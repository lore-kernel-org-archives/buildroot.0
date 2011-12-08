From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Dec 2011 23:39:57 +0100
Subject: [Buildroot] [git commit] gcc: remove old 4.2.4 version
Message-ID: <20111208224037.24B718F702@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7cfa3acbbe699998df03dbced331477b2a3d2110
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We unfortunately cannot remove the avr32 variant yet.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/4.2.4/100-uclibc-conf.patch          |  200 --------------------
 toolchain/gcc/4.2.4/1000-aapcs-linux.patch         |   17 --
 .../gcc/4.2.4/1001-gcc-4.2.x-inhibit-libc.patch    |   66 -------
 .../gcc/4.2.4/103-uclibc-conf-noupstream.patch     |   11 -
 toolchain/gcc/4.2.4/104-gnuhurd-uclibc-conf.patch  |   13 --
 toolchain/gcc/4.2.4/300-libstdc++-pic.patch        |   50 -----
 toolchain/gcc/4.2.4/301-missing-execinfo_h.patch   |   11 -
 toolchain/gcc/4.2.4/302-c99-snprintf.patch         |   11 -
 .../gcc/4.2.4/303-c99-complex-ugly-hack.patch      |   12 --
 toolchain/gcc/4.2.4/304-index_macro.patch          |   24 ---
 .../gcc/4.2.4/305-libmudflap-susv3-legacy.patch    |   49 -----
 toolchain/gcc/4.2.4/307-locale_facets.patch        |   26 ---
 .../gcc/4.2.4/402-libbackend_dep_gcov-iov.h.patch  |   13 --
 toolchain/gcc/4.2.4/800-arm-bigendian.patch        |   67 -------
 .../gcc/4.2.4/904-flatten-switch-stmt-00.patch     |  153 ---------------
 toolchain/gcc/4.2.4/910-soft-float.patch           |   26 ---
 toolchain/gcc/4.2.4/920-soft-float.patch           |   21 --
 toolchain/gcc/Config.in                            |    7 +-
 18 files changed, 1 insertions(+), 776 deletions(-)

