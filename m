From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 23:00:01 +0100
Subject: [Buildroot] [git commit branch/next] toolchain: kill ADI Blackfin
	toolchain
Message-ID: <20161125220030.A1568807DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=311bc137da2952445683413794f3ebc8e477c9ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This toolchain has many problems which are fixed in contemporary gcc
and uClibc-ng. In addition, several hacks are needed to be able to
work with this toolchain. All these hacks are removed as well.  Also
the package exceptions for this toolchain are removed.

The BR2_BFIN_INSTALL_FDPIC_SHARED and BR2_BFIN_INSTALL_FLAT_SHARED
options don't get a legacy entry. For the ADI toolchain, there already
is a legacy entry, so it doesn't make sense to add it twice. For other
external toolchains, these options didn't actually work, because they
rely on the specific layout of the ADI toolchain.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  8 +++
 package/glog/Config.in                             |  3 --
 package/php-amqp/Config.in                         |  2 -
 package/rabbitmq-c/Config.in                       |  4 --
 package/tinycbor/Config.in                         |  2 -
 package/x264/Config.in                             |  1 -
 toolchain/toolchain-external/Config.in             | 33 ------------
 .../toolchain-external/pkg-toolchain-external.mk   | 59 ----------------------
 .../toolchain-external-blackfin-uclinux/Config.in  | 17 -------
 .../Config.in.options                              | 10 ----
 .../toolchain-external-blackfin-uclinux.hash       |  3 --
 .../toolchain-external-blackfin-uclinux.mk         | 33 ------------
 12 files changed, 8 insertions(+), 167 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index cfb1276..aeefb39 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.02"
 
+config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
+	bool "Blackfin.uclinux.org 2014R1 toolchain removed"
+	select BR2_LEGACY
+	help
+	  The ADI Blackfin toolchain has many bugs which are fixed in
+	  more recent gcc and uClibc-ng releases. Use the Buildroot
+	  toolchain instead.
+
 config BR2_PACKAGE_MAKEDEVS
 	bool "makedevs removed"
 	select BR2_LEGACY
diff --git a/package/glog/Config.in b/package/glog/Config.in
index f708758..534997a 100644
--- a/package/glog/Config.in
+++ b/package/glog/Config.in
@@ -3,14 +3,11 @@ config BR2_PACKAGE_GLOG
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	# build issues with this external toolchain
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	help
 	  C++ implementation of the Google logging module
 
 	  https://github.com/google/glog
 
 comment "glog needs a toolchain w/ C++, threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
diff --git a/package/php-amqp/Config.in b/package/php-amqp/Config.in
index 253bfa7..0aa2021 100644
--- a/package/php-amqp/Config.in
+++ b/package/php-amqp/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PHP_AMQP
 	bool "php-amqp"
 	depends on BR2_PACKAGE_PHP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # rabbitmq-c
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX # rabbitmq-c
 	select BR2_PACKAGE_RABBITMQ_C
 	help
 	  Communicate with any AMQP compliant server.
@@ -11,4 +10,3 @@ config BR2_PACKAGE_PHP_AMQP
 
 comment "php-amqp needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
diff --git a/package/rabbitmq-c/Config.in b/package/rabbitmq-c/Config.in
index 0d08233..b330c90 100644
--- a/package/rabbitmq-c/Config.in
+++ b/package/rabbitmq-c/Config.in
@@ -1,9 +1,6 @@
 config BR2_PACKAGE_RABBITMQ_C
 	bool "rabbitmq-c"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# too old uClibc, not providing posix_spawn functions
-	# http://autobuild.buildroot.net/results/a6c3e79c61c5a535970d03bf37b068349f766a7f/
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	help
 	  This is a C-language AMQP client library for use with v2.0+
 	  of the RabbitMQ broker.
@@ -12,4 +9,3 @@ config BR2_PACKAGE_RABBITMQ_C
 
 comment "rabbitmq-c needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
diff --git a/package/tinycbor/Config.in b/package/tinycbor/Config.in
index cf176e4..41f0b5f 100644
--- a/package/tinycbor/Config.in
+++ b/package/tinycbor/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_TINYCBOR
 	bool "tinycbor"
-	# package uses fopencookie(), not available with this toolchain
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	help
 	  Concise Binary Object Representation (CBOR) Library
 
