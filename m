From: Martin Bark <martin@barkynet.com>
Date: Sun,  1 May 2016 20:52:23 +0100
Subject: [Buildroot] [PATCH 3/5] package/nginx: add thread pool support
In-Reply-To: <1462132345-28253-1-git-send-email-martin@barkynet.com>
References: <1462132345-28253-1-git-send-email-martin@barkynet.com>
Message-ID: <1462132345-28253-3-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nginx/Config.in | 3 +++
 package/nginx/nginx.mk  | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index f925cc7..bec83c3 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -18,6 +18,9 @@ config BR2_PACKAGE_NGINX_FILE_AIO
 	depends on !BR2_aarch64
 	depends on !BR2_arc
 
+config BR2_PACKAGE_NGINX_THREADS
+    bool "thread pool support"
+
 config BR2_PACKAGE_NGINX_HTTP
 	bool "http server"
 	default y
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 7f3b075..91772b3 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -64,7 +64,8 @@ NGINX_CONF_OPTS += \
 	--http-uwsgi-temp-path=/var/tmp/nginx/uwsgi
 
 NGINX_CONF_OPTS += \
-	$(if $(BR2_PACKAGE_NGINX_FILE_AIO),--with-file-aio)
+	$(if $(BR2_PACKAGE_NGINX_FILE_AIO),--with-file-aio) \
+	$(if $(BR2_PACKAGE_NGINX_THREADS),--with-threads)
 
 ifeq ($(BR2_PACKAGE_PCRE),y)
 NGINX_DEPENDENCIES += pcre
-- 
2.7.4
