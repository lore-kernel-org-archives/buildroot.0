From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 30 Sep 2007 05:48:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070930124826.8A2E23004D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-30 05:48:25 -0700 (Sun, 30 Sep 2007)
New Revision: 20142

Log:
- no need to $(strip ..) bool/tristate values (Cristian Ionescu-Idbohrn)


Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-09-30 12:46:02 UTC (rev 20141)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-09-30 12:48:25 UTC (rev 20142)
@@ -5,7 +5,7 @@
 #############################################################
 
 
-ifeq ($(strip $(BR2_PACKAGE_BUSYBOX_SNAPSHOT)),y)
+ifeq ($(BR2_PACKAGE_BUSYBOX_SNAPSHOT),y)
 # Be aware that this changes daily....
 BUSYBOX_DIR:=$(PROJECT_BUILD_DIR)/busybox
 BUSYBOX_SOURCE:=busybox-snapshot.tar.bz2
@@ -35,7 +35,7 @@
 	$(SED) "/#include.*busybox\.h/a#define CONFIG_SYSLOGD" $(BUSYBOX_DIR)/init/init.c
 endif
 	# Allow busybox patches.
-ifeq ($(strip $(BR2_PACKAGE_BUSYBOX_SNAPSHOT)),y)
+ifeq ($(BR2_PACKAGE_BUSYBOX_SNAPSHOT),y)
 	toolchain/patch-kernel.sh $(BUSYBOX_DIR) package/busybox busybox.\*.patch
 else
 	toolchain/patch-kernel.sh $(BUSYBOX_DIR) package/busybox busybox-$(BUSYBOX_VERSION)-\*.patch
@@ -46,21 +46,21 @@
 	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_DIR)/.config
 	$(SED) s,^CONFIG_PREFIX=.*,CONFIG_PREFIX=\"$(TARGET_DIR)\", \
 		$(BUSYBOX_DIR)/.config
-ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_0_1)),y)
+ifeq ($(BR2_BUSYBOX_VERSION_1_0_1),y)
 	$(SED) "s,^CROSS.*,CROSS=$(TARGET_CROSS)\n\PREFIX=$(TARGET_DIR),;" \
 		$(BUSYBOX_DIR)/Rules.mak
 endif
-ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_1_3)),y)
+ifeq ($(BR2_BUSYBOX_VERSION_1_1_3),y)
 	$(SED) s,^PREFIX=.*,CONFIG_PREFIX=\"$(TARGET_DIR)\", \
 		$(BUSYBOX_DIR)/.config
 endif
-ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_2_2_1)),y)
+ifeq ($(BR2_BUSYBOX_VERSION_1_2_2_1),y)
 	$(SED) s,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX=\"$(TARGET_CROSS)\", \
 		$(BUSYBOX_DIR)/.config
 	$(SED) s,^PREFIX=.*,CROSS_COMPILER_PREFIX=\"$(TARGET_CROSS)\", \
 		$(BUSYBOX_DIR)/.config
 endif
-ifeq ($(strip $(BR2_PACKAGE_BUSYBOX_SNAPSHOT)),y)
+ifeq ($(BR2_PACKAGE_BUSYBOX_SNAPSHOT),y)
 	$(SED) s,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX=\"$(TARGET_CROSS)\", \
 		$(BUSYBOX_DIR)/.config
 	$(SED) s,^PREFIX=.*,CROSS_COMPILER_PREFIX=\"$(TARGET_CROSS)\", \
@@ -148,6 +148,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_PACKAGE_BUSYBOX)),y)
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 TARGETS+=busybox
 endif
