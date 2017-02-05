From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Feb 2017 22:47:21 +0100
Subject: [Buildroot] [git commit] docs/website: fix google feed API
Message-ID: <20170205214745.663F580525@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa32078ed8cb1cd61daf6c08c0f1e320db32b4df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Google deprecated feed api to cenvert rss to json, switching
to yahoo yql. This patch also reorganize the javascript code
to accomodate the fixings.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/website/footer.html     |  1 -
 docs/website/js/buildroot.js | 73 ++++++++++++++++----------------------------
 2 files changed, 27 insertions(+), 47 deletions(-)

diff --git a/docs/website/footer.html b/docs/website/footer.html
index 1fcfd70..279c8b1 100644
--- a/docs/website/footer.html
+++ b/docs/website/footer.html
@@ -1,6 +1,5 @@
 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 	<script src="https://oss.maxcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
-	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
 	<script src="https://cdn.rawgit.com/zenorocha/clipboard.js/master/dist/clipboard.min.js"></script>
 	<script type="text/javascript" src="js/buildroot.js"></script>
 </body>
diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index 122436e..83983e6 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -1,15 +1,17 @@
 function load_activity(feedurl, divid) {
-    var feed = new google.feeds.Feed(feedurl);
+    var yqlURL = "https://query.yahooapis.com/v1/public/yql";
+    var yqlQS = "?q=select%20*%20from%20xml%20where%20url%20%3D%20'";
+    var yqlOPTS = "'&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=";
     var container = document.getElementById(divid);
-    var loaded = 0;
-    var nb_display = 8;
-    feed.setNumEntries(30);
-    feed.load(function(result) {
-        if (result.error) {
-        	return;
-        }
-        for (var i = 0; i < result.feed.entries.length; i++) {
-            var entry = result.feed.entries[i];
+    var url = yqlURL + yqlQS + encodeURIComponent(feedurl) + yqlOPTS;
+
+    $.getJSON(url, function(data){
+        var result = data.query.results;
+        var loaded = 0;
+        var nb_display = 8;
+        if (result==null) return;
+        for (var i = 0; i < result.feed.entry.length; i++) {
+            var entry = result.feed.entry[i];
             if (entry.title.indexOf("git commit") != -1)
                 continue;
             loaded += 1;
@@ -17,12 +19,12 @@ function load_activity(feedurl, divid) {
                 break;
             var div = document.createElement("p");
             var link = document.createElement("a");
-            var d = new Date(entry.publishedDate);
+            var d = new Date(entry.published);
             var data = '[' + d.toLocaleDateString() + '] ' + entry.title
             var text = document.createTextNode(data);
             link.appendChild(text);
             link.title = entry.title;
-            link.href = entry.link
+            link.href = entry.link.href;
             div.appendChild(link);
             container.appendChild(div);
         }
@@ -33,11 +35,6 @@ function load_activity(feedurl, divid) {
     });
 }
 
-function initialize() {
-    load_activity("http://rss.gmane.org/topics/excerpts/gmane.comp.lib.uclibc.buildroot", "mailing-list-activity");
-    load_activity("http://git.buildroot.org/buildroot/atom/?h=master", "commit-activity");
-}
-
 function google_analytics() {
     var _gaq = _gaq || [];
     _gaq.push(['_setAccount', 'UA-21761074-1']);
@@ -53,34 +50,6 @@ function google_analytics() {
     s.parentNode.insertBefore(ga, s);
 }
 
-$(function() {
-  $('a[href*=#]:not([href=#])').click(function() {
-    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
-      var target = $(this.hash);
-      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
-      if (target.length) {
-        $('html,body').animate({
-          scrollTop: target.offset().top
-        }, 1000);
-        return false;
-      }
-    }
-  });
-});
-
-google.load("feeds", "1");
-google.setOnLoadCallback(initialize);
-google_analytics();
-
-jQuery(document).ready(function($) {
-    var url = window.location.href;
-    // Get the basename of the URL
-    url = url.split(/[\\/]/).pop()
-    $('.nav a[href="/' + url + '"]').parent().addClass('active');
-
-    $('#slides').html('<iframe src="https://docs.google.com/gview?url=http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf&embedded=true" style="position:absolute; width:100%; height:100%; top:0; left:0;" frameborder="0"></iframe>')
-});
-
 function showTooltip(elem, msg) {
     elem.setAttribute('class', 'btn tooltipped tooltipped-s');
     elem.setAttribute('aria-label', msg);
@@ -98,7 +67,7 @@ clipboard.on('success', function(e) {
 });
 
 $(function() {
-  $('a[href*=#]:not([href=#])').click(function() {
+  $('a[href*=\\#]:not([href=\\#])').click(function() {
     if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
       var target = $(this.hash);
       target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
@@ -111,3 +80,15 @@ $(function() {
     }
   });
 });
+
+jQuery(document).ready(function($) {
+    var url = window.location.href;
+    // Get the basename of the URL
+    url = url.split(/[\\/]/).pop()
+    $('.nav a[href="/' + url + '"]').parent().addClass('active');
+
+    load_activity("http://rss.gmane.org/topics/excerpts/gmane.comp.lib.uclibc.buildroot", "mailing-list-activity");
+    load_activity("http://git.buildroot.org/buildroot/atom/?h=master", "commit-activity");
+
+    $('#slides').html('<iframe src="https://docs.google.com/gview?url=http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf&embedded=true" style="position:absolute; width:100%; height:100%; top:0; left:0;" frameborder="0"></iframe>')
+});
