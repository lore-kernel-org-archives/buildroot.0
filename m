From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  2 Mar 2014 19:21:43 +0100
Subject: [Buildroot] [PATCH 3/4] website: Add Buildroot javascript
In-Reply-To: <1393784504-11327-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1393784504-11327-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1393784504-11327-4-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add some specific Javascript to display commit and mailing recent
entries.
Note that the git commit mail are ignored.
Also load Google Analytics.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 docs/js/buildroot.js | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 docs/js/buildroot.js

diff --git a/docs/js/buildroot.js b/docs/js/buildroot.js
new file mode 100644
index 0000000..410b703
--- /dev/null
+++ b/docs/js/buildroot.js
@@ -0,0 +1,64 @@
+function load_activity(feedurl, divid) {
+    var feed = new google.feeds.Feed(feedurl);
+    feed.setNumEntries(30);
+    feed.load(function(result) {
+      if (!result.error) {
+        var container = document.getElementById(divid);
+        var loaded = 0;
+        var nb_display = 8;
+        for (var i = 0; i < result.feed.entries.length; i++) {
+          var entry = result.feed.entries[i];
+          if (entry.title.indexOf("git commit") != -1)
+            continue;
+          loaded += 1;
+          if (loaded >= nb_display)
+            break;
+          var div = document.createElement("p");
+          var link = document.createElement("a");
+          var d = new Date(entry.publishedDate);
+          var data = '[' + d.toLocaleDateString() + '] ' + entry.title
+          // Ensure all titles are the same length
+          if (data.length > 60) {
+            data = data.substr(0, 57)
+            data += '...'
+          }
+          var text = document.createTextNode(data);
+          link.appendChild(text);
+          link.title = entry.title;
+          link.href = entry.link
+          div.appendChild(link);
+          container.appendChild(div);
+        }
+        console.log(loaded);
+      }
+    });
+}
+
+function initialize() {
+  load_activity("http://rss.gmane.org/topics/excerpts/gmane.comp.lib.uclibc.buildroot", "mailing-list-activity");
+  load_activity("http://git.uclibc.org/buildroot/atom/?h=master", "commit-activity");
+}
+
+function google_analytics() {
+  var _gaq = _gaq || [];
+  _gaq.push(['_setAccount', 'UA-21761074-1']);
+  _gaq.push(['_setDomainName', 'none']);
+  _gaq.push(['_setAllowLinker', true]);
+  _gaq.push(['_trackPageview']);
+
+  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
+  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
+  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
+}
+
+google.load("feeds", "1");
+google.setOnLoadCallback(initialize);
+google_analytics();
+
+jQuery(document).ready(function($){
+    var url = window.location.href;
+    // Get the basename of the URL
+    url = url.split(/[\\/]/).pop()
+    $('.nav a[href="/'+url+'"]').parent().addClass('active');
+});
+
-- 
1.8.5.3
