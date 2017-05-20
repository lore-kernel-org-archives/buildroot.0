From: Theodore Ateba <tf.ateba@gmail.com>
Date: Sat, 20 May 2017 15:55:51 +0200
Subject: [Buildroot] [for-next,2/3] package/gcc: add support for gcc 7
In-Reply-To: <20170513113732.8154-2-romain.naour@gmail.com>
References: <20170513113732.8154-2-romain.naour@gmail.com>
Message-ID: <8f617d41-3f41-7d34-9800-b2c913411068@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested-by: Theodore Ateba, tf.ateba at gmail.com

To test ggc7 I made the following tasks:

1) Build test:

- Build a Buildroot toolchain with gcc7.1.0 and uClibc-ng.1.0.24 and a 
distribution for Beaglebone Black board on x86_64 PC.

- I had an conflict when applying the patch 
http://patchwork.ozlabs.org/patch/761980/ , it was resolve by making the 
following modification in the patch: ararc-2017.03-rc1 by arc-2017.03-rc2

2) Run time test on the BleagleBone Black:

- I made an sdCard with the generated image and boot the linux 
distribution on the target board.

- I also made an hello world program, compile it with the cross-tool 
chain generated with buuildroot.

- Run the hello world program on the Beaglebone black board.

I have also add the configuration used when testing the patch.

