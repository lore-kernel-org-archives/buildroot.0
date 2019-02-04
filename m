From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Feb 2019 15:06:20 +0100
Subject: [Buildroot] [git commit] docs/website: fixing query.yahooapis.com
 shutdown
Message-ID: <20190204140525.050BE81763@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9dcb5c581b8fddfdbbea5d2942618a5f0ddeceb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch rework the use of query.yahooapis.com to do the conversion
from xml to json required by our script and moves to the use of a js
library. Datas are therefore now converted in json format on the client.

Unfortunately, cause of the CORS restriction on nabble and
buildroot.org, we cannot retrieve directly the xml data from these
servers and we need a CORS proxy to do that.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[Peter: use sha256 integrity]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/footer.html     |  1 +
 docs/website/js/buildroot.js | 19 +++++++++----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/docs/website/footer.html b/docs/website/footer.html
index 5b18047093..82901b7ee6 100644
--- a/docs/website/footer.html
+++ b/docs/website/footer.html
@@ -1,6 +1,7 @@
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha256-U5ZEeKfGNOja007MMD3YBI0A3OSZOQbeG6z2f2Y0hu8=" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js" integrity="sha256-Daf8GuI2eLKHJlOWLRR/zRy9Clqcj4TUSumbxYH9kGI=" crossorigin="anonymous"></script>
+	<script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js" integrity="sha256-RbFvov4fXA9DW/RzOAcIC0ZHIDmghGdsoug5slJHMMI=" crossorigin="anonymous"></script>
 	<script type="text/javascript" src="js/buildroot.js"></script>
 </body>
 </html>
diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index ec28cbb750..fa5ad9a78e 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -1,17 +1,16 @@
 function load_activity(feedurl, divid) {
-    var yqlURL = "https://query.yahooapis.com/v1/public/yql";
-    var yqlQS = "?q=select%20entry%20from%20xml%20where%20url%20%3D%20'";
-    var yqlOPTS = "'%20limit%2010&format=json&callback=";
     var container = document.getElementById(divid);
-    var url = yqlURL + yqlQS + encodeURIComponent(feedurl) + yqlOPTS;
-
-    $.getJSON(url, function(data){
-        var result = data.query.results;
+    $.ajax({
+      url: "https://cors.io/?" + feedurl
+    })
+    .done(function(data){
+        var x2js = new X2JS();
+        var result = x2js.xml_str2json(data);
         var loaded = 0;
         var nb_display = 8;
         if (result==null) return;
-        for (var i = 0; i < result.feed.length; i++) {
-            var entry = result.feed[i].entry;
+        for (var i = 0; i < result.feed.entry.length; i++) {
+            var entry = result.feed.entry[i];
             if (entry.title.indexOf("git commit") != -1)
                 continue;
             loaded += 1;
@@ -24,7 +23,7 @@ function load_activity(feedurl, divid) {
             var text = document.createTextNode(data);
             link.appendChild(text);
             link.title = entry.title;
-            link.href = entry.link.href;
+            link.href = entry.link._href;
             div.appendChild(link);
             container.appendChild(div);
         }
