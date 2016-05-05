From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 22:30:06 +0200
Subject: [Buildroot] [git commit] package/nginx: add thread pool support
Message-ID: <20160505204505.CA16C801A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2748bc6b6544347c75837205c8537d2321d4393f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
