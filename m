From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  5 May 2018 12:58:44 +0200
Subject: [Buildroot] [PATCH] package/gcc: add support for gcc 8.1
Message-ID: <20180505105844.5278-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove 0860-cilk-fix-build-without-wchar.patch since cilk has
been removed from gcc.

Rebase 0900-remove-selftests.patch on gcc 8.1.0

Remove upstream patches 0001-m68k-coldfire-pr68467.patch and
0892-microblaze-Revert.patch.

Use bz2 release tarball only for gcc 4.9 since all other version
now use xz tarball.

Runtime tested on x86_64 with binutils 2.30, gcc 8.1.0,
kernel headers 4.14 and glibc 2.27.

Buildtime tested with glibc with all supported architectures.

Buildtime tested on x86_64 with musl and uClibc-ng

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/8.1.0/0001-uclibc-conf.patch           |  29 ++++
 package/gcc/8.1.0/0002-arm-softfloat-libgcc.patch  |  45 +++++++
 package/gcc/8.1.0/0003-remove-selftests.patch      | 149 +++++++++++++++++++++
 package/gcc/Config.in.host                         |   7 +
 package/gcc/gcc.hash                               |   2 +
 package/gcc/gcc.mk                                 |  10 +-
 toolchain/Config.in                                |   5 +
 .../toolchain-external-custom/Config.in.options    |   6 +
 8 files changed, 248 insertions(+), 5 deletions(-)
 create mode 100644 package/gcc/8.1.0/0001-uclibc-conf.patch
 create mode 100644 package/gcc/8.1.0/0002-arm-softfloat-libgcc.patch
 create mode 100644 package/gcc/8.1.0/0003-remove-selftests.patch

