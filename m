From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 16:14:29 +0200
Subject: [Buildroot] [git commit] package/sunxi-mali: remove sunxi-mali
	libMali for r2p4 Mali kernel modules
Message-ID: <20170507141649.CA25C8286D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95426afd59dd947c8da262fa10e0c5b1a3bbb525
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sunxi-mali userspace drivers (libMali.so) for r2p4 Mali kernel modules
are linked against libUMP.so.2 but libump package in Buildroot only
provide libUMP.so.3.

In upstream commit 1c5063f43cdc9de341c0d63b2e3921cab86c7742 [1], library
versioning was added. For the r3p* libraries, libUMP.so.3 is used (and
provided by Buildroot libump package), but for the r2p* libraries,
libUMP.so.2 is used (and not provided by Buildroot libump package).

Due to this any program or library trying to link with -lGLESv2 or -lEGL
will fail with the following error:

arm-none-linux-gnueabi/bin/ld: warning: libUMP.so.2, needed by output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libMali.so, not found (try using -rpath or -rpath-link)

output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so: undefined reference to `ump_close'
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so: undefined reference to `ump_mapped_pointer_get'
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so: undefined reference to `ump_secure_id_get'
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so: undefined reference to `ump_mapped_pointer_release'
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libMali.so: undefined reference to `ump_reference_add'
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libMali.so: undefined reference to `ump_size_get'
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so: undefined reference to `ump_reference_release'
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv4t/usr/lib/libEGL.so: undefined reference to `ump_open'
collect2: error: ld returned 1 exit status

Since nothing provides libUMP.so.2, this commit removes the
BR2_PACKAGE_SUNXI_MALI_R2P4 option and adds the BR2_ARM_EABIHF
dependency directly to sunxi-mali package.

Fixes:

  http://autobuild.buildroot.net/results/8d0/8d0b78798abf0c4ca124952d0d0455da6f8fa14f/

[1] https://github.com/linux-sunxi/sunxi-mali-proprietary/commit/1c5063f43cdc9de341c0d63b2e3921cab86c7742
[2] http://lists.busybox.net/pipermail/buildroot/2017-February/183500.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
[Thomas: fix conflicts when applying on master, tweak commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                 |  8 ++++++++
 package/sunxi-mali/Config.in     | 25 ++++++++-----------------
 package/sunxi-mali/sunxi-mali.mk | 12 ++----------
 3 files changed, 18 insertions(+), 27 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3e043d4..0bacac2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_PACKAGE_SUNXI_MALI_R2P4
+	bool "sunxi-mali r2p4 removed"
+	select BR2_LEGACY
+	help
+	  sunxi-mali libMali for r2p4 Mali kernel module has been
+	  removed since the libump package only provides libUMP.so.3.
+	  libMali for r2p4 Mali kernel module requires libUMP.so.2.
+
 config BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT
 	bool "CoffeeScript option has been removed"
 	select BR2_LEGACY
diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
index 71b1195..9eb3ad8 100644
--- a/package/sunxi-mali/Config.in
+++ b/package/sunxi-mali/Config.in
@@ -1,6 +1,12 @@
 config BR2_PACKAGE_SUNXI_MALI
 	bool "sunxi-mali"
 	depends on BR2_arm
+	# libump package only provide libUMP.so.3 which is used by
+	# libMali for r3p0 and r3p1 Mali kernel module. This version
+	# is only available for ARM EABIhf.
+	# libMali for r2p4 Mali kernel module (available for ARM EABI)
+	# requires libUMP.so.2.
+	depends on BR2_ARM_EABIHF # libUMP.so.3 only
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
@@ -36,31 +42,16 @@ choice
 	  appropriate version number is r3p0. For other kernels, use the maliver
 	  application to determine the appropriate version.
 
-config BR2_PACKAGE_SUNXI_MALI_R2P4
-	bool "r2p4"
-	depends on BR2_ARM_EABI
-
-comment "r2p4 requires an EABI toolchain"
-	depends on !BR2_ARM_EABI
-
 config BR2_PACKAGE_SUNXI_MALI_R3P0
 	bool "r3p0"
-	depends on BR2_ARM_EABIHF
-
-comment "r3p0 requires an EABIhf toolchain"
-	depends on !BR2_ARM_EABIHF
 
 config BR2_PACKAGE_SUNXI_MALI_R3P1
 	bool "r3p1"
-	depends on BR2_ARM_EABIHF
-
-comment "r3p1 requires an EABIhf toolchain"
-	depends on !BR2_ARM_EABIHF
 
 endchoice
 
 endif
 
-comment "sunxi-mali needs a glibc toolchain"
+comment "sunxi-mali needs an EABIhf glibc toolchain"
 	depends on BR2_arm
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
diff --git a/package/sunxi-mali/sunxi-mali.mk b/package/sunxi-mali/sunxi-mali.mk
index c808db6..90b580f 100644
--- a/package/sunxi-mali/sunxi-mali.mk
+++ b/package/sunxi-mali/sunxi-mali.mk
@@ -28,17 +28,9 @@ SUNXI_MALI_MAKE_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) -lm -ldl -lpthread" \
 	$(TARGET_MAKE_ENV)
 
-ifeq ($(BR2_ARM_EABIHF),y)
-SUNXI_MALI_MAKE_OPTS += ABI=armhf
-else
-SUNXI_MALI_MAKE_OPTS += ABI=armel
-endif
-
-SUNXI_MALI_MAKE_OPTS += EGL_TYPE=framebuffer
+SUNXI_MALI_MAKE_OPTS += EGL_TYPE=framebuffer \
+	ABI=armhf
 
-ifeq ($(BR2_PACKAGE_SUNXI_MALI_R2P4),y)
-SUNXI_MALI_MAKE_OPTS += VERSION=r2p4
-endif
 ifeq ($(BR2_PACKAGE_SUNXI_MALI_R3P0),y)
 SUNXI_MALI_MAKE_OPTS += VERSION=r3p0
 endif