diff --git a/toolchain/gcc/4.2.4/100-uclibc-conf.patch b/toolchain/gcc/4.2.4/100-uclibc-conf.patch
deleted file mode 100644
index 4243ff7..0000000
--- a/toolchain/gcc/4.2.4/100-uclibc-conf.patch
+++ /dev/null
@@ -1,200 +0,0 @@
---- gcc/libgomp/configure
-+++ gcc/libgomp/configure
-@@ -3771,7 +3771,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- gcc/gcc/config/cris/linux.h
-+++ gcc/gcc/config/cris/linux.h
-@@ -74,7 +74,11 @@
- #define CRIS_DEFAULT_CPU_VERSION CRIS_CPU_NG
- 
- #undef CRIS_SUBTARGET_VERSION
--#define CRIS_SUBTARGET_VERSION " - cris-axis-linux-gnu"
-+#if UCLIBC_DEFAULT
-+# define CRIS_SUBTARGET_VERSION " - cris-axis-linux-uclibc"
-+#else
-+# define CRIS_SUBTARGET_VERSION " - cris-axis-linux-gnu"
-+#endif
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
- 
---- gcc/libstdc++-v3/configure
-+++ gcc/libstdc++-v3/configure
-@@ -4276,7 +4276,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- gcc/zlib/configure
-+++ gcc/zlib/configure
-@@ -3422,7 +3422,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- gcc/libobjc/configure
-+++ gcc/libobjc/configure
-@@ -3309,7 +3309,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- gcc/libgfortran/configure
-+++ gcc/libgfortran/configure
-@@ -3695,7 +3695,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- gcc/libmudflap/configure
-+++ gcc/libmudflap/configure
-@@ -5378,7 +5378,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- gcc/boehm-gc/configure
-+++ gcc/boehm-gc/configure
-@@ -4316,7 +4316,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- gcc/libffi/configure
-+++ gcc/libffi/configure
-@@ -3453,7 +3453,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- gcc/libssp/configure
-+++ gcc/libssp/configure
-@@ -4409,7 +4409,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- gcc/contrib/regression/objs-gcc.sh
-+++ gcc/contrib/regression/objs-gcc.sh
-@@ -105,6 +105,10 @@
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
---- gcc/libjava/classpath/ltconfig
-+++ gcc/libjava/classpath/ltconfig
-@@ -603,7 +603,7 @@
- 
- # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
- case $host_os in
--linux-gnu*) ;;
-+linux-gnu*|linux-uclibc*) ;;
- linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
- esac
- 
-@@ -1251,7 +1251,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   version_type=linux
-   need_lib_prefix=no
-   need_version=no
---- gcc/libjava/classpath/configure
-+++ gcc/libjava/classpath/configure
-@@ -4665,7 +4665,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- gcc/libjava/configure
-+++ gcc/libjava/configure
-@@ -5212,7 +5212,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- gcc/libtool.m4
-+++ gcc/libtool.m4
-@@ -739,7 +739,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- gcc/ltconfig
-+++ gcc/ltconfig
-@@ -603,7 +603,7 @@
- 
- # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
- case $host_os in
--linux-gnu*) ;;
-+linux-gnu*|linux-uclibc*) ;;
- linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
- esac
- 
-@@ -1251,7 +1251,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   version_type=linux
-   need_lib_prefix=no
-   need_version=no
diff --git a/toolchain/gcc/4.2.4/1000-aapcs-linux.patch b/toolchain/gcc/4.2.4/1000-aapcs-linux.patch
deleted file mode 100644
index 80c5afc..0000000
--- a/toolchain/gcc/4.2.4/1000-aapcs-linux.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-2008-10-07  Bernhard Reutner-Fischer  <aldot@gcc.gnu.org>
-
-	* config.gcc (arm*-*-*): Add aapcs-linux to supported ABIs.
-
-Index: gcc/gcc/config.gcc
-===================================================================
---- gcc/gcc/config.gcc	(revision 140935)
-+++ gcc/gcc/config.gcc	(revision 140936)
-@@ -2656,7 +2656,7 @@
- 
- 		case "$with_abi" in
- 		"" \
--		| apcs-gnu | atpcs | aapcs | iwmmxt )
-+		| apcs-gnu | atpcs | aapcs | iwmmxt | aapcs-linux )
- 			#OK
- 			;;
- 		*)
diff --git a/toolchain/gcc/4.2.4/1001-gcc-4.2.x-inhibit-libc.patch b/toolchain/gcc/4.2.4/1001-gcc-4.2.x-inhibit-libc.patch
deleted file mode 100644
index b039dfc..0000000
--- a/toolchain/gcc/4.2.4/1001-gcc-4.2.x-inhibit-libc.patch
+++ /dev/null
@@ -1,66 +0,0 @@
---- gcc-4.2.4/gcc/unwind-sjlj.c.khem	2010-08-11 12:45:28.000000000 -0700
-+++ gcc-4.2.4/gcc/unwind-sjlj.c	2010-08-11 12:45:50.000000000 -0700
-@@ -28,6 +28,8 @@
-    Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
-    02110-1301, USA.  */
- 
-+#ifndef inhibit_libc
-+
- #include "tconfig.h"
- #include "tsystem.h"
- #include "coretypes.h"
-@@ -326,3 +328,4 @@ uw_identify_context (struct _Unwind_Cont
- #include "unwind.inc"
- 
- #endif /* USING_SJLJ_EXCEPTIONS */
-+#endif
---- gcc-4.2.4/gcc/unwind-dw2.c.khem	2010-08-11 12:42:45.000000000 -0700
-+++ gcc-4.2.4/gcc/unwind-dw2.c	2010-08-11 12:43:17.000000000 -0700
-@@ -28,6 +28,8 @@
-    Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
-    02110-1301, USA.  */
- 
-+#ifndef inhibit_libc
-+
- #include "tconfig.h"
- #include "tsystem.h"
- #include "coretypes.h"
-@@ -1537,3 +1539,5 @@ alias (_Unwind_SetIP);
- #endif
- 
- #endif /* !USING_SJLJ_EXCEPTIONS */
-+#endif
-+
---- gcc-4.2.4/gcc/unwind-dw2-fde-glibc.c.khem	2010-08-11 12:44:25.000000000 -0700
-+++ gcc-4.2.4/gcc/unwind-dw2-fde-glibc.c	2010-08-11 12:44:48.000000000 -0700
-@@ -29,6 +29,8 @@
-    segment and dl_iterate_phdr to avoid register/deregister calls at
-    DSO load/unload.  */
- 
-+#ifndef inhibit_libc
-+
- #ifndef _GNU_SOURCE
- #define _GNU_SOURCE 1
- #endif
-@@ -438,3 +440,4 @@ _Unwind_Find_FDE (void *pc, struct dwarf
- #if defined (USE_GAS_SYMVER) && defined (SHARED) && defined (USE_LIBUNWIND_EXCEPTIONS)
- alias (_Unwind_Find_FDE);
- #endif
-+#endif
---- gcc-4.2.4/gcc/unwind-dw2-fde.c	2005-06-25 03:02:01.000000000 +0100
-+++ gcc-4.2.4/gcc/unwind-dw2-fde.c	2010-08-12 10:43:24.221690613 +0100
-@@ -29,6 +29,8 @@
- Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
- 02110-1301, USA.  */
-
-+#ifndef inhibit_libc
-+
- #ifndef _Unwind_Find_FDE
- #include "tconfig.h"
- #include "tsystem.h"
-@@ -1028,3 +1030,5 @@
-
-   return f;
- }
-+
-+#endif
diff --git a/toolchain/gcc/4.2.4/103-uclibc-conf-noupstream.patch b/toolchain/gcc/4.2.4/103-uclibc-conf-noupstream.patch
deleted file mode 100644
index 09c9bbe..0000000
--- a/toolchain/gcc/4.2.4/103-uclibc-conf-noupstream.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- gcc/gcc/config.gcc.uclibc100-sh~	2006-03-06 20:46:56 +0100
-+++ gcc/gcc/config.gcc	2006-03-10 15:02:41 +0100
-@@ -1905,7 +1905,7 @@
- 	;;
- sh-*-elf* | sh[12346l]*-*-elf* | sh*-*-kaos* | \
- sh-*-symbianelf* | sh[12346l]*-*-symbianelf* | \
--  sh-*-linux* | sh[346lbe]*-*-linux* | \
-+  sh*-*-linux* | sh[346lbe]*-*-linux* | \
-   sh-*-netbsdelf* | shl*-*-netbsdelf* | sh5-*-netbsd* | sh5l*-*-netbsd* | \
-    sh64-*-netbsd* | sh64l*-*-netbsd*)
- 	tmake_file="${tmake_file} sh/t-sh sh/t-elf"
diff --git a/toolchain/gcc/4.2.4/104-gnuhurd-uclibc-conf.patch b/toolchain/gcc/4.2.4/104-gnuhurd-uclibc-conf.patch
deleted file mode 100644
index c04dd9f..0000000
--- a/toolchain/gcc/4.2.4/104-gnuhurd-uclibc-conf.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff -rdup gcc-4.2.1.oorig/gcc/config.gcc gcc-4.2.1/gcc/config.gcc
---- gcc-4.2.1.oorig/gcc/config.gcc	2007-10-01 11:52:52.000000000 +0200
-+++ gcc-4.2.1/gcc/config.gcc	2007-10-01 13:22:12.000000000 +0200
-@@ -494,6 +494,9 @@ case ${target} in
-     alpha*)
-       tm_file="${cpu_type}/${cpu_type}.h alpha/elf.h alpha/linux.h alpha/linux-elf.h gnu.h ${tm_file}"
-       ;;
-+    i[34567]86-*hurd*-*)
-+      tm_file="${cpu_type}/${cpu_type}.h i386/unix.h i386/att.h dbxelf.h elfos.h svr4.h i386/gnu.h gnu.h ${tm_file}"
-+      ;;
-     i[34567]86-*-*)
-       tm_file="${cpu_type}/${cpu_type}.h i386/unix.h i386/att.h dbxelf.h elfos.h svr4.h linux.h i386/linux.h gnu.h ${tm_file}"
-       ;;
diff --git a/toolchain/gcc/4.2.4/300-libstdc++-pic.patch b/toolchain/gcc/4.2.4/300-libstdc++-pic.patch
deleted file mode 100644
index 560bcb2..0000000
--- a/toolchain/gcc/4.2.4/300-libstdc++-pic.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-# DP: Build and install libstdc++_pic.a library.
-
---- gcc/libstdc++-v3/src/Makefile.am
-+++ gcc/libstdc++-v3/src/Makefile.am
-@@ -214,6 +214,12 @@
- 	  $(OPT_LDFLAGS) $(SECTION_LDFLAGS) $(AM_CXXFLAGS) $(LDFLAGS) -o $@
- 
- 
-+install-exec-local:
-+ifeq ($(enable_shared),yes)
-+	$(AR) cru libstdc++_pic.a .libs/*.o $(top_builddir)/libsupc++/*.o
-+	$(INSTALL_DATA) libstdc++_pic.a $(DESTDIR)$(toolexeclibdir)
-+endif
-+
- # Added bits to build debug library.
- if GLIBCXX_BUILD_DEBUG
- all-local: build_debug
---- gcc/libstdc++-v3/src/Makefile.in
-+++ gcc/libstdc++-v3/src/Makefile.in
-@@ -627,7 +627,7 @@
- 
- install-data-am: install-data-local
- 
--install-exec-am: install-toolexeclibLTLIBRARIES
-+install-exec-am: install-toolexeclibLTLIBRARIES install-exec-local
- 
- install-info: install-info-am
- 
-@@ -660,6 +660,7 @@
- 	distclean-libtool distclean-tags distdir dvi dvi-am html \
- 	html-am info info-am install install-am install-data \
- 	install-data-am install-data-local install-exec \
-+	install-exec-local \
- 	install-exec-am install-info install-info-am install-man \
- 	install-strip install-toolexeclibLTLIBRARIES installcheck \
- 	installcheck-am installdirs maintainer-clean \
-@@ -743,6 +743,13 @@
- install_debug:
- 	(cd ${debugdir} && $(MAKE) \
- 	toolexeclibdir=$(glibcxx_toolexeclibdir)/debug install)
-+
-+install-exec-local:
-+ifeq ($(enable_shared),yes)
-+	$(AR) cru libstdc++_pic.a *.o $(top_builddir)/libsupc++/*.o
-+	$(INSTALL_DATA) libstdc++_pic.a $(DESTDIR)$(toolexeclibdir)
-+endif
-+
- # Tell versions [3.59,3.63) of GNU make to not export all variables.
- # Otherwise a system limit (for SysV at least) may be exceeded.
- .NOEXPORT:
diff --git a/toolchain/gcc/4.2.4/301-missing-execinfo_h.patch b/toolchain/gcc/4.2.4/301-missing-execinfo_h.patch
deleted file mode 100644
index 0e2092f..0000000
--- a/toolchain/gcc/4.2.4/301-missing-execinfo_h.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- gcc-4.0.0/boehm-gc/include/gc.h-orig	2005-04-28 22:28:57.000000000 -0500
-+++ gcc-4.0.0/boehm-gc/include/gc.h	2005-04-28 22:30:38.000000000 -0500
-@@ -500,7 +500,7 @@
- #ifdef __linux__
- # include <features.h>
- # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
--     && !defined(__ia64__)
-+     && !defined(__ia64__) && !defined(__UCLIBC__)
- #   ifndef GC_HAVE_BUILTIN_BACKTRACE
- #     define GC_HAVE_BUILTIN_BACKTRACE
- #   endif
diff --git a/toolchain/gcc/4.2.4/302-c99-snprintf.patch b/toolchain/gcc/4.2.4/302-c99-snprintf.patch
deleted file mode 100644
index dfb22d6..0000000
--- a/toolchain/gcc/4.2.4/302-c99-snprintf.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- gcc-4.0.0/libstdc++-v3/include/c_std/std_cstdio.h-orig	2005-04-29 00:08:41.000000000 -0500
-+++ gcc-4.0.0/libstdc++-v3/include/c_std/std_cstdio.h	2005-04-29 00:08:45.000000000 -0500
-@@ -142,7 +142,7 @@
-   using ::vsprintf;
- }
- 
--#if _GLIBCXX_USE_C99
-+#if _GLIBCXX_USE_C99 || defined(__UCLIBC__)
- 
- #undef snprintf
- #undef vfscanf
diff --git a/toolchain/gcc/4.2.4/303-c99-complex-ugly-hack.patch b/toolchain/gcc/4.2.4/303-c99-complex-ugly-hack.patch
deleted file mode 100644
index 2ccc80d..0000000
--- a/toolchain/gcc/4.2.4/303-c99-complex-ugly-hack.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- gcc-4.0.0/libstdc++-v3/configure-old	2005-04-30 22:04:48.061603912 -0500
-+++ gcc-4.0.0/libstdc++-v3/configure	2005-04-30 22:06:13.678588152 -0500
-@@ -7194,6 +7194,9 @@
- cat >>conftest.$ac_ext <<_ACEOF
- /* end confdefs.h.  */
- #include <complex.h>
-+#ifdef __UCLIBC__
-+#error ugly hack to make sure configure test fails here for cross until uClibc supports the complex funcs
-+#endif
- int
- main ()
- {
diff --git a/toolchain/gcc/4.2.4/304-index_macro.patch b/toolchain/gcc/4.2.4/304-index_macro.patch
deleted file mode 100644
index d8e4765..0000000
--- a/toolchain/gcc/4.2.4/304-index_macro.patch
+++ /dev/null
@@ -1,24 +0,0 @@
---- gcc-4.1.0/libstdc++-v3/include/ext/rope.mps	2006-03-24 01:49:51 +0100
-+++ gcc-4.1.0/libstdc++-v3/include/ext/rope	2006-03-24 01:49:37 +0100
-@@ -59,6 +59,9 @@
- #include <bits/allocator.h>
- #include <ext/hash_fun.h>
- 
-+/* cope w/ index defined as macro, SuSv3 proposal */
-+#undef index
-+
- # ifdef __GC
- #   define __GC_CONST const
- # else
---- gcc-4.1.0/libstdc++-v3/include/ext/ropeimpl.h.mps	2006-03-24 01:50:04 +0100
-+++ gcc-4.1.0/libstdc++-v3/include/ext/ropeimpl.h	2006-03-24 01:50:28 +0100
-@@ -53,6 +53,9 @@
- #include <ext/memory> // For uninitialized_copy_n
- #include <ext/numeric> // For power
- 
-+/* cope w/ index defined as macro, SuSv3 proposal */
-+#undef index
-+
- _GLIBCXX_BEGIN_NAMESPACE(__gnu_cxx)
-
-   using std::size_t;
diff --git a/toolchain/gcc/4.2.4/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.2.4/305-libmudflap-susv3-legacy.patch
deleted file mode 100644
index 374b1f8..0000000
--- a/toolchain/gcc/4.2.4/305-libmudflap-susv3-legacy.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Index: gcc-4.2/libmudflap/mf-hooks2.c
-===================================================================
---- gcc-4.2/libmudflap/mf-hooks2.c	(revision 119834)
-+++ gcc-4.2/libmudflap/mf-hooks2.c	(working copy)
-@@ -427,7 +427,7 @@
- {
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s, n, __MF_CHECK_WRITE, "bzero region");
--  bzero (s, n);
-+  memset (s, 0, n);
- }
- 
- 
-@@ -437,7 +437,7 @@
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(src, n, __MF_CHECK_READ, "bcopy src");
-   MF_VALIDATE_EXTENT(dest, n, __MF_CHECK_WRITE, "bcopy dest");
--  bcopy (src, dest, n);
-+  memmove (dest, src, n);
- }
- 
- 
-@@ -447,7 +447,7 @@
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s1, n, __MF_CHECK_READ, "bcmp 1st arg");
-   MF_VALIDATE_EXTENT(s2, n, __MF_CHECK_READ, "bcmp 2nd arg");
--  return bcmp (s1, s2, n);
-+  return n == 0 ? 0 : memcmp (s1, s2, n);
- }
- 
- 
-@@ -456,7 +456,7 @@
-   size_t n = strlen (s);
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "index region");
--  return index (s, c);
-+  return strchr (s, c);
- }
- 
- 
-@@ -465,7 +465,7 @@
-   size_t n = strlen (s);
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "rindex region");
--  return rindex (s, c);
-+  return strrchr (s, c);
- }
- 
- /* XXX:  stpcpy, memccpy */
diff --git a/toolchain/gcc/4.2.4/307-locale_facets.patch b/toolchain/gcc/4.2.4/307-locale_facets.patch
deleted file mode 100644
index 412f865..0000000
--- a/toolchain/gcc/4.2.4/307-locale_facets.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-This patch fixes a bug into ostream::operator<<(double) due to the wrong size
-passed into the __convert_from_v method. The wrong size is then passed to
-std::snprintf function, that, on uClibc, doens't handle sized 0 buffer.
-
-Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
-
---- gcc-4.2.1/libstdc++-v3/include/bits/locale_facets.tcc	2006-10-17 18:43:47.000000000 +0200
-+++ gcc-4.2.1-st/libstdc++-v3/include/bits/locale_facets.tcc	2007-08-22 18:54:23.000000000 +0200
-@@ -1143,7 +1143,7 @@ _GLIBCXX_BEGIN_LDBL_NAMESPACE
- 	const int __cs_size = __fixed ? __max_exp + __prec + 4
- 	                              : __max_digits * 2 + __prec;
- 	char* __cs = static_cast<char*>(__builtin_alloca(__cs_size));
--	__len = std::__convert_from_v(_S_get_c_locale(), __cs, 0, __fbuf, 
-+	__len = std::__convert_from_v(_S_get_c_locale(), __cs, __cs_size, __fbuf, 
- 				      __prec, __v);
- #endif
- 
-@@ -1777,7 +1777,7 @@ _GLIBCXX_BEGIN_LDBL_NAMESPACE
-       // max_exponent10 + 1 for the integer part, + 2 for sign and '\0'.
-       const int __cs_size = numeric_limits<long double>::max_exponent10 + 3;
-       char* __cs = static_cast<char*>(__builtin_alloca(__cs_size));
--      int __len = std::__convert_from_v(_S_get_c_locale(), __cs, 0, "%.*Lf", 
-+      int __len = std::__convert_from_v(_S_get_c_locale(), __cs, __cs_size, "%.*Lf", 
- 					0, __units);
- #endif
-       string_type __digits(__len, char_type());
diff --git a/toolchain/gcc/4.2.4/402-libbackend_dep_gcov-iov.h.patch b/toolchain/gcc/4.2.4/402-libbackend_dep_gcov-iov.h.patch
deleted file mode 100644
index 0bf115c..0000000
--- a/toolchain/gcc/4.2.4/402-libbackend_dep_gcov-iov.h.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: gcc-4.2/gcc/Makefile.in
-===================================================================
---- gcc-4.2/gcc/Makefile.in	(revision 121758)
-+++ gcc-4.2/gcc/Makefile.in	(working copy)
-@@ -2658,7 +2658,7 @@ mips-tdump.o : mips-tdump.c $(CONFIG_H) 
- # FIXME: writing proper dependencies for this is a *LOT* of work.
- libbackend.o : $(OBJS-common:.o=.c) $(out_file) \
-   insn-config.h insn-flags.h insn-codes.h insn-constants.h \
--  insn-attr.h  $(DATESTAMP) $(BASEVER) $(DEVPHASE)
-+  insn-attr.h  $(DATESTAMP) $(BASEVER) $(DEVPHASE) gcov-iov.h
- 	$(CC) $(ALL_CFLAGS) $(ALL_CPPFLAGS) \
- 	  -DTARGET_NAME=\"$(target_noncanonical)\" \
- 	  -DLOCALEDIR=\"$(localedir)\" \
diff --git a/toolchain/gcc/4.2.4/800-arm-bigendian.patch b/toolchain/gcc/4.2.4/800-arm-bigendian.patch
deleted file mode 100644
index 07c6093..0000000
--- a/toolchain/gcc/4.2.4/800-arm-bigendian.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-By Lennert Buytenhek <buytenh@wantstofly.org>
-Adds support for arm*b-linux* big-endian ARM targets
-
-See http://gcc.gnu.org/PR16350
-
---- gcc-4.2.0/gcc/config/arm/linux-elf.h
-+++ gcc-4.2.0/gcc/config/arm/linux-elf.h
-@@ -28,19 +28,33 @@
- #undef  TARGET_VERSION
- #define TARGET_VERSION  fputs (" (ARM GNU/Linux with ELF)", stderr);
- 
-+/*
-+ * 'config.gcc' defines TARGET_BIG_ENDIAN_DEFAULT as 1 for arm*b-*
-+ * (big endian) configurations.
-+ */
-+#if TARGET_BIG_ENDIAN_DEFAULT
-+#define TARGET_ENDIAN_DEFAULT MASK_BIG_END
-+#define TARGET_ENDIAN_OPTION "mbig-endian"
-+#define TARGET_LINKER_EMULATION "armelfb_linux"
-+#else
-+#define TARGET_ENDIAN_DEFAULT 0
-+#define TARGET_ENDIAN_OPTION "mlittle-endian"
-+#define TARGET_LINKER_EMULATION "armelf_linux"
-+#endif
-+
- #undef  TARGET_DEFAULT_FLOAT_ABI
- #define TARGET_DEFAULT_FLOAT_ABI ARM_FLOAT_ABI_HARD
- 
- #undef  TARGET_DEFAULT
--#define TARGET_DEFAULT (0)
-+#define TARGET_DEFAULT (TARGET_ENDIAN_DEFAULT)
- 
- #define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm6
- 
--#define SUBTARGET_EXTRA_LINK_SPEC " -m armelf_linux -p"
-+#define SUBTARGET_EXTRA_LINK_SPEC " -m " TARGET_LINKER_EMULATION " -p"
- 
- #undef  MULTILIB_DEFAULTS
- #define MULTILIB_DEFAULTS \
--	{ "marm", "mlittle-endian", "mhard-float", "mno-thumb-interwork" }
-+	{ "marm", TARGET_ENDIAN_OPTION, "mhard-float", "mno-thumb-interwork" }
- 
- /* Now we define the strings used to build the spec file.  */
- #undef  LIB_SPEC
-@@ -61,7 +75,7 @@
-    %{rdynamic:-export-dynamic} \
-    %{!dynamic-linker:-dynamic-linker " LINUX_DYNAMIC_LINKER "} \
-    -X \
--   %{mbig-endian:-EB}" \
-+   %{mbig-endian:-EB} %{mlittle-endian:-EL}" \
-    SUBTARGET_EXTRA_LINK_SPEC
- 
- #undef  LINK_SPEC
---- gcc-4.2.0/gcc/config.gcc.orig	2006-09-22 14:53:41.000000000 +0200
-+++ gcc-4.2.0/gcc/config.gcc	2006-09-25 10:45:21.000000000 +0200
-@@ -696,6 +696,11 @@
- 	tm_file="dbxelf.h elfos.h linux.h arm/elf.h arm/linux-gas.h arm/linux-elf.h"
- 	tmake_file="${tmake_file} t-linux arm/t-arm"
- 	case ${target} in
-+	arm*b-*)
-+		tm_defines="${tm_defines} TARGET_BIG_ENDIAN_DEFAULT=1"
-+		;;
-+	esac
-+	case ${target} in
- 	arm*-*-linux-*eabi)
- 	    tm_file="$tm_file arm/bpabi.h arm/linux-eabi.h"
- 	    tmake_file="$tmake_file arm/t-arm-elf arm/t-bpabi arm/t-linux-eabi"
diff --git a/toolchain/gcc/4.2.4/904-flatten-switch-stmt-00.patch b/toolchain/gcc/4.2.4/904-flatten-switch-stmt-00.patch
deleted file mode 100644
index 8fac37c..0000000
--- a/toolchain/gcc/4.2.4/904-flatten-switch-stmt-00.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-Hi,
-
-The attached patch makes sure that we create smaller object code for
-simple switch statements. We just make sure to flatten the switch
-statement into an if-else chain, basically.
-
-This fixes a size-regression as compared to gcc-3.4, as can be seen
-below.
-
-2007-04-15  Bernhard Fischer  <..>
-
-	* stmt.c (expand_case): Do not create a complex binary tree when
-	optimizing for size but rather use the simple ordered list.
-	(emit_case_nodes): do not emit jumps to the default_label when
-	optimizing for size.
-
-Not regtested so far.
-Comments?
-
-Attached is the test switch.c mentioned below.
-
-$ for i in 2.95 3.3 3.4 4.0 4.1 4.2.orig-HEAD 4.3.orig-HEAD 4.3-HEAD;do
-gcc-$i  -DCHAIN -Os -o switch-CHAIN-$i.o -c switch.c ;done
-$ for i in 2.95 3.3 3.4 4.0 4.1 4.2.orig-HEAD 4.3.orig-HEAD 4.3-HEAD;do
-gcc-$i  -UCHAIN -Os -o switch-$i.o -c switch.c ;done
-
-$ size switch-*.o
-   text	   data	    bss	    dec	    hex	filename
-    169	      0	      0	    169	     a9	switch-2.95.o
-    115	      0	      0	    115	     73	switch-3.3.o
-    103	      0	      0	    103	     67	switch-3.4.o
-    124	      0	      0	    124	     7c	switch-4.0.o
-    124	      0	      0	    124	     7c	switch-4.1.o
-    124	      0	      0	    124	     7c	switch-4.2.orig-HEAD.o
-     95	      0	      0	     95	     5f	switch-4.3-HEAD.o
-    124	      0	      0	    124	     7c	switch-4.3.orig-HEAD.o
-    166	      0	      0	    166	     a6	switch-CHAIN-2.95.o
-    111	      0	      0	    111	     6f	switch-CHAIN-3.3.o
-     95	      0	      0	     95	     5f	switch-CHAIN-3.4.o
-     95	      0	      0	     95	     5f	switch-CHAIN-4.0.o
-     95	      0	      0	     95	     5f	switch-CHAIN-4.1.o
-     95	      0	      0	     95	     5f	switch-CHAIN-4.2.orig-HEAD.o
-     95	      0	      0	     95	     5f	switch-CHAIN-4.3-HEAD.o
-     95	      0	      0	     95	     5f	switch-CHAIN-4.3.orig-HEAD.o
-
-
-Content-Type: text/x-diff; charset=us-ascii
-Content-Disposition: attachment; filename="gcc-4.3.gcc-flatten-switch-stmt.00.diff"
-
-Index: gcc-4.2.0/gcc/stmt.c
-===================================================================
---- gcc-4.2.0.orig/gcc/stmt.c	(revision 123843)
-+++ gcc-4.2.0/gcc/stmt.c	(working copy)
-@@ -2517,7 +2517,11 @@ expand_case (tree exp)
- 	  use_cost_table
- 	    = (TREE_CODE (orig_type) != ENUMERAL_TYPE
- 	       && estimate_case_costs (case_list));
--	  balance_case_nodes (&case_list, NULL);
-+	  /* When optimizing for size, we want a straight list to avoid
-+	     jumps as much as possible. This basically creates an if-else
-+	     chain.  */
-+	  if (!optimize_size)
-+	    balance_case_nodes (&case_list, NULL);
- 	  emit_case_nodes (index, case_list, default_label, index_type);
- 	  emit_jump (default_label);
- 	}
-@@ -3075,6 +3079,7 @@ emit_case_nodes (rtx index, case_node_pt
- 	    {
- 	      if (!node_has_low_bound (node, index_type))
- 		{
-+		  if (!optimize_size) /* don't jl to the .default_label. */
- 		  emit_cmp_and_jump_insns (index,
- 					   convert_modes
- 					   (mode, imode,
-
-
-Content-Type: text/x-csrc; charset=us-ascii
-Content-Disposition: attachment; filename="switch.c"
-
-int
-commutative_tree_code (int code)
-{
-#define CASE(val, ret) case val:/* __asm__("# val="#val ",ret="#ret);*/ return ret;
-#ifndef CHAIN
-  switch (code)
-    {
-# if 1
-  CASE(1,3)
-  CASE(3,2)
-  CASE(5,8)
-  CASE(7,1)
-  CASE(33,4)
-  CASE(44,9)
-  CASE(55,10)
-  CASE(66,-1)
-  CASE(77,99)
-  CASE(666,0)
-# else
-    case 1:
-      return 3;
-    case 3:
-      return 2;
-    case 5:
-      return 8;
-    case 7:
-      return 1;
-    case 33:
-      return 4;
-    case 44:
-      return 9;
-    case 55:
-      return 10;
-    case 66:
-      return -1;
-    case 77:
-      return 99;
-    case 666:
-      return 0;
-# endif
-    default:
-      break;
-    }
-  return 4711;
-
-#else
-   if (code == 1)
-	return 3;
-  else if (code == 3)
-	return 2;
-  else if (code == 5)
-	return 8;
-  else if (code == 7)
-	return 1;
-  else if (code == 33)
-	return 4;
-  else if (code == 44)
-	return 9;
-  else if (code == 55)
-	return 10;
-  else if (code == 66)
-	return -1;
-  else if (code == 77)
-	return 99;
-  else if (code == 666)
-	return 0;
-  else
-	return 4711;
-#endif
-}
-
-
---AhhlLboLdkugWU4S--
-
diff --git a/toolchain/gcc/4.2.4/910-soft-float.patch b/toolchain/gcc/4.2.4/910-soft-float.patch
deleted file mode 100644
index 3f886ac..0000000
--- a/toolchain/gcc/4.2.4/910-soft-float.patch
+++ /dev/null
@@ -1,26 +0,0 @@
---- gcc-4.2-20061205/gcc/config/arm/t-linux    2006-12-08 15:18:33.000000000 -0800
-+++ gcc-4.2-20061205/gcc/config/arm/t-linux    2006-12-08 15:18:33.000000000 -0800
-@@ -4,7 +4,10 @@
- LIBGCC2_DEBUG_CFLAGS = -g0
- 
- LIB1ASMSRC = arm/lib1funcs.asm
--LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx
-+LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx \
-+      _negdf2 _addsubdf3 _muldivdf3 _cmpdf2 _unorddf2 _fixdfsi _fixunsdfsi \
-+      _truncdfsf2 _negsf2 _addsubsf3 _muldivsf3 _cmpsf2 _unordsf2 \
-+      _fixsfsi _fixunssfsi _floatdidf _floatundidf _floatdisf _floatundisf
- 
- # MULTILIB_OPTIONS = mhard-float/msoft-float
- # MULTILIB_DIRNAMES = hard-float soft-float
-
---- gcc-4.2-20061205/gcc/config/arm/linux-elf.h        2006-12-08 15:18:33.000000000 -0800
-+++ gcc-4.2-20061205/gcc/config/arm/linux-elf.h        2006-12-08 15:18:33.000000000 -0800
-@@ -63,7 +63,7 @@
-    %{shared:-lc} \
-    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
- 
--#define LIBGCC_SPEC "%{msoft-float:-lfloat} %{mfloat-abi=soft*:-lfloat} -lgcc"
-+#define LIBGCC_SPEC "-lgcc"
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
- 
diff --git a/toolchain/gcc/4.2.4/920-soft-float.patch b/toolchain/gcc/4.2.4/920-soft-float.patch
deleted file mode 100644
index 4287bfa..0000000
--- a/toolchain/gcc/4.2.4/920-soft-float.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -uNpr gcc-4.2.1_orig/gcc/config/rs6000/darwin-ldouble.c gcc-4.2.1/gcc/config/rs6000/darwin-ldouble.c
---- gcc-4.2.1_orig/gcc/config/rs6000/darwin-ldouble.c	2007-03-05 11:54:00.000000000 -0500
-+++ gcc-4.2.1/gcc/config/rs6000/darwin-ldouble.c	2008-01-31 17:51:24.000000000 -0500
-@@ -70,6 +70,8 @@ Software Foundation, 51 Franklin Street,
-    but GCC currently generates poor code when a union is used to turn
-    a long double into a pair of doubles.  */
- 
-+#if defined (_SOFT_FLOAT) && defined (__LONG_DOUBLE_128__)
-+
- long double __gcc_qadd (double, double, double, double);
- long double __gcc_qsub (double, double, double, double);
- long double __gcc_qmul (double, double, double, double);
-@@ -219,8 +221,6 @@ __gcc_qdiv (double a, double b, double c
-   return z.ldval;
- }
- 
--#if defined (_SOFT_FLOAT) && defined (__LONG_DOUBLE_128__)
--
- long double __gcc_qneg (double, double);
- int __gcc_qeq (double, double, double, double);
- int __gcc_qne (double, double, double, double);
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index e3d2587..dbcbbd3 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -14,10 +14,6 @@ choice
 	       depends on BR2_avr32
 	       bool "gcc 4.2.2-avr32-2.1.5"
 
-	config BR2_GCC_VERSION_4_2_4
-		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
-		bool "gcc 4.2.4"
-
 	config BR2_GCC_VERSION_4_3_X
 		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		bool "gcc 4.3.x"
@@ -41,7 +37,7 @@ endchoice
 
 config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 	bool
-	default y if !BR2_GCC_VERSION_4_2_4 && !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
+	default y if !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 
 config BR2_GCC_SNAP_DATE
 	string "GCC snapshot date"
@@ -60,7 +56,6 @@ config BR2_GCC_SNAP_DATE
 config BR2_GCC_VERSION
 	string
 	default "4.2.2-avr32-2.1.5" if BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
-	default "4.2.4"     if BR2_GCC_VERSION_4_2_4
 	default "4.3.6"     if BR2_GCC_VERSION_4_3_X
 	default "4.4.6"     if BR2_GCC_VERSION_4_4_X
 	default "4.5.3"     if BR2_GCC_VERSION_4_5_X