diff --git a/package/x264/Config.in b/package/x264/Config.in
index 7bf2319..be3ab3f 100644
--- a/package/x264/Config.in
+++ b/package/x264/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_X264
 	bool "x264"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX # madvise()
 	help
 	  x264 is a free software library and application for
 	  encoding video streams into the H.264/MPEG-4 AVC
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2c39e5a..c007e62 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -25,9 +25,6 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.
 # ARM big-endian
 source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
 
-# Blackfin
-source "toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in"
-
 # MIPS (use codesourcery toolchain by default)
 source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in"
 source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in"
@@ -125,9 +122,6 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.
 # ARM big-endian
 source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options"
 
-# Blackfin
-source "toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options"
-
 # MIPS
 source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options"
@@ -156,31 +150,4 @@ config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	  Copy the gdbserver provided by the external toolchain to the
 	  target.
 
-# When the FDPIC shared binary format is used, the corresponding libraries are
-# always installed. When a different binary format is used, we offer the option
-# of installing the FDPIC shared libraries.
-config BR2_BFIN_INSTALL_FDPIC_SHARED
-	bool "Install FDPIC shared libraries"
-	depends on BR2_bfin && !BR2_BINFMT_FDPIC
-	help
-	  The Linux kernel supports running both FDPIC and FLAT applications
-	  concurrently if the binary format specific libraries are installed
-	  properly. This option allows developer to install FDPIC libraries
-	  into a buildroot rootfs image built with binary format that is not
-	  FDPIC.
-
-# When the FLAT shared binary format is used, we force the installation
-# of the corresponding libraries. When a different binary format is
-# used, we offer the option of installing the FLAT shared libraries.
-config BR2_BFIN_INSTALL_FLAT_SHARED
-	bool "Install FLAT shared libraries" if !BR2_BINFMT_FLAT_SHARED
-	depends on BR2_bfin
-	default y if BR2_BINFMT_FLAT_SHARED
-	help
-	  The Linux kernel supports running both FDPIC and FLAT applications
-	  concurrently if the binary format specific libraries are installed
-	  properly. This option allows developer to install FLAT libraries
-	  into a buildroot rootfs image built with binary format that is not
-	  shared FLAT.
-
 endif # BR2_TOOLCHAIN_EXTERNAL
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 3cac520..e0a8b41 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -16,7 +16,6 @@
 #    MIPS, PowerPC, x86, x86_64 and NIOS 2 architectures. For the MIPS
 #    toolchain, the -muclibc variant isn't supported yet, only the
 #    default glibc-based variant is.
-#  * Analog Devices toolchains for the Blackfin architecture
 #  * Xilinx toolchains for the Microblaze architecture
 #  * Synopsys DesignWare toolchains for ARC cores
 #
@@ -79,12 +78,8 @@ ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
 TOOLCHAIN_EXTERNAL_BIN := $(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
 endif
 else
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX),y)
-TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
-else
 TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
 endif
-endif
 
 # If this is a buildroot toolchain, it already has a wrapper which we want to
 # bypass. Since this is only evaluated after it has been extracted, we can use
@@ -505,57 +500,6 @@ define TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
 endef
 endif
 
