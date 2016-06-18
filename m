From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 14:59:39 +0200
Subject: [Buildroot] [git commit] elfutils: bump version to 0.166
Message-ID: <20160618130411.1B0DD81963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=794ae61a15f7a36e199b62b2e5224cfc41bdabea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove 0001-argp-support.patch since it's already included upstream:
  https://git.fedorahosted.org/cgit/elfutils.git/commit/?id=1ab3c2befeedf5bd891cfbe17cfef79c06e5079a

- Tweak patches for this new version:
  - 0002-disable-progs.patch
  - 0003-fts.patch
  - 0004-disable-po.patch
  - 0005-really-make-werror-conditional-to-build-werror.patch

- Remove 0007-Allow-disabling-symbol-versioning-at-configure-t since
  it's already included upstream:
  https://git.fedorahosted.org/cgit/elfutils.git/commit/?id=bafacacaf7659a4933604662daba26a480b29a8d

- Remove portability patch since it's no longer needed. I have asked
  Mark Wielaard regarding this topic given the portability patch looks
  been discontinued since 0.163 and he replied the following:
  - "I believe it is no longer needed. At least not on any platform I
     am actively maintaining. See also this discussion from last year:
     https://lists.fedorahosted.org/pipermail/elfutils-devel/2015-May/004825.html"

- Add zlib dependency since it's now mandatory:
  configure: error: zlib not found but is required

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elfutils/0001-argp-support.patch           |  93 --------------
 package/elfutils/0002-disable-progs.patch          |  22 ++--
 package/elfutils/0003-fts.patch                    |  26 ++--
 ...y-make-werror-conditional-to-build-werror.patch |  18 +--
 ...bling-symbol-versioning-at-configure-time.patch | 139 ---------------------
 package/elfutils/Config.in                         |   1 +
 package/elfutils/elfutils.hash                     |   3 +-
 package/elfutils/elfutils.mk                       |  11 +-
 8 files changed, 40 insertions(+), 273 deletions(-)

