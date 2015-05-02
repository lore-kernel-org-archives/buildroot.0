From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sat,  2 May 2015 17:10:15 +0200
Subject: [Buildroot] [PATCH v2] php.ini: set date.timezone
In-Reply-To: <1430579415-22802-1-git-send-email-bos@je-eigen-domein.nl>
References: <1430579415-22802-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <1430579415-22802-3-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set date.timezone in php.ini to match time zone settings.
Prevents a warning being logged about it not being set
each time a PHP date/time method is used.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

---
v2: follows Arnout's suggestion, using BR2_TARGET_LOCALTIME
---
 package/php/php.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 3b9a117..47811ff 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -24,6 +24,12 @@ PHP_CONF_ENV = \
 	ac_cv_func_strcasestr=yes \
 	EXTRA_LIBS="$(PHP_EXTRA_LIBS)"
 
+ifeq ($(BR2_TARGET_LOCALTIME),)
+PHP_LOCALTIME = UTC
+else
+PHP_LOCALTIME = $(BR2_TARGET_LOCALTIME)
+endif
+
 # PHP can't be AUTORECONFed the standard way unfortunately
 PHP_DEPENDENCIES += host-autoconf host-automake host-libtool
 define PHP_BUILDCONF
@@ -288,6 +294,8 @@ define PHP_INSTALL_FIXUP
 	rm -f $(TARGET_DIR)/usr/bin/phpize
 	$(INSTALL) -D -m 0755 $(PHP_DIR)/php.ini-production \
 		$(TARGET_DIR)/etc/php.ini
+	$(SED) 's%;date.timezone =.*%date.timezone = $(PHP_LOCALTIME)%' \
+		$(TARGET_DIR)/etc/php.ini
 endef
 
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
-- 
2.1.4