-#
-# Various functions used by the external toolchain package
-# infrastructure to handle the Blackfin specific
-# BR2_BFIN_INSTALL_FDPIC_SHARED and BR2_BFIN_INSTALL_FLAT_SHARED
-# options.
-#
-
-# Special installation target used on the Blackfin architecture when
-# FDPIC is not the primary binary format being used, but the user has
-# nonetheless requested the installation of the FDPIC libraries to the
-# target filesystem.
-ifeq ($(BR2_BFIN_INSTALL_FDPIC_SHARED),y)
-define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC
-	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to staging...")
-	$(Q)FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
-	FDPIC_SYSROOT_DIR="$(call toolchain_find_sysroot,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
-	FDPIC_LIB_DIR="$(call toolchain_find_libdir,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
-	FDPIC_SUPPORT_LIB_DIR="" ; \
-	if test `find $${FDPIC_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
-	        FDPIC_LIBSTDCPP_A_LOCATION=$$(LANG=C $${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libstdc++.a) ; \
-	        if [ -e "$${FDPIC_LIBSTDCPP_A_LOCATION}" ]; then \
-	                FDPIC_SUPPORT_LIB_DIR=`readlink -f $${FDPIC_LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
-	        fi ; \
-	fi ; \
-	$(call copy_toolchain_sysroot,$${FDPIC_SYSROOT_DIR},$${FDPIC_SYSROOT_DIR},,$${FDPIC_LIB_DIR},$${FDPIC_SUPPORT_LIB_DIR})
-endef
-define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC
-	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...")
-	$(Q)for libs in $(TOOLCHAIN_EXTERNAL_LIBS); do \
-		$(call copy_toolchain_lib_root,$$libs); \
-	done
-endef
-endif
-
-# Special installation target used on the Blackfin architecture when
-# shared FLAT is not the primary format being used, but the user has
-# nonetheless requested the installation of the shared FLAT libraries
-# to the target filesystem. The flat libraries are found and linked
-# according to the index in name "libN.so". Index 1 is reserved for
-# the standard C library. Customer libraries can use 4 and above.
-ifeq ($(BR2_BFIN_INSTALL_FLAT_SHARED),y)
-define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT
-	$(Q)$(call MESSAGE,"Install external toolchain FLAT libraries to target...")
-	$(Q)FLAT_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))../../bfin-uclinux/bin/bfin-uclinux-gcc ; \
-	FLAT_LIBC_A_LOCATION=`$${FLAT_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -mid-shared-library -print-file-name=libc`; \
-	if [ -f $${FLAT_LIBC_A_LOCATION} -a ! -h $${FLAT_LIBC_A_LOCATION} ] ; then \
-	        $(INSTALL) -D $${FLAT_LIBC_A_LOCATION} $(TARGET_DIR)/lib/lib1.so; \
-	fi
-endef
-endif
-
 # uClibc-ng dynamic loader is called ld-uClibc.so.1, but gcc is not
 # patched specifically for uClibc-ng, so it continues to generate
 # binaries that expect the dynamic loader to be named ld-uClibc.so.0,
@@ -644,7 +588,6 @@ define $(2)_INSTALL_STAGING_CMDS
 	$$(TOOLCHAIN_WRAPPER_INSTALL)
 	$$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
-	$$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
 endef
@@ -660,8 +603,6 @@ define $(2)_INSTALL_TARGET_CMDS
 	$$(TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER)
-	$$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC)
-	$$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT)
 	$$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
 endef
 
diff --git a/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in
deleted file mode 100644
index 8b299e8..0000000
--- a/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in
+++ /dev/null
@@ -1,17 +0,0 @@
-config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
-	bool "Blackfin.uclinux.org 2014R1"
-	depends on BR2_bfin
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_USE_WCHAR
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	help
-	  Toolchain for the Blackfin architecture, from
-	  http://blackfin.uclinux.org.
diff --git a/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options
deleted file mode 100644
index 3b7f457..0000000
--- a/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options
+++ /dev/null
@@ -1,10 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "bfin-uclinux" if BR2_BINFMT_FLAT
-	default "bfin-linux-uclibc" if BR2_BINFMT_FDPIC
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-blackfin-uclinux"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.hash b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.hash
deleted file mode 100644
index b320d94..0000000
--- a/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256 e424e90d8481d942a40266d78d1488726561fed3ec38403094f98055e61889d0  blackfin-toolchain-2014R1-RC2.i386.tar.bz2
-sha256 c65b1b4b918d5185349d62a3b7bf43b4b21e1175c52598ec047ca56b3f11d857  blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.mk b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.mk
deleted file mode 100644
index 0a48220..0000000
--- a/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.mk
+++ /dev/null
@@ -1,33 +0,0 @@
-################################################################################
-#
-# toolchain-external-blackfin-uclinux
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION_MAJOR = 2014R1
-TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION = $(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION_MAJOR)-RC2
-
-ifeq ($(BR2_BINFMT_FLAT),y)
-TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_SUBDIR = bfin-uclinux
-else
-TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_SUBDIR = bfin-linux-uclibc
-endif
-
-TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_SITE = http://downloads.sourceforge.net/project/adi-toolchain/$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION_MAJOR)/$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION)/i386
-TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_SOURCE = blackfin-toolchain-$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION).i386.tar.bz2
-TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION).i386.tar.bz2
-
-TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_STRIP_COMPONENTS = 3
-
-# Special handling for Blackfin toolchain, because of the split in two
-# tarballs, and the organization of tarball contents. The tarballs
-# contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
-# which themselves contain the toolchain. This is why we strip more
-# components than usual.
-define TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_UCLIBC_EXTRA_EXTRACT
-	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_EXTRA_DOWNLOADS) | \
-		$(TAR) --strip-components=3 -C $(@D) $(TAR_OPTIONS) -
-endef
-TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_UCLIBC_EXTRA_EXTRACT
-
-$(eval $(toolchain-external-package))
