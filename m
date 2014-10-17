From: Karoly Kasza <kaszak@gmail.com>
Date: Fri, 17 Oct 2014 14:34:09 +0200
Subject: [Buildroot] [PATCH 1/2] util-linux: option to enable fdisk for host
	build
In-Reply-To: <1413549250-2753-1-git-send-email-kaszak@gmail.com>
References: <1413549250-2753-1-git-send-email-kaszak@gmail.com>
Message-ID: <1413549250-2753-2-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable the building of fdisk utility in util-linux host build.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/util-linux/Config.in.host                  |    9 ++++++
 .../util-linux/util-linux-004-enable-fdisk.patch   |   34 ++++++++++++++++++++
 package/util-linux/util-linux.mk                   |    5 +++
 3 files changed, 48 insertions(+)
 create mode 100644 package/util-linux/util-linux-004-enable-fdisk.patch

diff --git a/package/util-linux/Config.in.host b/package/util-linux/Config.in.host
index f73dc43..1451d15 100644
--- a/package/util-linux/Config.in.host
+++ b/package/util-linux/Config.in.host
@@ -6,3 +6,12 @@ config BR2_PACKAGE_HOST_UTIL_LINUX
 	  Things like mkfs, mkswap, swapon, fdisk, mount, dmesg, etc...
 
 	  http://www.kernel.org/pub/linux/utils/util-linux/
+
+if BR2_PACKAGE_HOST_UTIL_LINUX
+
+config BR2_PACKAGE_HOST_UTIL_LINUX_FDISK
+	bool "enable fdisk"
+	help
+	  Enable compiling fdisk
+
+endif
diff --git a/package/util-linux/util-linux-004-enable-fdisk.patch b/package/util-linux/util-linux-004-enable-fdisk.patch
new file mode 100644
index 0000000..5faf1bb
--- /dev/null
+++ b/package/util-linux/util-linux-004-enable-fdisk.patch
@@ -0,0 +1,34 @@
+Add options to enable/disable libfdisk and fdisk
+
+This is needed to be able to just build an fdisk binary
+for the host package.
+
+Signed-off-by: Karoly Kasza <kaszak@gmail.com>
+
+--- util-linux-2.25.1.orig/configure.ac	2014-10-11 13:47:52.000000000 +0200
++++ util-linux-2.25.1/configure.ac	2014-10-11 13:45:50.065076171 +0200
+@@ -820,12 +820,22 @@
+ dnl
+ dnl libfdisk is enabled at all times if possible
+ dnl
+-UL_BUILD_INIT([libfdisk], [check])
++# this behaviour changed for buildroot, along with fdisk
++AC_ARG_ENABLE([libfdisk],
++  AS_HELP_STRING([--disable-libfdisk], [do not build libfdisk]),
++  [], [UL_DEFAULT_ENABLE([libfdisk], [check])]
++)
++UL_BUILD_INIT([libfdisk])
+ UL_REQUIRES_BUILD([libfdisk], [libuuid])
+ UL_REQUIRES_BUILD([libfdisk], [libsmartcols])
+ AM_CONDITIONAL([BUILD_LIBFDISK], [test "x$build_libfdisk" = xyes])
+ 
+-UL_BUILD_INIT([fdisk], [check])
++
++AC_ARG_ENABLE([fdisk],
++  AS_HELP_STRING([--disable-fdisk], [do not build fdisk]),
++  [], [UL_DEFAULT_ENABLE([fdisk], [check])]
++)
++UL_BUILD_INIT([fdisk])
+ UL_REQUIRES_BUILD([fdisk], [libfdisk])
+ AM_CONDITIONAL([BUILD_FDISK], [test "x$build_fdisk" = xyes])
+ 
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index ebbab61..5335ff4 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -97,6 +97,11 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 	--disable-libblkid --disable-libmount \
 	--disable-all-programs --without-ncurses
 
+# Build host fdisk if selected
+ifeq ($(BR2_PACKAGE_HOST_UTIL_LINUX_FDISK),y)
+HOST_UTIL_LINUX_CONF_OPTS += --enable-fdisk --enable-libfdisk --enable-libsmartcols
+endif
+
 # Avoid building the tools if they are disabled since we can't install on
 # a per-directory basis.
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES),)
-- 
1.7.10.4
