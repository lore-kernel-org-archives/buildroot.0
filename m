From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 20:59:31 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20090125205931.4FB7876D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 20:59:30 +0000 (Sun, 25 Jan 2009)
New Revision: 25022

Log:
Fix spelling error, causing php to use host includes, add patching and unpacked targets

Modified:
   trunk/buildroot/package/php/php.mk


Changeset:
Modified: trunk/buildroot/package/php/php.mk
===================================================================
--- trunk/buildroot/package/php/php.mk	2009-01-25 20:55:31 UTC (rev 25021)
+++ trunk/buildroot/package/php/php.mk	2009-01-25 20:59:30 UTC (rev 25022)
@@ -87,7 +87,7 @@
 	PHP_DEPS+=readline
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_NCURSES),y)
-	PHP_CONFIGURE+=--with-ncurses=$(STATING_DIR)/usr
+	PHP_CONFIGURE+=--with-ncurses=$(STAGING_DIR)/usr
 	PHP_DEPS+=ncurses
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_SYSVMSG),y)
@@ -132,6 +132,8 @@
 
 $(PHP_DIR)/.unpacked: $(DL_DIR)/$(PHP_SOURCE)
 	$(PHP_CAT) $(DL_DIR)/$(PHP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(PHP_DIR) package/php/ php\*.patch
+	toolchain/patch-kernel.sh $(PHP_DIR) package/php/ php\*.patch.$(ARCH)
 	touch $@
 
 $(PHP_DIR)/.configured: $(PHP_DIR)/.unpacked
@@ -184,6 +186,8 @@
 
 php: uclibc $(PHP_DEPS) $(PHP_TARGET_DEPS) $(TARGET_DIR)/etc/php.ini
 
+php-unpacked: $(PHP_DIR)/.unpacked
+
 php-clean:
 	rm -f $(PHP_DIR)/.configured $(PHP_DIR)/.built $(PHP_DIR)/.staged
 	rm -f $(PHP_TARGET_DEPS)
