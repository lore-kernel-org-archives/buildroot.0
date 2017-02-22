From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 22 Feb 2017 21:03:47 +0100
Subject: [Buildroot] [PATCH] docs/website: Speedup javascript query
Message-ID: <1487793827-9204-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit limits results from the javascript
query for selecting messages from mailinglist.
It was not limited before.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/js/buildroot.js | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index da43664..a30da63 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -1,7 +1,7 @@
 function load_activity(feedurl, divid) {
     var yqlURL = "https://query.yahooapis.com/v1/public/yql";
-    var yqlQS = "?q=select%20*%20from%20xml%20where%20url%20%3D%20'";
-    var yqlOPTS = "'&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=";
+    var yqlQS = "?q=select%20entry%20from%20xml%20where%20url%20%3D%20'";
+    var yqlOPTS = "'%20limit%2010&format=json&callback=";
     var container = document.getElementById(divid);
     var url = yqlURL + yqlQS + encodeURIComponent(feedurl) + yqlOPTS;
 
@@ -10,8 +10,8 @@ function load_activity(feedurl, divid) {
         var loaded = 0;
         var nb_display = 8;
         if (result==null) return;
-        for (var i = 0; i < result.feed.entry.length; i++) {
-            var entry = result.feed.entry[i];
+        for (var i = 0; i < result.feed.length; i++) {
+            var entry = result.feed[i].entry;
             if (entry.title.indexOf("git commit") != -1)
                 continue;
             loaded += 1;
-- 
2.7.4
