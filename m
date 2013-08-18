From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Aug 2013 19:36:33 +0200
Subject: [Buildroot] [PATCH] toolchain: add support for glibc
Message-ID: <1376847393-12397-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The support for eglibc 2.17 was added to the internal toolchain
backend for 2013.08. This commit now adds glibc 2.18 support to the
internal toolchain backend. The building procedure is very similar to
the one of eglibc, with a few differences, but the two are kept
separate for now.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host              |   2 +-
 package/glibc/glibc.mk                  | 105 ++++++++++++++++++++++++++++++++
 toolchain/toolchain-buildroot/Config.in |  20 ++++++
 3 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 package/glibc/glibc.mk

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index a6acaa2..0b04b90 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -119,7 +119,7 @@ config BR2_INSTALL_FORTRAN
 config BR2_GCC_ENABLE_TLS
 	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	default y
-	depends on BR2_PTHREADS_NATIVE || BR2_TOOLCHAIN_BUILDROOT_EGLIBC
+	depends on BR2_PTHREADS_NATIVE || BR2_TOOLCHAIN_BUILDROOT_EGLIBC || BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	help
 	  Enable the compiler to generate code for accessing
 	  thread local storage variables
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
new file mode 100644
index 0000000..11fa985
--- /dev/null
+++ b/package/glibc/glibc.mk
@@ -0,0 +1,105 @@
+################################################################################
+#
+# glibc
+#
+################################################################################
+
+GLIBC_VERSION = 2.18
+GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
+GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
+GLIBC_LICENSE = GPLv2+ (programs), LGPLv2.1+, BSD-3c, MIT (library)
+GLIBC_LICENSE_FILES = COPYING COPYING.LIB LICENSES
+
+# Before glibc is configured, we must have the first stage
+# cross-compiler and the kernel headers
+GLIBC_DEPENDENCIES = host-gcc-initial linux-headers
+
+# Before glibc is built, we must have the second stage cross-compiler
+glibc-build: host-gcc-intermediate
+
+GLIBC_SUBDIR = build
+
+GLIBC_INSTALL_STAGING = YES
+
+GLIBC_INSTALL_STAGING_OPT = install_root=$(STAGING_DIR) install
+
+# Thumb build is broken, build in ARM mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+GLIBC_EXTRA_CFLAGS += -marm
+endif
+
+# Even though we use the autotools-package infrastructure, we have to
+# override the default configure commands for several reasons:
+#
+#  1. We have to build out-of-tree, but we can't use the same
+#     'symbolic link to configure' used with the gcc packages.
+#
+#  2. We have to execute the configure script with bash and not sh.
+#
+define GLIBC_CONFIGURE_CMDS
+	mkdir -p $(@D)/build
+	# Do the configuration
+	(cd $(@D)/build; \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" CPPFLAGS="" \
+		CXXFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" \
+		$(SHELL) $(@D)/configure \
+		ac_cv_path_BASH_SHELL=/bin/bash \
+		libc_cv_forced_unwind=yes \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--enable-shared \
+		$(if $(BR2_SOFT_FLOAT),--without-fp,--with-fp) \
+		--with-pkgversion="Buildroot" \
+		--without-cvs \
+		--disable-profile \
+		--without-gd \
+		--enable-obsolete-rpc \
+		--with-headers=$(STAGING_DIR)/usr/include)
+	# Install headers and start files
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build \
+		install_root=$(STAGING_DIR) \
+		install-bootstrap-headers=yes \
+		install-headers
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build csu/subdir_lib
+	cp $(@D)/build/csu/crt1.o $(STAGING_DIR)/usr/lib/
+	cp $(@D)/build/csu/crti.o $(STAGING_DIR)/usr/lib/
+	cp $(@D)/build/csu/crtn.o $(STAGING_DIR)/usr/lib/
+	$(TARGET_CROSS)gcc -nostdlib \
+		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libc.so
+	# stubs.h isn't installed by install-headers, so do it by
+	# hand.  We can tolerate an empty stubs.h for the moment.  See
+	# e.g. http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html
+	touch $(STAGING_DIR)/usr/include/gnu/stubs.h
+endef
+
+#
+# We also override the install to target commands since we only want
+# to install the libraries, and nothing more.
+#
+
+GLIBC_LIBS_LIB = \
+	ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so	   \
+	libnsl.so libpthread.so libresolv.so librt.so libutil.so   \
+	libnss_files.so libnss_dns.so
+
+ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
+GLIBC_LIBS_LIB += libthread_db.so
+endif
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+GLIBC_LIBS_USR_LIB += libstdc++.so
+endif
+
+define GLIBC_INSTALL_TARGET_CMDS
+	for libs in $(GLIBC_LIBS_LIB); do \
+		$(call copy_toolchain_lib_root,$(STAGING_DIR)/,,lib,$$libs,/lib) ; \
+	done
+	for libs in $(GLIBC_LIBS_USR_LIB); do \
+		$(call copy_toolchain_lib_root,$(STAGING_DIR)/,,lib,$$libs,/usr/lib) ; \
+	done
+endef
+
+$(eval $(autotools-package))
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 396a434..02efdbf 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -34,12 +34,32 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 
 	  http://eglibc.org
 
+config BR2_TOOLCHAIN_BUILDROOT_GLIBC
+	bool "glibc (experimental)"
+	depends on BR2_arm    || BR2_armeb    || BR2_aarch64 || \
+		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
+		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
+		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
+		   BR2_x86_64
+	select BR2_TOOLCHAIN_USES_GLIBC
+	# our glibc.mk enables RPC support
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	help
+	  This option selects glibc as the C library for the
+	  cross-compilation toolchain.
+
+	  The glibc support in the Buildroot toolchain backend is
+	  very recent, and therefore marked experimental.
+
+	  http://www.gnu.org/software/libc/
+
 endchoice
 
 config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	string
 	default "uclibc" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	default "eglibc" if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
+	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
 source "package/uclibc/Config.in"
 
-- 
1.8.1.2
