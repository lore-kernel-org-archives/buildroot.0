From: Chris Wardman <cjwfirmware@vxmdesign.com>
Date: Sun, 13 Sep 2015 03:02:46 -0400
Subject: [Buildroot] [PATCH 1/3] Experimental addition of the newlib library
Message-ID: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch add support for a newlib library build of the gcc toolchain.
This is designed to build arm-none-eabi- toolchain, and it was tested against an stm32f4discovery board.

Hopefully this will help people build bare metal code for arm processors

Signed-off-by: Chris Wardman <cjwfirmware@vxmdesign.com>
---
 package/Makefile.in                                | 10 ++++-
 package/gcc/gcc-final/gcc-final.mk                 |  4 ++
 package/gcc/gcc.mk                                 |  7 ++++
 package/newlib/Config.in                           |  4 ++
 .../newlib-0001-configure-tooldir-path.patch       | 25 +++++++++++
 package/newlib/newlib.mk                           | 48 ++++++++++++++++++++++
 toolchain/Config.in                                |  6 +++
 toolchain/toolchain-buildroot/Config.in            |  9 ++++
 8 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 package/newlib/Config.in
 create mode 100644 package/newlib/newlib-0001-configure-tooldir-path.patch
 create mode 100644 package/newlib/newlib.mk

diff --git a/package/Makefile.in b/package/Makefile.in
index 545694f..7f4d74e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -37,10 +37,16 @@ $(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
 endif
 
 # Compute GNU_TARGET_NAME
+ifeq ($(BR2_TOOLCHAIN_NO_VENDOR),y)
+GNU_TARGET_NAME = $(ARCH)-$(TARGET_OS)-$(LIBC)$(ABI)
+else
 GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
+endif
 
 # FLAT binary format needs uclinux
-ifeq ($(BR2_BINFMT_FLAT),y)
+ifeq ($(BR2_TOOLCHAIN_USES_NEWLIB),y)
+TARGET_OS = none
+else ifeq ($(BR2_BINFMT_FLAT),y)
 TARGET_OS = uclinux
 else
 TARGET_OS = linux
@@ -50,6 +56,8 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 LIBC = uclibc
 else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 LIBC = musl
+else ifeq ($(BR2_TOOLCHAIN_USES_NEWLIB),y)
+LIBC = 
 else
 LIBC = gnu
 endif
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 86b3c78..ba8d644 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -72,6 +72,10 @@ else
 HOST_GCC_FINAL_CONF_OPTS += --enable-shared
 endif
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_NEWLIB),y)
+HOST_GCC_FINAL_CONF_OPTS += --with-newlib
+endif
+
 ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
 HOST_GCC_FINAL_CONF_OPTS += --enable-libgomp
 else
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 501fcea..62f6b80 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -100,6 +100,13 @@ HOST_GCC_COMMON_CONF_OPTS = \
 HOST_GCC_COMMON_CONF_ENV = \
 	MAKEINFO=missing
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_NEWLIB),y)
+HOST_GCC_COMMON_CONF_OPTS += --with-gnu-as
+else
+HOST_GCC_COMMON_CONF_OPTS += --disable-__cxa_atexit
+endif
+
+
 GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
 GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
