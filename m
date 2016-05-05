From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 22:44:19 +0200
Subject: [Buildroot] [git commit] package/nginx: add debug logging support
Message-ID: <20160505204505.D513381F33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdbb0c8112bffb783a43a9f44dd7637ebaaf7c89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nginx/Config.in | 8 ++++++++
 package/nginx/nginx.mk  | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index ca3e3eb..9f3c218 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -354,6 +354,14 @@ config BR2_PACKAGE_NGINX_STREAM_UPSTREAM_ZONE_MODULE
 
 endif #BR2_PACKAGE_NGINX_STREAM
 
+config BR2_PACKAGE_NGINX_DEBUG
+	bool "debug logging"
+	help
+	  Enable debug logging. The debug level should be set with
+	  the error_log directive. For example
+
+	  error_log /var/log/nginx/error.log debug;
+
 comment "misc. modules"
 
 config BR2_PACKAGE_NGINX_SELECT_MODULE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 91772b3..c1e8367 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -226,6 +226,9 @@ NGINX_CONF_OPTS += \
 
 endif # BR2_PACKAGE_NGINX_STREAM
 
+# Debug logging
+NGINX_CONF_OPTS += $(if $(BR2_PACKAGE_NGINX_DEBUG),--with-debug)
+
 define NGINX_DISABLE_WERROR
 	$(SED) 's/-Werror//g' -i $(@D)/auto/cc/*
 endef
