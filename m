From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 23 Dec 2008 09:39:05 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20081223093905.CF72276A3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-23 09:39:05 +0000 (Tue, 23 Dec 2008)
New Revision: 24516

Log:
toolchain/uclibc: Add BR2_ENABLE_LOCALE_PREGENERATED option

Add an option to either generate locales yourself or download the
pregenerated set.

Based on 4bdca9cc in Bernhard's tree.

Modified:
   trunk/buildroot/toolchain/uClibc/Config.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2008-12-23 09:04:50 UTC (rev 24515)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2008-12-23 09:39:05 UTC (rev 24516)
@@ -56,8 +56,18 @@
 config BR2_ENABLE_LOCALE
 	bool "Enable locale/gettext/i18n support?"
 	help
-	    Enable locale/gettext/i18n support?
+	  Enable locale/gettext/i18n support?
 
+config BR2_ENABLE_LOCALE_PREGENERATED
+	bool "Use pregenerated locale data?"
+	depends on BR2_ENABLE_LOCALE
+	help
+	  Instead of generating the locale data locally you can optionally
+	  download a pregenerated set of locales.
+
+	  Say N here unless your buildhost lacks locale support and you
+	  desparately want to use internationalization on your target.
+
 choice
 	prompt "Thread library implementation"
 	default BR2_PTHREADS_OLD

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-12-23 09:04:50 UTC (rev 24515)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-12-23 09:39:05 UTC (rev 24516)
@@ -96,7 +96,7 @@
 $(DL_DIR)/$(UCLIBC_SOURCE):
 	$(WGET) -P $(DL_DIR) $(UCLIBC_SITE)/$(UCLIBC_SOURCE)
 
-ifneq ($(BR2_ENABLE_LOCALE),)
+ifneq ($(BR2_ENABLE_LOCALE_PREGENERATED),)
 UCLIBC_SITE_LOCALE:=http://www.uclibc.org/downloads
 UCLIBC_SOURCE_LOCALE:=uClibc-locale-030818.tgz
 
@@ -125,7 +125,7 @@
 	toolchain/patch-kernel.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) \
 		uClibc.\*.patch uClibc.\*.patch.$(ARCH)
 endif
-ifneq ($(BR2_ENABLE_LOCALE),)
+ifneq ($(BR2_ENABLE_LOCALE_PREGENERATED)),)
 	cp -dpf $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE) $(UCLIBC_DIR)/extra/locale/
 endif
 	touch $@
@@ -346,11 +346,13 @@
 	echo "# PTHREADS_DEBUG_SUPPORT is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_ENABLE_LOCALE),y)
+ifeq ($(BR2_ENABLE_LOCALE_PREGENERATED),y)
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\nUCLIBC_PREGENERATED_LOCALE_DATA=y\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=y\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig
-	$(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.oldconfig
 else
+	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\nUCLIBC_PREGENERATED_LOCALE_DATA=n\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=n\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig
+endif
+else
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' $(UCLIBC_DIR)/.oldconfig
-	$(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_USE_WCHAR),y)
 	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.oldconfig