diff --git a/package/elfutils/0001-argp-support.patch b/package/elfutils/0001-argp-support.patch
deleted file mode 100644
index 1a74b35..0000000
--- a/package/elfutils/0001-argp-support.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-Allow the usage of an external implementation of the argp functions
-
-uClibc lack the argp family of functions that glibc has. Therefore, we
-add a check in the configure script to see if argp_parse is available
-in the C library. If not, we look if it is available in the additional
-'argp' library. If so, we link against that library. If not, we error
-out.
-
-This allows to build elfutils against uClibc with an external argp
-library.
-
-Based on the former patch by Thomas Petazzoni.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-diff -rup a/configure.ac b/configure.ac
---- a/configure.ac	2015-01-06 11:30:02.170052875 +0000
-+++ b/configure.ac	2015-01-06 11:31:10.122219826 +0000
-@@ -253,6 +253,13 @@ AC_SUBST([LIBEBL_SUBDIR])
- AC_DEFINE_UNQUOTED(LIBEBL_SUBDIR, "$LIBEBL_SUBDIR")
- AH_TEMPLATE([LIBEBL_SUBDIR], [$libdir subdirectory containing libebl modules.])
- 
-+AC_CHECK_FUNC([argp_parse])
-+if test "$ac_cv_func_argp_parse" != yes; then
-+	AC_CHECK_LIB([argp],[argp_parse],ARGP_LIBS=-largp,
-+		AC_MSG_ERROR([No argp_parse function available.]))
-+fi
-+AC_SUBST(ARGP_LIBS)
-+
- dnl Test for zlib and bzlib, gives ZLIB/BZLIB .am
- dnl conditional and config.h USE_ZLIB/USE_BZLIB #define.
- save_LIBS="$LIBS"
-diff -rup a/libdw/Makefile.am b/libdw/Makefile.am
---- a/libdw/Makefile.am	2014-12-19 20:43:11.000000000 +0000
-+++ b/libdw/Makefile.am	2015-01-06 11:32:21.075438524 +0000
-@@ -112,7 +112,7 @@ libdw.so$(EXEEXT): $(srcdir)/libdw.map l
- 		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
- 		-Wl,--version-script,$<,--no-undefined \
- 		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
--		-ldl $(zip_LIBS)
-+		-ldl $(zip_LIBS) $(ARGP_LIBS)
- 	@$(textrel_check)
- 	ln -fs $@ $@.$(VERSION)
- 
-diff -rup a/src/Makefile.am b/src/Makefile.am
---- a/src/Makefile.am	2015-01-06 11:30:02.430057339 +0000
-+++ b/src/Makefile.am	2015-01-06 11:34:53.061049752 +0000
-@@ -94,27 +94,29 @@ readelf_no_Werror = yes
- strings_no_Werror = yes
- addr2line_no_Wformat = yes
- 
--readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) -ldl
-+readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) -ldl $(ARGP_LIBS)
- nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) -ldl \
--	   $(demanglelib)
--size_LDADD = $(libelf) $(libeu)
--strip_LDADD = $(libebl) $(libelf) $(libeu) -ldl
--ld_LDADD = $(libebl) $(libelf) $(libeu) -ldl
-+	   $(demanglelib) $(ARGP_LIBS)
-+size_LDADD = $(libelf) $(libeu) $(ARGP_LIBS)
-+strip_LDADD = $(libebl) $(libelf) $(libeu) -ldl $(ARGP_LIBS)
-+ld_LDADD = $(libebl) $(libelf) $(libeu) -ldl $(ARGP_LIBS)
- if NATIVE_LD
- # -ldl is always needed for libebl.
- ld_LDADD += libld_elf.a
- endif
- ld_LDFLAGS = -rdynamic
--elflint_LDADD  = $(libebl) $(libelf) $(libeu) -ldl
--findtextrel_LDADD = $(libdw) $(libelf)
--addr2line_LDADD = $(libdw) $(libelf)
--elfcmp_LDADD = $(libebl) $(libelf) -ldl
--objdump_LDADD  = $(libasm) $(libebl) $(libelf) $(libeu) -ldl
--ranlib_LDADD = libar.a $(libelf) $(libeu)
--strings_LDADD = $(libelf) $(libeu)
--ar_LDADD = libar.a $(libelf) $(libeu)
--unstrip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) -ldl
--stack_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) -ldl $(demanglelib)
-+elflint_LDADD  = $(libebl) $(libelf) $(libeu) -ldl $(ARGP_LIBS)
-+findtextrel_LDADD = $(libdw) $(libelf) $(ARGP_LIBS)
-+addr2line_LDADD = $(libdw) $(libelf) $(ARGP_LIBS)
-+elfcmp_LDADD = $(libebl) $(libelf) -ldl $(ARGP_LIBS)
-+objdump_LDADD  = $(libasm) $(libebl) $(libelf) $(libeu) -ldl \
-+	$(ARGP_LIBS)
-+ranlib_LDADD = libar.a $(libelf) $(libeu) $(ARGP_LIBS)
-+strings_LDADD = $(libelf) $(libeu) $(ARGP_LIBS)
-+ar_LDADD = libar.a $(libelf) $(libeu) $(ARGP_LIBS)
-+unstrip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) -ldl $(ARGP_LIBS)
-+stack_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) -ldl \
-+	$(demanglelib) $(ARGP_LIBS)
- 
- ldlex.o: ldscript.c
- ldlex_no_Werror = yes
diff --git a/package/elfutils/0002-disable-progs.patch b/package/elfutils/0002-disable-progs.patch
index 3e37bb8..ea6b934 100644
--- a/package/elfutils/0002-disable-progs.patch
+++ b/package/elfutils/0002-disable-progs.patch
@@ -9,15 +9,17 @@ obstack_printf() in uClibc for example).
 
 Based on the former patch by Thomas Petazzoni.
 
+[Vincent: tweak patch for 0.166]
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 
 diff -rup a/configure.ac b/configure.ac
