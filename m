From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Sep 2013 22:50:20 +0200
Subject: [Buildroot] [git commit] toolchain-internal: skip gcc-intermediate
	when possible
Message-ID: <20130915213314.6ECE282A40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2babed4a50fcd050abc4686e05e24d0e374d10a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When NPTL support was introduced, gcc required a three stages build
process. Since gcc 4.7, this is no longer necessary, and it is
possible to get back to a two stages build process. This patch takes
advantage of this, by doing a two stages build process when possible.

We introduce a few hidden kconfig options:

 * BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD, which is set by the gcc
   Config.in logic to indicate that the compiler might need a three
   stages build. Currently, all versions prior to 4.7.x are selecting
   this kconfig option.

 * BR2_TOOLCHAIN_LIBC_NEEDS_THREE_STAGE_BUILD, which indicates whether
   the C library might need a three stages build. This is the case for
   eglibc, and uClibc when NPTL is enabled.

 * BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD finally is enabled when both
   of the previous options are enabled. It indicates that a three
   stages build is actually needed.

In addition to those options, the uClibc/gcc build logic is changed to
use only a two stages build process when possible.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/eglibc/eglibc.mk               |    5 +++--
 package/gcc/Config.in.host             |   11 +++++++++++
 package/gcc/gcc-initial/gcc-initial.mk |    8 ++++++++
 package/uclibc/Config.in               |    1 +
 package/uclibc/uclibc.mk               |    5 +++--
 toolchain/Config.in                    |    9 +++++++++
 6 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/package/eglibc/eglibc.mk b/package/eglibc/eglibc.mk
index fe12299..0ed908d 100644
--- a/package/eglibc/eglibc.mk
+++ b/package/eglibc/eglibc.mk
@@ -14,8 +14,9 @@ EGLIBC_LICENSE_FILES = libc/COPYING libc/COPYING.LIB libc/LICENSES
 # cross-compiler and the kernel headers
 EGLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-gawk
 
-# Before eglibc is built, we must have the second stage cross-compiler
-eglibc-build: host-gcc-intermediate
+# Before eglibc is built, we must have the second stage
+# cross-compiler, for some gcc versions
+eglibc-build: $(if $(BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD),host-gcc-intermediate)
 
 EGLIBC_SUBDIR = build
 
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index a6acaa2..7e6df2d 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -3,6 +3,12 @@ comment "GCC Options"
 config BR2_GCC_NEEDS_MPC
 	bool
 
+# Until gcc 4.7, a three stage build process was needed when using
+# NPTL. This hidden option tells whether gcc is a version that
+# requires this three stage build process.
+config BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
+	bool
+
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
@@ -16,11 +22,13 @@ choice
 	config BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 		depends on BR2_avr32
 		bool "gcc 4.2.2-avr32-2.1.5"
+		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_3_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.3.x"
+		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_4_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
@@ -29,6 +37,7 @@ choice
 		depends on !BR2_ARM_EABIHF
 		# VFPv4 support appeared in gcc 4.5
 		depends on !BR2_ARM_FPU_VFPV4 && !BR2_ARM_FPU_VFPV4D16
+		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_5_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
@@ -36,11 +45,13 @@ choice
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.5.x"
+		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_6_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.6.x"
+		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_7_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 0eb492f..83767ea 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -29,6 +29,7 @@ HOST_GCC_INITIAL_CONF_OPT = \
 	--enable-languages=c \
 	--disable-shared \
 	--without-headers \
+	--disable-threads \
 	--with-newlib \
 	--disable-largefile \
 	--disable-nls \
@@ -40,4 +41,11 @@ HOST_GCC_INITIAL_CONF_ENV = \
 HOST_GCC_INITIAL_MAKE_OPT = all-gcc
 HOST_GCC_INITIAL_INSTALL_OPT = install-gcc
 
+ifeq ($(BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD),)
+ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
+HOST_GCC_INITIAL_MAKE_OPT += all-target-libgcc
+HOST_GCC_INITIAL_INSTALL_OPT += install-target-libgcc
+endif
+endif
+
 $(eval $(host-autotools-package))
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 92e04e9..037ca01 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -115,6 +115,7 @@ choice
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
 		select BR2_TOOLCHAIN_HAS_THREADS
+		select BR2_TOOLCHAIN_LIBC_NEEDS_THREE_STAGE_BUILD
 		depends on !BR2_arc
 		depends on !BR2_avr32
 		depends on !BR2_bfin
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 39877bb..181a772 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -22,8 +22,9 @@ UCLIBC_INSTALL_STAGING = YES
 # cross-compiler and the kernel headers
 UCLIBC_DEPENDENCIES = host-gcc-initial linux-headers
 
-# Before uClibc is built, we must have the second stage cross-compiler
-uclibc-build: host-gcc-intermediate
+# Before uClibc is built, we must have the second stage
+# cross-compiler, for some gcc versions, and when NPTL is used.
+uclibc-build: $(if $(BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD),host-gcc-intermediate)
 
 # specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
 # setting.
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 9d1e68f..27f7b50 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -1,5 +1,13 @@
 menu "Toolchain"
 
+config BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD
+	bool
+	default y if BR2_TOOLCHAIN_LIBC_NEEDS_THREE_STAGE_BUILD && \
+		BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
+
+config BR2_TOOLCHAIN_LIBC_NEEDS_THREE_STAGE_BUILD
+	bool
+
 # Should be selected for glibc or eglibc
 config BR2_TOOLCHAIN_USES_GLIBC
 	bool
@@ -10,6 +18,7 @@ config BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
+	select BR2_TOOLCHAIN_LIBC_NEEDS_THREE_STAGE_BUILD
 
 config BR2_TOOLCHAIN_USES_UCLIBC
 	bool
