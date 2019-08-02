From: Romain Naour <romain.naour@smile.fr>
Date: Fri,  2 Aug 2019 15:09:35 +0200
Subject: [Buildroot] [PATCH 5/6] package/gcc: remove gcc 4.9
In-Reply-To: <20190802130937.12591-1-romain.naour@smile.fr>
References: <20190802130937.12591-1-romain.naour@smile.fr>
Message-ID: <20190802130937.12591-5-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to reduce the number of choice in gcc selection, remove the
gcc 4.9 version.

This version was kept due to libstdc++ ABI-incompatible changes and
other build issues with kernel and bootloader as reported by Arnout
[1].

Since then, gcc 4.9 is not supported any more since glibc 2.29 [2]
and recent kernel and bootloaders has been fixed to use more recent
compiler version.

[1] http://lists.busybox.net/pipermail/buildroot/2017-June/194374.html
[2] https://www.sourceware.org/ml/libc-alpha/2019-01/msg00723.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy                              |   7 +
 ...059-libgcc-should-not-use-__write-fo.patch |  43 --
 .../4.9.4/0002-m68k-coldfire-pr68467.patch    |  48 --
 ...3-libsanitizer-Use-pre-computed-size.patch |  71 --
 package/gcc/4.9.4/100-uclibc-conf.patch       |  15 -
 ...werpc-link-with-math-lib.patch.conditional | 122 ----
 package/gcc/4.9.4/111-pr65730.patch           |  34 -
 ...ix-typo-for-powerpc-e6500-cpu_is_64b.patch |  26 -
 package/gcc/4.9.4/130-pr43538.patch           |  25 -
 ...-Fix-build-with-_FILE_OFFSET_BITS-64.patch |  37 -
 .../gcc/4.9.4/301-missing-execinfo_h.patch    |  13 -
 .../gcc/4.9.4/810-arm-softfloat-libgcc.patch  |  30 -
 .../gcc/4.9.4/830-arm_unbreak_armv4t.patch    |  13 -
 ...0-microblaze-enable-dwarf-eh-support.patch | 166 -----
 .../gcc/4.9.4/850-libstdcxx-uclibc-c99.patch  | 274 --------
 package/gcc/4.9.4/860-cilk-wchar.patch        |  56 --
 ...870-xtensa-add-mauto-litpools-option.patch | 287 --------
 ...xtensa-reimplement-register-spilling.patch |  76 ---
 ...d-dw2-fde-dip-instead-of-unwind-dw2-.patch |  33 -
 .../4.9.4/873-xtensa-fix-_Unwind_GetCFA.patch |  40 --
 .../874-xtensa-add-uclinux-support.patch      | 169 -----
 .../875-xtensa-fix-PR-target-82181.patch      |  31 -
 .../4.9.4/880-nios2_legitimize_address.patch  |  49 --
 package/gcc/4.9.4/890-fix-m68k-compile.patch  |  15 -
 package/gcc/4.9.4/900-musl-support.patch      | 640 ------------------
 package/gcc/4.9.4/901-microblaze-uclibc.patch |  21 -
 ...libgcc-disable-split-stack-nothreads.patch |  14 -
 .../4.9.4/940-uclinux-enable-threads.patch    |  20 -
 ...42-asan-fix-missing-include-signal-h.patch |  36 -
 ...ot-struct-ucontext-in-linux-unwind.h.patch | 190 ------
 package/gcc/4.9.4/944-sanitizer-linux.patch   |  88 ---
 package/gcc/Config.in.host                    |  18 +-
 package/gcc/gcc.hash                          |   2 -
 package/gcc/gcc.mk                            |   6 -
 34 files changed, 8 insertions(+), 2707 deletions(-)
 delete mode 100644 package/gcc/4.9.4/0001-ARM-PR-target-68059-libgcc-should-not-use-__write-fo.patch
 delete mode 100644 package/gcc/4.9.4/0002-m68k-coldfire-pr68467.patch
 delete mode 100644 package/gcc/4.9.4/0003-libsanitizer-Use-pre-computed-size.patch
 delete mode 100644 package/gcc/4.9.4/100-uclibc-conf.patch
 delete mode 100644 package/gcc/4.9.4/1000-powerpc-link-with-math-lib.patch.conditional
 delete mode 100644 package/gcc/4.9.4/111-pr65730.patch
 delete mode 100644 package/gcc/4.9.4/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
 delete mode 100644 package/gcc/4.9.4/130-pr43538.patch
 delete mode 100644 package/gcc/4.9.4/140-sanitizer-Fix-build-with-_FILE_OFFSET_BITS-64.patch
 delete mode 100644 package/gcc/4.9.4/301-missing-execinfo_h.patch
 delete mode 100644 package/gcc/4.9.4/810-arm-softfloat-libgcc.patch
 delete mode 100644 package/gcc/4.9.4/830-arm_unbreak_armv4t.patch
 delete mode 100644 package/gcc/4.9.4/840-microblaze-enable-dwarf-eh-support.patch
 delete mode 100644 package/gcc/4.9.4/850-libstdcxx-uclibc-c99.patch
 delete mode 100644 package/gcc/4.9.4/860-cilk-wchar.patch
 delete mode 100644 package/gcc/4.9.4/870-xtensa-add-mauto-litpools-option.patch
 delete mode 100644 package/gcc/4.9.4/871-xtensa-reimplement-register-spilling.patch
 delete mode 100644 package/gcc/4.9.4/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
 delete mode 100644 package/gcc/4.9.4/873-xtensa-fix-_Unwind_GetCFA.patch
 delete mode 100644 package/gcc/4.9.4/874-xtensa-add-uclinux-support.patch
 delete mode 100644 package/gcc/4.9.4/875-xtensa-fix-PR-target-82181.patch
 delete mode 100644 package/gcc/4.9.4/880-nios2_legitimize_address.patch
 delete mode 100644 package/gcc/4.9.4/890-fix-m68k-compile.patch
 delete mode 100644 package/gcc/4.9.4/900-musl-support.patch
 delete mode 100644 package/gcc/4.9.4/901-microblaze-uclibc.patch
 delete mode 100644 package/gcc/4.9.4/930-libgcc-disable-split-stack-nothreads.patch
 delete mode 100644 package/gcc/4.9.4/940-uclinux-enable-threads.patch
 delete mode 100644 package/gcc/4.9.4/942-asan-fix-missing-include-signal-h.patch
 delete mode 100644 package/gcc/4.9.4/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
 delete mode 100644 package/gcc/4.9.4/944-sanitizer-linux.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index 6a241b1ec8..fa7de2d8d3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2019.08"
 
+config BR2_GCC_VERSION_4_9_X
+	bool "gcc 4.9.x support removed"
+	select BR2_LEGACY
+	help
+	  Support for gcc version 4.9.x has been removed. The current
+	  default version (8.x or later) has been selected instead.
+
 config BR2_GDB_VERSION_7_12
 	bool "gdb 7.12.x has been removed"
 	select BR2_LEGACY