---- a/configure.ac	2015-01-06 11:31:10.122219826 +0000
-+++ b/configure.ac	2015-01-06 11:37:38.397891424 +0000
-@@ -260,6 +260,12 @@ if test "$ac_cv_func_argp_parse" != yes;
- fi
- AC_SUBST(ARGP_LIBS)
+--- a/configure.ac	2016-03-31 09:48:08.000000000 +0100
++++ b/configure.ac	2016-06-17 14:47:03.561704498 +0100
+@@ -253,6 +253,12 @@ AC_SUBST([LIBEBL_SUBDIR])
+ AC_DEFINE_UNQUOTED(LIBEBL_SUBDIR, "$LIBEBL_SUBDIR")
+ AH_TEMPLATE([LIBEBL_SUBDIR], [$libdir subdirectory containing libebl modules.])
  
 +AC_ARG_ENABLE([progs],
 +	AS_HELP_STRING([--enable-progs], [enable progs]),
@@ -25,13 +27,13 @@ diff -rup a/configure.ac b/configure.ac
 +	enable_progs=yes)
 +AM_CONDITIONAL(ENABLE_PROGS, test "$enable_progs" = yes)
 +
- dnl Test for zlib and bzlib, gives ZLIB/BZLIB .am
- dnl conditional and config.h USE_ZLIB/USE_BZLIB #define.
+ dnl zlib is mandatory.
  save_LIBS="$LIBS"
+ LIBS=
 diff -rup a/Makefile.am b/Makefile.am
---- a/Makefile.am	2014-06-17 19:51:09.000000000 +0100
-+++ b/Makefile.am	2015-01-06 11:38:42.846999410 +0000
-@@ -22,9 +22,13 @@ ACLOCAL_AMFLAGS = -I m4
+--- a/Makefile.am	2016-01-12 12:49:19.000000000 +0000
++++ b/Makefile.am	2016-06-17 14:48:02.585861468 +0100
+@@ -26,9 +26,13 @@ AM_MAKEFLAGS = --no-print-directory
  
  pkginclude_HEADERS = version.h
  
diff --git a/package/elfutils/0003-fts.patch b/package/elfutils/0003-fts.patch
index 99e8794..0131b75 100644
--- a/package/elfutils/0003-fts.patch
+++ b/package/elfutils/0003-fts.patch
@@ -24,13 +24,15 @@ already provided by the C library.
 
 Based on the former patch by Thomas Petazzoni.
 
+[Vincent: tweak patch for 0.166]
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 
 diff -Nrup a/configure.ac b/configure.ac
---- a/configure.ac	2015-01-06 11:37:38.397891424 +0000
-+++ b/configure.ac	2015-01-06 11:40:53.568258759 +0000
-@@ -266,6 +266,10 @@ AC_ARG_ENABLE([progs],
+--- a/configure.ac	2016-06-17 14:47:03.561704498 +0100
++++ b/configure.ac	2016-06-17 14:52:35.038200412 +0100
+@@ -259,6 +259,10 @@ AC_ARG_ENABLE([progs],
  	enable_progs=yes)
  AM_CONDITIONAL(ENABLE_PROGS, test "$enable_progs" = yes)
  
@@ -38,12 +40,12 @@ diff -Nrup a/configure.ac b/configure.ac
 +	AC_DEFINE([HAVE_FTS_H], [], [Define if <fts.h> is available in C library]))
 +AM_CONDITIONAL(HAVE_FTS, test "$ac_cv_header_fts_h" = yes)
 +
- dnl Test for zlib and bzlib, gives ZLIB/BZLIB .am
- dnl conditional and config.h USE_ZLIB/USE_BZLIB #define.
+ dnl zlib is mandatory.
  save_LIBS="$LIBS"
+ LIBS=
 diff -Nrup a/libdwfl/fts.c b/libdwfl/fts.c
 --- a/libdwfl/fts.c	1970-01-01 01:00:00.000000000 +0100
-+++ b/libdwfl/fts.c	2015-01-06 11:42:13.481640322 +0000
++++ b/libdwfl/fts.c	2016-06-17 14:57:26.649912084 +0100
 @@ -0,0 +1,1095 @@
 +/*-
 + * Copyright (c) 1990, 1993, 1994
@@ -1142,7 +1144,7 @@ diff -Nrup a/libdwfl/fts.c b/libdwfl/fts.c
 +}
 diff -Nrup a/libdwfl/fts_.h b/libdwfl/fts_.h
 --- a/libdwfl/fts_.h	1970-01-01 01:00:00.000000000 +0100
-+++ b/libdwfl/fts_.h	2015-01-06 11:42:13.481640322 +0000
++++ b/libdwfl/fts_.h	2016-06-17 14:58:42.003387566 +0100
 @@ -0,0 +1,131 @@
 +/*
 + * Copyright (c) 1989, 1993
@@ -1276,8 +1278,8 @@ diff -Nrup a/libdwfl/fts_.h b/libdwfl/fts_.h
 +
 +#endif /* fts.h */
 diff -Nrup a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
