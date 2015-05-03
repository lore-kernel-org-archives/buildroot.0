From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sun,  3 May 2015 02:09:53 +0200
Subject: [Buildroot] [PATCH] nginx: add option to enable php-fpm
	configuration
Message-ID: <1430611794-12123-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Offer to install a minimal nginx.conf that has php support enabled
when both nginx and php-fpm are selected.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/nginx/Config.in      | 11 +++++++++++
 package/nginx/nginx-php.conf | 38 ++++++++++++++++++++++++++++++++++++++
 package/nginx/nginx.mk       |  9 +++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 package/nginx/nginx-php.conf

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index be445f4..48498c1 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -321,4 +321,15 @@ config BR2_PACKAGE_NGINX_ADD_MODULES
 	help
 	  Space separated list of urls of the additional modules
 
+config BR2_PACKAGE_NGINX_PHP_FPM
+	bool "enable php in configuration"
+	depends on BR2_PACKAGE_PHP_FPM
+	select BR2_PACKAGE_NGINX_HTTP_FASTCGI_MODULE
+	default y
+	help
+	  Install a minimal nginx.conf that handles PHP requests through php-fpm.
+
+comment "php support depends on php with FPM sapi"
+	depends on BR2_PACKAGE_PHP && !BR2_PACKAGE_PHP_FPM
+
 endif
diff --git a/package/nginx/nginx-php.conf b/package/nginx/nginx-php.conf
new file mode 100644
index 0000000..9d17ebf
--- /dev/null
+++ b/package/nginx/nginx-php.conf
@@ -0,0 +1,38 @@
+#
+# nginx.conf minimal config with php-fpm
+#
+
+events {
+    worker_connections  1024;
+}
+
+http {
+    include      mime.types;
+    default_type application/octet-stream;
+    sendfile     on;
+    #gzip        on;
+
+    server {
+        listen      80;
+        server_name $hostname;
+        root        /usr/html;
+
+        location / {
+            index index.php index.html index.htm;
+        }
+
+        location ~ \.php$ {
+            # Ensure a PHP file with that name exists on the file system
+            try_files     $uri =404;
+
+            fastcgi_pass  unix:/var/run/php-fpm.sock;
+            include       fastcgi.conf;
+
+            # By default nginx buffers all script output to memory and temp
+            # files, freeing up the PHP process asap for the next request.
+            # Turn this off if not desired (e.g. if you send large files)
+            #
+            #fastcgi_buffering off;
+        }
+    }
+}
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 90ebbcc..24e2a41 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -237,4 +237,13 @@ define NGINX_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50nginx
 endef
 
+ifeq ($(BR2_PACKAGE_NGINX_PHP_FPM),y)
+define NGINX_INSTALL_PHP_CONFIG
+	$(INSTALL) -D -m 0644 package/nginx/nginx-php.conf \
+		$(TARGET_DIR)/etc/nginx/nginx.conf
+endef
+
+NGINX_POST_INSTALL_TARGET_HOOKS += NGINX_INSTALL_PHP_CONFIG
+endif
+
 $(eval $(generic-package))
-- 
2.1.4
