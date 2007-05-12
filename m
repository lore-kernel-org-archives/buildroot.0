From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 12 May 2007 11:39:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070512183929.DD6B048012@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-05-12 11:39:28 -0700 (Sat, 12 May 2007)
New Revision: 18610

Log:
- store uClibc's configfile as BR2_UCLIBC_CONFIG in menuconfig


Modified:
   trunk/buildroot/toolchain/uClibc/Config.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2007-05-11 12:57:35 UTC (rev 18609)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2007-05-12 18:39:28 UTC (rev 18610)
@@ -14,8 +14,12 @@
 		bool "uClibc 0.9.28"
 
 	config BR2_UCLIBC_VERSION_0_9_28_3
+		depends BR2_DEPRECATED
 		bool "uClibc 0.9.28.3"
 
+	config BR2_UCLIBC_VERSION_0_9_29
+		bool "uClibc 0.9.29"
+
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
 
@@ -29,6 +33,19 @@
 	help
 	    Use latest snapshot or one from a specific date?
 
+config BR2_UCLIBC_CONFIG
+	string "uClibc configuration file to use?"
+	default "toolchain/uClibc/uClibc-0.9.28.config" if BR2_UCLIBC_VERSION_0_9_28
+	default "toolchain/uClibc/uClibc-0.9.28.config" if BR2_UCLIBC_VERSION_0_9_28_3
+	default "toolchain/uClibc/uClibc-0.9.29.config" if BR2_UCLIBC_VERSION_0_9_29
+	default "toolchain/uClibc/uClibc-0.9.29.config" if BR2_UCLIBC_VERSION_0_9_30
+	default "toolchain/uClibc/uClibc-0.9.29.config" if BR2_UCLIBC_VERSION_SNAPSHOT
+	help
+	  Some people may wish to use their own modified uClibc configuration
+	  file and will specify their config file location with this option.
+	  See also docs/README in this package.
+	  If unsure, use the default.
+
 config BR2_ENABLE_LOCALE
 	bool "Enable locale/gettext/i18n support?"
 	default n

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-05-11 12:57:35 UTC (rev 18609)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-05-12 18:39:28 UTC (rev 18610)
@@ -6,6 +6,13 @@
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 
+# specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
+# setting.
+ifndef UCLIBC_CONFIG_FILE
+UCLIBC_CONFIG_FILE=$(subst ",, $(strip $(BR2_UCLIBC_CONFIG)))
+#")
+endif
+
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 # Be aware that this changes daily....
 UCLIBC_VER:=0.9.29
@@ -13,23 +20,22 @@
 UCLIBC_SOURCE:=uClibc-$(strip $(subst ",, $(BR2_USE_UCLIBC_SNAPSHOT))).tar.bz2
 #"))
 UCLIBC_SITE:=http://www.uclibc.org/downloads/snapshots
-ifndef UCLIBC_CONFIG_FILE
-UCLIBC_CONFIG_FILE=toolchain/uClibc/uClibc-0.9.29.config
+else
+# releases
+ifeq ($(BR2_UCLIBC_VERSION_0_9_29),y)
+UCLIBC_VER:=0.9.29
 endif
-else
 ifeq ($(BR2_UCLIBC_VERSION_0_9_28_3),y)
 UCLIBC_VER:=0.9.28.3
 endif
 ifeq ($(BR2_UCLIBC_VERSION_0_9_28),y)
 UCLIBC_VER:=0.9.28
 endif
+
 UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc-$(UCLIBC_VER)
 UCLIBC_SOURCE:=uClibc-$(UCLIBC_VER).tar.bz2
 UCLIBC_SITE:=http://www.uclibc.org/downloads
-ifndef UCLIBC_CONFIG_FILE
-UCLIBC_CONFIG_FILE=toolchain/uClibc/uClibc-0.9.28.config
 endif
-endif
 
 UCLIBC_CAT:=$(BZCAT)
 