---- a/libdwfl/linux-kernel-modules.c	2014-11-22 22:43:52.000000000 +0000
-+++ b/libdwfl/linux-kernel-modules.c	2015-01-06 11:44:25.610924805 +0000
+--- a/libdwfl/linux-kernel-modules.c	2016-03-02 16:25:38.000000000 +0000
++++ b/libdwfl/linux-kernel-modules.c	2016-06-17 14:59:50.267724089 +0100
 @@ -29,7 +29,11 @@
  /* We include this before config.h because it can't handle _FILE_OFFSET_BITS.
     Everything we need here is fine if its declarations just come first.  */
@@ -1291,9 +1293,9 @@ diff -Nrup a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
  #include <config.h>
  
 diff -Nrup a/libdwfl/Makefile.am b/libdwfl/Makefile.am
---- a/libdwfl/Makefile.am	2014-06-17 19:51:09.000000000 +0100
-+++ b/libdwfl/Makefile.am	2015-01-06 11:45:25.442959369 +0000
-@@ -79,6 +79,9 @@ endif
+--- a/libdwfl/Makefile.am	2016-01-12 12:49:19.000000000 +0000
++++ b/libdwfl/Makefile.am	2016-06-17 15:01:03.492157569 +0100
+@@ -77,6 +77,9 @@ endif
  if LZMA
  libdwfl_a_SOURCES += lzma.c
  endif
diff --git a/package/elfutils/0005-really-make-werror-conditional-to-build-werror.patch b/package/elfutils/0005-really-make-werror-conditional-to-build-werror.patch
index 59aae5e..aa4d12d 100644
--- a/package/elfutils/0005-really-make-werror-conditional-to-build-werror.patch
+++ b/package/elfutils/0005-really-make-werror-conditional-to-build-werror.patch
@@ -8,17 +8,19 @@ function [-Werror=maybe-uninitialized]
 	 ^
 cc1: all warnings being treated as errors
 
+[Vincent: tweak patch for 0.166]
+
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 
 diff -rup a/config/eu.am b/config/eu.am
---- a/config/eu.am	2014-11-10 16:19:14.356031479 +0000
-+++ b/config/eu.am	2014-11-10 16:21:11.702072011 +0000
-@@ -35,7 +35,6 @@ LD_AS_NEEDED = @LD_AS_NEEDED@
- DEFS = -D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR='"${localedir}"'
- AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I..
- AM_CFLAGS = -std=gnu99 -Wall -Wshadow \
+--- a/config/eu.am	2016-03-02 16:25:38.000000000 +0000
++++ b/config/eu.am	2016-06-17 15:05:08.270974835 +0100
+@@ -65,7 +65,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -W
+ 	    -Wold-style-definition -Wstrict-prototypes \
+ 	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
+ 	    $(NULL_DEREFERENCE_WARNING) \
 -	    $(if $($(*F)_no_Werror),,-Werror) \
- 	    $(if $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) \
- 	    $(if $($(*F)_no_Wformat),-Wno-format,-Wformat=2) \
+ 	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
+ 	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
  	    $($(*F)_CFLAGS)
