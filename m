From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat,  4 Feb 2017 23:34:54 +0100
Subject: [Buildroot] [PATCH 1/1] docs/website: Feed API and gmane fix
Message-ID: <1486247694-7324-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Google retired feed API, this patch changes in favour of
  yahoo yql for rss to json conversion
* Gmane is gone, replacing it with nabble.
* Removed the import for feed api libraries
* Updates to the latest jquery version
* Reorganized javascript code in buildroot.js to accomodate
  the mentioned fixings

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/footer.html     |  5 ++--
 docs/website/header.html     |  2 +-
 docs/website/js/buildroot.js | 71 ++++++++++++++++----------------------------
 docs/website/support.html    |  6 ++--
 4 files changed, 33 insertions(+), 51 deletions(-)

diff --git a/docs/website/footer.html b/docs/website/footer.html
index 16fab36..279c8b1 100644
--- a/docs/website/footer.html
+++ b/docs/website/footer.html
@@ -1,6 +1,5 @@
-	<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
-	<script src="https://oss.maxcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
-	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
+	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
+	<script src="https://oss.maxcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	<script src="https://cdn.rawgit.com/zenorocha/clipboard.js/master/dist/clipboard.min.js"></script>
 	<script type="text/javascript" src="js/buildroot.js"></script>
 </body>
diff --git a/docs/website/header.html b/docs/website/header.html
index 3842f32..ef6724f 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -10,7 +10,7 @@
 
 	<title>Buildroot - Making Embedded Linux Easy</title>
 
-	<link href="https://oss.maxcdn.com/bootswatch/3.3.5/paper/bootstrap.min.css" rel="stylesheet">
+	<link href="https://oss.maxcdn.com/bootswatch/3.3.7/paper/bootstrap.min.css" rel="stylesheet">
 	<link href="css/main.css" rel="stylesheet">
 
 	<!--[if lt IE 9]>
diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index 122436e..f86d0d5 100644
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
@@ -17,7 +19,7 @@ function load_activity(feedurl, divid) {
                 break;
             var div = document.createElement("p");
             var link = document.createElement("a");
-            var d = new Date(entry.publishedDate);
+            var d = new Date(entry.published);
             var data = '[' + d.toLocaleDateString() + '] ' + entry.title
             var text = document.createTextNode(data);
             link.appendChild(text);
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
+    load_activity("http://buildroot-busybox.2317881.n4.nabble.com/Buildroot-busybox-ft2.xml", "mailing-list-activity");
+    load_activity("http://git.buildroot.org/buildroot/atom/?h=master", "commit-activity");
+
+    $('#slides').html('<iframe src="https://docs.google.com/gview?url=http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf&embedded=true" style="position:absolute; width:100%; height:100%; top:0; left:0;" frameborder="0"></iframe>')
+});
diff --git a/docs/website/support.html b/docs/website/support.html
index 92ee03b..a1184c8 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -50,9 +50,11 @@
 		    list, since there is a good chance someone else has asked the same question
 		    before.</p>
 
-		  <form method="get" action="http://search.gmane.org/">
+		  <form method="get" action="http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp">
 		    <input type="text" name="query">
-		    <input type="hidden" name="group" value="gmane.comp.lib.uclibc.buildroot">
+		    <input type="hidden" name="macro" value="search_page">
+		    <input type="hidden" name="node" value="2">
+		    <input type="hidden" name="sort" value="date">
 		    <button type="submit" class="btn btn-default">Submit</button>
 		  </form>
 		</div>
-- 
2.7.4
