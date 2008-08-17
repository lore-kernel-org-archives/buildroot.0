From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 17 Aug 2008 06:46:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/speex
Message-ID: <20080817134643.17B343C6D4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-17 06:46:42 -0700 (Sun, 17 Aug 2008)
New Revision: 23099

Log:
speex: automate selection of arm specific optimizations

ARM version info according to wikipedia, hopefully I got it all correct.

Modified:
   trunk/buildroot/package/speex/Config.in
   trunk/buildroot/package/speex/speex.mk


Changeset:
Modified: trunk/buildroot/package/speex/Config.in
===================================================================
--- trunk/buildroot/package/speex/Config.in	2008-08-17 13:20:31 UTC (rev 23098)
+++ trunk/buildroot/package/speex/Config.in	2008-08-17 13:46:42 UTC (rev 23099)
@@ -8,10 +8,18 @@
 
 	  http://www.speex.org/
 
+config BR2_PACKAGE_SPEEX_ARM_GENERIC
+       bool
+       default y
+       depends on BR2_PACKAGE_SPEEX && (BR2_generic_arm || BR2_arm610 || BR2_arm710)
+
+config BR2_PACKAGE_SPEEX_ARM4
+       bool
+       default y
+       depends on BR2_PACKAGE_SPEEX && (BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_sa110 || BR2_sa1100)
+
 config BR2_PACKAGE_SPEEX_ARM5E
-	bool "Support ARM5E instruction set"
 	default y
-	depends on BR2_PACKAGE_SPEEX && BR2_arm
-	help
-	  Use the additional instructions available in the ARM5E
-	  or later cores.
+	bool
+	depends on BR2_PACKAGE_SPEEX && BR2_arm && !(BR2_PACKAGE_SPEEX_ARM_GENERIC || BR2_PACKAGE_SPEEX_ARM4)
+

Modified: trunk/buildroot/package/speex/speex.mk
===================================================================
--- trunk/buildroot/package/speex/speex.mk	2008-08-17 13:20:31 UTC (rev 23098)
+++ trunk/buildroot/package/speex/speex.mk	2008-08-17 13:46:42 UTC (rev 23099)
@@ -14,6 +14,10 @@
 SPEEX_CONF_OPT = --with-ogg-libraries=$(STAGING_DIR)/usr/lib --with-ogg-includes=$(STAGING_DIR)/usr/include \
 		--disable-static --enable-fixed-point $(DISABLE_NLS)
 
+ifeq ($(BR2_PACKAGE_SPEEX_ARM4),y)
+	SPEEX_CONF_OPT += --enable-arm4-asm
+endif
+
 ifeq ($(BR2_PACKAGE_SPEEX_ARM5E),y)
 	SPEEX_CONF_OPT += --enable-arm5e-asm
 endif