diff --git a/package/elfutils/0007-Allow-disabling-symbol-versioning-at-configure-time.patch b/package/elfutils/0007-Allow-disabling-symbol-versioning-at-configure-time.patch
deleted file mode 100644
index 7378f26..0000000
--- a/package/elfutils/0007-Allow-disabling-symbol-versioning-at-configure-time.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-From bafacacaf7659a4933604662daba26a480b29a8d Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Thu, 23 Apr 2015 20:46:59 +0200
-Subject: [PATCH] Allow disabling symbol versioning at configure time
-
-Due to missing symbol versioning support in uClibc calls to versioned
-functions that internally call different version of themselves results
-in infinite recursion.
-
-Introduce macro SYMBOL_VERSIONING and use it instead of plain SHARED to
-decide whether symbol versioning is needed. Control this macro
-definition with new configure option --disable-symbol-versioning.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
-Signed-off-by: Mark Wielaard <mjw@redhat.com>
----
-Backported from: bafacacaf7659a4933604662daba26a480b29a8d
-Changes to ChangeLogs are dropped.
-
- config/eu.am                   | 10 ++++++++--
- configure.ac                   |  7 +++++++
- lib/eu-config.h                |  6 +++---
- libdwfl/core-file.c            |  2 +-
- libdwfl/dwfl_module_build_id.c |  2 +-
- libdwfl/dwfl_report_elf.c      |  2 +-
-
-diff --git a/config/eu.am b/config/eu.am
-index faf8add..6103a3e 100644
---- a/config/eu.am
-+++ b/config/eu.am
-@@ -38,16 +38,22 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
- 
- COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage, $(COMPILE))
- 
-+DEFS.os = -DPIC -DSHARED
-+if SYMBOL_VERSIONING
-+DEFS.os += -DSYMBOL_VERSIONING
-+else
-+endif
-+
- %.os: %.c %.o
- if AMDEP
--	if $(COMPILE.os) -c -o $@ -fpic -DPIC -DSHARED -MT $@ -MD -MP \
-+	if $(COMPILE.os) -c -o $@ -fpic $(DEFS.os) -MT $@ -MD -MP \
- 	  -MF "$(DEPDIR)/$*.Tpo" `test -f '$<' || echo '$(srcdir)/'`$<; \
- 	then cat "$(DEPDIR)/$*.Tpo" >> "$(DEPDIR)/$*.Po"; \
- 	     rm -f "$(DEPDIR)/$*.Tpo"; \
- 	else rm -f "$(DEPDIR)/$*.Tpo"; exit 1; \
- 	fi
- else
--	$(COMPILE.os) -c -o $@ -fpic -DPIC -DSHARED $<
-+	$(COMPILE.os) -c -o $@ -fpic $(DEFS.os) $<
- endif
- 
- CLEANFILES = *.gcno *.gcda
-diff --git a/configure.ac b/configure.ac
-index ed2c964..be01573 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -241,6 +241,13 @@ AS_HELP_STRING([--disable-textrelcheck],
-                [Disable textrelcheck being a fatal error]))
- AM_CONDITIONAL(FATAL_TEXTREL, [test "x$enable_textrelcheck" != "xno"])
- 
-+AC_ARG_ENABLE([symbol-versioning],
-+AS_HELP_STRING([--disable-symbol-versioning],
-+               [Disable symbol versioning in shared objects]))
-+AM_CONDITIONAL(SYMBOL_VERSIONING, [test "x$enable_symbol_versioning" != "xno"])
-+AS_IF([test "x$enable_symbol_versioning" = "xno"],
-+      [AC_MSG_WARN([Disabling symbol versioning breaks ABI compatibility.])])
-+
- dnl The directories with content.
- 
- dnl Documentation.
-diff --git a/lib/eu-config.h b/lib/eu-config.h
-index 3afff26..5bb21c1 100644
---- a/lib/eu-config.h
-+++ b/lib/eu-config.h
-@@ -163,7 +163,7 @@ asm (".section predict_data, \"aw\"; .previous\n"
- #define ELFUTILS_HEADER(name) <lib##name.h>
- 
- 
--#ifdef SHARED
-+#ifdef SYMBOL_VERSIONING
- # define OLD_VERSION(name, version) \
-   asm (".globl _compat." #version "." #name "\n" \
-        "_compat." #version "." #name " = " #name "\n" \
-@@ -181,8 +181,8 @@ asm (".section predict_data, \"aw\"; .previous\n"
- # define OLD_VERSION(name, version) /* Nothing for static linking.  */
- # define NEW_VERSION(name, version) /* Nothing for static linking.  */
- # define COMPAT_VERSION_NEWPROTO(name, version, prefix) \
--  error "should use #ifdef SHARED"
--# define COMPAT_VERSION(name, version, prefix) error "should use #ifdef SHARED"
-+  error "should use #ifdef SYMBOL_VERSIONING"
-+# define COMPAT_VERSION(name, version, prefix) error "should use #ifdef SYMBOL_VERSIONING"
- #endif
- 
- 
-diff --git a/libdwfl/core-file.c b/libdwfl/core-file.c
-index 324e9d2..bbe0899 100644
---- a/libdwfl/core-file.c
-+++ b/libdwfl/core-file.c
-@@ -588,7 +588,7 @@ dwfl_core_file_report (Dwfl *dwfl, Elf *elf, const char *executable)
- INTDEF (dwfl_core_file_report)
- NEW_VERSION (dwfl_core_file_report, ELFUTILS_0.158)
- 
--#ifdef SHARED
-+#ifdef SYMBOL_VERSIONING
- int _compat_without_executable_dwfl_core_file_report (Dwfl *dwfl, Elf *elf);
- COMPAT_VERSION_NEWPROTO (dwfl_core_file_report, ELFUTILS_0.146,
- 			 without_executable)
-diff --git a/libdwfl/dwfl_module_build_id.c b/libdwfl/dwfl_module_build_id.c
-index 350bbf8..c9a42ca 100644
---- a/libdwfl/dwfl_module_build_id.c
-+++ b/libdwfl/dwfl_module_build_id.c
-@@ -101,7 +101,7 @@ dwfl_module_build_id (Dwfl_Module *mod,
- INTDEF (dwfl_module_build_id)
- NEW_VERSION (dwfl_module_build_id, ELFUTILS_0.138)
- 
--#ifdef SHARED
-+#ifdef SYMBOL_VERSIONING
- COMPAT_VERSION (dwfl_module_build_id, ELFUTILS_0.130, vaddr_at_end)
- 
- int
-diff --git a/libdwfl/dwfl_report_elf.c b/libdwfl/dwfl_report_elf.c
-index 3a4ae2e..624284c 100644
---- a/libdwfl/dwfl_report_elf.c
-+++ b/libdwfl/dwfl_report_elf.c
-@@ -321,7 +321,7 @@ dwfl_report_elf (Dwfl *dwfl, const char *name, const char *file_name, int fd,
- INTDEF (dwfl_report_elf)
- NEW_VERSION (dwfl_report_elf, ELFUTILS_0.156)
- 
--#ifdef SHARED
-+#ifdef SYMBOL_VERSIONING
- Dwfl_Module *
-   _compat_without_add_p_vaddr_dwfl_report_elf (Dwfl *dwfl, const char *name,
- 					       const char *file_name, int fd,
--- 
-1.8.1.4
-
diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index ca93770..cbb5af2 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -5,6 +5,7 @@ comment "elfutils needs a uClibc or (e)glibc toolchain w/ wchar, dynamic library
 
 config BR2_PACKAGE_ELFUTILS
 	bool "elfutils"
+	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	depends on BR2_USE_WCHAR
diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
index 123b7a2..9fa9403 100644
--- a/package/elfutils/elfutils.hash
+++ b/package/elfutils/elfutils.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  570c91a1783fa5386aaa2dfdd08dda1de777c2b63bf3b9c1437d635ffdd7a070  elfutils-0.161.tar.bz2
-sha256  bf0363d03e1e4668778eb4e7ddd10e405a22f753b3ad813a537fc01164d1e3fe  elfutils-portability-0.161.patch
+sha256 3c056914c8a438b210be0d790463b960fc79d234c3f05ce707cbff80e94cba30  elfutils-0.166.tar.bz2
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index cc05618..76b36bc 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-ELFUTILS_VERSION = 0.161
+ELFUTILS_VERSION = 0.166
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://fedorahosted.org/releases/e/l/elfutils/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
 ELFUTILS_LICENSE = GPLv3, GPLv2, LGPLv3
 ELFUTILS_LICENSE_FILES = COPYING COPYING-GPLV2 COPYING-LGPLV3
-ELFUTILS_PATCH = elfutils-portability-0.161.patch
+ELFUTILS_DEPENDENCIES = zlib
 
 # The tarball does not have a generated configure script
 ELFUTILS_AUTORECONF = YES
@@ -44,13 +44,6 @@ ELFUTILS_DEPENDENCIES += argp-standalone
 ELFUTILS_CONF_OPTS += --disable-symbol-versioning
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-ELFUTILS_DEPENDENCIES += zlib
-ELFUTILS_CONF_OPTS += --with-zlib
-else
-ELFUTILS_CONF_OPTS += --without-zlib
-endif
-
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 ELFUTILS_DEPENDENCIES += bzip2
 ELFUTILS_CONF_OPTS += --with-bzlib
