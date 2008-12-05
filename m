From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  5 Dec 2008 07:27:42 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20081205152742.CAB833C8EF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-05 07:27:42 -0800 (Fri, 05 Dec 2008)
New Revision: 24288

Log:
toolchain/binutils: honour HAVE_MANPAGES / HAVE_INFOPAGES

Based on b157db55 in Bernhard's tree.

Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-05 15:27:38 UTC (rev 24287)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-05 15:27:42 UTC (rev 24288)
@@ -106,6 +106,8 @@
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
+		--mandir=/usr/share/man \
+		--infodir=/usr/share/info \
 		$(BR2_CONFIGURE_DEVEL_SYSROOT) \
 		$(BR2_CONFIGURE_STAGING_SYSROOT) \
 		$(DISABLE_NLS) \
@@ -158,6 +160,8 @@
 		--build=$(GNU_HOST_NAME) \
 		--host=$(REAL_GNU_TARGET_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
+		--mandir=/usr/share/man \
+		--infodir=/usr/share/info \
 		$(DISABLE_NLS) \
 		$(MULTILIB) \
 		$(BINUTILS_TARGET_CONFIG_OPTIONS) \
@@ -174,8 +178,13 @@
 	$(MAKE) DESTDIR=$(TARGET_DIR) \
 		tooldir=/usr build_tooldir=/usr \
 		-C $(BINUTILS_DIR2) install
-	#rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-	#	$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	rm -rf $(TARGET_DIR)/usr/man
+endif
+ifneq ($(BR2_HAVE_INFOPAGES),y)
+	rm -rf $(TARGET_DIR)/usr/info
+endif
+	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/share/doc
 	-$(STRIPCMD) $(TARGET_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/* > /dev/null 2>&1
 	-$(STRIPCMD) $(TARGET_DIR)/usr/bin/* > /dev/null 2>&1
 
