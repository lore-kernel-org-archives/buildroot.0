From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 20 Feb 2015 00:20:46 +0100
Subject: [Buildroot] [PATCH] package/openvmtools: enable openvmtools kernel
	modules
Message-ID: <1424388046-30299-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allow to build openvmtools's vmsync, vmci, vsock,
vmxnet, vmblock and vmhgfs kernel modules.

Tested with a 3.2.64 kernel but the build is broken for
newer kernel (3.14+ at least).

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: K?roly Kasza <kaszak@gmail.com>
---
 ...on-t-append-build-directory-to-LINUXINCLU.patch | 31 ++++++++++++++++++++++
 ...gure-fix-modules-install-to-target-rootfs.patch | 28 +++++++++++++++++++
 package/openvmtools/Config.in                      |  9 +++++++
 package/openvmtools/openvmtools.mk                 | 16 ++++++++++-
 4 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 package/openvmtools/0008-configure-don-t-append-build-directory-to-LINUXINCLU.patch
 create mode 100644 package/openvmtools/0009-configure-fix-modules-install-to-target-rootfs.patch

diff --git a/package/openvmtools/0008-configure-don-t-append-build-directory-to-LINUXINCLU.patch b/package/openvmtools/0008-configure-don-t-append-build-directory-to-LINUXINCLU.patch
new file mode 100644
index 0000000..5d18d9f
--- /dev/null
+++ b/package/openvmtools/0008-configure-don-t-append-build-directory-to-LINUXINCLU.patch
@@ -0,0 +1,31 @@
+From 796296f35c6992b4c685b7926a2aff9cd3bcac81 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Mon, 16 Feb 2015 11:30:23 +0100
+Subject: [PATCH 8/8] configure: don't append build directory to LINUXINCLUDE.
+
+This break the build when LINUXDIR point to the kernel linux sources
+(ie not from /lib/module/uname -r/build/include)
+
+Use directly --with-linuxdir=$(LINUX_DIR)/build if necessary.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 549736f..6c97785 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -148,7 +148,7 @@ if test "$with_kernel_modules" = "yes"; then
+          if test ! -d "$LINUXDIR/kernel/"; then
+              AC_MSG_ERROR([$LINUXDIR/kernel does not exist])
+          fi
+-         LINUXINCLUDE="$LINUXDIR/build/include"
++         LINUXINCLUDE="$LINUXDIR/include"
+          if test ! -d "$LINUXINCLUDE"; then
+             AC_MSG_ERROR([Can't find include dir under $LINUXDIR])
+          fi
+-- 
+1.7.10.4
+
diff --git a/package/openvmtools/0009-configure-fix-modules-install-to-target-rootfs.patch b/package/openvmtools/0009-configure-fix-modules-install-to-target-rootfs.patch
new file mode 100644
index 0000000..b9cefb0
--- /dev/null
+++ b/package/openvmtools/0009-configure-fix-modules-install-to-target-rootfs.patch
@@ -0,0 +1,28 @@
+From bfcf1483da376ff417473588eb35c66fd730f386 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Wed, 18 Feb 2015 23:26:10 +0100
+Subject: [PATCH] configure: fix modules install to target rootfs
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 549736f..a03c662 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -932,7 +932,9 @@ if test "$have_glib_2_14" = "yes"; then
+ fi
+ 
+ if test "$os" = "linux"; then
+-   MODULES_DIR="$LINUXDIR/kernel/"
++   # MODULES_DIR is used to install vmware modules to the target
++   # Use DESTDIR to define the target rootfs when installing
++   MODULES_DIR="/lib/modules/$KERNEL_RELEASE/kernel/"
+ 
+    CPPFLAGS="$CPPFLAGS -D_FILE_OFFSET_BITS=64"
+    CPPFLAGS="$CPPFLAGS -D_LARGEFILE64_SOURCE"
+-- 
+1.9.3
+
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 5fc6977..0c2cfda 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -52,6 +52,15 @@ config BR2_PACKAGE_OPENVMTOOLS_PAM
 comment "PAM support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
+config BR2_PACKAGE_OPENVMTOOLS_KERNEL_MODULES
+	bool "Openvmtools Linux Kernel Modules"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Build openvmtools's Linux kernel modules.
+
+comment "Openvmtools's Linux kernel modules needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
 endif
 
 comment "openvmtools needs a toolchain w/ wchar, threads, RPC, largefile, locale"
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index e0ec6d6..853d21f 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -12,9 +12,23 @@ OPENVMTOOLS_LICENSE_FILES = COPYING
 # Autoreconf needed because package is distributed without a configure script
 # See http://sourceforge.net/p/open-vm-tools/mailman/message/32550385/
 OPENVMTOOLS_AUTORECONF = YES
-OPENVMTOOLS_CONF_OPTS = --without-icu --without-x --without-gtk2 --without-gtkmm --without-kernel-modules
+# Add --without-root-privileges in order to not run depmod -a on the host.
+OPENVMTOOLS_CONF_OPTS = --without-icu --without-x --without-gtk2 --without-gtkmm --without-root-privileges
 OPENVMTOOLS_DEPENDENCIES = libglib2
 
+ifeq ($(BR2_PACKAGE_OPENVMTOOLS_KERNEL_MODULES),y)
+# Specify the Linux version from the kernel build by Buildroot otherwise the
+# the host Linux version will be used.
+# Use LINUX_VERSION_PROBED (aka the real Linux version), which tells us where
+# kernel modules are going to be installed in the target filesystem.
+OPENVMTOOLS_CONF_OPTS += --with-kernel-modules \
+	--with-kernel-release=$(LINUX_VERSION_PROBED) \
+	--with-linuxdir=$(LINUX_DIR)
+OPENVMTOOLS_DEPENDENCIES += linux
+else
+OPENVMTOOLS_CONF_OPTS += --without-kernel-modules
+endif
+
 # When libfuse is available, openvmtools can build vmblock-fuse, so
 # make sure that libfuse gets built first
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
-- 
1.9.3
