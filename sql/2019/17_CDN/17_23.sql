#standardSQL
# 17_23: Percentage of responses with stale-if-error directive
SELECT
  _TABLE_SUFFIX AS client,
  _cdn_provider AS cdn,
  COUNTIF(LOWER(resp_cache_control) LIKE "%stale-if-error%") AS freq,
  COUNT(0) AS total,
  ROUND(COUNTIF(LOWER(resp_cache_control) LIKE "%stale-if-error%") * 100 / COUNT(0), 2) AS pct
FROM
  `httparchive.summary_requests.2019_07_01_*`
GROUP BY
  client,
  cdn
ORDER BY
  total DESC