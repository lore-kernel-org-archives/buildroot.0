From: Martin Bark <martin@barkynet.com>
Date: Sun,  1 May 2016 20:52:24 +0100
Subject: [Buildroot] [PATCH 4/5] package/nginx: add debug logging support
In-Reply-To: <1462132345-28253-1-git-send-email-martin@barkynet.com>
References: <1462132345-28253-1-git-send-email-martin@barkynet.com>
Message-ID: <1462132345-28253-4-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nginx/Config.in | 8 ++++++++
 package/nginx/nginx.mk  | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index bec83c3..bdbcbc6 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -350,6 +350,14 @@ config BR2_PACKAGE_NGINX_STREAM_UPSTREAM_ZONE_MODULE
 
 endif #BR2_PACKAGE_NGINX_STREAM
 
+config BR2_PACKAGE_NGINX_DEBUG
+	bool "debug logging"
+	help
+	  Enable debug logging.  The debug level should be set with the error_log
+	  directive.  For example
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
-- 
2.7.4
