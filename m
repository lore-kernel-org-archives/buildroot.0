From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 21 Nov 2008 06:36:48 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20081121143648.844A13C8D7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-21 06:36:48 -0800 (Fri, 21 Nov 2008)
New Revision: 24114

Log:
busybox: fixup id applet on 1.13.0 for old uclibc versions

The id applet in 1.13.0 only compiles with uclibc < 0.9.30 if the
busybox internal passwd/grp functions are used.

Therefore, automatically enable CONFIG_USE_BB_PWD_GRP if that situation
is detected and warn the user.

Modified:
   trunk/buildroot/package/busybox/busybox-1.13.x.config
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox-1.13.x.config
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.x.config	2008-11-21 11:50:13 UTC (rev 24113)
+++ trunk/buildroot/package/busybox/busybox-1.13.x.config	2008-11-21 14:36:48 UTC (rev 24114)
@@ -171,7 +171,7 @@
 CONFIG_HEAD=y
 CONFIG_FEATURE_FANCY_HEAD=y
 CONFIG_HOSTID=y
-# CONFIG_ID is not set
+CONFIG_ID=y
 CONFIG_INSTALL=y
 CONFIG_FEATURE_INSTALL_LONG_OPTIONS=y
 CONFIG_LENGTH=y

Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2008-11-21 11:50:13 UTC (rev 24113)
+++ trunk/buildroot/package/busybox/busybox.mk	2008-11-21 14:36:48 UTC (rev 24114)
@@ -60,6 +60,14 @@
 	$(SED) s,^PREFIX=.*,CROSS_COMPILER_PREFIX=\"$(TARGET_CROSS)\", \
 		$(BUSYBOX_DIR)/.config
 endif
+# id applet breaks on 1.13.0 with old uclibc unless the bb pwd routines are used
+ifeq ($(BR2_BUSYBOX_VERSION_1_13_X)$(BR2_UCLIBC_VERSION_0_9_28_3)$(BR2_UCLIBC_VERSION_0_9_29),yy)
+	if grep -q 'CONFIG_ID=y' $(BUSYBOX_DIR)/.config; \
+	then \
+		echo 'warning: CONFIG_ID needs BB_PWD_GRP with old uclibc, enabling' >&2;\
+		$(SED) "s/^.*CONFIG_USE_BB_PWD_GRP.*/CONFIG_USE_BB_PWD_GRP=y/;" $(BUSYBOX_DIR)/.config; \
+	fi
+endif
 ifeq ($(BR2_PACKAGE_BUSYBOX_SNAPSHOT),y)
 	$(SED) s,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX=\"$(TARGET_CROSS)\", \
 		$(BUSYBOX_DIR)/.config
