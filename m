From: Martin Bark <martin@barkynet.com>
Date: Tue,  3 May 2016 10:36:56 +0100
Subject: [Buildroot] [PATCH v2 5/6] package/nginx: add thread pool support
In-Reply-To: <1462268217-31545-1-git-send-email-martin@barkynet.com>
References: <1462268217-31545-1-git-send-email-martin@barkynet.com>
Message-ID: <1462268217-31545-5-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v1 -> v2
 - Added depends on BR2_TOOLCHAIN_HAS_THREADS
---
 package/nginx/Config.in | 7 +++++++
 package/nginx/nginx.mk  | 3 ++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index f925cc7..ca3e3eb 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -18,6 +18,13 @@ config BR2_PACKAGE_NGINX_FILE_AIO
 	depends on !BR2_aarch64
 	depends on !BR2_arc
 
+config BR2_PACKAGE_NGINX_THREADS
+	bool "thread pool support"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+
+comment "thread pool support needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
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