diff --git a/package/gcc/4.9.4/0001-ARM-PR-target-68059-libgcc-should-not-use-__write-fo.patch b/package/gcc/4.9.4/0001-ARM-PR-target-68059-libgcc-should-not-use-__write-fo.patch
deleted file mode 100644
index fd2bc69538..0000000000
--- a/package/gcc/4.9.4/0001-ARM-PR-target-68059-libgcc-should-not-use-__write-fo.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 80bc14a5249da7054b716229206b453f339b4a5e Mon Sep 17 00:00:00 2001
-From: nsz <nsz@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Mon, 23 Nov 2015 15:17:55 +0000
-Subject: [PATCH] [ARM] PR target/68059 libgcc should not use __write for
- printing fatal error
-
-libgcc/
-	PR target/68059
-	* config/arm/linux-atomic-64bit.c (__write): Rename to...
-	(write): ...this and fix the return type.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 230762 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- libgcc/config/arm/linux-atomic-64bit.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libgcc/config/arm/linux-atomic-64bit.c b/libgcc/config/arm/linux-atomic-64bit.c
-index 5b8c6e2..9078673 100644
---- a/libgcc/config/arm/linux-atomic-64bit.c
-+++ b/libgcc/config/arm/linux-atomic-64bit.c
-@@ -33,7 +33,7 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
-    kernels; we check for that in an init section and bail out rather
-    unceremoneously.  */
- 
--extern unsigned int __write (int fd, const void *buf, unsigned int count);
-+extern int write (int fd, const void *buf, unsigned int count);
- extern void abort (void);
- 
- /* Kernel helper for compare-and-exchange.  */
-@@ -56,7 +56,7 @@ static void __check_for_sync8_kernelhelper (void)
- 	 for the user - I'm not sure I can rely on much else being
- 	 available at this point, so do the same as generic-morestack.c
- 	 write () and abort ().  */
--      __write (2 /* stderr.  */, err, sizeof (err));
-+      write (2 /* stderr.  */, err, sizeof (err));
-       abort ();
-     }
- };
--- 
-2.10.2
-
diff --git a/package/gcc/4.9.4/0002-m68k-coldfire-pr68467.patch b/package/gcc/4.9.4/0002-m68k-coldfire-pr68467.patch
deleted file mode 100644
index d701ab6878..0000000000
--- a/package/gcc/4.9.4/0002-m68k-coldfire-pr68467.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Backport from upstream, see
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68467
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gcc-4.9.4.orig/gcc/config/m68k/m68k.c gcc-4.9.4/gcc/config/m68k/m68k.c
---- gcc-4.9.4.orig/gcc/config/m68k/m68k.c	2014-02-27 12:10:55.000000000 +0100
-+++ gcc-4.9.4/gcc/config/m68k/m68k.c	2018-02-17 21:28:53.430538916 +0100
-@@ -166,6 +166,8 @@
- 			      const_tree, bool);
- static bool m68k_cannot_force_const_mem (enum machine_mode mode, rtx x);
- static bool m68k_output_addr_const_extra (FILE *, rtx);
-+static machine_mode m68k_promote_function_mode (const_tree, machine_mode,
-+						int *, const_tree, int);
- static void m68k_init_sync_libfuncs (void) ATTRIBUTE_UNUSED;
- 
- /* Initialize the GCC target structure.  */
-@@ -308,6 +310,9 @@
- #undef TARGET_ATOMIC_TEST_AND_SET_TRUEVAL
- #define TARGET_ATOMIC_TEST_AND_SET_TRUEVAL 128
- 
-+#undef TARGET_PROMOTE_FUNCTION_MODE
-+#define TARGET_PROMOTE_FUNCTION_MODE m68k_promote_function_mode
-+
- static const struct attribute_spec m68k_attribute_table[] =
- {
-   /* { name, min_len, max_len, decl_req, type_req, fn_type_req, handler,
-@@ -6527,4 +6532,20 @@
- 	      == m68k_fk_interrupt_handler));
- }
- 
-+/* Implement TARGET_PROMOTE_FUNCTION_MODE.  */
-+
-+static machine_mode
-+m68k_promote_function_mode (const_tree type, machine_mode mode,
-+                            int *punsignedp ATTRIBUTE_UNUSED,
-+                            const_tree fntype ATTRIBUTE_UNUSED,
-+                            int for_return)
-+{
-+  /* Promote libcall arguments narrower than int to match the normal C
-+     ABI (for which promotions are handled via
-+     TARGET_PROMOTE_PROTOTYPES).  */
-+  if (type == NULL_TREE && !for_return && (mode == QImode || mode == HImode))
-+    return SImode;
-+  return mode;
-+}
-+
- #include "gt-m68k.h"
diff --git a/package/gcc/4.9.4/0003-libsanitizer-Use-pre-computed-size.patch b/package/gcc/4.9.4/0003-libsanitizer-Use-pre-computed-size.patch
deleted file mode 100644
index 5b4c05a719..0000000000
--- a/package/gcc/4.9.4/0003-libsanitizer-Use-pre-computed-size.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 61f38c64c01a15560026115a157b7021ec67bd3b Mon Sep 17 00:00:00 2001
-From: hjl <hjl@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 24 May 2018 20:21:54 +0000
-Subject: [PATCH] libsanitizer: Use pre-computed size of struct ustat for Linux
-
-Cherry-pick compiler-rt revision 333213:
-
-<sys/ustat.h> has been removed from glibc 2.28 by:
-
-commit cf2478d53ad7071e84c724a986b56fe17f4f4ca7
-Author: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Date:   Sun Mar 18 11:28:59 2018 +0800
-
-    Deprecate ustat syscall interface
-
-This patch uses pre-computed size of struct ustat for Linux.
-
-	PR sanitizer/85835
-	* sanitizer_common/sanitizer_platform_limits_posix.cc: Don't
-	include <sys/ustat.h> for Linux.
-	(SIZEOF_STRUCT_USTAT): New.
-	(struct_ustat_sz): Use SIZEOF_STRUCT_USTAT for Linux.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch at 260688 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Backported from upstream commit
-https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=61f38c64c01a15560026115a157b7021ec67bd3b
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- libsanitizer/ChangeLog                                    |  8 ++++++++
- .../sanitizer_common/sanitizer_platform_limits_posix.cc   | 15 +++++++++++++--
- 2 files changed, 21 insertions(+), 2 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-index 31a5e69..8017afd 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-@@ -81,7 +89,6 @@ typedef struct user_fpregs elf_fpregset_t;
- # include <sys/procfs.h>
- #endif
- #include <sys/user.h>
--#include <sys/ustat.h>
- #include <linux/cyclades.h>
- #include <linux/if_eql.h>
- #include <linux/if_plip.h>
-@@ -163,7 +170,19 @@
-   unsigned struct_old_utsname_sz = sizeof(struct old_utsname);
-   unsigned struct_oldold_utsname_sz = sizeof(struct oldold_utsname);
-   unsigned struct_itimerspec_sz = sizeof(struct itimerspec);
--  unsigned struct_ustat_sz = sizeof(struct ustat);
-+  // Use pre-computed size of struct ustat to avoid <sys/ustat.h> which
-+  // has been removed from glibc 2.28.
-+#if defined(__aarch64__) || defined(__s390x__) || defined (__mips64) \
-+  || defined(__powerpc64__) || defined(__arch64__) || defined(__sparcv9) \
-+  || defined(__x86_64__)
-+#define SIZEOF_STRUCT_USTAT 32
-+#elif defined(__arm__) || defined(__i386__) || defined(__mips__) \
-+  || defined(__powerpc__) || defined(__s390__)
-+#define SIZEOF_STRUCT_USTAT 20
-+#else
-+#error Unknown size of struct ustat
-+#endif
-+  unsigned struct_ustat_sz = SIZEOF_STRUCT_USTAT;
- #endif // SANITIZER_LINUX
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
--- 
-2.9.3
diff --git a/package/gcc/4.9.4/100-uclibc-conf.patch b/package/gcc/4.9.4/100-uclibc-conf.patch
deleted file mode 100644
index d56bf0a194..0000000000
--- a/package/gcc/4.9.4/100-uclibc-conf.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Index: gcc-4.8.0/contrib/regression/objs-gcc.sh
-===================================================================
---- gcc-4.8.0.orig/contrib/regression/objs-gcc.sh	2009-04-09 17:00:19.000000000 +0200
-+++ gcc-4.8.0/contrib/regression/objs-gcc.sh	2013-03-23 17:39:04.000000000 +0100
-@@ -106,6 +106,10 @@
-  then
-   make all-gdb all-dejagnu all-ld || exit 1
-   make install-gdb install-dejagnu install-ld || exit 1
-+elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
-+ then
-+  make all-gdb all-dejagnu all-ld || exit 1
-+  make install-gdb install-dejagnu install-ld || exit 1
- elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
-   make bootstrap || exit 1
-   make install || exit 1
diff --git a/package/gcc/4.9.4/1000-powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.9.4/1000-powerpc-link-with-math-lib.patch.conditional
deleted file mode 100644
index 5e0484fbb4..0000000000
--- a/package/gcc/4.9.4/1000-powerpc-link-with-math-lib.patch.conditional
+++ /dev/null
@@ -1,122 +0,0 @@
-http://gcc.gnu.org/ml/gcc-patches/2008-10/msg00269.html
-
-On glibc the libc.so carries a copy of the math function copysignl() but
-on uClibc math functions like copysignl() live in libm. Since libgcc_s
-contains unresolved symbols, any attempt to link against libgcc_s
-without explicitely specifying -lm fails, resulting in a broken
-bootstrap of the compiler.
-
-Forward port to gcc 4.5.1 by Gustavo Zacarias <gustavo@zacarias.com.ar>
-
----
- libgcc/Makefile.in  |    4 +++-
- libgcc/configure    |   32 ++++++++++++++++++++++++++++++++
- libgcc/configure.ac |   21 +++++++++++++++++++++
- 3 files changed, 56 insertions(+), 1 deletion(-)
-
-Index: b/libgcc/Makefile.in
-===================================================================
---- a/libgcc/Makefile.in
-+++ b/libgcc/Makefile.in
-@@ -42,6 +42,7 @@
- enable_vtable_verify = @enable_vtable_verify@
- enable_decimal_float = @enable_decimal_float@
- fixed_point = @fixed_point@
-+LIBGCC_LIBM = @LIBGCC_LIBM@
- 
- host_noncanonical = @host_noncanonical@
- target_noncanonical = @target_noncanonical@
-@@ -943,9 +944,10 @@
- 		@multilib_dir@,$(MULTIDIR),$(subst \
- 		@shlib_objs@,$(objects) libgcc.a,$(subst \
- 		@shlib_base_name@,libgcc_s,$(subst \
-+		@libgcc_libm@,$(LIBGCC_LIBM),$(subst \
- 		@shlib_map_file@,$(mapfile),$(subst \
- 		@shlib_slibdir_qual@,$(MULTIOSSUBDIR),$(subst \
--		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK))))))))
-+		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK)))))))))
- 
- libunwind$(SHLIB_EXT): $(libunwind-s-objects) $(extra-parts)
- 	# @multilib_flags@ is still needed because this may use
-Index: b/libgcc/configure
-===================================================================
---- a/libgcc/configure
-+++ b/libgcc/configure
-@@ -564,6 +564,7 @@
- tmake_file
- sfp_machine_header
- set_use_emutls
-+LIBGCC_LIBM
- set_have_cc_tls
- vis_hide
- fixed_point
-@@ -4535,6 +4536,37 @@
- 	fi
- fi
- 
-+# On powerpc libgcc_s references copysignl which is a libm function but
-+# glibc apparently also provides it via libc as opposed to uClibc where
-+# it lives in libm.
-+echo "$as_me:$LINENO: checking for library containing copysignl" >&5
-+echo $ECHO_N "checking for library containing copysignl... $ECHO_C" >&6
-+if test "${libgcc_cv_copysignl_lib+set}" = set; then
-+  echo $ECHO_N "(cached) $ECHO_C" >&6
-+else
-+
-+    echo '#include <features.h>' > conftest.c
-+    echo 'int the_libc = __UCLIBC__ + __powerpc__;' >> conftest.c
-+    libgcc_cv_copysignl_lib="-lc"
-+    if { ac_try='${CC-cc} -S conftest.c -o conftest.s 1>&5'
-+  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); }; }
-+    then
-+       libgcc_cv_copysignl_lib="-lm"
-+    fi
-+    rm -f conftest.*
-+
-+fi
-+echo "$as_me:$LINENO: result: $libgcc_cv_copysignl_lib" >&5
-+echo "${ECHO_T}$libgcc_cv_copysignl_lib" >&6
-+
-+case /${libgcc_cv_copysignl_lib}/ in
-+  /-lm/) LIBGCC_LIBM="$LIBGCC_LIBM -lm" ;;
-+  *) LIBGCC_LIBM= ;;
-+esac
- 
- # Conditionalize the makefile for this target machine.
- tmake_file_=
-Index: b/libgcc/configure.ac
-===================================================================
---- a/libgcc/configure.ac
-+++ b/libgcc/configure.ac
-@@ -357,6 +357,27 @@
- fi
- AC_SUBST(set_have_cc_tls)
- 
-+# On powerpc libgcc_s references copysignl which is a libm function but
-+# glibc apparently also provides it via libc as opposed to uClibc where
-+# it lives in libm.
-+AC_CACHE_CHECK
-+  libgcc_cv_copysignl_lib,
-+    echo '#include <features.h>' > conftest.c
-+    echo 'int the_libc = __UCLIBC__ + __powerpc__;' >> conftest.c
-+    libgcc_cv_copysignl_lib="-lc"
-+    if AC_TRY_COMMAND(${CC-cc} -S conftest.c -o conftest.s 1>&AS_MESSAGE_LOG_FD)
-+    then
-+       libgcc_cv_copysignl_lib="-lm"
-+    fi
-+    rm -f conftest.*
-+  ])
-+
-+case /${libgcc_cv_copysignl_lib}/ in
-+  /-lm/) LIBGCC_LIBM="$LIBGCC_LIBM -lm" ;;
-+  *) LIBGCC_LIBM= ;;
-+esac
-+AC_SUBST(LIBGCC_LIBM)
-+
- # See if we have emulated thread-local storage.
- GCC_CHECK_EMUTLS
- set_use_emutls=
diff --git a/package/gcc/4.9.4/111-pr65730.patch b/package/gcc/4.9.4/111-pr65730.patch
deleted file mode 100644
index 8a41fd2a10..0000000000
--- a/package/gcc/4.9.4/111-pr65730.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From b9a7775674d91c7af8043a83211ffeaa576327d7 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Fri, 10 Apr 2015 17:46:30 +0300
-Subject: [PATCH] Fix PR target/65730
-
-2015-05-20  Max Filippov  <jcmvbkbc@gmail.com>
-gcc/
-	* config/xtensa/xtensa.c (init_alignment_context): Replace MULT
-	by BITS_PER_UNIT with ASHIFT by exact_log2 (BITS_PER_UNIT).
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 223452
-Changes to ChangeLog are dropped.
-
- gcc/config/xtensa/xtensa.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-Index: b/gcc/config/xtensa/xtensa.c
-===================================================================
---- a/gcc/config/xtensa/xtensa.c
-+++ b/gcc/config/xtensa/xtensa.c
-@@ -1436,8 +1436,9 @@
-   if (ac->shift != NULL_RTX)
-     {
-       /* Shift is the byte count, but we need the bitcount.  */
--      ac->shift = expand_simple_binop (SImode, MULT, ac->shift,
--				       GEN_INT (BITS_PER_UNIT),
-+      gcc_assert (exact_log2 (BITS_PER_UNIT) >= 0);
-+      ac->shift = expand_simple_binop (SImode, ASHIFT, ac->shift,
-+				       GEN_INT (exact_log2 (BITS_PER_UNIT)),
- 				       NULL_RTX, 1, OPTAB_DIRECT);
-       ac->modemask = expand_simple_binop (SImode, ASHIFT,
- 					  GEN_INT (GET_MODE_MASK (mode)),
diff --git a/package/gcc/4.9.4/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch b/package/gcc/4.9.4/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
deleted file mode 100644
index bb77c4b9ef..0000000000
--- a/package/gcc/4.9.4/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 9bf6066d588632dab9f78932df15b5b4140f31f3 Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Fri, 6 Nov 2015 14:27:23 +0100
-Subject: [PATCH] gcc/config.gcc: fix typo for powerpc e6500 cpu_is_64bit
-
-Otherwise it is not recognized as a 64-bit powerpc and gcc will not generate
-64-bit binaries by default.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- gcc/config.gcc | 2 +-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-Index: b/gcc/config.gcc
-===================================================================
---- a/gcc/config.gcc
-+++ b/gcc/config.gcc
-@@ -441,7 +441,7 @@
- 	extra_headers="ppc-asm.h altivec.h spe.h ppu_intrinsics.h paired.h spu2vmx.h vec_types.h si2vmx.h htmintrin.h htmxlintrin.h"
- 	need_64bit_hwint=yes
- 	case x$with_cpu in
--	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[345678]|xpower6x|xrs64a|xcell|xa2|xe500mc64|xe5500|Xe6500)
-+	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[345678]|xpower6x|xrs64a|xcell|xa2|xe500mc64|xe5500|xe6500)
- 		cpu_is_64bit=yes
- 		;;
- 	esac
diff --git a/package/gcc/4.9.4/130-pr43538.patch b/package/gcc/4.9.4/130-pr43538.patch
deleted file mode 100644
index 19e57bb059..0000000000
--- a/package/gcc/4.9.4/130-pr43538.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From c037df1be41f8daf4d581d7ffa4ec8cfa640bccf Mon Sep 17 00:00:00 2001
-From: glisse <glisse@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Fri, 25 Apr 2014 08:03:08 +0000
-Subject: [PATCH] 2014-04-25  Marc Glisse  <marc.glisse@inria.fr>
-
-	PR target/43538
-	* mt-gnu: Don't reset CXXFLAGS_FOR_TARGET.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 209784 138bc75d-0d04-0410-961f-82ee72b054a4
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- config/mt-gnu    | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/config/mt-gnu b/config/mt-gnu
-index 15bf417..5c696f5 100644
---- a/config/mt-gnu
-+++ b/config/mt-gnu
-@@ -1 +1 @@
--CXXFLAGS_FOR_TARGET = $(CXXFLAGS) -D_GNU_SOURCE
-+CXXFLAGS_FOR_TARGET += -D_GNU_SOURCE
--- 
-2.1.4
-
diff --git a/package/gcc/4.9.4/140-sanitizer-Fix-build-with-_FILE_OFFSET_BITS-64.patch b/package/gcc/4.9.4/140-sanitizer-Fix-build-with-_FILE_OFFSET_BITS-64.patch
deleted file mode 100644
index 55f32288f5..0000000000
--- a/package/gcc/4.9.4/140-sanitizer-Fix-build-with-_FILE_OFFSET_BITS-64.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 3c536954a67a883630f4a7513a27f02a892c3dcb Mon Sep 17 00:00:00 2001
-From: Evgeniy Stepanov <eugeni.stepanov@gmail.com>
-Date: Tue, 21 Oct 2014 21:08:13 +0000
-Subject: [PATCH] [sanitizer] Fix build with _FILE_OFFSET_BITS=64.
-
-Sanitizer source is not affected by _FILE_OFFSET_BITS in general,
-but this one file must be built with 32-bit off_t. More details in the code.
-
-git-svn-id: https://llvm.org/svn/llvm-project/compiler-rt/trunk at 220328 91177308-0d34-0410-b5e6-96231b3b80d8
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- lib/sanitizer_common/sanitizer_platform_limits_posix.cc | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-index bbc1108..fc09522 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-@@ -13,7 +13,15 @@
- 
- #include "sanitizer_platform.h"
- #if SANITIZER_LINUX || SANITIZER_MAC
-+// Tests in this file assume that off_t-dependent data structures match the
-+// libc ABI. For example, struct dirent here is what readdir() function (as
-+// exported from libc) returns, and not the user-facing "dirent", which
-+// depends on _FILE_OFFSET_BITS setting.
-+// To get this "true" dirent definition, we undefine _FILE_OFFSET_BITS below.
-+#ifdef _FILE_OFFSET_BITS
-+#undef _FILE_OFFSET_BITS
-+#endif
- 
- #include "sanitizer_internal_defs.h"
- #include "sanitizer_platform_limits_posix.h"
- 
--- 
-2.1.4
-
diff --git a/package/gcc/4.9.4/301-missing-execinfo_h.patch b/package/gcc/4.9.4/301-missing-execinfo_h.patch
deleted file mode 100644
index 00efda24aa..0000000000
--- a/package/gcc/4.9.4/301-missing-execinfo_h.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: gcc-4.8.0/boehm-gc/include/gc.h
-===================================================================
---- gcc-4.8.0.orig/boehm-gc/include/gc.h	2007-04-23 23:10:09.000000000 +0200
-+++ gcc-4.8.0/boehm-gc/include/gc.h	2013-03-23 17:39:20.000000000 +0100
-@@ -503,7 +503,7 @@
- #if defined(__linux__) || defined(__GLIBC__)
- # include <features.h>
- # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
--     && !defined(__ia64__)
-+     && !defined(__ia64__) && !defined(__UCLIBC__)
- #   ifndef GC_HAVE_BUILTIN_BACKTRACE
- #     define GC_HAVE_BUILTIN_BACKTRACE
- #   endif
diff --git a/package/gcc/4.9.4/810-arm-softfloat-libgcc.patch b/package/gcc/4.9.4/810-arm-softfloat-libgcc.patch
deleted file mode 100644
index 5efa7fd1bc..0000000000
--- a/package/gcc/4.9.4/810-arm-softfloat-libgcc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Index: b/gcc/config/arm/linux-elf.h
-===================================================================
---- a/gcc/config/arm/linux-elf.h
-+++ b/gcc/config/arm/linux-elf.h
-@@ -60,7 +60,7 @@
-    %{shared:-lc} \
-    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
- 
--#define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
-+#define LIBGCC_SPEC "-lgcc"
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
- 
-Index: b/libgcc/config/arm/t-linux
-===================================================================
---- a/libgcc/config/arm/t-linux
-+++ b/libgcc/config/arm/t-linux
-@@ -1,6 +1,11 @@
- LIB1ASMSRC = arm/lib1funcs.S
- LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx _clzsi2 _clzdi2 \
--	_ctzsi2 _arm_addsubdf3 _arm_addsubsf3
-+	_ctzsi2 _arm_addsubdf3 _arm_addsubsf3 \
-+	_arm_addsubdf3 _arm_addsubsf3 \
-+	_arm_negdf2 _arm_muldivdf3 _arm_cmpdf2 _arm_unorddf2 \
-+	_arm_fixdfsi _arm_fixunsdfsi _arm_truncdfsf2 \
-+	_arm_negsf2 _arm_muldivsf3 _arm_cmpsf2 _arm_unordsf2 \
-+	_arm_fixsfsi _arm_fixunssfsi
- 
- # Just for these, we omit the frame pointer since it makes such a big
- # difference.
diff --git a/package/gcc/4.9.4/830-arm_unbreak_armv4t.patch b/package/gcc/4.9.4/830-arm_unbreak_armv4t.patch
deleted file mode 100644
index 37f8f2a54d..0000000000
--- a/package/gcc/4.9.4/830-arm_unbreak_armv4t.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-http://sourceware.org/ml/crossgcc/2008-05/msg00009.html
-
---- a/gcc/config/arm/linux-eabi.h
-+++ b/gcc/config/arm/linux-eabi.h
-@@ -45,7 +45,7 @@
-    The ARM10TDMI core is the default for armv5t, so set
-    SUBTARGET_CPU_DEFAULT to achieve this.  */
- #undef  SUBTARGET_CPU_DEFAULT
--#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm10tdmi
-+#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm9tdmi
- 
- /* TARGET_BIG_ENDIAN_DEFAULT is set in
-    config.gcc for big endian configurations.  */
diff --git a/package/gcc/4.9.4/840-microblaze-enable-dwarf-eh-support.patch b/package/gcc/4.9.4/840-microblaze-enable-dwarf-eh-support.patch
deleted file mode 100644
index 03fc47f192..0000000000
--- a/package/gcc/4.9.4/840-microblaze-enable-dwarf-eh-support.patch
+++ /dev/null
@@ -1,166 +0,0 @@
-Fetched from Xilinx gcc git at https://github.com/Xilinx/gcc
-
-From 23c35173490ac2d6348a668dfc9c1a6eb62171f2 Mon Sep 17 00:00:00 2001
-From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
-Date: Mon, 18 Jun 2012 20:18:13 +0200
-Subject: [PATCH] [Patch, microblaze]: Enable DWARF exception handling support.
-
-Changelog
-
-2013-03-18  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
-            David Holsgrove <david.holsgrove@xilinx.com>
-
- * common/config/microblaze/microblaze-common.c: Remove
-   TARGET_EXCEPT_UNWIND_INFO definition.
- * config/microblaze/microblaze-protos.h: Add
-   microblaze_eh_return prototype.
- * gcc/config/microblaze/microblaze.c: (microblaze_must_save_register,
-   microblaze_expand_epilogue, microblaze_return_addr): Handle
-   calls_eh_return
-   (microblaze_eh_return): New function.
- * gcc/config/microblaze/microblaze.h: Define RETURN_ADDR_OFFSET,
-   EH_RETURN_DATA_REGNO, MB_EH_STACKADJ_REGNUM, EH_RETURN_STACKADJ_RTX,
-   ASM_PREFERRED_EH_DATA_FORMAT
- * gcc/config/microblaze/microblaze.md: Define eh_return pattern.
-
-Signed-off-by: David Holsgrove <david.holsgrove@xilinx.com>
-Signed-off-by: Edgar E. Iglesias <edgar.iglesias@gmail.com>
----
- gcc/common/config/microblaze/microblaze-common.c |  3 ---
- gcc/config/microblaze/microblaze-protos.h        |  1 +
- gcc/config/microblaze/microblaze.c               | 29 ++++++++++++++++++++----
- gcc/config/microblaze/microblaze.h               | 15 ++++++++++++
- gcc/config/microblaze/microblaze.md              | 11 +++++++++
- 5 files changed, 52 insertions(+), 7 deletions(-)
-
-Index: b/gcc/common/config/microblaze/microblaze-common.c
-===================================================================
---- a/gcc/common/config/microblaze/microblaze-common.c
-+++ b/gcc/common/config/microblaze/microblaze-common.c
-@@ -37,7 +37,4 @@
- #undef  TARGET_OPTION_OPTIMIZATION_TABLE
- #define TARGET_OPTION_OPTIMIZATION_TABLE microblaze_option_optimization_table
- 
--#undef TARGET_EXCEPT_UNWIND_INFO
--#define TARGET_EXCEPT_UNWIND_INFO  sjlj_except_unwind_info
--
- struct gcc_targetm_common targetm_common = TARGETM_COMMON_INITIALIZER;
-Index: b/gcc/config/microblaze/microblaze-protos.h
-===================================================================
---- a/gcc/config/microblaze/microblaze-protos.h
-+++ b/gcc/config/microblaze/microblaze-protos.h
-@@ -54,6 +54,7 @@
- extern int symbol_mentioned_p (rtx);
- extern int label_mentioned_p (rtx);
- extern bool microblaze_cannot_force_const_mem (enum machine_mode, rtx);
-+extern void microblaze_eh_return (rtx op0);
- #endif  /* RTX_CODE */
- 
- /* Declare functions in microblaze-c.c.  */
-Index: b/gcc/config/microblaze/microblaze.c
-===================================================================
---- a/gcc/config/microblaze/microblaze.c
-+++ b/gcc/config/microblaze/microblaze.c
-@@ -1906,6 +1906,11 @@
-   if (frame_pointer_needed && (regno == HARD_FRAME_POINTER_REGNUM))
-     return 1;
- 
-+  if (crtl->calls_eh_return
-+      && regno == MB_ABI_SUB_RETURN_ADDR_REGNUM) {
-+    return 1;
-+  }
-+
-   if (!crtl->is_leaf)
-     {
-       if (regno == MB_ABI_SUB_RETURN_ADDR_REGNUM)
-@@ -1933,6 +1938,13 @@
- 	return 1;
-     }
- 
-+  if (crtl->calls_eh_return
-+      && (regno == EH_RETURN_DATA_REGNO (0)
-+          || regno == EH_RETURN_DATA_REGNO (1)))
-+    {
-+      return 1;
-+    }
-+
-   return 0;
- }
- 
-@@ -2962,6 +2974,12 @@
-       emit_insn (gen_addsi3 (stack_pointer_rtx, stack_pointer_rtx, fsiz_rtx));
-     }
- 
-+  if (crtl->calls_eh_return)
-+    emit_insn (gen_addsi3 (stack_pointer_rtx,
-+                           stack_pointer_rtx,
-+                           gen_rtx_raw_REG (SImode,
-+                                            MB_EH_STACKADJ_REGNUM)));
-+
-   emit_jump_insn (gen_return_internal (gen_rtx_REG (Pmode, GP_REG_FIRST +
- 						    MB_ABI_SUB_RETURN_ADDR_REGNUM)));
- }
-@@ -3256,10 +3274,13 @@
-   if (count != 0)
-     return NULL_RTX;
- 
--  return gen_rtx_PLUS (Pmode,
--		       get_hard_reg_initial_val (Pmode,
--						 MB_ABI_SUB_RETURN_ADDR_REGNUM),
--		       GEN_INT (8));
-+  return get_hard_reg_initial_val (Pmode,
-+                                   MB_ABI_SUB_RETURN_ADDR_REGNUM);
-+}
-+
-+void microblaze_eh_return (rtx op0)
-+{
-+  emit_insn (gen_movsi(gen_rtx_MEM(Pmode, stack_pointer_rtx), op0));
- }
- 
- /* Queue an .ident string in the queue of top-level asm statements.
-Index: b/gcc/config/microblaze/microblaze.h
-===================================================================
---- a/gcc/config/microblaze/microblaze.h
-+++ b/gcc/config/microblaze/microblaze.h
-@@ -184,6 +184,21 @@
- #define INCOMING_RETURN_ADDR_RTX  			\
-   gen_rtx_REG (VOIDmode, GP_REG_FIRST + MB_ABI_SUB_RETURN_ADDR_REGNUM)
- 
-+/* Specifies the offset from INCOMING_RETURN_ADDR_RTX and the actual return PC.  */
-+#define RETURN_ADDR_OFFSET (8)
-+
-+/* Describe how we implement __builtin_eh_return.  */
-+#define EH_RETURN_DATA_REGNO(N) (((N) < 2) ? MB_ABI_FIRST_ARG_REGNUM + (N) : INVALID_REGNUM)
-+
-+#define MB_EH_STACKADJ_REGNUM  MB_ABI_INT_RETURN_VAL2_REGNUM
-+#define EH_RETURN_STACKADJ_RTX  gen_rtx_REG (Pmode, MB_EH_STACKADJ_REGNUM)
-+
-+/* Select a format to encode pointers in exception handling data.  CODE
-+   is 0 for data, 1 for code labels, 2 for function pointers.  GLOBAL is
-+   true if the symbol may be affected by dynamic relocations.  */
-+#define ASM_PREFERRED_EH_DATA_FORMAT(CODE,GLOBAL) \
-+  ((flag_pic || GLOBAL) ? DW_EH_PE_aligned : DW_EH_PE_absptr)
-+
- /* Use DWARF 2 debugging information by default.  */
- #define DWARF2_DEBUGGING_INFO
- #define PREFERRED_DEBUGGING_TYPE DWARF2_DEBUG
-Index: b/gcc/config/microblaze/microblaze.md
-===================================================================
---- a/gcc/config/microblaze/microblaze.md
-+++ b/gcc/config/microblaze/microblaze.md
-@@ -2261,4 +2261,15 @@
-   (set_attr "mode"      "SI")
-   (set_attr "length"    "4")])
- 
-+; This is used in compiling the unwind routines.
-+(define_expand "eh_return"
-+  [(use (match_operand 0 "general_operand" ""))]
-+  ""
-+  "
-+{
-+  microblaze_eh_return(operands[0]);
-+  DONE;
-+}")
-+
- (include "sync.md")
-+
diff --git a/package/gcc/4.9.4/850-libstdcxx-uclibc-c99.patch b/package/gcc/4.9.4/850-libstdcxx-uclibc-c99.patch
deleted file mode 100644
index 533d01fad5..0000000000
--- a/package/gcc/4.9.4/850-libstdcxx-uclibc-c99.patch
+++ /dev/null
@@ -1,274 +0,0 @@
-Allow C99-depending features of libstdc++ with uClibc
-
-The libstdc++ code is fairly restrictive on how it checks for C99
-compatibility: it requires *complete* C99 support to enable certain
-features. For example, uClibc provides a good number of C99 features,
-but not C99 complex number support. For this reason, libstdc++
-completely disables many the standard C++ methods that can in fact
-work because uClibc provides the necessary functions.
-
-This patch is similar and highly inspired from
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58393, but implemented in
-a way that doesn't involve changing the configure.ac script, as
-autoreconfiguring gcc is complicated. It simply relies on the fact
-that uClibc defines the __UCLIBC__ definition.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Gustavo: update for 4.9.3]
-
-Index: b/libstdc++-v3/config/locale/generic/c_locale.h
-===================================================================
---- a/libstdc++-v3/config/locale/generic/c_locale.h
-+++ b/libstdc++-v3/config/locale/generic/c_locale.h
-@@ -70,7 +70,7 @@
-     __builtin_va_list __args;
-     __builtin_va_start(__args, __fmt);
- 
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
- #else
-     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
-Index: b/libstdc++-v3/config/locale/gnu/c_locale.h
-===================================================================
---- a/libstdc++-v3/config/locale/gnu/c_locale.h
-+++ b/libstdc++-v3/config/locale/gnu/c_locale.h
-@@ -88,7 +88,7 @@
-     __builtin_va_list __args;
-     __builtin_va_start(__args, __fmt);
- 
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
- #else
-     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
-Index: b/libstdc++-v3/include/bits/basic_string.h
-===================================================================
---- a/libstdc++-v3/include/bits/basic_string.h
-+++ b/libstdc++-v3/include/bits/basic_string.h
-@@ -2843,7 +2843,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if __cplusplus >= 201103L && defined(_GLIBCXX_USE_C99)
-+#if __cplusplus >= 201103L && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__))
- 
- #include <ext/string_conversions.h>
- 
-Index: b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
-===================================================================
---- a/libstdc++-v3/include/bits/locale_facets_nonio.tcc
-+++ b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
-@@ -572,7 +572,7 @@
-     {
-       const locale __loc = __io.getloc();
-       const ctype<_CharT>& __ctype = use_facet<ctype<_CharT> >(__loc);
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-       // First try a buffer perhaps big enough.
-       int __cs_size = 64;
-       char* __cs = static_cast<char*>(__builtin_alloca(__cs_size));
-Index: b/libstdc++-v3/include/bits/locale_facets.tcc
-===================================================================
---- a/libstdc++-v3/include/bits/locale_facets.tcc
-+++ b/libstdc++-v3/include/bits/locale_facets.tcc
-@@ -987,7 +987,7 @@
- 	char __fbuf[16];
- 	__num_base::_S_format_float(__io, __fbuf, __mod);
- 
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 	// First try a buffer perhaps big enough (most probably sufficient
- 	// for non-ios_base::fixed outputs)
- 	int __cs_size = __max_digits * 3;
-Index: b/libstdc++-v3/include/c_compatibility/math.h
-===================================================================
---- a/libstdc++-v3/include/c_compatibility/math.h
-+++ b/libstdc++-v3/include/c_compatibility/math.h
-@@ -56,7 +56,7 @@
- using std::floor;
- using std::fmod;
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- using std::fpclassify;
- using std::isfinite;
- using std::isinf;
-Index: b/libstdc++-v3/include/c_compatibility/wchar.h
-===================================================================
---- a/libstdc++-v3/include/c_compatibility/wchar.h
-+++ b/libstdc++-v3/include/c_compatibility/wchar.h
-@@ -103,7 +103,7 @@
- using std::wmemset;
- using std::wcsftime;
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- using std::wcstold;
- using std::wcstoll;
- using std::wcstoull;
-Index: b/libstdc++-v3/include/c_global/cstdio
-===================================================================
---- a/libstdc++-v3/include/c_global/cstdio
-+++ b/libstdc++-v3/include/c_global/cstdio
-@@ -146,7 +146,7 @@
-   using ::vsprintf;
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef snprintf
- #undef vfscanf
-Index: b/libstdc++-v3/include/c_global/cstdlib
-===================================================================
---- a/libstdc++-v3/include/c_global/cstdlib
-+++ b/libstdc++-v3/include/c_global/cstdlib
-@@ -182,7 +182,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef _Exit
- #undef llabs
-Index: b/libstdc++-v3/include/c_global/cwchar
-===================================================================
---- a/libstdc++-v3/include/c_global/cwchar
-+++ b/libstdc++-v3/include/c_global/cwchar
-@@ -232,7 +232,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef wcstold
- #undef wcstoll
-@@ -289,7 +289,7 @@
-   using std::vwscanf;
- #endif
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-   using std::wcstold;
-   using std::wcstoll;
-   using std::wcstoull;
-Index: b/libstdc++-v3/include/c_std/cstdio
-===================================================================
---- a/libstdc++-v3/include/c_std/cstdio
-+++ b/libstdc++-v3/include/c_std/cstdio
-@@ -144,7 +144,7 @@
-   using ::vsprintf;
- } // namespace std
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef snprintf
- #undef vfscanf
-Index: b/libstdc++-v3/include/c_std/cstdlib
-===================================================================
---- a/libstdc++-v3/include/c_std/cstdlib
-+++ b/libstdc++-v3/include/c_std/cstdlib
-@@ -180,7 +180,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef _Exit
- #undef llabs
-Index: b/libstdc++-v3/include/c_std/cwchar
-===================================================================
---- a/libstdc++-v3/include/c_std/cwchar
-+++ b/libstdc++-v3/include/c_std/cwchar
-@@ -228,7 +228,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef wcstold
- #undef wcstoll
-Index: b/libstdc++-v3/include/ext/vstring.h
-===================================================================
---- a/libstdc++-v3/include/ext/vstring.h
-+++ b/libstdc++-v3/include/ext/vstring.h
-@@ -2680,7 +2680,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if ((__cplusplus >= 201103L) && defined(_GLIBCXX_USE_C99))
-+#if ((__cplusplus >= 201103L) && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)))
- 
- #include <ext/string_conversions.h>
- 
-Index: b/libstdc++-v3/include/tr1/cstdio
-===================================================================
---- a/libstdc++-v3/include/tr1/cstdio
-+++ b/libstdc++-v3/include/tr1/cstdio
-@@ -33,7 +33,7 @@
- 
- #include <cstdio>
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- namespace std _GLIBCXX_VISIBILITY(default)
- {
-Index: b/libstdc++-v3/include/tr1/cstdlib
-===================================================================
---- a/libstdc++-v3/include/tr1/cstdlib
-+++ b/libstdc++-v3/include/tr1/cstdlib
-@@ -35,7 +35,7 @@
- 
- #if _GLIBCXX_HOSTED
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- namespace std _GLIBCXX_VISIBILITY(default)
- {
-Index: b/libstdc++-v3/include/tr1/cwchar
-===================================================================
---- a/libstdc++-v3/include/tr1/cwchar
-+++ b/libstdc++-v3/include/tr1/cwchar
-@@ -52,7 +52,7 @@
-   using std::vwscanf;
- #endif
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-   using std::wcstold;
-   using std::wcstoll;
-   using std::wcstoull;
-Index: b/libstdc++-v3/include/tr1/stdlib.h
-===================================================================
---- a/libstdc++-v3/include/tr1/stdlib.h
-+++ b/libstdc++-v3/include/tr1/stdlib.h
-@@ -33,7 +33,7 @@
- 
- #if _GLIBCXX_HOSTED
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- using std::tr1::atoll;
- using std::tr1::strtoll;
-Index: b/libstdc++-v3/src/c++11/debug.cc
-===================================================================
---- a/libstdc++-v3/src/c++11/debug.cc
-+++ b/libstdc++-v3/src/c++11/debug.cc
-@@ -788,7 +788,7 @@
- 				     int __n __attribute__ ((__unused__)), 
- 				     const char* __fmt, _Tp __s) const throw ()
-     {
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-       std::snprintf(__buf, __n, __fmt, __s);
- #else
-       std::sprintf(__buf, __fmt, __s);
diff --git a/package/gcc/4.9.4/860-cilk-wchar.patch b/package/gcc/4.9.4/860-cilk-wchar.patch
deleted file mode 100644
index 1837405151..0000000000
--- a/package/gcc/4.9.4/860-cilk-wchar.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-[PATCH] cilk: fix build without wchar
-
-When building against uClibc with wchar support disabled, WCHAR_MIN and
-WCHAR_MAX are not defined leading to compilation errors.
-
-Fix it by only including the wchar code if available.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- libcilkrts/include/cilk/reducer_min_max.h |    8 ++++++++
- 1 file changed, 8 insertions(+)
-
-Index: host-gcc-final-4.9.2/libcilkrts/include/cilk/reducer_min_max.h
-===================================================================
---- host-gcc-final-4.9.2.orig/libcilkrts/include/cilk/reducer_min_max.h
-+++ host-gcc-final-4.9.2/libcilkrts/include/cilk/reducer_min_max.h
-@@ -3154,7 +3154,9 @@
- CILK_C_REDUCER_MAX_INSTANCE(char,               char,       CHAR_MIN)
- CILK_C_REDUCER_MAX_INSTANCE(unsigned char,      uchar,      0)
- CILK_C_REDUCER_MAX_INSTANCE(signed char,        schar,      SCHAR_MIN)
-+#ifdef WCHAR_MIN
- CILK_C_REDUCER_MAX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
-+#endif
- CILK_C_REDUCER_MAX_INSTANCE(short,              short,      SHRT_MIN)
- CILK_C_REDUCER_MAX_INSTANCE(unsigned short,     ushort,     0)
- CILK_C_REDUCER_MAX_INSTANCE(int,                int,        INT_MIN)
-@@ -3306,7 +3308,9 @@
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(char,               char,       CHAR_MIN)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned char,      uchar,      0)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(signed char,        schar,      SCHAR_MIN)
-+#ifdef WCHAR_MIN
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
-+#endif
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(short,              short,      SHRT_MIN)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned short,     ushort,     0)
- CILK_C_REDUCER_MAX_INDEX_INSTANCE(int,                int,        INT_MIN)
-@@ -3432,7 +3436,9 @@
- CILK_C_REDUCER_MIN_INSTANCE(char,               char,       CHAR_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(signed char,        schar,      SCHAR_MAX)
-+#ifdef WCHAR_MAX
- CILK_C_REDUCER_MIN_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
-+#endif
- CILK_C_REDUCER_MIN_INSTANCE(short,              short,      SHRT_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
- CILK_C_REDUCER_MIN_INSTANCE(int,                int,        INT_MAX)
-@@ -3584,7 +3590,9 @@
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(char,               char,       CHAR_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(signed char,        schar,      SCHAR_MAX)
-+#ifdef WCHAR_MAX
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
-+#endif
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(short,              short,      SHRT_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
- CILK_C_REDUCER_MIN_INDEX_INSTANCE(int,                int,        INT_MAX)
diff --git a/package/gcc/4.9.4/870-xtensa-add-mauto-litpools-option.patch b/package/gcc/4.9.4/870-xtensa-add-mauto-litpools-option.patch
deleted file mode 100644
index 98c7b3f32c..0000000000
--- a/package/gcc/4.9.4/870-xtensa-add-mauto-litpools-option.patch
+++ /dev/null
@@ -1,287 +0,0 @@
-From 6d852ffb43b111a39162135c95249e749c4e285b Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Thu, 6 Aug 2015 01:16:02 +0300
-Subject: [PATCH] xtensa: add -mauto-litpools option
-
-With support from assembler this option allows compiling huge functions,
-where single literal pool at the beginning of a function may not be
-reachable by L32R instructions at its end.
-
-Currently assembler --auto-litpools option cannot deal with literals
-used from multiple locations separated by more than 256 KBytes of code.
-Don't turn constants into literals, instead use MOVI instruction to load
-them into registers and let the assembler turn them into literals as
-necessary.
-
-2015-08-12  Max Filippov  <jcmvbkbc@gmail.com>
-gcc/
-	* config/xtensa/constraints.md (define_constraint "Y"): New
-	constraint.
-	* config/xtensa/elf.h (ASM_SPEC): Add m(no-)auto-litpools.
-	* config/xtensa/linux.h (ASM_SPEC): Likewise.
-	* config/xtensa/predicates.md (move_operand): Match constants
-	and symbols in the presence of TARGET_AUTO_LITPOOLS.
-	* config/xtensa/xtensa.c (xtensa_valid_move): Don't allow
-	immediate references to TLS data.
-	(xtensa_emit_move_sequence): Don't force constants to memory in
-	the presence of TARGET_AUTO_LITPOOLS.
-	(print_operand): Add 'y' format, same as default, but capable of
-	printing SF mode constants as well.
-	* config/xtensa/xtensa.md (movsi_internal, movhi_internal)
-	(movsf_internal): Add movi pattern that loads literal.
-	(movsf, movdf): Don't force constants to memory in the presence
-	of TARGET_AUTO_LITPOOLS.
-	(movdf_internal): Add 'Y' constraint.
-	* config/xtensa/xtensa.opt (mauto-litpools): New option.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: r226828
-Changes to ChangeLogs and documentation are dropped.
-
- gcc/config/xtensa/constraints.md |  5 +++++
- gcc/config/xtensa/elf.h          |  4 +++-
- gcc/config/xtensa/linux.h        |  4 +++-
- gcc/config/xtensa/predicates.md  |  3 ++-
- gcc/config/xtensa/xtensa.c       | 19 ++++++++++++++++++-
- gcc/config/xtensa/xtensa.md      | 35 +++++++++++++++++++----------------
- gcc/config/xtensa/xtensa.opt     |  4 ++++
- 7 files changed, 54 insertions(+), 20 deletions(-)
-
-Index: b/gcc/config/xtensa/constraints.md
-===================================================================
---- a/gcc/config/xtensa/constraints.md
-+++ b/gcc/config/xtensa/constraints.md
-@@ -111,6 +111,11 @@
-  (and (match_code "const_int")
-       (match_test "xtensa_mask_immediate (ival)")))
- 
-+(define_constraint "Y"
-+ "A constant that can be used in relaxed MOVI instructions."
-+ (and (match_code "const_int,const_double,const,symbol_ref,label_ref")
-+      (match_test "TARGET_AUTO_LITPOOLS")))
-+
- ;; Memory constraints.  Do not use define_memory_constraint here.  Doing so
- ;; causes reload to force some constants into the constant pool, but since
- ;; the Xtensa constant pool can only be accessed with L32R instructions, it
-Index: b/gcc/config/xtensa/elf.h
-===================================================================
---- a/gcc/config/xtensa/elf.h
-+++ b/gcc/config/xtensa/elf.h
-@@ -48,7 +48,9 @@
-   %{mtarget-align:--target-align} \
-   %{mno-target-align:--no-target-align} \
-   %{mlongcalls:--longcalls} \
--  %{mno-longcalls:--no-longcalls}"
-+  %{mno-longcalls:--no-longcalls} \
-+  %{mauto-litpools:--auto-litpools} \
-+  %{mno-auto-litpools:--no-auto-litpools}"
- 
- #undef LIB_SPEC
- #define LIB_SPEC "-lc -lsim -lc -lhandlers-sim -lhal"
-Index: b/gcc/config/xtensa/linux.h
-===================================================================
---- a/gcc/config/xtensa/linux.h
-+++ b/gcc/config/xtensa/linux.h
-@@ -42,7 +42,9 @@
-   %{mtarget-align:--target-align} \
-   %{mno-target-align:--no-target-align} \
-   %{mlongcalls:--longcalls} \
--  %{mno-longcalls:--no-longcalls}"
-+  %{mno-longcalls:--no-longcalls} \
-+  %{mauto-litpools:--auto-litpools} \
-+  %{mno-auto-litpools:--no-auto-litpools}"
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
- 
-Index: b/gcc/config/xtensa/predicates.md
-===================================================================
---- a/gcc/config/xtensa/predicates.md
-+++ b/gcc/config/xtensa/predicates.md
-@@ -142,7 +142,8 @@
- 	       (match_test "GET_MODE_CLASS (mode) == MODE_INT
- 			    && xtensa_simm12b (INTVAL (op))"))
- 	  (and (match_code "const_int,const_double,const,symbol_ref,label_ref")
--	       (match_test "TARGET_CONST16 && CONSTANT_P (op)
-+	       (match_test "(TARGET_CONST16 || TARGET_AUTO_LITPOOLS)
-+			    && CONSTANT_P (op)
- 			    && GET_MODE_SIZE (mode) % UNITS_PER_WORD == 0")))))
- 
- ;; Accept the floating point constant 1 in the appropriate mode.
-Index: b/gcc/config/xtensa/xtensa.c
-===================================================================
---- a/gcc/config/xtensa/xtensa.c
-+++ b/gcc/config/xtensa/xtensa.c
-@@ -477,6 +477,9 @@
-     {
-       int dst_regnum = xt_true_regnum (operands[0]);
- 
-+      if (xtensa_tls_referenced_p (operands[1]))
-+	return FALSE;
-+
-       /* The stack pointer can only be assigned with a MOVSP opcode.  */
-       if (dst_regnum == STACK_POINTER_REGNUM)
- 	return (mode == SImode
-@@ -1044,7 +1047,7 @@
- 	  return 1;
- 	}
- 
--      if (! TARGET_CONST16)
-+      if (! TARGET_AUTO_LITPOOLS && ! TARGET_CONST16)
- 	{
- 	  src = force_const_mem (SImode, src);
- 	  operands[1] = src;
-@@ -2428,6 +2431,20 @@
- 	}
-       break;
- 
-+    case 'y':
-+      if (GET_CODE (x) == CONST_DOUBLE &&
-+	  GET_MODE (x) == SFmode)
-+	{
-+	  REAL_VALUE_TYPE r;
-+	  long l;
-+	  REAL_VALUE_FROM_CONST_DOUBLE (r, x);
-+	  REAL_VALUE_TO_TARGET_SINGLE (r, l);
-+	  fprintf (file, "0x%08lx", l);
-+	  break;
-+	}
-+
-+      /* fall through */
-+
-     default:
-       if (GET_CODE (x) == REG || GET_CODE (x) == SUBREG)
- 	fprintf (file, "%s", reg_names[xt_true_regnum (x)]);
-Index: b/gcc/config/xtensa/xtensa.md
-===================================================================
---- a/gcc/config/xtensa/xtensa.md
-+++ b/gcc/config/xtensa/xtensa.md
-@@ -799,8 +799,8 @@
- })
- 
- (define_insn "movsi_internal"
--  [(set (match_operand:SI 0 "nonimmed_operand" "=D,D,D,D,R,R,a,q,a,W,a,a,U,*a,*A")
--	(match_operand:SI 1 "move_operand" "M,D,d,R,D,d,r,r,I,i,T,U,r,*A,*r"))]
-+  [(set (match_operand:SI 0 "nonimmed_operand" "=D,D,D,D,R,R,a,q,a,a,W,a,a,U,*a,*A")
-+	(match_operand:SI 1 "move_operand" "M,D,d,R,D,d,r,r,I,Y,i,T,U,r,*A,*r"))]
-   "xtensa_valid_move (SImode, operands)"
-   "@
-    movi.n\t%0, %x1
-@@ -812,15 +812,16 @@
-    mov\t%0, %1
-    movsp\t%0, %1
-    movi\t%0, %x1
-+   movi\t%0, %1
-    const16\t%0, %t1\;const16\t%0, %b1
-    %v1l32r\t%0, %1
-    %v1l32i\t%0, %1
-    %v0s32i\t%1, %0
-    rsr\t%0, ACCLO
-    wsr\t%1, ACCLO"
--  [(set_attr "type" "move,move,move,load,store,store,move,move,move,move,load,load,store,rsr,wsr")
-+  [(set_attr "type" "move,move,move,load,store,store,move,move,move,move,move,load,load,store,rsr,wsr")
-    (set_attr "mode"	"SI")
--   (set_attr "length"	"2,2,2,2,2,2,3,3,3,6,3,3,3,3,3")])
-+   (set_attr "length"	"2,2,2,2,2,2,3,3,3,3,6,3,3,3,3,3")])
- 
- ;; 16-bit Integer moves
- 
-@@ -834,21 +835,22 @@
- })
- 
- (define_insn "movhi_internal"
--  [(set (match_operand:HI 0 "nonimmed_operand" "=D,D,a,a,a,U,*a,*A")
--	(match_operand:HI 1 "move_operand" "M,d,r,I,U,r,*A,*r"))]
-+  [(set (match_operand:HI 0 "nonimmed_operand" "=D,D,a,a,a,a,U,*a,*A")
-+	(match_operand:HI 1 "move_operand" "M,d,r,I,Y,U,r,*A,*r"))]
-   "xtensa_valid_move (HImode, operands)"
-   "@
-    movi.n\t%0, %x1
-    mov.n\t%0, %1
-    mov\t%0, %1
-    movi\t%0, %x1
-+   movi\t%0, %1
-    %v1l16ui\t%0, %1
-    %v0s16i\t%1, %0
-    rsr\t%0, ACCLO
-    wsr\t%1, ACCLO"
--  [(set_attr "type"	"move,move,move,move,load,store,rsr,wsr")
-+  [(set_attr "type"	"move,move,move,move,move,load,store,rsr,wsr")
-    (set_attr "mode"	"HI")
--   (set_attr "length"	"2,2,3,3,3,3,3,3")])
-+   (set_attr "length"	"2,2,3,3,3,3,3,3,3")])
- 
- ;; 8-bit Integer moves
- 
-@@ -919,7 +921,7 @@
- 	(match_operand:SF 1 "general_operand" ""))]
-   ""
- {
--  if (!TARGET_CONST16 && CONSTANT_P (operands[1]))
-+  if (!TARGET_CONST16 && !TARGET_AUTO_LITPOOLS && CONSTANT_P (operands[1]))
-     operands[1] = force_const_mem (SFmode, operands[1]);
- 
-   if ((!register_operand (operands[0], SFmode)
-@@ -934,8 +936,8 @@
- })
- 
- (define_insn "movsf_internal"
--  [(set (match_operand:SF 0 "nonimmed_operand" "=f,f,U,D,D,R,a,f,a,W,a,a,U")
--	(match_operand:SF 1 "move_operand" "f,U,f,d,R,d,r,r,f,iF,T,U,r"))]
-+  [(set (match_operand:SF 0 "nonimmed_operand" "=f,f,U,D,D,R,a,f,a,a,W,a,a,U")
-+	(match_operand:SF 1 "move_operand" "f,U,f,d,R,d,r,r,f,Y,iF,T,U,r"))]
-   "((register_operand (operands[0], SFmode)
-      || register_operand (operands[1], SFmode))
-     && !(FP_REG_P (xt_true_regnum (operands[0]))
-@@ -950,13 +952,14 @@
-    mov\t%0, %1
-    wfr\t%0, %1
-    rfr\t%0, %1
-+   movi\t%0, %y1
-    const16\t%0, %t1\;const16\t%0, %b1
-    %v1l32r\t%0, %1
-    %v1l32i\t%0, %1
-    %v0s32i\t%1, %0"
--  [(set_attr "type"	"farith,fload,fstore,move,load,store,move,farith,farith,move,load,load,store")
-+  [(set_attr "type"	"farith,fload,fstore,move,load,store,move,farith,farith,move,move,load,load,store")
-    (set_attr "mode"	"SF")
--   (set_attr "length"	"3,3,3,2,2,2,3,3,3,6,3,3,3")])
-+   (set_attr "length"	"3,3,3,2,2,2,3,3,3,3,6,3,3,3")])
- 
- (define_insn "*lsiu"
-   [(set (match_operand:SF 0 "register_operand" "=f")
-@@ -997,7 +1000,7 @@
- 	(match_operand:DF 1 "general_operand" ""))]
-   ""
- {
--  if (CONSTANT_P (operands[1]) && !TARGET_CONST16)
-+  if (CONSTANT_P (operands[1]) && !TARGET_CONST16 && !TARGET_AUTO_LITPOOLS)
-     operands[1] = force_const_mem (DFmode, operands[1]);
- 
-   if (!register_operand (operands[0], DFmode)
-@@ -1008,8 +1011,8 @@
- })
- 
- (define_insn_and_split "movdf_internal"
--  [(set (match_operand:DF 0 "nonimmed_operand" "=a,W,a,a,U")
--	(match_operand:DF 1 "move_operand" "r,iF,T,U,r"))]
-+  [(set (match_operand:DF 0 "nonimmed_operand" "=a,a,W,a,a,U")
-+	(match_operand:DF 1 "move_operand" "r,Y,iF,T,U,r"))]
-   "register_operand (operands[0], DFmode)
-    || register_operand (operands[1], DFmode)"
-   "#"
-Index: b/gcc/config/xtensa/xtensa.opt
-===================================================================
---- a/gcc/config/xtensa/xtensa.opt
-+++ b/gcc/config/xtensa/xtensa.opt
-@@ -38,6 +38,10 @@
- Target
- Intersperse literal pools with code in the text section
- 
-+mauto-litpools
-+Target Report Mask(AUTO_LITPOOLS)
-+Relax literals in assembler and place them automatically in the text section
-+
- mserialize-volatile
- Target Report Mask(SERIALIZE_VOLATILE)
- -mno-serialize-volatile	Do not serialize volatile memory references with MEMW instructions
diff --git a/package/gcc/4.9.4/871-xtensa-reimplement-register-spilling.patch b/package/gcc/4.9.4/871-xtensa-reimplement-register-spilling.patch
deleted file mode 100644
index abc7a08e8d..0000000000
--- a/package/gcc/4.9.4/871-xtensa-reimplement-register-spilling.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 05154174b369505238b759cf80d595d8cfc8c731 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Mon, 10 Aug 2015 21:35:20 +0300
-Subject: [PATCH 1/3] xtensa: reimplement register spilling
-
-Spilling windowed registers in userspace is much easier, more portable,
-less error-prone and equally effective as in kernel. Now that register
-spilling syscall is considered obsolete in the xtensa linux kernel
-replace it with CALL12 followed by series of ENTRY in libgcc.
-
-2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
-libgcc/
-	* config/xtensa/lib2funcs.S (__xtensa_libgcc_window_spill): Use
-	CALL12 followed by series of ENTRY to spill windowed registers.
-	(__xtensa_nonlocal_goto): Call __xtensa_libgcc_window_spill
-	instead of making linux spill syscall.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: r226962
-
- libgcc/config/xtensa/lib2funcs.S | 30 +++++++++++++++++++++++-------
- 1 file changed, 23 insertions(+), 7 deletions(-)
-
-diff --git a/libgcc/config/xtensa/lib2funcs.S b/libgcc/config/xtensa/lib2funcs.S
-index 3ac8c1d..2e678af 100644
---- a/libgcc/config/xtensa/lib2funcs.S
-+++ b/libgcc/config/xtensa/lib2funcs.S
-@@ -33,10 +33,29 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- 	.global	__xtensa_libgcc_window_spill
- 	.type	__xtensa_libgcc_window_spill, at function
- __xtensa_libgcc_window_spill:
--	entry	sp, 32
--	movi	a2, 0
--	syscall
-+	entry	sp, 48
-+#if XCHAL_NUM_AREGS > 16
-+	call12	1f
-+	retw
-+	.align	4
-+1:
-+	.rept	(XCHAL_NUM_AREGS - 24) / 12
-+	_entry	sp, 48
-+	mov	a12, a0
-+	.endr
-+	_entry	sp, 16
-+#if XCHAL_NUM_AREGS % 12 == 0
-+	mov	a4, a4
-+#elif XCHAL_NUM_AREGS % 12 == 4
-+	mov	a8, a8
-+#elif XCHAL_NUM_AREGS % 12 == 8
-+	mov	a12, a12
-+#endif
-+	retw
-+#else
-+	mov	a8, a8
- 	retw
-+#endif
- 	.size	__xtensa_libgcc_window_spill, .-__xtensa_libgcc_window_spill
- 
- 
-@@ -58,10 +77,7 @@ __xtensa_nonlocal_goto:
- 	entry	sp, 32
- 
- 	/* Flush registers.  */
--	mov	a5, a2
--	movi	a2, 0
--	syscall
--	mov	a2, a5
-+	call8	__xtensa_libgcc_window_spill
- 
- 	/* Because the save area for a0-a3 is stored one frame below
- 	   the one identified by a2, the only way to restore those
--- 
-1.8.1.4
-
diff --git a/package/gcc/4.9.4/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch b/package/gcc/4.9.4/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
deleted file mode 100644
index f23a5c0737..0000000000
--- a/package/gcc/4.9.4/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From f66206679a0ad604f13673559f230160cd3d1189 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Fri, 14 Aug 2015 02:45:02 +0300
-Subject: [PATCH 2/3] xtensa: use unwind-dw2-fde-dip instead of unwind-dw2-fde
-
-This allows having exception cleanup code in binaries that don't
-register their unwind tables.
-
-2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
-libgcc/
-	* config/xtensa/t-xtensa (LIB2ADDEH): Replace unwind-dw2-fde
-	with unwind-dw2-fde-dip.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: r226963
-
- libgcc/config/xtensa/t-xtensa | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libgcc/config/xtensa/t-xtensa b/libgcc/config/xtensa/t-xtensa
-index 27399e6..66d0eb3 100644
---- a/libgcc/config/xtensa/t-xtensa
-+++ b/libgcc/config/xtensa/t-xtensa
-@@ -13,4 +13,4 @@ LIB1ASMFUNCS = _mulsi3 _divsi3 _modsi3 _udivsi3 _umodsi3 \
- LIB2ADD = $(srcdir)/config/xtensa/lib2funcs.S
- 
- LIB2ADDEH = $(srcdir)/config/xtensa/unwind-dw2-xtensa.c \
--   $(srcdir)/unwind-dw2-fde.c $(srcdir)/unwind-sjlj.c $(srcdir)/unwind-c.c
-+   $(srcdir)/unwind-dw2-fde-dip.c $(srcdir)/unwind-sjlj.c $(srcdir)/unwind-c.c
--- 
-1.8.1.4
-
diff --git a/package/gcc/4.9.4/873-xtensa-fix-_Unwind_GetCFA.patch b/package/gcc/4.9.4/873-xtensa-fix-_Unwind_GetCFA.patch
deleted file mode 100644
index dc405132cc..0000000000
--- a/package/gcc/4.9.4/873-xtensa-fix-_Unwind_GetCFA.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 15c7c4d39b317f0d902ef28fd43eca5c3369f891 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Sat, 15 Aug 2015 05:12:11 +0300
-Subject: [PATCH 3/3] xtensa: fix _Unwind_GetCFA
-
-Returning context->cfa in _Unwind_GetCFA makes CFA point one stack frame
-higher than what was actually used by code at context->ra. This results
-in invalid CFA value in signal frames and premature unwinding completion
-in forced unwinding used by uClibc NPTL thread cancellation.
-Returning context->sp from _Unwind_GetCFA makes all CFA values valid and
-matching code that used them.
-
-2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
-libgcc/
-	* config/xtensa/unwind-dw2-xtensa.c (_Unwind_GetCFA): Return
-	context->sp instead of context->cfa.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: r226964
-
- libgcc/config/xtensa/unwind-dw2-xtensa.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libgcc/config/xtensa/unwind-dw2-xtensa.c b/libgcc/config/xtensa/unwind-dw2-xtensa.c
-index 35f7797..ef6b900 100644
---- a/libgcc/config/xtensa/unwind-dw2-xtensa.c
-+++ b/libgcc/config/xtensa/unwind-dw2-xtensa.c
-@@ -130,7 +130,7 @@ _Unwind_GetGR (struct _Unwind_Context *context, int index)
- _Unwind_Word
- _Unwind_GetCFA (struct _Unwind_Context *context)
- {
--  return (_Unwind_Ptr) context->cfa;
-+  return (_Unwind_Ptr) context->sp;
- }
- 
- /* Overwrite the saved value for register INDEX in CONTEXT with VAL.  */
--- 
-1.8.1.4
-
diff --git a/package/gcc/4.9.4/874-xtensa-add-uclinux-support.patch b/package/gcc/4.9.4/874-xtensa-add-uclinux-support.patch
deleted file mode 100644
index 881aec09d9..0000000000
--- a/package/gcc/4.9.4/874-xtensa-add-uclinux-support.patch
+++ /dev/null
@@ -1,169 +0,0 @@
-From 70c2cb98fb129b4766b5da0f945dc41fd568c77a Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Sat, 22 Aug 2015 08:44:26 +0300
-Subject: [PATCH] xtensa: add uclinux support
-
-2015-10-03  Max Filippov  <jcmvbkbc@gmail.com>
-gcc/
-	* config.gcc (xtensa*-*-uclinux*): New configuration.
-	* config/xtensa/uclinux.h: New file.
-	* config/xtensa/uclinux.opt: New file.
-
-libgcc/
-	* config.host (xtensa*-*-uclinux*): New configuration.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: r228450
-
- gcc/config.gcc                |  5 ++++
- gcc/config/xtensa/uclinux.h   | 69 +++++++++++++++++++++++++++++++++++++++++++
- gcc/config/xtensa/uclinux.opt | 32 ++++++++++++++++++++
- libgcc/config.host            |  5 ++++
- 4 files changed, 111 insertions(+)
- create mode 100644 gcc/config/xtensa/uclinux.h
- create mode 100644 gcc/config/xtensa/uclinux.opt
-
-Index: b/gcc/config.gcc
-===================================================================
---- a/gcc/config.gcc
-+++ b/gcc/config.gcc
-@@ -2871,6 +2871,11 @@
- 	tm_file="${tm_file} dbxelf.h elfos.h gnu-user.h linux.h glibc-stdint.h xtensa/linux.h"
- 	tmake_file="${tmake_file} xtensa/t-xtensa"
- 	;;
-+xtensa*-*-uclinux*)
-+	tm_file="${tm_file} dbxelf.h elfos.h gnu-user.h linux.h glibc-stdint.h xtensa/uclinux.h"
-+	tmake_file="${tmake_file} xtensa/t-xtensa"
-+	extra_options="${extra_options} xtensa/uclinux.opt"
-+	;;
- am33_2.0-*-linux*)
- 	tm_file="mn10300/mn10300.h dbxelf.h elfos.h gnu-user.h linux.h glibc-stdint.h mn10300/linux.h"
- 	gas=yes gnu_ld=yes
-Index: b/gcc/config/xtensa/uclinux.h
-===================================================================
---- /dev/null
-+++ b/gcc/config/xtensa/uclinux.h
-@@ -0,0 +1,69 @@
-+/* Xtensa uClinux configuration.
-+   Derived from the configuration for GCC for Intel i386 running Linux.
-+   Copyright (C) 2001-2015 Free Software Foundation, Inc.
-+
-+This file is part of GCC.
-+
-+GCC is free software; you can redistribute it and/or modify it under
-+the terms of the GNU General Public License as published by the Free
-+Software Foundation; either version 3, or (at your option) any later
-+version.
-+
-+GCC is distributed in the hope that it will be useful, but WITHOUT ANY
-+WARRANTY; without even the implied warranty of MERCHANTABILITY or
-+FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-+for more details.
-+
-+You should have received a copy of the GNU General Public License
-+along with GCC; see the file COPYING3.  If not see
-+<http://www.gnu.org/licenses/>.  */
-+
-+#undef TARGET_OS_CPP_BUILTINS
-+#define TARGET_OS_CPP_BUILTINS()				\
-+  do								\
-+    {								\
-+      GNU_USER_TARGET_OS_CPP_BUILTINS ();			\
-+      builtin_define ("__uClinux__");				\
-+    }								\
-+  while (0)
-+
-+#undef SUBTARGET_CPP_SPEC
-+#define SUBTARGET_CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
-+
-+#undef SIZE_TYPE
-+#define SIZE_TYPE "unsigned int"
-+
-+#undef PTRDIFF_TYPE
-+#define PTRDIFF_TYPE "int"
-+
-+#undef WCHAR_TYPE
-+#define WCHAR_TYPE "long int"
-+
-+#undef WCHAR_TYPE_SIZE
-+#define WCHAR_TYPE_SIZE 32
-+
-+#undef ASM_SPEC
-+#define ASM_SPEC \
-+ "%{mtext-section-literals:--text-section-literals} \
-+  %{mno-text-section-literals:--no-text-section-literals} \
-+  %{mtarget-align:--target-align} \
-+  %{mno-target-align:--no-target-align} \
-+  %{mlongcalls:--longcalls} \
-+  %{mno-longcalls:--no-longcalls} \
-+  %{mauto-litpools:--auto-litpools} \
-+  %{mno-auto-litpools:--no-auto-litpools}"
-+
-+#undef LINK_SPEC
-+#define LINK_SPEC "%{!no-elf2flt:%{!elf2flt*:-elf2flt}}"
-+
-+#undef LOCAL_LABEL_PREFIX
-+#define LOCAL_LABEL_PREFIX	"."
-+
-+/* Always enable "-fpic" for Xtensa Linux.  */
-+#define XTENSA_ALWAYS_PIC 1
-+
-+#undef TARGET_LIBC_HAS_FUNCTION
-+#define TARGET_LIBC_HAS_FUNCTION no_c99_libc_has_function
-+
-+#undef DBX_REGISTER_NUMBER
-+
-Index: b/gcc/config/xtensa/uclinux.opt
-===================================================================
---- /dev/null
-+++ b/gcc/config/xtensa/uclinux.opt
-@@ -0,0 +1,32 @@
-+; Xtensa uClinux options.
-+
-+; Copyright (C) 2015 Free Software Foundation, Inc.
-+;
-+; This file is part of GCC.
-+;
-+; GCC is free software; you can redistribute it and/or modify it under
-+; the terms of the GNU General Public License as published by the Free
-+; Software Foundation; either version 3, or (at your option) any later
-+; version.
-+;
-+; GCC is distributed in the hope that it will be useful, but WITHOUT ANY
-+; WARRANTY; without even the implied warranty of MERCHANTABILITY or
-+; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-+; for more details.
-+;
-+; You should have received a copy of the GNU General Public License
-+; along with GCC; see the file COPYING3.  If not see
-+; <http://www.gnu.org/licenses/>.
-+
-+; See the GCC internals manual (options.texi) for a description of
-+; this file's format.
-+
-+; Please try to keep this file in ASCII collating order.
-+
-+elf2flt
-+Driver
-+
-+elf2flt=
-+Driver JoinedOrMissing
-+
-+; This comment is to ensure we retain the blank line above.
-Index: b/libgcc/config.host
-===================================================================
---- a/libgcc/config.host
-+++ b/libgcc/config.host
-@@ -1213,6 +1213,11 @@
- 	tmake_file="$tmake_file xtensa/t-xtensa xtensa/t-linux t-slibgcc-libgcc"
- 	md_unwind_header=xtensa/linux-unwind.h
- 	;;
-+xtensa*-*-uclinux*)
-+	tmake_file="$tmake_file xtensa/t-xtensa xtensa/t-linux t-slibgcc-libgcc"
-+	md_unwind_header=xtensa/linux-unwind.h
-+	extra_parts="$extra_parts crtbeginS.o crtbeginT.o crtendS.o"
-+	;;
- am33_2.0-*-linux*)
- 	# Don't need crtbeginT.o from *-*-linux* default.
- 	extra_parts="crtbegin.o crtend.o crtbeginS.o crtendS.o"
diff --git a/package/gcc/4.9.4/875-xtensa-fix-PR-target-82181.patch b/package/gcc/4.9.4/875-xtensa-fix-PR-target-82181.patch
deleted file mode 100644
index 266e659c17..0000000000
--- a/package/gcc/4.9.4/875-xtensa-fix-PR-target-82181.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8dd3af97bb6ccb3dfd6cbe20c5a28ce80fcd0de7 Mon Sep 17 00:00:00 2001
-From: jcmvbkbc <jcmvbkbc@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Mon, 11 Sep 2017 21:53:38 +0000
-Subject: [PATCH] xtensa: fix PR target/82181
-
-2017-09-11  Max Filippov  <jcmvbkbc@gmail.com>
-gcc/
-	Backport from mainline
-	* config/xtensa/xtensa.c (xtensa_mem_offset): Check that both
-	words of DImode object are reachable by xtensa_uimm8x4 access.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- gcc/config/xtensa/xtensa.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
-index 3c0096113775..3eb4db85b971 100644
---- a/gcc/config/xtensa/xtensa.c
-+++ b/gcc/config/xtensa/xtensa.c
-@@ -612,6 +612,7 @@ xtensa_mem_offset (unsigned v, enum machine_mode mode)
-     case HImode:
-       return xtensa_uimm8x2 (v);
- 
-+    case DImode:
-     case DFmode:
-       return (xtensa_uimm8x4 (v) && xtensa_uimm8x4 (v + 4));
- 
--- 
-2.1.4
-
diff --git a/package/gcc/4.9.4/880-nios2_legitimize_address.patch b/package/gcc/4.9.4/880-nios2_legitimize_address.patch
deleted file mode 100644
index 4623f295a7..0000000000
--- a/package/gcc/4.9.4/880-nios2_legitimize_address.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From b0ea54f3f995754881e0ea6651133aa7b58eeaa2 Mon Sep 17 00:00:00 2001
-From: cltang <cltang@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Tue, 22 Sep 2015 12:23:20 +0000
-Subject: [PATCH] nios2_legitimize_address 2015-09-22  Chung-Lin Tang 
- <cltang@codesourcery.com>
-
-	Backport from mainline
-	2015-09-22  Chung-Lin Tang  <cltang@codesourcery.com>
-
-	* config/nios2/nios2.c (nios2_legitimize_address): When handling
-	'reg + reloc' cases, allow first operand to be non-REG, and use
-	force_reg() to enforce address pattern.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch at 228013 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Fixes:
-http://autobuild.buildroot.net/results/901/90186d1fe134b804c0101554296b1235dc0ccbb0
-
-[backported to 4.9.3]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/config/nios2/nios2.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/nios2/nios2.c b/gcc/config/nios2/nios2.c
-index 047b615..41dd6f9 100644
---- a/gcc/config/nios2/nios2.c
-+++ b/gcc/config/nios2/nios2.c
-@@ -1786,15 +1786,15 @@ nios2_legitimize_address (rtx x, rtx oldx ATTRIBUTE_UNUSED,
- 
-      Which will be output as '%tls_le(var+48)(r23)' in assembly.  */
-   if (GET_CODE (x) == PLUS
--      && GET_CODE (XEXP (x, 0)) == REG
-       && GET_CODE (XEXP (x, 1)) == CONST)
-     {
--      rtx unspec, offset, reg = XEXP (x, 0);
-+      rtx unspec, offset;
-       split_const (XEXP (x, 1), &unspec, &offset);
-       if (GET_CODE (unspec) == UNSPEC
- 	  && !nios2_large_offset_p (XINT (unspec, 1))
- 	  && offset != const0_rtx)
- 	{
-+	  rtx reg = force_reg (Pmode, XEXP (x, 0));
- 	  unspec = copy_rtx (unspec);
- 	  XVECEXP (unspec, 0, 0)
- 	    = plus_constant (Pmode, XVECEXP (unspec, 0, 0), INTVAL (offset));
--- 
-2.5.0
-
diff --git a/package/gcc/4.9.4/890-fix-m68k-compile.patch b/package/gcc/4.9.4/890-fix-m68k-compile.patch
deleted file mode 100644
index 140977b3cd..0000000000
--- a/package/gcc/4.9.4/890-fix-m68k-compile.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-remove unused header, which breaks the toolchain building
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gcc-4.9.3.orig/libgcc/config/m68k/linux-atomic.c gcc-4.9.3/libgcc/config/m68k/linux-atomic.c
---- gcc-4.9.3.orig/libgcc/config/m68k/linux-atomic.c	2014-01-02 23:25:22.000000000 +0100
-+++ gcc-4.9.3/libgcc/config/m68k/linux-atomic.c	2016-03-18 22:24:40.000000000 +0100
-@@ -33,7 +33,6 @@
-    using the kernel helper defined below.  There is no support for
-    64-bit operations yet.  */
- 
--#include <asm/unistd.h>
- #include <stdbool.h>
- 
- #ifndef __NR_atomic_cmpxchg_32
diff --git a/package/gcc/4.9.4/900-musl-support.patch b/package/gcc/4.9.4/900-musl-support.patch
deleted file mode 100644
index a862d01116..0000000000
--- a/package/gcc/4.9.4/900-musl-support.patch
+++ /dev/null
@@ -1,640 +0,0 @@
-Add musl support to gcc
-
-This patch comes from the musl-cross project at
-https://bitbucket.org/GregorR/musl-cross/src. Compared to the upstream version:
-
- * the config.sub modifications have been removed, because Buildroot
-   already overwrites all config.sub with a more recent config.sub
-   that has musl support.
-
- * change to ensure that a dummy dynamic linker path
-   MUSL_DYNAMIC_LINKER<foo> is defined for all architectures,
-   otherwise building gcc for architectures not supported by musl was
-   causing build failure. Bug reported upstream at
-   https://bitbucket.org/GregorR/musl-gcc-patches/issue/4/musl-gcc-patches-break-the-build-on.
-
- * change the USE_PT_GNU_EH_FRAME logic to keep the existing gcc logic
-   and only add the musl one as an addition, not as a replacement. Not
-   doing this breaks C++ exception handling with glibc, because
-   USE_PT_GNU_EH_FRAME doesn't get defined due to the configure script
-   not testing dl_iterate_phdr() on any system except Solaris.
-
-[Gustavo: remove upstream applied gcc/config/sh/sh.c chunk for 4.9.1]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
-
-Index: b/fixincludes/mkfixinc.sh
-===================================================================
---- a/fixincludes/mkfixinc.sh
-+++ b/fixincludes/mkfixinc.sh
-@@ -19,7 +19,8 @@
-     powerpc-*-eabi*    | \
-     powerpc-*-rtems*   | \
-     powerpcle-*-eabisim* | \
--    powerpcle-*-eabi* )
-+    powerpcle-*-eabi* | \
-+    *-musl* )
- 	#  IF there is no include fixing,
- 	#  THEN create a no-op fixer and exit
- 	(echo "#! /bin/sh" ; echo "exit 0" ) > ${target}
-Index: b/gcc/config.gcc
-===================================================================
---- a/gcc/config.gcc
-+++ b/gcc/config.gcc
-@@ -594,7 +594,7 @@
- esac
- 
- # Common C libraries.
--tm_defines="$tm_defines LIBC_GLIBC=1 LIBC_UCLIBC=2 LIBC_BIONIC=3"
-+tm_defines="$tm_defines LIBC_GLIBC=1 LIBC_UCLIBC=2 LIBC_BIONIC=3 LIBC_MUSL=4"
- 
- # 32-bit x86 processors supported by --with-arch=.  Each processor
- # MUST be separated by exactly one space.
-@@ -719,6 +719,9 @@
-     *-*-*uclibc*)
-       tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC"
-       ;;
-+    *-*-*musl*)
-+      tm_defines="$tm_defines DEFAULT_LIBC=LIBC_MUSL"
-+      ;;
-     *)
-       tm_defines="$tm_defines DEFAULT_LIBC=LIBC_GLIBC"
-       ;;
-@@ -2338,6 +2341,10 @@
- 	    powerpc*-*-linux*paired*)
- 		tm_file="${tm_file} rs6000/750cl.h" ;;
- 	esac
-+        case ${target} in
-+            *-linux*-musl*)
-+                enable_secureplt=yes ;;
-+        esac
- 	if test x${enable_secureplt} = xyes; then
- 		tm_file="rs6000/secureplt.h ${tm_file}"
- 	fi
-Index: b/gcc/config/aarch64/aarch64-linux.h
-===================================================================
---- a/gcc/config/aarch64/aarch64-linux.h
-+++ b/gcc/config/aarch64/aarch64-linux.h
-@@ -22,6 +22,8 @@
- #define GCC_AARCH64_LINUX_H
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}.so.1"
-+#undef MUSL_DYNAMIC_LINKER
-+#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64.so.1"
- 
- #define CPP_SPEC "%{pthread:-D_REENTRANT}"
- 
-Index: b/gcc/config/arm/linux-eabi.h
-===================================================================
---- a/gcc/config/arm/linux-eabi.h
-+++ b/gcc/config/arm/linux-eabi.h
-@@ -77,6 +77,23 @@
-     %{mfloat-abi=soft*:" GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "} \
-     %{!mfloat-abi=*:" GLIBC_DYNAMIC_LINKER_DEFAULT "}"
- 
-+/* For ARM musl currently supports four dynamic linkers:
-+   - ld-musl-arm.so.1 - for the EABI-derived soft-float ABI
-+   - ld-musl-armhf.so.1 - for the EABI-derived hard-float ABI
-+   - ld-musl-armeb.so.1 - for the EABI-derived soft-float ABI, EB
-+   - ld-musl-armebhf.so.1 - for the EABI-derived hard-float ABI, EB
-+   musl does not support the legacy OABI mode.
-+   All the dynamic linkers live in /lib.
-+   We default to soft-float, EL. */
-+#undef  MUSL_DYNAMIC_LINKER
-+#if TARGET_BIG_ENDIAN_DEFAULT
-+#define MUSL_DYNAMIC_LINKER_E "%{mlittle-endian:;:eb}"
-+#else
-+#define MUSL_DYNAMIC_LINKER_E "%{mbig-endian:eb}"
-+#endif
-+#define MUSL_DYNAMIC_LINKER \
-+  "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}.so.1"
-+
- /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
-    use the GNU/Linux version, not the generic BPABI version.  */
- #undef  LINK_SPEC
-Index: b/gcc/config/i386/linux.h
-===================================================================
---- a/gcc/config/i386/linux.h
-+++ b/gcc/config/i386/linux.h
-@@ -21,3 +21,5 @@
- 
- #define GNU_USER_LINK_EMULATION "elf_i386"
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
-+#undef MUSL_DYNAMIC_LINKER
-+#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
-Index: b/gcc/config/i386/linux64.h
-===================================================================
---- a/gcc/config/i386/linux64.h
-+++ b/gcc/config/i386/linux64.h
-@@ -30,3 +30,10 @@
- #define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
- #define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
- #define GLIBC_DYNAMIC_LINKERX32 "/libx32/ld-linux-x32.so.2"
-+
-+#undef MUSL_DYNAMIC_LINKER32
-+#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
-+#undef MUSL_DYNAMIC_LINKER64
-+#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-x86_64.so.1"
-+#undef MUSL_DYNAMIC_LINKERX32
-+#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
-Index: b/gcc/config/linux.h
-===================================================================
---- a/gcc/config/linux.h
-+++ b/gcc/config/linux.h
-@@ -32,10 +32,12 @@
- #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
- #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
- #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
-+#define OPTION_MUSL   (DEFAULT_LIBC == LIBC_MUSL)
- #else
- #define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
- #define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
- #define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
-+#define OPTION_MUSL   (linux_libc == LIBC_MUSL)
- #endif
- 
- #define GNU_USER_TARGET_OS_CPP_BUILTINS()			\
-@@ -53,18 +55,21 @@
-    uClibc or Bionic is the default C library and whether
-    -muclibc or -mglibc or -mbionic has been passed to change the default.  */
- 
--#define CHOOSE_DYNAMIC_LINKER1(LIBC1, LIBC2, LIBC3, LD1, LD2, LD3)	\
--  "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:" LD1 "}}"
-+#define CHOOSE_DYNAMIC_LINKER1(LIBC1, LIBC2, LIBC3, LIBC4, LD1, LD2, LD3, LD4)	\
-+  "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:%{" LIBC4 ":" LD4 ";:" LD1 "}}}"
- 
- #if DEFAULT_LIBC == LIBC_GLIBC
--#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
--  CHOOSE_DYNAMIC_LINKER1 ("mglibc", "muclibc", "mbionic", G, U, B)
-+#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
-+  CHOOSE_DYNAMIC_LINKER1 ("mglibc", "muclibc", "mbionic", "mmusl", G, U, B, M)
- #elif DEFAULT_LIBC == LIBC_UCLIBC
--#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
--  CHOOSE_DYNAMIC_LINKER1 ("muclibc", "mglibc", "mbionic", U, G, B)
-+#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
-+  CHOOSE_DYNAMIC_LINKER1 ("muclibc", "mglibc", "mbionic", "mmusl", U, G, B, M)
- #elif DEFAULT_LIBC == LIBC_BIONIC
--#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
--  CHOOSE_DYNAMIC_LINKER1 ("mbionic", "mglibc", "muclibc", B, G, U)
-+#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
-+  CHOOSE_DYNAMIC_LINKER1 ("mbionic", "mglibc", "muclibc", "mmusl", B, G, U, M)
-+#elif DEFAULT_LIBC == LIBC_MUSL
-+#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
-+  CHOOSE_DYNAMIC_LINKER1 ("mmusl", "mglibc", "muclibc", "mbionic", M, G, U, B)
- #else
- #error "Unsupported DEFAULT_LIBC"
- #endif /* DEFAULT_LIBC */
-@@ -82,23 +87,103 @@
- #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
- #define BIONIC_DYNAMIC_LINKERX32 "/system/bin/linkerx32"
- 
-+/* Musl dynamic linker paths must be defined on a per-architecture
-+   basis, for each architecture supported by Musl. However, in order
-+   to let other architectures continue to build with other C
-+   libraries, we provide a dummy definition of the following defines. */
-+#define MUSL_DYNAMIC_LINKER "invalid"
-+#define MUSL_DYNAMIC_LINKER32 "invalid"
-+#define MUSL_DYNAMIC_LINKER64 "invalid"
-+#define MUSL_DYNAMIC_LINKERX32 "invalid"
-+
- #define GNU_USER_DYNAMIC_LINKER						\
-   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER,	\
--			 BIONIC_DYNAMIC_LINKER)
-+			 BIONIC_DYNAMIC_LINKER, MUSL_DYNAMIC_LINKER)
- #define GNU_USER_DYNAMIC_LINKER32					\
-   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_LINKER32, \
--			 BIONIC_DYNAMIC_LINKER32)
-+			 BIONIC_DYNAMIC_LINKER32, MUSL_DYNAMIC_LINKER32)
- #define GNU_USER_DYNAMIC_LINKER64					\
-   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_LINKER64, \
--			 BIONIC_DYNAMIC_LINKER64)
-+			 BIONIC_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKER64)
- #define GNU_USER_DYNAMIC_LINKERX32					\
-   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERX32, UCLIBC_DYNAMIC_LINKERX32, \
--			 BIONIC_DYNAMIC_LINKERX32)
-+			 BIONIC_DYNAMIC_LINKERX32, MUSL_DYNAMIC_LINKER32)
- 
- /* Whether we have Bionic libc runtime */
- #undef TARGET_HAS_BIONIC
- #define TARGET_HAS_BIONIC (OPTION_BIONIC)
- 
-+/* musl avoids problematic includes by rearranging the include directories.
-+ * Unfortunately, this is mostly duplicated from cppdefault.c */
-+#if DEFAULT_LIBC == LIBC_MUSL
-+#define INCLUDE_DEFAULTS_MUSL_GPP			\
-+    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,		\
-+      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },		\
-+    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,		\
-+      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },		\
-+    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,	\
-+      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
-+
-+#ifdef LOCAL_INCLUDE_DIR
-+#define INCLUDE_DEFAULTS_MUSL_LOCAL			\
-+    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },		\
-+    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
-+#else
-+#define INCLUDE_DEFAULTS_MUSL_LOCAL
-+#endif
-+
-+#ifdef PREFIX_INCLUDE_DIR
-+#define INCLUDE_DEFAULTS_MUSL_PREFIX			\
-+    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0},
-+#else
-+#define INCLUDE_DEFAULTS_MUSL_PREFIX
-+#endif
-+
-+#ifdef CROSS_INCLUDE_DIR
-+#define INCLUDE_DEFAULTS_MUSL_CROSS			\
-+    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0},
-+#else
-+#define INCLUDE_DEFAULTS_MUSL_CROSS
-+#endif
-+
-+#ifdef TOOL_INCLUDE_DIR
-+#define INCLUDE_DEFAULTS_MUSL_TOOL			\
-+    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0},
-+#else
-+#define INCLUDE_DEFAULTS_MUSL_TOOL
-+#endif
-+
-+#ifdef NATIVE_SYSTEM_HEADER_DIR
-+#define INCLUDE_DEFAULTS_MUSL_NATIVE			\
-+    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
-+    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 0 },
-+#else
-+#define INCLUDE_DEFAULTS_MUSL_NATIVE
-+#endif
-+
-+#if defined (CROSS_DIRECTORY_STRUCTURE) && !defined (TARGET_SYSTEM_ROOT)
-+# undef INCLUDE_DEFAULTS_MUSL_LOCAL
-+# define INCLUDE_DEFAULTS_MUSL_LOCAL
-+# undef INCLUDE_DEFAULTS_MUSL_NATIVE
-+# define INCLUDE_DEFAULTS_MUSL_NATIVE
-+#else
-+# undef INCLUDE_DEFAULTS_MUSL_CROSS
-+# define INCLUDE_DEFAULTS_MUSL_CROSS
-+#endif
-+
-+#undef INCLUDE_DEFAULTS
-+#define INCLUDE_DEFAULTS				\
-+  {							\
-+    INCLUDE_DEFAULTS_MUSL_GPP				\
-+    INCLUDE_DEFAULTS_MUSL_PREFIX			\
-+    INCLUDE_DEFAULTS_MUSL_CROSS				\
-+    INCLUDE_DEFAULTS_MUSL_TOOL				\
-+    INCLUDE_DEFAULTS_MUSL_NATIVE			\
-+    { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
-+    { 0, 0, 0, 0, 0, 0 }				\
-+  }
-+#endif
-+
- #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
- /* This is a *uclinux* target.  We don't define below macros to normal linux
-    versions, because doing so would require *uclinux* targets to include
-Index: b/gcc/config/linux.opt
-===================================================================
---- a/gcc/config/linux.opt
-+++ b/gcc/config/linux.opt
-@@ -30,3 +30,7 @@
- muclibc
- Target Report RejectNegative Var(linux_libc,LIBC_UCLIBC) Negative(mbionic)
- Use uClibc C library
-+
-+mmusl
-+Target Report RejectNegative Var(linux_libc,LIBC_MUSL) Negative(mglibc)
-+Use musl C library
-Index: b/gcc/config/microblaze/linux.h
-===================================================================
---- a/gcc/config/microblaze/linux.h
-+++ b/gcc/config/microblaze/linux.h
-@@ -28,7 +28,23 @@
- #undef TLS_NEEDS_GOT
- #define TLS_NEEDS_GOT 1
- 
--#define DYNAMIC_LINKER "/lib/ld.so.1"
-+#if TARGET_BIG_ENDIAN_DEFAULT == 0 /* LE */
-+#define MUSL_DYNAMIC_LINKER_E "%{EB:;:el}"
-+#else
-+#define MUSL_DYNAMIC_LINKER_E "%{EL:el}"
-+#endif
-+
-+#undef MUSL_DYNAMIC_LINKER
-+#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-microblaze" MUSL_DYNAMIC_LINKER_E ".so.1"
-+#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
-+
-+#if DEFAULT_LIBC == LIBC_MUSL
-+#define DYNAMIC_LINKER MUSL_DYNAMIC_LINKER
-+#else
-+#define DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
-+#endif
-+
-+
- #undef  SUBTARGET_EXTRA_SPECS
- #define SUBTARGET_EXTRA_SPECS \
-   { "dynamic_linker", DYNAMIC_LINKER }
-Index: b/gcc/config/rs6000/linux64.h
-===================================================================
---- a/gcc/config/rs6000/linux64.h
-+++ b/gcc/config/rs6000/linux64.h
-@@ -371,17 +371,23 @@
- #endif
- #define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
- #define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
-+#undef MUSL_DYNAMIC_LINKER32
-+#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-powerpc.so.1"
-+#undef MUSL_DYNAMIC_LINKER64
-+#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-powerpc64.so.1"
- #if DEFAULT_LIBC == LIBC_UCLIBC
--#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
-+#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{mmusl:" M ";:" U "}}"
- #elif DEFAULT_LIBC == LIBC_GLIBC
--#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
-+#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{muclibc:" U ";:%{mmusl:" M ";:" G "}}"
-+#elif DEFAULT_LIBC == LIBC_MUSL
-+#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{muclibc:" U ";:" M "}}"
- #else
- #error "Unsupported DEFAULT_LIBC"
- #endif
- #define GNU_USER_DYNAMIC_LINKER32 \
--  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_LINKER32)
-+  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_LINKER32, MUSL_DYNAMIC_LINKER32)
- #define GNU_USER_DYNAMIC_LINKER64 \
--  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_LINKER64)
-+  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKER64)
- 
- #undef  DEFAULT_ASM_ENDIAN
- #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
-Index: b/gcc/config/rs6000/secureplt.h
-===================================================================
---- a/gcc/config/rs6000/secureplt.h
-+++ b/gcc/config/rs6000/secureplt.h
-@@ -18,3 +18,4 @@
- <http://www.gnu.org/licenses/>.  */
- 
- #define CC1_SECURE_PLT_DEFAULT_SPEC "-msecure-plt"
-+#define LINK_SECURE_PLT_DEFAULT_SPEC "--secure-plt"
-Index: b/gcc/config/rs6000/sysv4.h
-===================================================================
---- a/gcc/config/rs6000/sysv4.h
-+++ b/gcc/config/rs6000/sysv4.h
-@@ -537,6 +537,9 @@
- #ifndef CC1_SECURE_PLT_DEFAULT_SPEC
- #define CC1_SECURE_PLT_DEFAULT_SPEC ""
- #endif
-+#ifndef LINK_SECURE_PLT_DEFAULT_SPEC
-+#define LINK_SECURE_PLT_DEFAULT_SPEC ""
-+#endif
- 
- /* Pass -G xxx to the compiler.  */
- #define	CC1_SPEC "%{G*} %(cc1_cpu)" \
-@@ -585,7 +588,8 @@
- 
- /* Override the default target of the linker.  */
- #define	LINK_TARGET_SPEC \
--  ENDIAN_SELECT("", " --oformat elf32-powerpcle", "")
-+  ENDIAN_SELECT("", " --oformat elf32-powerpcle", "") \
-+  "%{!mbss-plt: %{!msecure-plt: %(link_secure_plt_default)}}"
- 
- /* Any specific OS flags.  */
- #define LINK_OS_SPEC "\
-@@ -763,15 +767,18 @@
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
- #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
-+#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-powerpc.so.1"
- #if DEFAULT_LIBC == LIBC_UCLIBC
--#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
-+#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{mmusl:" M ";:" U "}}"
-+#elif DEFAULT_LIBC == LIBC_MUSL
-+#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{muclibc:" U ";:" M "}}"
- #elif !defined (DEFAULT_LIBC) || DEFAULT_LIBC == LIBC_GLIBC
--#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
-+#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{muclibc:" U ";:%{mmusl:" M ";:" G "}}"
- #else
- #error "Unsupported DEFAULT_LIBC"
- #endif
- #define GNU_USER_DYNAMIC_LINKER \
--  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER)
-+  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER, MUSL_DYNAMIC_LINKER)
- 
- #define LINK_OS_LINUX_SPEC "-m elf32ppclinux %{!shared: %{!static: \
-   %{rdynamic:-export-dynamic} \
-@@ -894,6 +901,7 @@
-   { "link_os_openbsd",		LINK_OS_OPENBSD_SPEC },			\
-   { "link_os_default",		LINK_OS_DEFAULT_SPEC },			\
-   { "cc1_secure_plt_default",	CC1_SECURE_PLT_DEFAULT_SPEC },		\
-+  { "link_secure_plt_default",	LINK_SECURE_PLT_DEFAULT_SPEC },		\
-   { "cpp_os_ads",		CPP_OS_ADS_SPEC },			\
-   { "cpp_os_yellowknife",	CPP_OS_YELLOWKNIFE_SPEC },		\
-   { "cpp_os_mvme",		CPP_OS_MVME_SPEC },			\
-Index: b/gcc/config/sh/linux.h
-===================================================================
---- a/gcc/config/sh/linux.h
-+++ b/gcc/config/sh/linux.h
-@@ -43,7 +43,15 @@
- 
- #define TARGET_ASM_FILE_END file_end_indicate_exec_stack
- 
-+#if TARGET_BIG_ENDIAN_DEFAULT /* BE */
-+#define MUSL_DYNAMIC_LINKER_E "eb"
-+#else
-+#define MUSL_DYNAMIC_LINKER_E
-+#endif
-+
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
-+#undef MUSL_DYNAMIC_LINKER
-+#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E ".so.1"
- 
- #undef SUBTARGET_LINK_EMUL_SUFFIX
- #define SUBTARGET_LINK_EMUL_SUFFIX "_linux"
-Index: b/gcc/configure
-===================================================================
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -27601,6 +27601,9 @@
-       gcc_cv_target_dl_iterate_phdr=no
-     fi
-     ;;
-+  *-linux-musl*)
-+    gcc_cv_target_dl_iterate_phdr=yes
-+    ;;
- esac
- 
- if test x$gcc_cv_target_dl_iterate_phdr = xyes; then
-Index: b/gcc/configure.ac
-===================================================================
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -5173,6 +5173,9 @@
-       gcc_cv_target_dl_iterate_phdr=no
-     fi
-     ;;
-+  *-linux-musl*)
-+    gcc_cv_target_dl_iterate_phdr=yes
-+    ;;
- esac
- GCC_TARGET_TEMPLATE([TARGET_DL_ITERATE_PHDR])
- if test x$gcc_cv_target_dl_iterate_phdr = xyes; then
-Index: b/gcc/ginclude/stddef.h
-===================================================================
---- a/gcc/ginclude/stddef.h
-+++ b/gcc/ginclude/stddef.h
-@@ -181,6 +181,7 @@
- #ifndef _GCC_SIZE_T
- #ifndef _SIZET_
- #ifndef __size_t
-+#ifndef __DEFINED_size_t /* musl */
- #define __size_t__	/* BeOS */
- #define __SIZE_T__	/* Cray Unicos/Mk */
- #define _SIZE_T
-@@ -197,6 +198,7 @@
- #define ___int_size_t_h
- #define _GCC_SIZE_T
- #define _SIZET_
-+#define __DEFINED_size_t /* musl */
- #if (defined (__FreeBSD__) && (__FreeBSD__ >= 5)) \
-   || defined(__FreeBSD_kernel__)
- /* __size_t is a typedef on FreeBSD 5, must not trash it. */
-@@ -214,6 +216,7 @@
- typedef long ssize_t;
- #endif /* __BEOS__ */
- #endif /* !(defined (__GNUG__) && defined (size_t)) */
-+#endif /* __DEFINED_size_t */
- #endif /* __size_t */
- #endif /* _SIZET_ */
- #endif /* _GCC_SIZE_T */
-Index: b/libgcc/unwind-dw2-fde-dip.c
-===================================================================
---- a/libgcc/unwind-dw2-fde-dip.c
-+++ b/libgcc/unwind-dw2-fde-dip.c
-@@ -73,6 +73,13 @@
-     && defined(TARGET_DL_ITERATE_PHDR) \
-     && defined(__sun__) && defined(__svr4__)
- # define USE_PT_GNU_EH_FRAME
-+ #endif
-+
-+/* For musl libc, TARGET_DL_ITERATE_PHDR gets defined by the configure
-+   script. */
-+#if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR)	\
-+  && defined(TARGET_DL_ITERATE_PHDR)
-+# define USE_PT_GNU_EH_FRAME
- #endif
- 
- #if defined(USE_PT_GNU_EH_FRAME)
-Index: b/libgomp/config/posix/time.c
-===================================================================
---- a/libgomp/config/posix/time.c
-+++ b/libgomp/config/posix/time.c
-@@ -28,6 +28,8 @@
-    The following implementation uses the most simple POSIX routines.
-    If present, POSIX 4 clocks should be used instead.  */
- 
-+#define _POSIX_C_SOURCE 199309L /* for clocks */
-+
- #include "libgomp.h"
- #include <unistd.h>
- #if TIME_WITH_SYS_TIME
-Index: b/libitm/config/arm/hwcap.cc
-===================================================================
---- a/libitm/config/arm/hwcap.cc
-+++ b/libitm/config/arm/hwcap.cc
-@@ -40,7 +40,11 @@
- 
- #ifdef __linux__
- #include <unistd.h>
-+#ifdef __GLIBC__
- #include <sys/fcntl.h>
-+#else
-+#include <fcntl.h>
-+#endif
- #include <elf.h>
- 
- static void __attribute__((constructor))
-Index: b/libitm/config/linux/x86/tls.h
-===================================================================
---- a/libitm/config/linux/x86/tls.h
-+++ b/libitm/config/linux/x86/tls.h
-@@ -25,16 +25,19 @@
- #ifndef LIBITM_X86_TLS_H
- #define LIBITM_X86_TLS_H 1
- 
--#if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 10)
-+#if defined(__GLIBC_PREREQ)
-+#if __GLIBC_PREREQ(2, 10)
- /* Use slots in the TCB head rather than __thread lookups.
-    GLIBC has reserved words 10 through 13 for TM.  */
- #define HAVE_ARCH_GTM_THREAD 1
- #define HAVE_ARCH_GTM_THREAD_DISP 1
- #endif
-+#endif
- 
- #include "config/generic/tls.h"
- 
--#if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 10)
-+#if defined(__GLIBC_PREREQ)
-+#if __GLIBC_PREREQ(2, 10)
- namespace GTM HIDDEN {
- 
- #ifdef __x86_64__
-@@ -101,5 +104,6 @@
- 
- } // namespace GTM
- #endif /* >= GLIBC 2.10 */
-+#endif
- 
- #endif // LIBITM_X86_TLS_H
-Index: b/libstdc++-v3/configure.host
-===================================================================
---- a/libstdc++-v3/configure.host
-+++ b/libstdc++-v3/configure.host
-@@ -266,6 +266,13 @@
-     os_include_dir="os/bsd/freebsd"
-     ;;
-   gnu* | linux* | kfreebsd*-gnu | knetbsd*-gnu)
-+    # check for musl by target
-+    case "${host_os}" in
-+      *-musl*)
-+        os_include_dir="os/generic"
-+        ;;
-+      *)
-+
-     if [ "$uclibc" = "yes" ]; then
-       os_include_dir="os/uclibc"
-     elif [ "$bionic" = "yes" ]; then
-@@ -274,6 +281,9 @@
-       os_include_dir="os/gnu-linux"
-     fi
-     ;;
-+
-+    esac
-+    ;;
-   hpux*)
-     os_include_dir="os/hpux"
-     ;;
-Index: b/gcc/config/mips/linux64.h
-===================================================================
---- a/gcc/config/mips/linux64.h
-+++ b/gcc/config/mips/linux64.h
-@@ -41,4 +41,4 @@
- #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
- #define GNU_USER_DYNAMIC_LINKERN32 \
-   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, UCLIBC_DYNAMIC_LINKERN32, \
--			 BIONIC_DYNAMIC_LINKERN32)
-+			 BIONIC_DYNAMIC_LINKERN32, MUSL_DYNAMIC_LINKER)
-Index: b/gcc/config/mips/linux.h
-===================================================================
---- a/gcc/config/mips/linux.h
-+++ b/gcc/config/mips/linux.h
-@@ -23,3 +23,11 @@
- #undef UCLIBC_DYNAMIC_LINKER
- #define UCLIBC_DYNAMIC_LINKER \
-   "%{mnan=2008:/lib/ld-uClibc-mipsn8.so.0;:/lib/ld-uClibc.so.0}"
-+
-+#if TARGET_ENDIAN_DEFAULT == 0 /* LE */
-+#define MUSL_DYNAMIC_LINKER_E "%{EB:;:el}"
-+#else
-+#define MUSL_DYNAMIC_LINKER_E "%{EL:el}"
-+#endif
-+#undef MUSL_DYNAMIC_LINKER
-+#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-mips" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
diff --git a/package/gcc/4.9.4/901-microblaze-uclibc.patch b/package/gcc/4.9.4/901-microblaze-uclibc.patch
deleted file mode 100644
index 82c44e149f..0000000000
--- a/package/gcc/4.9.4/901-microblaze-uclibc.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Add dynamic linker support for uClibc
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
-
-diff -Nur gcc-4.9.3.orig/gcc/config/microblaze/linux.h gcc-4.9.3/gcc/config/microblaze/linux.h
---- gcc-4.9.3.orig/gcc/config/microblaze/linux.h	2016-06-04 21:21:09.430646655 +0200
-+++ gcc-4.9.3/gcc/config/microblaze/linux.h	2016-06-04 21:21:44.596003509 +0200
-@@ -36,10 +36,13 @@
- 
- #undef MUSL_DYNAMIC_LINKER
- #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-microblaze" MUSL_DYNAMIC_LINKER_E ".so.1"
-+#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
- #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
- 
- #if DEFAULT_LIBC == LIBC_MUSL
- #define DYNAMIC_LINKER MUSL_DYNAMIC_LINKER
-+#elif DEFAULT_LIBC == LIBC_UCLIBC
-+#define DYNAMIC_LINKER UCLIBC_DYNAMIC_LINKER
- #else
- #define DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
- #endif
diff --git a/package/gcc/4.9.4/930-libgcc-disable-split-stack-nothreads.patch b/package/gcc/4.9.4/930-libgcc-disable-split-stack-nothreads.patch
deleted file mode 100644
index 670cf8dae1..0000000000
--- a/package/gcc/4.9.4/930-libgcc-disable-split-stack-nothreads.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-disable split-stack for non-thread builds
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gcc-4.9.3.orig/libgcc/config/t-stack gcc-4.9.3/libgcc/config/t-stack
---- gcc-4.9.3.orig/libgcc/config/t-stack	2010-10-01 21:31:49.000000000 +0200
-+++ gcc-4.9.3/libgcc/config/t-stack	2016-03-07 01:34:32.000000000 +0100
-@@ -1,4 +1,6 @@
- # Makefile fragment to provide generic support for -fsplit-stack.
- # This should be used in config.host for any host which supports
- # -fsplit-stack.
-+ifeq ($(enable_threads),yes)
- LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
-+endif
diff --git a/package/gcc/4.9.4/940-uclinux-enable-threads.patch b/package/gcc/4.9.4/940-uclinux-enable-threads.patch
deleted file mode 100644
index 5108147627..0000000000
--- a/package/gcc/4.9.4/940-uclinux-enable-threads.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Enable POSIX threads for uClinux targets
-Reported upstream:
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71721
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-Index: b/gcc/config.gcc
-===================================================================
---- a/gcc/config.gcc
-+++ b/gcc/config.gcc
-@@ -810,6 +810,9 @@
- *-*-uclinux*)
-   extra_options="$extra_options gnu-user.opt"
-   use_gcc_stdint=wrap
-+  case ${enable_threads} in
-+    "" | yes | posix) thread_file='posix' ;;
-+  esac
-   tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC SINGLE_LIBC"
-   ;;
- *-*-rdos*)
diff --git a/package/gcc/4.9.4/942-asan-fix-missing-include-signal-h.patch b/package/gcc/4.9.4/942-asan-fix-missing-include-signal-h.patch
deleted file mode 100644
index 5f00c04d2b..0000000000
--- a/package/gcc/4.9.4/942-asan-fix-missing-include-signal-h.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 205aa8e97bab553e5e6fe45896325e97962de704 Mon Sep 17 00:00:00 2001
-From: Rolf Eike Beer <eb@emlix.com>
-Date: Wed, 8 Feb 2017 11:42:52 +0100
-Subject: [PATCH] asan: fix missing include of signal.h
-
-This breaks when building gcc 4.9.4 / 5.4.0 with
-target_platform=powerpc-unknown-linux-gnu with glibc 2.25:
-
-../../../../gcc-host/libsanitizer/asan/asan_linux.cc: In function 'bool __asan::AsanInterceptsSignal(int)':
-../../../../gcc-host/libsanitizer/asan/asan_linux.cc:222:20: error: 'SIGSEGV' was not declared in this scope
-   return signum == SIGSEGV && common_flags()->handle_segv;
-
-This has been verified to apply to at least 4.9.4 and up to 5.4,
-the code has been reworked for gcc 6.
-
-Resolves (Buildroot) Bug: https://bugs.busybox.net/show_bug.cgi?id=10061
-
-Upstream: https://patchwork.ozlabs.org/patch/725596/
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- libsanitizer/asan/asan_linux.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libsanitizer/asan/asan_linux.cc b/libsanitizer/asan/asan_linux.cc
-index c504168..59087b9 100644
---- a/libsanitizer/asan/asan_linux.cc
-+++ b/libsanitizer/asan/asan_linux.cc
-@@ -29,6 +29,7 @@
- #include <dlfcn.h>
- #include <fcntl.h>
- #include <pthread.h>
-+#include <signal.h>
- #include <stdio.h>
- #include <unistd.h>
- #include <unwind.h>
diff --git a/package/gcc/4.9.4/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch b/package/gcc/4.9.4/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
deleted file mode 100644
index 526346c6f8..0000000000
--- a/package/gcc/4.9.4/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
+++ /dev/null
@@ -1,190 +0,0 @@
-From b7e85069238c40eae54d0ca03ab6d5470d1815f9 Mon Sep 17 00:00:00 2001
-From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Tue, 4 Jul 2017 10:25:10 +0000
-Subject: [PATCH] Use ucontext_t not struct ucontext in linux-unwind.h files.
-
-Current glibc no longer gives the ucontext_t type the tag struct
-ucontext, to conform with POSIX namespace rules.  This requires
-various linux-unwind.h files in libgcc, that were previously using
-struct ucontext, to be fixed to use ucontext_t instead.  This is
-similar to the removal of the struct siginfo tag from siginfo_t some
-years ago.
-
-This patch changes those files to use ucontext_t instead.  As the
-standard name that should be unconditionally safe, so this is not
-restricted to architectures supported by glibc, or conditioned on the
-glibc version.
-
-Tested compilation together with current glibc with glibc's
-build-many-glibcs.py.
-
-	* config/aarch64/linux-unwind.h (aarch64_fallback_frame_state),
-	config/alpha/linux-unwind.h (alpha_fallback_frame_state),
-	config/bfin/linux-unwind.h (bfin_fallback_frame_state),
-	config/i386/linux-unwind.h (x86_64_fallback_frame_state,
-	x86_fallback_frame_state), config/m68k/linux-unwind.h (struct
-	uw_ucontext), config/nios2/linux-unwind.h (struct nios2_ucontext),
-	config/pa/linux-unwind.h (pa32_fallback_frame_state),
-	config/sh/linux-unwind.h (sh_fallback_frame_state),
-	config/tilepro/linux-unwind.h (tile_fallback_frame_state),
-	config/xtensa/linux-unwind.h (xtensa_fallback_frame_state): Use
-	ucontext_t instead of struct ucontext.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch at 249958 138bc75d-0d04-0410-961f-82ee72b054a4
-[Romain backport from gcc-5-branch]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- libgcc/config/aarch64/linux-unwind.h | 2 +-
- libgcc/config/alpha/linux-unwind.h   | 2 +-
- libgcc/config/bfin/linux-unwind.h    | 2 +-
- libgcc/config/i386/linux-unwind.h    | 4 ++--
- libgcc/config/m68k/linux-unwind.h    | 2 +-
- libgcc/config/nios2/linux-unwind.h   | 2 +-
- libgcc/config/pa/linux-unwind.h      | 2 +-
- libgcc/config/sh/linux-unwind.h      | 2 +-
- libgcc/config/tilepro/linux-unwind.h | 2 +-
- libgcc/config/xtensa/linux-unwind.h  | 2 +-
- 10 files changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/libgcc/config/aarch64/linux-unwind.h b/libgcc/config/aarch64/linux-unwind.h
-index 6b5b3cd..d13dc34 100644
---- a/libgcc/config/aarch64/linux-unwind.h
-+++ b/libgcc/config/aarch64/linux-unwind.h
-@@ -52,7 +52,7 @@ aarch64_fallback_frame_state (struct _Unwind_Context *context,
-   struct rt_sigframe
-   {
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-   };
- 
-   struct rt_sigframe *rt_;
-diff --git a/libgcc/config/alpha/linux-unwind.h b/libgcc/config/alpha/linux-unwind.h
-index b5bfd1c..166d3d2 100644
---- a/libgcc/config/alpha/linux-unwind.h
-+++ b/libgcc/config/alpha/linux-unwind.h
-@@ -51,7 +51,7 @@ alpha_fallback_frame_state (struct _Unwind_Context *context,
-     {
-       struct rt_sigframe {
- 	siginfo_t info;
--	struct ucontext uc;
-+	ucontext_t uc;
-       } *rt_ = context->cfa;
-       sc = &rt_->uc.uc_mcontext;
-     }
-diff --git a/libgcc/config/bfin/linux-unwind.h b/libgcc/config/bfin/linux-unwind.h
-index dc58f0a..8b94568 100644
---- a/libgcc/config/bfin/linux-unwind.h
-+++ b/libgcc/config/bfin/linux-unwind.h
-@@ -52,7 +52,7 @@ bfin_fallback_frame_state (struct _Unwind_Context *context,
- 	void *puc;
- 	char retcode[8];
- 	siginfo_t info;
--	struct ucontext uc;
-+	ucontext_t uc;
-       } *rt_ = context->cfa;
- 
-       /* The void * cast is necessary to avoid an aliasing warning.
-diff --git a/libgcc/config/i386/linux-unwind.h b/libgcc/config/i386/linux-unwind.h
-index 7986928..a9d621c 100644
---- a/libgcc/config/i386/linux-unwind.h
-+++ b/libgcc/config/i386/linux-unwind.h
-@@ -58,7 +58,7 @@ x86_64_fallback_frame_state (struct _Unwind_Context *context,
-   if (*(unsigned char *)(pc+0) == 0x48
-       && *(unsigned long long *)(pc+1) == RT_SIGRETURN_SYSCALL)
-     {
--      struct ucontext *uc_ = context->cfa;
-+      ucontext_t *uc_ = context->cfa;
-       /* The void * cast is necessary to avoid an aliasing warning.
-          The aliasing warning is correct, but should not be a problem
-          because it does not alias anything.  */
-@@ -138,7 +138,7 @@ x86_fallback_frame_state (struct _Unwind_Context *context,
- 	siginfo_t *pinfo;
- 	void *puc;
- 	siginfo_t info;
--	struct ucontext uc;
-+	ucontext_t uc;
-       } *rt_ = context->cfa;
-       /* The void * cast is necessary to avoid an aliasing warning.
-          The aliasing warning is correct, but should not be a problem
-diff --git a/libgcc/config/m68k/linux-unwind.h b/libgcc/config/m68k/linux-unwind.h
-index 1ba2a0c4..d67767e 100644
---- a/libgcc/config/m68k/linux-unwind.h
-+++ b/libgcc/config/m68k/linux-unwind.h
-@@ -33,7 +33,7 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- /* <sys/ucontext.h> is unfortunately broken right now.  */
- struct uw_ucontext {
- 	unsigned long	  uc_flags;
--	struct ucontext  *uc_link;
-+	ucontext_t	 *uc_link;
- 	stack_t		  uc_stack;
- 	mcontext_t	  uc_mcontext;
- 	unsigned long	  uc_filler[80];
-diff --git a/libgcc/config/nios2/linux-unwind.h b/libgcc/config/nios2/linux-unwind.h
-index ba4bd80..8978868 100644
---- a/libgcc/config/nios2/linux-unwind.h
-+++ b/libgcc/config/nios2/linux-unwind.h
-@@ -38,7 +38,7 @@ struct nios2_mcontext {
- 
- struct nios2_ucontext {
-   unsigned long uc_flags;
--  struct ucontext *uc_link;
-+  ucontext_t *uc_link;
-   stack_t uc_stack;
-   struct nios2_mcontext uc_mcontext;
-   sigset_t uc_sigmask;	/* mask last for extensibility */
-diff --git a/libgcc/config/pa/linux-unwind.h b/libgcc/config/pa/linux-unwind.h
-index 4a3cfff..d2ac437 100644
---- a/libgcc/config/pa/linux-unwind.h
-+++ b/libgcc/config/pa/linux-unwind.h
-@@ -80,7 +80,7 @@ pa32_fallback_frame_state (struct _Unwind_Context *context,
-   struct sigcontext *sc;
-   struct rt_sigframe {
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-   } *frame;
- 
-   /* rt_sigreturn trampoline:
-diff --git a/libgcc/config/sh/linux-unwind.h b/libgcc/config/sh/linux-unwind.h
-index 4875706..671bde7 100644
---- a/libgcc/config/sh/linux-unwind.h
-+++ b/libgcc/config/sh/linux-unwind.h
-@@ -180,7 +180,7 @@ sh_fallback_frame_state (struct _Unwind_Context *context,
-     {
-       struct rt_sigframe {
- 	siginfo_t info;
--	struct ucontext uc;
-+	ucontext_t uc;
-       } *rt_ = context->cfa;
-       /* The void * cast is necessary to avoid an aliasing warning.
-          The aliasing warning is correct, but should not be a problem
-diff --git a/libgcc/config/tilepro/linux-unwind.h b/libgcc/config/tilepro/linux-unwind.h
-index 27481cf..c24d58c 100644
---- a/libgcc/config/tilepro/linux-unwind.h
-+++ b/libgcc/config/tilepro/linux-unwind.h
-@@ -61,7 +61,7 @@ tile_fallback_frame_state (struct _Unwind_Context *context,
-   struct rt_sigframe {
-     unsigned char save_area[C_ABI_SAVE_AREA_SIZE];
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-   } *rt_;
- 
-   /* Return if this is not a signal handler.  */
-diff --git a/libgcc/config/xtensa/linux-unwind.h b/libgcc/config/xtensa/linux-unwind.h
-index 6832d0b..cb15b4c 100644
---- a/libgcc/config/xtensa/linux-unwind.h
-+++ b/libgcc/config/xtensa/linux-unwind.h
-@@ -63,7 +63,7 @@ xtensa_fallback_frame_state (struct _Unwind_Context *context,
- 
-   struct rt_sigframe {
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-   } *rt_;
- 
-   /* movi a2, __NR_rt_sigreturn; syscall */
--- 
-2.9.5
-
diff --git a/package/gcc/4.9.4/944-sanitizer-linux.patch b/package/gcc/4.9.4/944-sanitizer-linux.patch
deleted file mode 100644
index caadf2de7b..0000000000
--- a/package/gcc/4.9.4/944-sanitizer-linux.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From f9a35ba5c150da2e381c4cab01f8f12bcd6af5d2 Mon Sep 17 00:00:00 2001
-From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Mon, 17 Jul 2017 19:41:08 +0000
-Subject: [PATCH] 	Backported from mainline 	2017-07-14  Jakub
- Jelinek  <jakub@redhat.com>
-
-	PR sanitizer/81066
-	* sanitizer_common/sanitizer_linux.h: Cherry-pick upstream r307969.
-	* sanitizer_common/sanitizer_linux.cc: Likewise.
-	* sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc: Likewise.
-	* tsan/tsan_platform_linux.cc: Likewise.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch at 250287 138bc75d-0d04-0410-961f-82ee72b054a4
-(cherry picked from commit 72edc2c02f8b4768ad660f46a1c7e2400c0a8e06)
-[Romain backport to 4.9.4]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- libsanitizer/sanitizer_common/sanitizer_linux.cc                      | 3 +--
- libsanitizer/sanitizer_common/sanitizer_linux.h                       | 4 +---
- libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc | 2 +-
- libsanitizer/tsan/tsan_platform_linux.cc                              | 2 +-
- 4 files changed, 4 insertions(+), 7 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_linux.cc b/libsanitizer/sanitizer_common/sanitizer_linux.cc
-index 69c9c10..8e53673 100644
---- a/libsanitizer/sanitizer_common/sanitizer_linux.cc
-+++ b/libsanitizer/sanitizer_common/sanitizer_linux.cc
-@@ -599,8 +599,7 @@ uptr internal_prctl(int option, uptr arg2, uptr arg3, uptr arg4, uptr arg5) {
-   return internal_syscall(__NR_prctl, option, arg2, arg3, arg4, arg5);
- }
- 
--uptr internal_sigaltstack(const struct sigaltstack *ss,
--                         struct sigaltstack *oss) {
-+uptr internal_sigaltstack(const void *ss, void *oss) {
-   return internal_syscall(__NR_sigaltstack, (uptr)ss, (uptr)oss);
- }
- 
-diff --git a/libsanitizer/sanitizer_common/sanitizer_linux.h b/libsanitizer/sanitizer_common/sanitizer_linux.h
-index 6422df1..8e111d1 100644
---- a/libsanitizer/sanitizer_common/sanitizer_linux.h
-+++ b/libsanitizer/sanitizer_common/sanitizer_linux.h
-@@ -18,7 +18,6 @@
- #include "sanitizer_platform_limits_posix.h"
- 
- struct link_map;  // Opaque type returned by dlopen().
--struct sigaltstack;
- 
- namespace __sanitizer {
- // Dirent structure for getdents(). Note that this structure is different from
-@@ -28,8 +27,7 @@ struct linux_dirent;
- // Syscall wrappers.
- uptr internal_getdents(fd_t fd, struct linux_dirent *dirp, unsigned int count);
- uptr internal_prctl(int option, uptr arg2, uptr arg3, uptr arg4, uptr arg5);
--uptr internal_sigaltstack(const struct sigaltstack* ss,
--                          struct sigaltstack* oss);
-+uptr internal_sigaltstack(const void* ss, void* oss);
- uptr internal_sigaction(int signum, const __sanitizer_kernel_sigaction_t *act,
-     __sanitizer_kernel_sigaction_t *oldact);
- uptr internal_sigprocmask(int how, __sanitizer_kernel_sigset_t *set,
-diff --git a/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc b/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
-index 6ee63ec..50c21a3 100644
---- a/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
-+++ b/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
-@@ -238,7 +238,7 @@ static int TracerThread(void* argument) {
- 
-   // Alternate stack for signal handling.
-   InternalScopedBuffer<char> handler_stack_memory(kHandlerStackSize);
--  struct sigaltstack handler_stack;
-+  stack_t handler_stack;
-   internal_memset(&handler_stack, 0, sizeof(handler_stack));
-   handler_stack.ss_sp = handler_stack_memory.data();
-   handler_stack.ss_size = kHandlerStackSize;
-diff --git a/libsanitizer/tsan/tsan_platform_linux.cc b/libsanitizer/tsan/tsan_platform_linux.cc
-index fe69430..49f5270 100644
---- a/libsanitizer/tsan/tsan_platform_linux.cc
-+++ b/libsanitizer/tsan/tsan_platform_linux.cc
-@@ -351,7 +351,7 @@ bool IsGlobalVar(uptr addr) {
- // closes within glibc. The code is a pure hack.
- int ExtractResolvFDs(void *state, int *fds, int nfd) {
-   int cnt = 0;
--  __res_state *statp = (__res_state*)state;
-+  struct __res_state *statp = (struct __res_state*)state;
-   for (int i = 0; i < MAXNS && cnt < nfd; i++) {
-     if (statp->_u._ext.nsaddrs[i] && statp->_u._ext.nssocks[i] != -1)
-       fds[cnt++] = statp->_u._ext.nssocks[i];
--- 
-2.9.5
-
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 15ce7b81b5..d770d9b4b9 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -27,20 +27,6 @@ config BR2_GCC_VERSION_OR1K
 	depends on BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
-config BR2_GCC_VERSION_4_9_X
-	bool "gcc 4.9.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
-	# Broken or unsupported architectures
-	depends on !BR2_arc
-	depends on !BR2_or1k
-	# musl on microblaze, ppc64 and mips64 unsupported
-	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_microblazeel || BR2_microblazebe))
-	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
-	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
-	# glibc >= 2.29 needs gcc >= 5 on all architectures.
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-
 config BR2_GCC_VERSION_5_X
 	bool "gcc 5.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
@@ -91,15 +77,13 @@ config BR2_GCC_VERSION_9_X
 
 endchoice
 
-# libcilkrts was introduced in gcc 4.9 (oldest gcc version we
-# support), and removed in gcc 8.x
+# libcilkrts was introduced in gcc 4.9 and removed in gcc 8.x
 config BR2_GCC_SUPPORTS_LIBCILKRTS
 	bool
 	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_GCC_VERSION
 	string
-	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.5.0"     if BR2_GCC_VERSION_5_X
 	default "6.5.0"     if BR2_GCC_VERSION_6_X
 	default "7.4.0"     if BR2_GCC_VERSION_7_X
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 91562aef1e..9266d3a398 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -1,5 +1,3 @@
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.4/sha512.sum
-sha512  93abb78e16277454f41a8e9810f41f66c0fdffdc539a762ff6b67d3037f78db971378683fd2ebf707d1d51c059fad2161fe42d110c330027f40214b7db0f3efe  gcc-4.9.4.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.5.0/sha512.sum
 sha512  670ff52c2ae12c7852c12987e91798c5aa8bd6daf21f0d6e0cd57a4aa59cc4f06a837fe76426eaa1424cfddca937bed377680700eadc04d76b9180d462364fa1  gcc-5.5.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.5.0/sha512.sum
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 20ef544ef5..86e1d4df51 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -21,14 +21,8 @@ GCC_SITE = $(call github,c-sky,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
-# From version 5.5.0, 6.4.0, 7.2.0 and 8.1.0 a bz2 release tarball is not
-# provided anymore. Use the xz tarball instead.
-ifeq ($(BR2_GCC_VERSION_4_9_X),y)
-GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
-else
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.xz
 endif
-endif
 
 #
 # Xtensa special hook
-- 
2.20.1