diff --git a/package/newlib/Config.in b/package/newlib/Config.in
new file mode 100644
index 0000000..0f3e2d7
--- /dev/null
+++ b/package/newlib/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_NEWLIB
+       bool
+       depends on BR2_TOOLCHAIN_USES_NEWLIB
+       default y
diff --git a/package/newlib/newlib-0001-configure-tooldir-path.patch b/package/newlib/newlib-0001-configure-tooldir-path.patch
new file mode 100644
index 0000000..c162678
--- /dev/null
+++ b/package/newlib/newlib-0001-configure-tooldir-path.patch
@@ -0,0 +1,25 @@
+This patch is required to fix how the newlib headers are installed. 
+
+The cross compiler expects headers to be in 
+.../host/usr/arm-none-eabi/sysroot/usr/include/newlib.h
+by default newlib installed the headers into 
+.../host/usr/arm-none-eabi/sysroot/arm-none-eabi/include/newlib.h
+
+${exec_prefix} provides the .../host/usr/arm-none-eabi/sysroot path
+${target_noncanonical} provides an extra arm-none-eabi/ that must be removed. 
+
+Signed-off-by: Chris Wardman <cjwfirmware@vxmdesign.com>
+
+
+diff -uNr newlib-old/configure newlib-new/configure
+--- newlib-old/configure	2014-07-05 17:09:07.000000000 -0400
++++ newlib-new/configure	2014-12-25 00:59:01.727549186 -0500
+@@ -6985,7 +6985,7 @@
+ 
+ # Some systems (e.g., one of the i386-aix systems the gas testers are
+ # using) don't handle "\$" correctly, so don't use it here.
+-tooldir='${exec_prefix}'/${target_noncanonical}
++tooldir='${exec_prefix}'/usr
+ build_tooldir=${tooldir}
+ 
+ # Create a .gdbinit file which runs the one in srcdir
diff --git a/package/newlib/newlib.mk b/package/newlib/newlib.mk
new file mode 100644
index 0000000..02008e5
--- /dev/null
+++ b/package/newlib/newlib.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# newlib
+#
+################################################################################
+
+NEWLIB_VERSION = 2.2.0
+NEWLIB_SITE = ftp://sourceware.org/pub/newlib
+NEWLIB_LICENSE = MIT
+NEWLIB_LICENSE_FILES = COPYRIGHT
+
+NEWLIB_DEPENDENCIES = host-gcc-initial
+NEWLIB_ADD_TOOLCHAIN_DEPENDENCY = NO
+NEWLIB_INSTALL_STAGING = YES
+
+define NEWLIB_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_MAKE_ENV) \
+		./configure \
+			--target=$(GNU_TARGET_NAME) \
+			--host=$(GNU_HOST_NAME) \
+			--build=$(GNU_HOST_NAME) \
+			--prefix=$(STAGING_DIR) \
+			--includedir=$(STAGING_DIR)/usr/include \
+			--oldincludedir=$(STAGING_DIR)/usr/include \
+			--with-build-sysroot=$(STAGING_DIR) \
+			--enable-newlib-io-long-long \
+			--enable-newlib-register-fini \
+			--disable-newlib-supplied-syscalls \
+			--disable-nls)
+
+endef
+
+define NEWLIB_APPLY_PATCHES
+	$(APPLY_PATCHES) $(@D) package/newlib \*.patch
+endef
+
+define NEWLIB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define NEWLIB_INSTALL_STAGING_CMDS
+	mkdir -p $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+$(eval $(generic-package))
+
diff --git a/toolchain/Config.in b/toolchain/Config.in
index a851ce4..88ebe8c 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -28,6 +28,12 @@ config BR2_TOOLCHAIN_USES_MUSL
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
+config BR2_TOOLCHAIN_USES_NEWLIB
+       bool
+
+config BR2_TOOLCHAIN_NO_VENDOR 
+       bool
+
 choice
 	prompt "Toolchain type"
 	help
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 13e2b15..c11db73 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -94,6 +94,14 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	  This option selects musl as the C library for the
 	  cross-compilation toolchain.
 
+config BR2_TOOLCHAIN_BUILDROOT_NEWLIB
+       bool "newlib (experimental)"
+       depends on BR2_arm
+       select BR2_TOOLCHAIN_USES_NEWLIB
+       select BR2_TOOLCHAIN_NO_VENDOR
+       help
+         This will build the newlib library for a toolchain without an OS
+
 endchoice
 
 config BR2_TOOLCHAIN_BUILDROOT_LIBC
@@ -104,6 +112,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	default "musl"	 if BR2_TOOLCHAIN_BUILDROOT_MUSL
+	default "newlib" if BR2_TOOLCHAIN_BUILDROOT_NEWLIB
 
 source "package/uclibc/Config.in"
 source "package/glibc/Config.in"
-- 
1.9.1
