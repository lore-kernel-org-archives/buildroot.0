From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  3 Mar 2009 20:23:13 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20090303202313.B6DF57626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-03 20:23:10 +0000 (Tue, 03 Mar 2009)
New Revision: 25510

Log:
uclibc: cleanup version handling

Based on 0171c72 in Bernhards' tree.

Modified:
   trunk/buildroot/toolchain/uClibc/Config.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2009-03-03 18:47:56 UTC (rev 25509)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2009-03-03 20:23:10 UTC (rev 25510)
@@ -41,6 +41,14 @@
 	help
 	    Use latest snapshot or one from a specific date?
 
+config BR2_UCLIBC_VERSION_STRING
+	string
+	default 0.9.28.3	if BR2_UCLIBC_VERSION_0_9_28_3
+	default 0.9.29		if BR2_UCLIBC_VERSION_0_9_29
+	default 0.9.30		if BR2_UCLIBC_VERSION_0_9_30
+	default 0.9.30.1	if BR2_UCLIBC_VERSION_0_9_30_1
+	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
+
 config BR2_UCLIBC_CONFIG
 	string "uClibc configuration file to use?"
 	default "toolchain/uClibc/uClibc-0.9.28.config" if BR2_UCLIBC_VERSION_0_9_28_3

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-03-03 18:47:56 UTC (rev 25509)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-03-03 20:23:10 UTC (rev 25510)
@@ -13,45 +13,29 @@
 #")
 endif
 
+UCLIBC_VER:=$(subst ",,$(BR2_UCLIBC_VERSION_STRING))
+#")
+
+UCLIBC_OFFICIAL_VERSION:=$(UCLIBC_VER)$(VENDOR_SUFFIX)$(VENDOR_UCLIBC_RELEASE)
+
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
-# Be aware that this changes daily....
-UCLIBC_VER:=0.9.30
-UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc
-UCLIBC_SOURCE:=uClibc-$(strip $(subst ",, $(BR2_USE_UCLIBC_SNAPSHOT))).tar.bz2
-#"))
 UCLIBC_SITE:=http://www.uclibc.org/downloads/snapshots
-UCLIBC_PATCH_DIR:=toolchain/uClibc/
+UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc
 else
-# releases
-ifeq ($(BR2_UCLIBC_VERSION_0_9_30_1),y)
-UCLIBC_VER:=0.9.30.1
-endif
-ifeq ($(BR2_UCLIBC_VERSION_0_9_30),y)
-UCLIBC_VER:=0.9.30
-endif
-ifeq ($(BR2_UCLIBC_VERSION_0_9_29),y)
-UCLIBC_VER:=0.9.29
-endif
-ifeq ($(BR2_UCLIBC_VERSION_0_9_28_3),y)
-UCLIBC_VER:=0.9.28.3
-endif
+UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc-$(UCLIBC_OFFICIAL_VERSION)
 UCLIBC_SITE:=http://www.uclibc.org/downloads
-
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SOURCE),y)
 UCLIBC_SITE:=$(VENDOR_SITE)
 endif
+endif
 
-UCLIBC_OFFICIAL_VERSION:=$(UCLIBC_VER)$(VENDOR_SUFFIX)$(VENDOR_UCLIBC_RELEASE)
-
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 UCLIBC_PATCH_DIR:=toolchain/uClibc/
 else
 UCLIBC_PATCH_DIR:=toolchain/uClibc/ext_source/$(VENDOR_PATCH_DIR)/$(UCLIBC_OFFICIAL_VERSION)
 endif
 
-UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc-$(UCLIBC_OFFICIAL_VERSION)
 UCLIBC_SOURCE:=uClibc-$(UCLIBC_OFFICIAL_VERSION).tar.bz2
-endif
 
 UCLIBC_CAT:=$(BZCAT)
 
