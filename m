From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 22 Feb 2017 23:52:36 +0100
Subject: [Buildroot] [PATCH] docs/website: Improving website speed
Message-ID: <1487803956-24668-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently the buildroot website is not leveraging common
techniques to have a better loading speed (browser caching,
gzip compression, deflating).
This commit provides an .htaccess files with all the needed to
enable mentioned features. This .htaccess only works if the
webserver has deflate, expires and headers modules enabled.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/.htaccess | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 docs/website/.htaccess

diff --git a/docs/website/.htaccess b/docs/website/.htaccess
new file mode 100644
index 0000000..b02beb8
--- /dev/null
+++ b/docs/website/.htaccess
@@ -0,0 +1,62 @@
+# BEGIN Compress text files
+<ifModule mod_deflate.c>
+  <filesMatch ".(css|js|x?html?|php)$">
+    SetOutputFilter DEFLATE
+  </filesMatch>
+</ifModule>
+# END Compress text files
+
+# BEGIN Expire headers
+<ifModule mod_expires.c>
+  ExpiresActive On
+  ExpiresDefault "access plus 1 seconds"
+  ExpiresByType image/x-icon "access plus 2592000 seconds"
+  ExpiresByType image/jpeg "access plus 2592000 seconds"
+  ExpiresByType image/png "access plus 2592000 seconds"
+  ExpiresByType image/gif "access plus 2592000 seconds"
+  ExpiresByType application/x-shockwave-flash "access plus 2592000 seconds"
+  ExpiresByType text/css "access plus 604800 seconds"
+  ExpiresByType text/javascript "access plus 216000 seconds"
+  ExpiresByType application/javascript "access plus 216000 seconds"
+  ExpiresByType application/x-javascript "access plus 216000 seconds"
+  ExpiresByType text/html "access plus 600 seconds"
+  ExpiresByType application/xhtml+xml "access plus 600 seconds"
+</ifModule>
+# END Expire headers
+
+# BEGIN Cache-Control Headers
+<ifModule mod_headers.c>
+  <filesMatch ".(ico|jpe?g|png|gif|swf)$">
+    Header set Cache-Control "max-age=2592000, public"
+  </filesMatch>
+  <filesMatch ".(css)$">
+    Header set Cache-Control "max-age=604800, public"
+  </filesMatch>
+  <filesMatch ".(js)$">
+    Header set Cache-Control "max-age=216000, private"
+  </filesMatch>
+  <filesMatch ".(x?html?|php)$">
+    Header set Cache-Control "max-age=600, private, must-revalidate"
+  </filesMatch>
+</ifModule>
+# END Cache-Control Headers
+
+# BEGIN Turn ETags Off
+<ifModule mod_headers.c>
+  Header unset ETag
+</ifModule>
+FileETag None
+# END Turn ETags Off
+
+# BEGIN gzip
+<ifModule mod_gzip.c>
+mod_gzip_on Yes
+mod_gzip_dechunk Yes
+mod_gzip_item_include file .(html?|txt|css|js)$
+mod_gzip_item_include handler ^cgi-script$
+mod_gzip_item_include mime ^text/.*
+mod_gzip_item_include mime ^application/x-javascript.*
+mod_gzip_item_exclude mime ^image/.*
+mod_gzip_item_exclude rspheader ^Content-Encoding:.*gzip.*
+</ifModule>
+# END gzip
-- 
2.7.4
