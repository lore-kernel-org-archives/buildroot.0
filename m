From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  3 Nov 2014 00:58:16 +0100
Subject: [Buildroot] [PATCH 3/3] website: Tidy up code
In-Reply-To: <1414972696-10647-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414972696-10647-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414972696-10647-3-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By inversing the "if (!result.error)" we gain one level of indent.
Also moving variable declarations into a more correct block of code.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 docs/js/buildroot.js | 53 ++++++++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/docs/js/buildroot.js b/docs/js/buildroot.js
index dd6ca6e..83a3ac0 100644
--- a/docs/js/buildroot.js
+++ b/docs/js/buildroot.js
@@ -1,33 +1,34 @@
 function load_activity(feedurl, divid) {
     var feed = new google.feeds.Feed(feedurl);
+    var container = document.getElementById(divid);
+    var loaded = 0;
+    var nb_display = 8;
     feed.setNumEntries(30);
     feed.load(function(result) {
-        if (!result.error) {
-            var container = document.getElementById(divid);
-            var loaded = 0;
-            var nb_display = 8;
-            for (var i = 0; i < result.feed.entries.length; i++) {
-                var entry = result.feed.entries[i];
-                if (entry.title.indexOf("git commit") != -1)
-                    continue;
-                loaded += 1;
-                if (loaded > nb_display)
-                    break;
-                var div = document.createElement("p");
-                var link = document.createElement("a");
-                var d = new Date(entry.publishedDate);
-                var data = '[' + d.toLocaleDateString() + '] ' + entry.title
-                var text = document.createTextNode(data);
-                link.appendChild(text);
-                link.title = entry.title;
-                link.href = entry.link
-                div.appendChild(link);
-                container.appendChild(div);
-            }
-            var empty = nb_display - loaded;
-            for (var i = 0; i < empty; i++) {
-                container.appendChild(document.createElement("p"));
-            }
+        if (result.error) {
+        	return;
+        }
+        for (var i = 0; i < result.feed.entries.length; i++) {
+            var entry = result.feed.entries[i];
+            if (entry.title.indexOf("git commit") != -1)
+                continue;
+            loaded += 1;
+            if (loaded > nb_display)
+                break;
+            var div = document.createElement("p");
+            var link = document.createElement("a");
+            var d = new Date(entry.publishedDate);
+            var data = '[' + d.toLocaleDateString() + '] ' + entry.title
+            var text = document.createTextNode(data);
+            link.appendChild(text);
+            link.title = entry.title;
+            link.href = entry.link
+            div.appendChild(link);
+            container.appendChild(div);
+        }
+        var empty = nb_display - loaded;
+        for (var i = 0; i < empty; i++) {
+            container.appendChild(document.createElement("p"));
         }
     });
 }
-- 
2.1.1
