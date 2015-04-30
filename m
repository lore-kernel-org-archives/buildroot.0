From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu, 30 Apr 2015 21:36:07 +0200
Subject: [Buildroot] [PATCH] php: fpm sapi: install startup script
Message-ID: <1430422567-14903-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When PHP's FastCGI Process Manager SAPI is selected:

- install a startup script.
- install a simple configuration, using the ondemand process manager
  that only starts children when the website is actually being used.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/php/php-fpm.conf | 14 ++++++++++++++
 package/php/php.mk       | 15 +++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 package/php/php-fpm.conf

diff --git a/package/php/php-fpm.conf b/package/php/php-fpm.conf
new file mode 100644
index 0000000..2ffe595
--- /dev/null
+++ b/package/php/php-fpm.conf
@@ -0,0 +1,14 @@
+[www]
+# Only start children when there are requests to be processed
+pm = ondemand
+# Terminate them again after there haven't been any for 2 minutes
+pm.process_idle_timeout = 120s
+# Maximum number of children processing PHP requests concurrently
+pm.max_children = 32
+
+listen = /var/run/php-fpm.sock
+listen.owner = www-data
+listen.group = www-data
+user = www-data
+group = www-data
+
diff --git a/package/php/php.mk b/package/php/php.mk
index e4331f2..6c42aba 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -251,6 +251,21 @@ PHP_CONF_OPTS += \
 PHP_DEPENDENCIES += jpeg libpng freetype
 endif
 
+ifeq ($(BR2_PACKAGE_PHP_FPM),y)
+define PHP_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(@D)/sapi/fpm/init.d.php-fpm \
+		$(TARGET_DIR)/etc/init.d/S49php-fpm
+endef
+
+define PHP_INSTALL_FPM_CONF
+	$(INSTALL) -D -m 0644 package/php/php-fpm.conf \
+		$(TARGET_DIR)/etc/php-fpm.conf
+	rm -f $(TARGET_DIR)/etc/php-fpm.conf.default
+endef
+
+PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FPM_CONF
+endif
+
 define PHP_EXTENSIONS_FIXUP
 	$(SED) "/prefix/ s:/usr:$(STAGING_DIR)/usr:" \
 		$(STAGING_DIR)/usr/bin/phpize
-- 
2.1.4
