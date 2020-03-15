From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Mar 2020 11:21:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/owfs: enable back php
Message-ID: <20200315102111.2731422-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

owfs supports PHP7 since version 3.2p3 and
https://github.com/owfs/owfs/commit/a9a79b330e334ba80c305905b51e8886b40772d9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/owfs/owfs.mk | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index ffc0b3098d..4e9a3f5c28 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -14,10 +14,6 @@ OWFS_LICENSE = GPL-2.0+, LGPL-2.0 (owtcl)
 OWFS_LICENSE_FILES = COPYING COPYING.LIB
 OWFS_INSTALL_STAGING = YES
 
-# owfs PHP support is not PHP 7 compliant
-# https://sourceforge.net/p/owfs/support-requests/32/
-OWFS_CONF_OPTS += --disable-owphp --without-php
-
 # Skip man pages processing
 OWFS_CONF_ENV += ac_cv_path_SOELIM=true
 
@@ -67,6 +63,27 @@ else
 OWFS_CONF_OPTS += --disable-avahi
 endif
 
+ifeq ($(BR2_PACKAGE_PHP),y)
+OWFS_CONF_OPTS += \
+	--enable-owphp \
+	--with-php \
+	--with-phpconfig=$(STAGING_DIR)/usr/bin/php-config
+OWFS_DEPENDENCIES += php host-swig
+
+# $(libdir) is set to $(EXTENSION_DIR) which is patched in php.mk to add
+# $(TARGET_DIR) so remove $(DESTDIR) to avoid an install failure
+define OWFS_PHP_EXTENSION_FIXUP
+	$(SED) 's/$$(DESTDIR)$$(libdir)/$$(libdir)/g' \
+		$(@D)/module/swig/php/Makefile
+endef
+
+OWFS_POST_CONFIGURE_HOOKS += OWFS_PHP_EXTENSION_FIXUP
+else
+OWFS_CONF_OPTS += \
+	--disable-owphp \
+	--without-php
+endif
+
 # setup.py isn't python3 compliant
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 OWFS_CONF_OPTS += \
-- 
2.25.1
