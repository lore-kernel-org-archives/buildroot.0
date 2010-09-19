From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Sun, 19 Sep 2010 10:21:14 +0200
Subject: [Buildroot] [PATCH 1/2] introducing util-linux-ng as replacement
	for util-linux
In-Reply-To: <1284884475-2390-1-git-send-email-marcus.osdoba@googlemail.com>
References: <1284884475-2390-1-git-send-email-marcus.osdoba@googlemail.com>
Message-ID: <1284884475-2390-2-git-send-email-marcus.osdoba@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Marcus Osdoba <ossy1980@gmx.net>

mark util-linux as deprecated since next version (util-linux-ng) is available
needs toolchain with wchar support

Signed-off-by: Marcus Osdoba <marcus.osdoba@googlemail.com>
---
 package/Config.in                      |    1 +
 package/util-linux-ng/Config.in        |   54 ++++++++++++++++++++++++++++
 package/util-linux-ng/util-linux-ng.mk |   60 ++++++++++++++++++++++++++++++++
 package/util-linux/Config.in           |    1 +
 4 files changed, 116 insertions(+), 0 deletions(-)
 create mode 100644 package/util-linux-ng/Config.in
 create mode 100644 package/util-linux-ng/util-linux-ng.mk

diff --git a/package/Config.in b/package/Config.in
index 2209b55..78e0e5c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -465,6 +465,7 @@ source "package/psmisc/Config.in"
 source "package/sysklogd/Config.in"
 source "package/sysvinit/Config.in"
 source "package/util-linux/Config.in"
+source "package/util-linux-ng/Config.in"
 endif
 endmenu
 
diff --git a/package/util-linux-ng/Config.in b/package/util-linux-ng/Config.in
new file mode 100644
index 0000000..19533e0
--- /dev/null
+++ b/package/util-linux-ng/Config.in
@@ -0,0 +1,54 @@
+config BR2_PACKAGE_UTIL_LINUX_NG
+	bool "util-linux-ng"
+	depends on (BR2_PROGRAM_INVOCATION && BR2_LARGEFILE && BR2_USE_WCHAR)
+	help
+	  Fork of util-linux which consists of essential Linux utilities.
+
+	  Things like mkfs, mkswap, swapon, fdisk, mount, dmesg, etc...
+	  http://userweb.kernel.org/~kzak/util-linux-ng/
+
+comment "util-linux-ng requires a toolchain with PROGRAM_INVOCATION support"
+	depends on !BR2_PROGRAM_INVOCATION
+
+comment "util-linux-ng requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
+
+comment "util-linux-ng requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
+
+comment "UUID library support activated in e2fsprogs, deactivate it there to use util-linux-ng implementation"
+	depends on BR2_PACKAGE_E2FSPROGS_LIBUUID
+
+if BR2_PACKAGE_UTIL_LINUX_NG
+comment "utils selection"
+
+config BR2_PACKAGE_UTIL_LINUX_NG_LIBBLKID
+	bool "The library and tools for blkid support."
+	help
+	  This package provides the recent blkid support 
+	  (parallel versions exist in e2fsprogs and busybox)
+
+config BR2_PACKAGE_UTIL_LINUX_NG_LIBUUID
+	bool "The library and tools for uuid support."
+	depends on !BR2_PACKAGE_E2FSPROGS_LIBUUID
+	help
+	  This package provides the recent uuid support 
+	  (parallel versions exist in e2fsprogs and busybox)
+
+
+config BR2_PACKAGE_UTIL_LINUX_NG_MOUNT_UTILS
+	bool "Devices mount/unmounting utilities"
+	depends on (BR2_PACKAGE_UTIL_LINUX_NG_LIBUUID || BR2_PACKAGE_E2FSPROGS_LIBUUID ) && BR2_PACKAGE_UTIL_LINUX_NG_LIBBLKID
+	help
+	  This package contains utilities to mount/unmount devices.
+	  Also provided by busybox.
+
+config BR2_PACKAGE_UTIL_LINUX_NG_FSCK
+	bool "Filesystem check"
+	depends on BR2_PACKAGE_UTIL_LINUX_NG_LIBUUID && BR2_PACKAGE_UTIL_LINUX_NG_LIBBLKID
+	help
+	  Linux mainstream filesystem check.
+	  Also provided by busybox.
+
+
+endif
diff --git a/package/util-linux-ng/util-linux-ng.mk b/package/util-linux-ng/util-linux-ng.mk
new file mode 100644
index 0000000..d02cdd6
--- /dev/null
+++ b/package/util-linux-ng/util-linux-ng.mk
@@ -0,0 +1,60 @@
+#############################################################
+#
+# UTIL_LINUX_NG
+#
+#############################################################
+UTIL_LINUX_NG_MAJORVERSION = 2.17
+UTIL_LINUX_NG_VERSION      = $(UTIL_LINUX_NG_MAJORVERSION).2
+UTIL_LINUX_NG_SITE         = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux-ng/v$(UTIL_LINUX_NG_MAJORVERSION)
+UTIL_LINUX_NG_SOURCE       = util-linux-ng-$(UTIL_LINUX_NG_VERSION).tar.bz2
+UTIL_LINUX_NG_CONF_OPT = --disable-use-tty-group \
+                         --enable-shared \
+                         --without-libiconv-prefix \
+                         --without-libintl-prefix \
+                         --disable-rpath \
+                         --disable-schedutils \
+                         --disable-doc
+UTIL_LINUX_NG_LIBTOOL_PATCH = NO
+
+# otherwise some apps won't find uuid.h for example
+UTIL_LINUX_NG_INSTALL_STAGING = YES
+
+
+ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
+  UTIL_LINUX_NG_DEPENDENCIES += e2fsprogs
+endif
+
+# make util-linux-ng win over links to busybox binary
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+  UTIL_LINUX_NG_DEPENDENCIES += busybox
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+  UTIL_LINUX_NG_CONF_OPT += --with-ncurses
+  UTIL_LINUX_NG_DEPENDENCIES += ncurses
+else
+  UTIL_LINUX_NG_CONF_OPT += --without-ncurses
+endif # BR2_PACKAGE_NCURSES
+
+ifneq ($(BR2_PACKAGE_ZLIB),y)
+  UTIL_LINUX_NG_CONF_OPT += --disable-cramfs
+endif
+
+ifneq ($(BR2_PACKAGE_UTIL_LINUX_NG_MOUNT_UTILS),y)
+  UTIL_LINUX_NG_CONF_OPT += --disable-mount
+endif
+
+ifneq ($(BR2_PACKAGE_UTIL_LINUX_NG_LIBUUID),y)
+  UTIL_LINUX_NG_CONF_OPT += --disable-libuuid
+endif
+
+ifneq ($(BR2_PACKAGE_UTIL_LINUX_NG_LIBBLKID),y)
+  UTIL_LINUX_NG_CONF_OPT += --disable-libblkid
+endif
+
+ifneq ($(BR2_PACKAGE_UTIL_LINUX_NG_FSCK),y)
+  UTIL_LINUX_NG_CONF_OPT += --disable-fsck
+endif
+
+
+$(eval $(call AUTOTARGETS,package,util-linux-ng))
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 434dae9..00e9f88 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_UTIL-LINUX
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on BR2_INET_RPC
+	depends on BR2_DEPRECATED
 	help
 	  Various useful/essential Linux utilities.
 
-- 
1.7.1
