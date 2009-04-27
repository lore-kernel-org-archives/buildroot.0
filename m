From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 27 Apr 2009 14:07:37 +0000 (UTC)
Subject: [Buildroot] svn commit: [26219] trunk/buildroot/toolchain/gcc
Message-ID: <20090427140737.6C26B7745E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-27 14:07:36 +0000 (Mon, 27 Apr 2009)
New Revision: 26219

Log:
toolchain/gcc: fix java support

Not runtime tested, but now it atleast builds.

Modified:
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2009-04-27 10:26:56 UTC (rev 26218)
+++ trunk/buildroot/toolchain/gcc/Config.in	2009-04-27 14:07:36 UTC (rev 26219)
@@ -142,9 +142,13 @@
 	help
 	  Build a Fortran cross-compiler
 
+config BR2_GCC_CROSS_JAVA
+       bool
+
 config BR2_INSTALL_LIBGCJ
 	bool "Build/install java compiler and libgcj?"
 	depends on !BR2_avr32 && BR2_INSTALL_LIBSTDCPP
+	select BR2_GCC_CROSS_JAVA
 	help
 	  Build/install java compiler and libgcj?
 

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-04-27 10:26:56 UTC (rev 26218)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-04-27 14:07:36 UTC (rev 26219)
@@ -80,6 +80,9 @@
 ifeq ($(BR2_GCC_CROSS_FORTRAN),y)
 GCC_CROSS_LANGUAGES:=$(GCC_CROSS_LANGUAGES),fortran
 endif
+ifeq ($(BR2_GCC_CROSS_JAVA),y)
+GCC_CROSS_LANGUAGES:=$(GCC_CROSS_LANGUAGES),java
+endif
 ifeq ($(BR2_GCC_CROSS_OBJC),y)
 GCC_CROSS_LANGUAGES:=$(GCC_CROSS_LANGUAGES),objc
 endif
@@ -356,14 +359,11 @@
 endif
 endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
-	cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/lib/
-	cp -dpf $(STAGING_DIR)/lib/lib-org-w3c-dom.so* $(TARGET_DIR)/lib/
-	cp -dpf $(STAGING_DIR)/lib/lib-org-xml-sax.so* $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcj.so* $(TARGET_DIR)/usr/lib/
 	mkdir -p $(TARGET_DIR)/usr/lib/security
-	cp -dpf $(STAGING_DIR)/usr/lib/security/libgcj.security \
-		$(TARGET_DIR)/usr/lib/security/
 	cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security \
 		$(TARGET_DIR)/usr/lib/security/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libgcj.so*
 endif
 	mkdir -p $(@D)
 	touch $@