Thanks.
On 05/13/2017 01:37 PM, Romain Naour wrote:
> Remove upstream patches:
>
> 831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
>
> 870-xtensa-Fix-PR-target-78118.patch
>
> 871-xtensa-Fix-PR-target-78603.patch
>
> 890-fix-m68k-compile.patch:
> https://github.com/gcc-mirror/gcc/commit/1701058da920d27de87dc82e8d327b8ca930e997
>
> 892-libgcc-mkmap-symver-support-skip_underscore.patch:
> https://github.com/gcc-mirror/gcc/commit/6c8f362e1f17cce05131eb8ff53963d64bc69484
>
> 893-libgcc-config-bfin-use-the-generic-linker-version-in.patch:
> https://github.com/gcc-mirror/gcc/commit/966d046c08ba50fc988ac614f84f2d49c1546e28
>
> 894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch:
> https://github.com/gcc-mirror/gcc/commit/397d0e43abb943f1fe57801220e7e46bc6636c7c
>
> 895-bfin-define-REENTRANT.patch:
> https://github.com/gcc-mirror/gcc/commit/da89a4dcdf75bc3134f73520535c949bbbb0c845
>
> 940-uclinux-enable-threads.patch:
> https://github.com/gcc-mirror/gcc/commit/b9ce54109ec78d18f6123a1e54aae1293bede716
>
> 941-mips-Add-support-for-mips-r6-musl.patch:
> https://github.com/gcc-mirror/gcc/commit/83717065090bb8b954556d1216dd9dc397dc0243
>
> Remove obsolete patches:
>
> 301-missing-execinfo_h.patch: boehm-gc removed from gcc sources:
> https://github.com/gcc-mirror/gcc/commit/baf71228766058f5541d929891237d394376c975
>
> 830-arm_unbreak_armv4t.patch: SUBTARGET_CPU_DEFAULT removed:
> https://github.com/gcc-mirror/gcc/commit/ff3caa3ade14a42d5ab7e81cbd3605fe15aa998d
>
> Add a new patch to allow to build gcc 7.1 without extracting gcc/testsuite
> directory.
>
> This new gcc version require a kernel patch [1] to avoid a build issue with
> ____ilog2_NaN symbol. The following kernel version contain contain already
> this patch :
> 4.11, 4.10.6, 4.9.18, 4.4.57, 3.18.50 and 3.12.73.
>
> To build a toolchain based on gcc 7 and uClibc-ng 1.0.24, the patch [2] is
> required to avoid a build issue due to missing aligned_alloc() definition.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=474c90156c8dcc2fa815e6716cc9394d7930cb9c
> [2] https://cgit.openadk.org/cgi/cgit/uclibc-ng.git/commit/?id=5b0f49037e8ea8500b05c8f31ee88529ccac4cee
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> ---
>
> Build tested with glibc, musl and uClibc-ng.
>
> Runtime tested with uClibc-ng (1.0.24) on x86_64 PC target.
> ---
>   package/gcc/7.1.0/0100-uclibc-conf.patch           |  29 ++++++
>   package/gcc/7.1.0/0810-arm-softfloat-libgcc.patch  |  45 +++++++++
>   .../7.1.0/0860-cilk-fix-build-without-wchar.patch  |  64 ++++++++++++
>   package/gcc/7.1.0/0891-fix-m68k-uclinux.patch      |  30 ++++++
>   package/gcc/7.1.0/0900-remove-selftests.patch      | 111 +++++++++++++++++++++
>   package/gcc/Config.in.host                         |  11 ++
>   package/gcc/gcc.hash                               |   2 +
>   toolchain/toolchain-common.in                      |   5 +
>   8 files changed, 297 insertions(+)
>   create mode 100644 package/gcc/7.1.0/0100-uclibc-conf.patch
>   create mode 100644 package/gcc/7.1.0/0810-arm-softfloat-libgcc.patch
>   create mode 100644 package/gcc/7.1.0/0860-cilk-fix-build-without-wchar.patch
>   create mode 100644 package/gcc/7.1.0/0891-fix-m68k-uclinux.patch
>   create mode 100644 package/gcc/7.1.0/0900-remove-selftests.patch
>
> diff --git a/package/gcc/7.1.0/0100-uclibc-conf.patch b/package/gcc/7.1.0/0100-uclibc-conf.patch
> new file mode 100644
> index 0000000..d354baf
> --- /dev/null
> +++ b/package/gcc/7.1.0/0100-uclibc-conf.patch
> @@ -0,0 +1,29 @@
> +From 326b880b20e5f8187dbda736b4c4c662cbfb00ca Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Tue, 2 May 2017 22:36:15 +0200
> +Subject: [PATCH] uclibc-conf
> +
> +[Romain: convert to git patch]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + contrib/regression/objs-gcc.sh | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/contrib/regression/objs-gcc.sh b/contrib/regression/objs-gcc.sh
> +index 60b0497..6dc7ead 100755
> +--- a/contrib/regression/objs-gcc.sh
> ++++ b/contrib/regression/objs-gcc.sh
> +@@ -106,6 +106,10 @@ if [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-gnu ]
> +  then
> +   make all-gdb all-dejagnu all-ld || exit 1
> +   make install-gdb install-dejagnu install-ld || exit 1
> ++elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
> ++ then
> ++  make all-gdb all-dejagnu all-ld || exit 1
> ++  make install-gdb install-dejagnu install-ld || exit 1
> + elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
> +   make bootstrap || exit 1
> +   make install || exit 1
> +--
> +2.9.3
> +
> diff --git a/package/gcc/7.1.0/0810-arm-softfloat-libgcc.patch b/package/gcc/7.1.0/0810-arm-softfloat-libgcc.patch
> new file mode 100644
> index 0000000..63880dd
> --- /dev/null
> +++ b/package/gcc/7.1.0/0810-arm-softfloat-libgcc.patch
> @@ -0,0 +1,45 @@
> +From 420a304ac0daa29d66da6ed5b0b49fc4c482d522 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Tue, 2 May 2017 22:46:18 +0200
> +Subject: [PATCH] arm softfloat libgcc
> +
> +[Romain: convert to git patch]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + gcc/config/arm/linux-elf.h | 2 +-
> + libgcc/config/arm/t-linux  | 7 ++++++-
> + 2 files changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
> +index 3d62367..dad0b97 100644
> +--- a/gcc/config/arm/linux-elf.h
> ++++ b/gcc/config/arm/linux-elf.h
> +@@ -58,7 +58,7 @@
> +    %{shared:-lc} \
> +    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
> +
> +-#define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
> ++#define LIBGCC_SPEC "-lgcc"
> +
> + #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> +
> +diff --git a/libgcc/config/arm/t-linux b/libgcc/config/arm/t-linux
> +index 3d520de..e7bc042 100644
> +--- a/libgcc/config/arm/t-linux
> ++++ b/libgcc/config/arm/t-linux
> +@@ -1,6 +1,11 @@
> + LIB1ASMSRC = arm/lib1funcs.S
> + LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx _clzsi2 _clzdi2 \
> +-	_ctzsi2 _arm_addsubdf3 _arm_addsubsf3
> ++	_ctzsi2 _arm_addsubdf3 _arm_addsubsf3 \
> ++	_arm_addsubdf3 _arm_addsubsf3 \
> ++	_arm_negdf2 _arm_muldivdf3 _arm_cmpdf2 _arm_unorddf2 \
> ++	_arm_fixdfsi _arm_fixunsdfsi _arm_truncdfsf2 \
> ++	_arm_negsf2 _arm_muldivsf3 _arm_cmpsf2 _arm_unordsf2 \
> ++	_arm_fixsfsi _arm_fixunssfsi
> +
> + # Just for these, we omit the frame pointer since it makes such a big
> + # difference.
> +--
> +2.9.3
> +
> diff --git a/package/gcc/7.1.0/0860-cilk-fix-build-without-wchar.patch b/package/gcc/7.1.0/0860-cilk-fix-build-without-wchar.patch
> new file mode 100644
> index 0000000..61ab01c
> --- /dev/null
> +++ b/package/gcc/7.1.0/0860-cilk-fix-build-without-wchar.patch
> @@ -0,0 +1,64 @@
> +From 714739e69ead1d9823233af40645277f6d4633ea Mon Sep 17 00:00:00 2001
> +From: Peter Korsgaard <peter@korsgaard.com>
> +Date: Tue, 2 May 2017 23:21:46 +0200
> +Subject: [PATCH] cilk: fix build without wchar
> +
> +When building against uClibc with wchar support disabled, WCHAR_MIN and
> +WCHAR_MAX are not defined leading to compilation errors.
> +
> +Fix it by only including the wchar code if available.
> +
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +[Romain: convert to git patch]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + libcilkrts/include/cilk/reducer_min_max.h | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/libcilkrts/include/cilk/reducer_min_max.h b/libcilkrts/include/cilk/reducer_min_max.h
> +index 641aa82..4f8e010 100644
> +--- a/libcilkrts/include/cilk/reducer_min_max.h
> ++++ b/libcilkrts/include/cilk/reducer_min_max.h
> +@@ -3289,7 +3289,9 @@ __CILKRTS_BEGIN_EXTERN_C
> + CILK_C_REDUCER_MAX_INSTANCE(char,               char,       CHAR_MIN)
> + CILK_C_REDUCER_MAX_INSTANCE(unsigned char,      uchar,      0)
> + CILK_C_REDUCER_MAX_INSTANCE(signed char,        schar,      SCHAR_MIN)
> ++#ifdef WCHAR_MIN
> + CILK_C_REDUCER_MAX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
> ++#endif
> + CILK_C_REDUCER_MAX_INSTANCE(short,              short,      SHRT_MIN)
> + CILK_C_REDUCER_MAX_INSTANCE(unsigned short,     ushort,     0)
> + CILK_C_REDUCER_MAX_INSTANCE(int,                int,        INT_MIN)
> +@@ -3441,7 +3443,9 @@ __CILKRTS_BEGIN_EXTERN_C
> + CILK_C_REDUCER_MAX_INDEX_INSTANCE(char,               char,       CHAR_MIN)
> + CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned char,      uchar,      0)
> + CILK_C_REDUCER_MAX_INDEX_INSTANCE(signed char,        schar,      SCHAR_MIN)
> ++#ifdef WCHAR_MIN
> + CILK_C_REDUCER_MAX_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
> ++#endif
> + CILK_C_REDUCER_MAX_INDEX_INSTANCE(short,              short,      SHRT_MIN)
> + CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned short,     ushort,     0)
> + CILK_C_REDUCER_MAX_INDEX_INSTANCE(int,                int,        INT_MIN)
> +@@ -3567,7 +3571,9 @@ __CILKRTS_BEGIN_EXTERN_C
> + CILK_C_REDUCER_MIN_INSTANCE(char,               char,       CHAR_MAX)
> + CILK_C_REDUCER_MIN_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
> + CILK_C_REDUCER_MIN_INSTANCE(signed char,        schar,      SCHAR_MAX)
> ++#ifdef WCHAR_MAX
> + CILK_C_REDUCER_MIN_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
> ++#endif
> + CILK_C_REDUCER_MIN_INSTANCE(short,              short,      SHRT_MAX)
> + CILK_C_REDUCER_MIN_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
> + CILK_C_REDUCER_MIN_INSTANCE(int,                int,        INT_MAX)
> +@@ -3719,7 +3725,9 @@ __CILKRTS_BEGIN_EXTERN_C
> + CILK_C_REDUCER_MIN_INDEX_INSTANCE(char,               char,       CHAR_MAX)
> + CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
> + CILK_C_REDUCER_MIN_INDEX_INSTANCE(signed char,        schar,      SCHAR_MAX)
> ++#ifdef WCHAR_MAX
> + CILK_C_REDUCER_MIN_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
> ++#endif
> + CILK_C_REDUCER_MIN_INDEX_INSTANCE(short,              short,      SHRT_MAX)
> + CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
> + CILK_C_REDUCER_MIN_INDEX_INSTANCE(int,                int,        INT_MAX)
> +--
> +2.9.3
> +
> diff --git a/package/gcc/7.1.0/0891-fix-m68k-uclinux.patch b/package/gcc/7.1.0/0891-fix-m68k-uclinux.patch
> new file mode 100644
> index 0000000..e84fd92
> --- /dev/null
> +++ b/package/gcc/7.1.0/0891-fix-m68k-uclinux.patch
> @@ -0,0 +1,30 @@
> +From c2773170a1b0e2728f71f2275a99fd177ba2cef4 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Tue, 2 May 2017 23:25:17 +0200
> +Subject: [PATCH] fix m68k uclinux avoids internal compiler error while
> + compiling linux-atomic.c See here:
> + https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53833
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +[Romain: convert to git patch]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + libgcc/config.host | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libgcc/config.host b/libgcc/config.host
> +index b279a64..04fe183 100644
> +--- a/libgcc/config.host
> ++++ b/libgcc/config.host
> +@@ -820,7 +820,7 @@ m68k*-*-netbsdelf*)
> + m68k*-*-openbsd*)
> + 	;;
> + m68k-*-uclinux*)	# Motorola m68k/ColdFire running uClinux with uClibc
> +-	tmake_file="$tmake_file m68k/t-floatlib m68k/t-linux"
> ++	tmake_file="$tmake_file m68k/t-floatlib"
> + 	md_unwind_header=m68k/linux-unwind.h
> + 	;;
> + m68k-*-linux*)			# Motorola m68k's running GNU/Linux
> +--
> +2.9.3
> +
> diff --git a/package/gcc/7.1.0/0900-remove-selftests.patch b/package/gcc/7.1.0/0900-remove-selftests.patch
> new file mode 100644
> index 0000000..a3bc7a5
> --- /dev/null
> +++ b/package/gcc/7.1.0/0900-remove-selftests.patch
> @@ -0,0 +1,111 @@
> +From 63f0917d90eb83d267dc517fdfb6523a74b1917c Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Wed, 3 May 2017 00:37:06 +0200
> +Subject: [PATCH] remove selftests
> +
> +When the gcc archive is extracted by the gcc.mk, the gcc/testsuite
> +is excluded:
> +
> +HOST_GCC_EXCLUDES = \
> +	libjava/* libgo/* \
> +	gcc/testsuite/* libstdc++-v3/testsuite/*
> +
> +The new Makefile target from the "Selftest framework" [1] added a dependency
> +on the gcc/testsuite/Makefile.
> +Revert partially the commit [1] to allow building gcc without selftest.
> +
> +[1] https://github.com/gcc-mirror/gcc/commit/99b4f3a2d5bf2c137de9731e27b483eb6b462fd9
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + gcc/Makefile.in | 46 +++++-----------------------------------------
> + 1 file changed, 5 insertions(+), 41 deletions(-)
> +
> +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> +index 74d1912..652a554 100644
> +--- a/gcc/Makefile.in
> ++++ b/gcc/Makefile.in
> +@@ -1581,14 +1581,13 @@ OBJS = \
> + OBJS-libcommon = diagnostic.o diagnostic-color.o diagnostic-show-locus.o \
> + 	edit-context.o \
> + 	pretty-print.o intl.o \
> +-	vec.o input.o version.o hash-table.o ggc-none.o memory-block.o \
> +-	selftest.o
> ++	vec.o input.o version.o hash-table.o ggc-none.o memory-block.o
> +
> + # Objects in libcommon-target.a, used by drivers and by the core
> + # compiler and containing target-dependent code.
> + OBJS-libcommon-target = $(common_out_object_file) prefix.o params.o \
> + 	opts.o opts-common.o options.o vec.o hooks.o common/common-targhooks.o \
> +-	hash-table.o file-find.o spellcheck.o selftest.o
> ++	hash-table.o file-find.o spellcheck.o
> +
> + # This lists all host objects for the front ends.
> + ALL_HOST_FRONTEND_OBJS = $(foreach v,$(CONFIG_LANGUAGES),$($(v)_OBJS))
> +@@ -1865,10 +1864,10 @@ config.status: $(srcdir)/configure $(srcdir)/config.gcc
> + quickstrap: all
> + 	cd $(toplevel_builddir) && $(MAKE) all-target-libgcc
> +
> +-all.internal: start.encap rest.encap doc selftest
> ++all.internal: start.encap rest.encap doc
> + # This is what to compile if making a cross-compiler.
> + all.cross: native gcc-cross$(exeext) cpp$(exeext) specs \
> +-	libgcc-support lang.all.cross doc selftest @GENINSRC@ srcextra
> ++	libgcc-support lang.all.cross doc @GENINSRC@ srcextra
> + # This is what must be made before installing GCC and converting libraries.
> + start.encap: native xgcc$(exeext) cpp$(exeext) specs \
> + 	libgcc-support lang.start.encap @GENINSRC@ srcextra
> +@@ -1888,41 +1887,6 @@ endif
> + # This does the things that can't be done on the host machine.
> + rest.cross: specs
> +
> +-# GCC's selftests.
> +-# Specify a dummy input file to placate the driver.
> +-# Specify -nostdinc to work around missing WIND_BASE environment variable
> +-# required for *-wrs-vxworks-* targets.
> +-# Specify -o /dev/null so the output of -S is discarded. More importantly
> +-# It does not try to create a file with the name "null.s" on POSIX and
> +-# "nul.s" on Windows. Because on Windows "nul" is a reserved file name.
> +-# Specify the path to gcc/testsuite/selftests within the srcdir
> +-# as an argument to -fself-test.
> +-SELFTEST_FLAGS = -nostdinc -x c /dev/null -S -o /dev/null \
> +-	-fself-test=$(srcdir)/testsuite/selftests
> +-
> +-# Run the selftests during the build once we have a driver and a cc1,
> +-# so that self-test failures are caught as early as possible.
> +-# Use "s-selftest" to ensure that we only run the selftests if the
> +-# driver, cc1, or selftest data change.
> +-.PHONY: selftest
> +-selftest: s-selftest
> +-s-selftest: $(GCC_PASSES) cc1$(exeext) stmp-int-hdrs \
> +-  $(srcdir)/testsuite/selftests
> +-	$(GCC_FOR_TARGET) $(SELFTEST_FLAGS)
> +-	$(STAMP) $@
> +-
> +-# Convenience method for running selftests under gdb:
> +-.PHONY: selftest-gdb
> +-selftest-gdb: $(GCC_PASSES) cc1$(exeext) stmp-int-hdrs
> +-	$(GCC_FOR_TARGET) $(SELFTEST_FLAGS) \
> +-	  -wrapper gdb,--args
> +-
> +-# Convenience method for running selftests under valgrind:
> +-.PHONY: selftest-valgrind
> +-selftest-valgrind: $(GCC_PASSES) cc1$(exeext) stmp-int-hdrs
> +-	$(GCC_FOR_TARGET) $(SELFTEST_FLAGS) \
> +-	  -wrapper valgrind,--leak-check=full
> +-
> + # Recompile all the language-independent object files.
> + # This is used only if the user explicitly asks for it.
> + compilations: $(BACKEND)
> +@@ -2076,7 +2040,7 @@ gcc-nm.c: gcc-ar.c
> + 	cp $^ $@
> +
> + COLLECT2_OBJS = collect2.o collect2-aix.o tlink.o vec.o ggc-none.o \
> +-  collect-utils.o file-find.o hash-table.o selftest.o
> ++  collect-utils.o file-find.o hash-table.o
> + COLLECT2_LIBS = @COLLECT2_LIBS@
> + collect2$(exeext): $(COLLECT2_OBJS) $(LIBDEPS)
> + # Don't try modifying collect2 (aka ld) in place--it might be linking this.
> +--
> +2.9.3
> +
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 4bcb23e..f1c2faf 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -87,6 +87,16 @@ config BR2_GCC_VERSION_6_X
>   	depends on !BR2_mips_m6250 && !BR2_mips_p6600
>   	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
>   
> +config BR2_GCC_VERSION_7_X
> +	bool "gcc 7.x"
> +	# Broken or unsupported architectures
> +	depends on !BR2_arc
> +	depends on !BR2_microblaze
> +	depends on !BR2_or1k
> +	# Unsupported MIPS cores
> +	depends on !BR2_mips_m6250 && !BR2_mips_p6600
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
> +
>   endchoice
>   
>   # Indicates if GCC for architecture supports --with-{arch,cpu,..}  to
> @@ -106,6 +116,7 @@ config BR2_GCC_VERSION
>   	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
>   	default "5.4.0"     if BR2_GCC_VERSION_5_X
>   	default "6.3.0"     if BR2_GCC_VERSION_6_X
> +	default "7.1.0"     if BR2_GCC_VERSION_7_X
>   	default "arc-2017.03-rc1" if BR2_GCC_VERSION_ARC
>   	default "musl-5.4.0" if BR2_GCC_VERSION_OR1K
>   
> diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
> index 052a825..7255d12 100644
> --- a/package/gcc/gcc.hash
> +++ b/package/gcc/gcc.hash
> @@ -10,6 +10,8 @@ sha512  93abb78e16277454f41a8e9810f41f66c0fdffdc539a762ff6b67d3037f78db971378683
>   sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d1ef16ea39def408a644ba48f97519ec7a7dd37d260c3e9423514265b  gcc-5.4.0.tar.bz2
>   # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.3.0/sha512.sum
>   sha512  234dd9b1bdc9a9c6e352216a7ef4ccadc6c07f156006a59759c5e0e6a69f0abcdc14630eff11e3826dd6ba5933a8faa43043f3d1d62df6bd5ab1e82862f9bf78  gcc-6.3.0.tar.bz2
> +# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.1.0/sha512.sum
> +sha512  b5d952be9a10f0e0926bb2868877d10544039d6d2f35ba0a08f51231dd622a007650764a03e173194701467547789ad7d2d9cbc10adcdf118d619cdedbd14aec  gcc-7.1.0.tar.bz2
>   
>   # Locally calculated (fetched from Github)
>   sha512  e4fe5a179b8feabf932a8a6f4794ff6907b868a65487412d855a4b3671aa24ec8544a44f3b63e69ea2c12fcd4d8028d0619d40bf016ee7c1a5b5a99aa9315ef3  gcc-arc-2017.03-rc1.tar.gz
> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index 76c0e7c..d670f44 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -320,10 +320,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_6
>   	bool
>   	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
>   
> +config BR2_TOOLCHAIN_GCC_AT_LEAST_7
> +	bool
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
> +
>   # This order guarantees that the highest version is set, as kconfig
>   # stops affecting a value on the first matching default.
>   config BR2_TOOLCHAIN_GCC_AT_LEAST
>   	string
> +	default "7"	if BR2_TOOLCHAIN_GCC_AT_LEAST_7
>   	default "6"	if BR2_TOOLCHAIN_GCC_AT_LEAST_6
>   	default "5"	if BR2_TOOLCHAIN_GCC_AT_LEAST_5
>   	default "4.9"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170520/ec8bce05/attachment.html>
-------------- next part --------------
BR2_arm=y
BR2_cortex_a8=y
BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
BR2_GCC_VERSION_7_X=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="adde2ca9f86797071f6e7b2b9e779fa5e4a8f3cd"
BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk"
BR2_PACKAGE_DROPBEAR=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_CUSTOM_VERSION=y
BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
BR2_TARGET_UBOOT_NEEDS_DTC=y
# BR2_TARGET_UBOOT_FORMAT_BIN is not set
BR2_TARGET_UBOOT_FORMAT_IMG=y
BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="MLO"
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