diff --git a/package/gcc/8.1.0/0001-uclibc-conf.patch b/package/gcc/8.1.0/0001-uclibc-conf.patch
new file mode 100644
index 0000000000..7d0f710945
--- /dev/null
+++ b/package/gcc/8.1.0/0001-uclibc-conf.patch
@@ -0,0 +1,29 @@
+From 07475e62626e246df07f35c4427b207c480b1f95 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Tue, 2 May 2017 22:36:15 +0200
+Subject: [PATCH 1/3] uclibc-conf
+
+[Romain: convert to git patch]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ contrib/regression/objs-gcc.sh | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/contrib/regression/objs-gcc.sh b/contrib/regression/objs-gcc.sh
+index 60b0497fea2..6dc7eadff36 100755
+--- a/contrib/regression/objs-gcc.sh
++++ b/contrib/regression/objs-gcc.sh
+@@ -106,6 +106,10 @@ if [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-gnu ]
+  then
+   make all-gdb all-dejagnu all-ld || exit 1
+   make install-gdb install-dejagnu install-ld || exit 1
++elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
++ then
++  make all-gdb all-dejagnu all-ld || exit 1
++  make install-gdb install-dejagnu install-ld || exit 1
+ elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
+   make bootstrap || exit 1
+   make install || exit 1
+-- 
+2.14.3
+
diff --git a/package/gcc/8.1.0/0002-arm-softfloat-libgcc.patch b/package/gcc/8.1.0/0002-arm-softfloat-libgcc.patch
new file mode 100644
index 0000000000..61df733c1d
--- /dev/null
+++ b/package/gcc/8.1.0/0002-arm-softfloat-libgcc.patch
@@ -0,0 +1,45 @@
+From f016160e98472084c4db4848e0c5d6e68f7d75d4 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Tue, 2 May 2017 22:46:18 +0200
+Subject: [PATCH 2/3] arm softfloat libgcc
+
+[Romain: convert to git patch]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gcc/config/arm/linux-elf.h | 2 +-
+ libgcc/config/arm/t-linux  | 7 ++++++-
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
+index cfcd9cb1a5c..b8a9a9ca4ae 100644
+--- a/gcc/config/arm/linux-elf.h
++++ b/gcc/config/arm/linux-elf.h
+@@ -58,7 +58,7 @@
+    %{shared:-lc} \
+    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
+ 
+-#define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
++#define LIBGCC_SPEC "-lgcc"
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
+ 
+diff --git a/libgcc/config/arm/t-linux b/libgcc/config/arm/t-linux
+index 3d520decafb..e7bc042d4e4 100644
+--- a/libgcc/config/arm/t-linux
++++ b/libgcc/config/arm/t-linux
+@@ -1,6 +1,11 @@
+ LIB1ASMSRC = arm/lib1funcs.S
+ LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx _clzsi2 _clzdi2 \
+-	_ctzsi2 _arm_addsubdf3 _arm_addsubsf3
++	_ctzsi2 _arm_addsubdf3 _arm_addsubsf3 \
++	_arm_addsubdf3 _arm_addsubsf3 \
++	_arm_negdf2 _arm_muldivdf3 _arm_cmpdf2 _arm_unorddf2 \
++	_arm_fixdfsi _arm_fixunsdfsi _arm_truncdfsf2 \
++	_arm_negsf2 _arm_muldivsf3 _arm_cmpsf2 _arm_unordsf2 \
++	_arm_fixsfsi _arm_fixunssfsi
+ 
+ # Just for these, we omit the frame pointer since it makes such a big
+ # difference.
+-- 
+2.14.3
+
diff --git a/package/gcc/8.1.0/0003-remove-selftests.patch b/package/gcc/8.1.0/0003-remove-selftests.patch
new file mode 100644
index 0000000000..2caddc15f9
--- /dev/null
+++ b/package/gcc/8.1.0/0003-remove-selftests.patch
@@ -0,0 +1,149 @@
+From 0b33b1afd99500b8d4f857f0abd00cea6fe08ea6 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 3 May 2017 00:37:06 +0200
+Subject: [PATCH 3/3] remove selftests
+
+When the gcc archive is extracted by the gcc.mk, the gcc/testsuite
+is excluded:
+
+HOST_GCC_EXCLUDES = \
+	libjava/* libgo/* \
+	gcc/testsuite/* libstdc++-v3/testsuite/*
+
+The new Makefile target from the "Selftest framework" [1] added a dependency
+on the gcc/testsuite/Makefile.
+Revert partially the commit [1] to allow building gcc without selftest.
+
+[1] https://github.com/gcc-mirror/gcc/commit/99b4f3a2d5bf2c137de9731e27b483eb6b462fd9
+
+[Rebased on gcc 8.1]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gcc/Makefile.in | 83 ++++-----------------------------------------------------
+ 1 file changed, 5 insertions(+), 78 deletions(-)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index 20bee0494b1..1ae5fb382b5 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -1610,14 +1610,13 @@ OBJS-libcommon = diagnostic.o diagnostic-color.o diagnostic-show-locus.o \
+ 	edit-context.o \
+ 	pretty-print.o intl.o \
+ 	sbitmap.o \
+-	vec.o input.o version.o hash-table.o ggc-none.o memory-block.o \
+-	selftest.o selftest-diagnostic.o
++	vec.o input.o version.o hash-table.o ggc-none.o memory-block.o
+ 
+ # Objects in libcommon-target.a, used by drivers and by the core
+ # compiler and containing target-dependent code.
+ OBJS-libcommon-target = $(common_out_object_file) prefix.o params.o \
+ 	opts.o opts-common.o options.o vec.o hooks.o common/common-targhooks.o \
+-	hash-table.o file-find.o spellcheck.o selftest.o
++	hash-table.o file-find.o spellcheck.o
+ 
+ # This lists all host objects for the front ends.
+ ALL_HOST_FRONTEND_OBJS = $(foreach v,$(CONFIG_LANGUAGES),$($(v)_OBJS))
+@@ -1894,10 +1893,10 @@ config.status: $(srcdir)/configure $(srcdir)/config.gcc
+ quickstrap: all
+ 	cd $(toplevel_builddir) && $(MAKE) all-target-libgcc
+ 
+-all.internal: start.encap rest.encap doc selftest
++all.internal: start.encap rest.encap doc
+ # This is what to compile if making a cross-compiler.
+ all.cross: native gcc-cross$(exeext) cpp$(exeext) specs \
+-	libgcc-support lang.all.cross doc selftest @GENINSRC@ srcextra
++	libgcc-support lang.all.cross doc @GENINSRC@ srcextra
+ # This is what must be made before installing GCC and converting libraries.
+ start.encap: native xgcc$(exeext) cpp$(exeext) specs \
+ 	libgcc-support lang.start.encap @GENINSRC@ srcextra
+@@ -1917,78 +1916,6 @@ endif
+ # This does the things that can't be done on the host machine.
+ rest.cross: specs
+ 
+-# GCC's selftests.
+-# Specify a dummy input file to placate the driver.
+-# Specify -nostdinc to work around missing WIND_BASE environment variable
+-# required for *-wrs-vxworks-* targets.
+-# Specify -o /dev/null so the output of -S is discarded. More importantly
+-# It does not try to create a file with the name "null.s" on POSIX and
+-# "nul.s" on Windows. Because on Windows "nul" is a reserved file name.
+-# Beware that /dev/null is not available to mingw tools, so directly use
+-# "nul" instead of "/dev/null" if we're building on a mingw machine.
+-# Specify the path to gcc/testsuite/selftests within the srcdir
+-# as an argument to -fself-test.
+-DEVNULL=$(if $(findstring mingw,$(build)),nul,/dev/null)
+-SELFTEST_FLAGS = -nostdinc $(DEVNULL) -S -o $(DEVNULL) \
+-	-fself-test=$(srcdir)/testsuite/selftests
+-
+-C_SELFTEST_FLAGS = -xc $(SELFTEST_FLAGS)
+-CPP_SELFTEST_FLAGS = -xc++ $(SELFTEST_FLAGS)
+-
+-SELFTEST_DEPS = $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftests
+-
+-C_SELFTEST_DEPS = cc1$(exeext) $(SELFTEST_DEPS)
+-CPP_SELFTEST_DEPS = cc1plus$(exeext) $(SELFTEST_DEPS)
+-
+-# Run the selftests during the build once we have a driver and the frontend,
+-# so that self-test failures are caught as early as possible.
+-# Use "s-selftest-FE" to ensure that we only run the selftests if the
+-# driver, frontend, or selftest data change.
+-.PHONY: selftest
+-
+-# By default, only run the selftests within the C frontend
+-selftest: s-selftest-c
+-
+-# C selftests
+-s-selftest-c: $(C_SELFTEST_DEPS)
+-	$(GCC_FOR_TARGET) $(C_SELFTEST_FLAGS)
+-	$(STAMP) $@
+-
+-# Convenience methods for running C selftests under gdb:
+-.PHONY: selftest-c-gdb
+-selftest-c-gdb: $(C_SELFTEST_DEPS)
+-	$(GCC_FOR_TARGET) $(C_SELFTEST_FLAGS) \
+-	  -wrapper gdb,--args
+-
+-.PHONY: selftest-gdb
+-selftest-gdb: selftest-c-gdb
+-
+-# Convenience methods for running C selftests under valgrind:
+-.PHONY: selftest-c-valgrind
+-selftest-c-valgrind: $(C_SELFTEST_DEPS)
+-	$(GCC_FOR_TARGET) $(C_SELFTEST_FLAGS) \
+-	  -wrapper valgrind,--leak-check=full
+-
+-.PHONY: selftest-valgrind
+-selftest-valgrind: selftest-c-valgrind
+-
+-# C++ selftests
+-s-selftest-c++: $(CPP_SELFTEST_DEPS)
+-	$(GCC_FOR_TARGET) $(CPP_SELFTEST_FLAGS)
+-	$(STAMP) $@
+-
+-# Convenience method for running C++ selftests under gdb:
+-.PHONY: selftest-c++-gdb
+-selftest-c++-gdb: $(CPP_SELFTEST_DEPS)
+-	$(GCC_FOR_TARGET) $(CPP_SELFTEST_FLAGS) \
+-	  -wrapper gdb,--args
+-
+-# Convenience method for running C++ selftests under valgrind:
+-.PHONY: selftest-c++-valgrind
+-selftest-c++-valgrind: $(CPP_SELFTEST_DEPS)
+-	$(GCC_FOR_TARGET) $(CPP_SELFTEST_FLAGS) \
+-	  -wrapper valgrind,--leak-check=full
+-
+ # Recompile all the language-independent object files.
+ # This is used only if the user explicitly asks for it.
+ compilations: $(BACKEND)
+@@ -2142,7 +2069,7 @@ gcc-nm.c: gcc-ar.c
+ 	cp $^ $@
+ 
+ COLLECT2_OBJS = collect2.o collect2-aix.o tlink.o vec.o ggc-none.o \
+-  collect-utils.o file-find.o hash-table.o selftest.o
++  collect-utils.o file-find.o hash-table.o
+ COLLECT2_LIBS = @COLLECT2_LIBS@
+ collect2$(exeext): $(COLLECT2_OBJS) $(LIBDEPS)
+ # Don't try modifying collect2 (aka ld) in place--it might be linking this.
+-- 
+2.14.3
+
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 7c08fb3596..ae91b5c0c4 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -61,6 +61,12 @@ config BR2_GCC_VERSION_7_X
 	depends on !BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
+config BR2_GCC_VERSION_8_X
+	bool "gcc 8.x"
+	# Broken or unsupported architectures
+	depends on !BR2_or1k
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
 endchoice
 
 config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
@@ -73,6 +79,7 @@ config BR2_GCC_VERSION
 	default "5.5.0"     if BR2_GCC_VERSION_5_X
 	default "6.4.0"     if BR2_GCC_VERSION_6_X
 	default "7.3.0"     if BR2_GCC_VERSION_7_X
+	default "8.1.0"     if BR2_GCC_VERSION_8_X
 	default "arc-2018.03-rc1" if BR2_GCC_VERSION_ARC
 	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index d9a651b547..a2efe551ac 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,6 +6,8 @@ sha512  670ff52c2ae12c7852c12987e91798c5aa8bd6daf21f0d6e0cd57a4aa59cc4f06a837fe7
 sha512  02c60e54527c7adf584798d5251f8a0b80c93d5deafce82501b2c28e6692e0bd783927bbfc4bc527a863c0cccc025150a34740a9e29badb02d4b48e56a8aba90  gcc-6.4.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.3.0/sha512.sum
 sha512  ad41a7e4584e40e92cdf860bc0288500fbaf5dfb7e8c3fcabe9eba809c87bcfa85b46c19c19921b0cdf6d05483faede8287bb9ea120c0d1559449a70e602c8d4  gcc-7.3.0.tar.xz
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-8.1.0/sha512.sum
+sha512  c96246f34a7aeb404c4525b754dc7f7708a18e06271aadb2b32fef00e6e0940f584e52430bfe2ab01e699c93e3cb418adc113d2622fa826facbec0ec8ce3eb2c  gcc-8.1.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  16e5f9d1637be9a099a996074dc43803803497965c1eab6c0057f10d193d30dcc405ad852df82c4f8c61b195195ee797b788ba0b235d7b03e4410806ac5f94bc  gcc-arc-2018.03-rc1.tar.gz
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 0afb06a57e..1ae9b7edd9 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -18,13 +18,13 @@ GCC_SITE = $(call github,openrisc,or1k-gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
-# From version 5.5.0, 6.4.0 and 7.2.0 a bz2 release tarball is not
+# From version 5.5.0, 6.4.0, 7.2.0 and 8.1.0 a bz2 release tarball is not
 # provided anymore. Use the xz tarball instead.
-ifeq ($(BR2_GCC_VERSION_5_X)$(BR2_GCC_VERSION_6_X)$(BR2_GCC_VERSION_7_X),y)
-GCC_SOURCE = gcc-$(GCC_VERSION).tar.xz
-else
+ifeq ($(BR2_GCC_VERSION_4_9_X),y)
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
-endif # BR2_GCC_VERSION_6_X
+else
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.xz
+endif
 endif
 
 #
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 121ddb4fa4..f33e359c04 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -409,10 +409,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "8"	if BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	default "7"	if BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	default "6"	if BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	default "5"	if BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 65d94d0adf..5261165a90 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -27,6 +27,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 choice
 	bool "External toolchain gcc version"
+	default BR2_TOOLCHAIN_EXTERNAL_GCC_8   if BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	default BR2_TOOLCHAIN_EXTERNAL_GCC_7   if BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	default BR2_TOOLCHAIN_EXTERNAL_GCC_6   if BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	default BR2_TOOLCHAIN_EXTERNAL_GCC_5   if BR2_ARCH_NEEDS_GCC_AT_LEAST_5
@@ -37,8 +38,13 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_8
+	bool "8.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_7
 	bool "7.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_6
-- 
2.14.3
