From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 10 Nov 2014 10:45:23 +0000
Subject: [Buildroot] [PATCH 2/2] elfutils: Adapt patches to the new version
In-Reply-To: <1415616323-58155-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1415616323-58155-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1415616323-58155-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...isable-progs.patch => 0001-disable-progs.patch} |   54 ++++++------
 package/elfutils/0002-argp-support.patch           |   92 ++++++++++++++++++++
 ...s-03-memcpy-def.patch => 0003-memcpy-def.patch} |   15 ++--
 .../{elfutils-04-fts.patch => 0004-fts.patch}      |   69 +++++++--------
 package/elfutils/0005-disable-po.patch             |   23 +++++
 package/elfutils/elfutils-02-argp-support.patch    |   92 --------------------
 package/elfutils/elfutils-05-disable-po.patch      |   22 -----
 7 files changed, 183 insertions(+), 184 deletions(-)
 rename package/elfutils/{elfutils-01-disable-progs.patch => 0001-disable-progs.patch} (60%)
 create mode 100644 package/elfutils/0002-argp-support.patch
 rename package/elfutils/{elfutils-03-memcpy-def.patch => 0003-memcpy-def.patch} (58%)
 rename package/elfutils/{elfutils-04-fts.patch => 0004-fts.patch} (97%)
 create mode 100644 package/elfutils/0005-disable-po.patch
 delete mode 100644 package/elfutils/elfutils-02-argp-support.patch
 delete mode 100644 package/elfutils/elfutils-05-disable-po.patch

diff --git a/package/elfutils/elfutils-01-disable-progs.patch b/package/elfutils/0001-disable-progs.patch
similarity index 60%
rename from package/elfutils/elfutils-01-disable-progs.patch
rename to package/elfutils/0001-disable-progs.patch
index 462de89..b66252d 100644
--- a/package/elfutils/elfutils-01-disable-progs.patch
+++ b/package/elfutils/0001-disable-progs.patch
@@ -7,35 +7,17 @@ useful because the programs are often not needed, and also because
 building the programs against uClibc causes several issues (lack of
 obstack_printf() in uClibc for example).
 
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile.am
-===================================================================
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -22,9 +22,13 @@
- 
- pkginclude_HEADERS = version.h
- 
-+if ENABLE_PROGS
-+PROGS_SUBDIR = src
-+endif
-+
- # Add doc back when we have some real content.
- SUBDIRS = config m4 lib libelf libebl libdwfl libdw libcpu libasm backends \
--	  src po tests
-+	  $(PROGS_SUBDIR) po tests
- 
- EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
- 	     COPYING COPYING-GPLV2 COPYING-LGPLV3
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -263,6 +263,12 @@
+Based on the former patch by Thomas Petazzoni.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -rup a/configure.ac b/configure.ac
+--- a/configure.ac	2014-11-07 14:54:32.859360779 +0000
++++ b/configure.ac	2014-11-07 14:47:44.847376394 +0000
+@@ -253,6 +253,12 @@ AC_SUBST([LIBEBL_SUBDIR])
  AC_DEFINE_UNQUOTED(LIBEBL_SUBDIR, "$LIBEBL_SUBDIR")
  AH_TEMPLATE([LIBEBL_SUBDIR], [$libdir subdirectory containing libebl modules.])
- 
+
 +AC_ARG_ENABLE([progs],
 +	AS_HELP_STRING([--enable-progs], [enable progs]),
 +	enable_progs=$enableval,
@@ -45,3 +27,21 @@ Index: b/configure.ac
  dnl Test for zlib and bzlib, gives ZLIB/BZLIB .am
  dnl conditional and config.h USE_ZLIB/USE_BZLIB #define.
  save_LIBS="$LIBS"
+diff -rup a/Makefile.am b/Makefile.am
+--- a/Makefile.am	2014-08-27 10:25:17.000000000 +0100
++++ b/Makefile.am	2014-11-07 14:51:38.081368550 +0000
+@@ -22,9 +22,13 @@ ACLOCAL_AMFLAGS = -I m4
+
+ pkginclude_HEADERS = version.h
+
++if ENABLE_PROGS
++PROGS_SUBDIR = src
++endif
++
+ # Add doc back when we have some real content.
+ SUBDIRS = config m4 lib libelf libebl libdwelf libdwfl libdw libcpu libasm \
+-	  backends src po tests
++	  backends $(PROGS_SUBDIR) po tests
+
+ EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
+	     COPYING COPYING-GPLV2 COPYING-LGPLV3
diff --git a/package/elfutils/0002-argp-support.patch b/package/elfutils/0002-argp-support.patch
new file mode 100644
index 0000000..31a79d0
--- /dev/null
+++ b/package/elfutils/0002-argp-support.patch
@@ -0,0 +1,92 @@
+Allow the usage of an external implementation of the argp functions
+
+uClibc lack the argp family of functions that glibc has. Therefore, we
+add a check in the configure script to see if argp_parse is available
+in the C library. If not, we look if it is available in the additional
+'argp' library. If so, we link against that library. If not, we error
+out.
+
+This allows to build elfutils against uClibc with an external argp
+library.
+
+Based on the former patch by Thomas Petazzoni.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -rup a/configure.ac b/configure.ac
+--- a/configure.ac	2014-11-07 15:00:38.663627402 +0000
++++ b/configure.ac	2014-11-07 15:02:30.233539737 +0000
+@@ -259,6 +259,13 @@ AC_ARG_ENABLE([progs],
+	enable_progs=yes)
+ AM_CONDITIONAL(ENABLE_PROGS, test "$enable_progs" = yes)
+
++AC_CHECK_FUNC([argp_parse])
++if test "$ac_cv_func_argp_parse" != yes; then
++	AC_CHECK_LIB([argp],[argp_parse],ARGP_LIBS=-largp,
++		AC_MSG_ERROR([No argp_parse function available.]))
++fi
++AC_SUBST(ARGP_LIBS)
++
+ dnl Test for zlib and bzlib, gives ZLIB/BZLIB .am
+ dnl conditional and config.h USE_ZLIB/USE_BZLIB #define.
+ save_LIBS="$LIBS"
+diff -rup a/libdw/Makefile.am b/libdw/Makefile.am
+--- a/libdw/Makefile.am	2014-08-27 10:25:17.000000000 +0100
++++ b/libdw/Makefile.am	2014-11-07 15:09:32.804794962 +0000
+@@ -110,7 +110,7 @@ libdw.so$(EXEEXT): $(srcdir)/libdw.map l
+		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
+		-Wl,--version-script,$<,--no-undefined \
+		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
+-		-ldl $(zip_LIBS)
++		-ldl $(zip_LIBS) $(ARGP_LIBS)
+	if $(READELF) -d $@ | fgrep -q TEXTREL; then exit 1; fi
+	ln -fs $@ $@.$(VERSION)
+
+diff -rup a/src/Makefile.am b/src/Makefile.am
+--- a/src/Makefile.am	2014-11-07 15:00:35.867579484 +0000
++++ b/src/Makefile.am	2014-11-07 15:08:47.380013980 +0000
+@@ -94,27 +94,29 @@ readelf_no_Werror = yes
+ strings_no_Werror = yes
+ addr2line_no_Wformat = yes
+
+-readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) -ldl
++readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) -ldl $(ARGP_LIBS)
+ nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) -ldl \
+-	   $(demanglelib)
+-size_LDADD = $(libelf) $(libeu)
+-strip_LDADD = $(libebl) $(libelf) $(libeu) -ldl
+-ld_LDADD = $(libebl) $(libelf) $(libeu) -ldl
++	   $(demanglelib) $(ARGP_LIBS)
++size_LDADD = $(libelf) $(libeu) $(ARGP_LIBS)
++strip_LDADD = $(libebl) $(libelf) $(libeu) -ldl $(ARGP_LIBS)
++ld_LDADD = $(libebl) $(libelf) $(libeu) -ldl $(ARGP_LIBS)
+ if NATIVE_LD
+ # -ldl is always needed for libebl.
+ ld_LDADD += libld_elf.a
+ endif
+ ld_LDFLAGS = -rdynamic
+-elflint_LDADD  = $(libebl) $(libelf) $(libeu) -ldl
+-findtextrel_LDADD = $(libdw) $(libelf)
+-addr2line_LDADD = $(libdw) $(libelf)
+-elfcmp_LDADD = $(libebl) $(libelf) -ldl
+-objdump_LDADD  = $(libasm) $(libebl) $(libelf) $(libeu) -ldl
+-ranlib_LDADD = libar.a $(libelf) $(libeu)
+-strings_LDADD = $(libelf) $(libeu)
+-ar_LDADD = libar.a $(libelf) $(libeu)
+-unstrip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) -ldl
+-stack_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) -ldl $(demanglelib)
++elflint_LDADD  = $(libebl) $(libelf) $(libeu) -ldl $(ARGP_LIBS)
++findtextrel_LDADD = $(libdw) $(libelf) $(ARGP_LIBS)
++addr2line_LDADD = $(libdw) $(libelf) $(ARGP_LIBS)
++elfcmp_LDADD = $(libebl) $(libelf) -ldl $(ARGP_LIBS)
++objdump_LDADD  = $(libasm) $(libebl) $(libelf) $(libeu) -ldl \
++	$(ARGP_LIBS)
++ranlib_LDADD = libar.a $(libelf) $(libeu) $(ARGP_LIBS)
++strings_LDADD = $(libelf) $(libeu) $(ARGP_LIBS)
++ar_LDADD = libar.a $(libelf) $(libeu) $(ARGP_LIBS)
++unstrip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) -ldl $(ARGP_LIBS)
++stack_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) -ldl \
++	$(demanglelib) $(ARGP_LIBS)
+
+ ldlex.o: ldscript.c
+ ldlex_no_Werror = yes
diff --git a/package/elfutils/elfutils-03-memcpy-def.patch b/package/elfutils/0003-memcpy-def.patch
similarity index 58%
rename from package/elfutils/elfutils-03-memcpy-def.patch
rename to package/elfutils/0003-memcpy-def.patch
index eb50cf6..ce28003 100644
--- a/package/elfutils/elfutils-03-memcpy-def.patch
+++ b/package/elfutils/0003-memcpy-def.patch
@@ -4,21 +4,22 @@ For some reason, libelf uses the internal glibc alias __memcpy, which
 doesn't exist in uClibc. Add a manual alias so that the build can
 proceed with uClibc.
 
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Based on the former patch by Thomas Petazzoni.
 
-Index: b/libelf/libelf.h
-===================================================================
---- a/libelf/libelf.h
-+++ b/libelf/libelf.h
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -rup a/libelf/libelf.h b/libelf/libelf.h
+--- a/libelf/libelf.h	2014-08-27 10:25:17.000000000 +0100
++++ b/libelf/libelf.h	2014-11-07 15:13:08.743508221 +0000
 @@ -34,6 +34,11 @@
  /* Get the ELF types.  */
  #include <elf.h>
- 
+
 +#ifndef _LIBC
 +#ifndef __mempcpy
 +#define __mempcpy mempcpy
 +#endif
 +#endif
- 
+
  /* Known translation types.  */
  typedef enum
diff --git a/package/elfutils/elfutils-04-fts.patch b/package/elfutils/0004-fts.patch
similarity index 97%
rename from package/elfutils/elfutils-04-fts.patch
rename to package/elfutils/0004-fts.patch
index 7318236..2653b7c 100644
--- a/package/elfutils/elfutils-04-fts.patch
+++ b/package/elfutils/0004-fts.patch
@@ -22,16 +22,17 @@ So we have several options here:
 Of course, the fts_*() functions are only built if they are not
 already provided by the C library.
 
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Based on the former patch by Thomas Petazzoni.
 
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -276,6 +276,10 @@
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -Nrup a/configure.ac b/configure.ac
+--- a/configure.ac	2014-11-07 15:14:42.402119092 +0000
++++ b/configure.ac	2014-11-07 15:16:50.161316781 +0000
+@@ -266,6 +266,10 @@ if test "$ac_cv_func_argp_parse" != yes;
  fi
  AC_SUBST(ARGP_LIBS)
- 
+
 +AC_CHECK_HEADER([fts.h],
 +	AC_DEFINE([HAVE_FTS_H], [], [Define if <fts.h> is available in C library]))
 +AM_CONDITIONAL(HAVE_FTS, test "$ac_cv_header_fts_h" = yes)
@@ -39,24 +40,9 @@ Index: b/configure.ac
  dnl Test for zlib and bzlib, gives ZLIB/BZLIB .am
  dnl conditional and config.h USE_ZLIB/USE_BZLIB #define.
  save_LIBS="$LIBS"
-Index: b/libdwfl/Makefile.am
-===================================================================
---- a/libdwfl/Makefile.am
-+++ b/libdwfl/Makefile.am
-@@ -79,6 +79,9 @@
- if LZMA
- libdwfl_a_SOURCES += lzma.c
- endif
-+if !HAVE_FTS
-+libdwfl_a_SOURCES += fts.c
-+endif
- 
- if MUDFLAP
- libdwfl = libdwfl.a $(libdw) $(libebl) $(libelf) $(libeu)
-Index: b/libdwfl/fts.c
-===================================================================
---- /dev/null
-+++ b/libdwfl/fts.c
+diff -Nrup a/libdwfl/fts.c b/libdwfl/fts.c
+--- a/libdwfl/fts.c	1970-01-01 01:00:00.000000000 +0100
++++ b/libdwfl/fts.c	2014-11-07 15:25:08.325879956 +0000
 @@ -0,0 +1,1095 @@
 +/*-
 + * Copyright (c) 1990, 1993, 1994
@@ -1153,10 +1139,9 @@ Index: b/libdwfl/fts.c
 +	errno = oerrno;
 +	return (ret);
 +}
-Index: b/libdwfl/fts_.h
-===================================================================
---- /dev/null
-+++ b/libdwfl/fts_.h
+diff -Nrup a/libdwfl/fts_.h b/libdwfl/fts_.h
+--- a/libdwfl/fts_.h	1970-01-01 01:00:00.000000000 +0100
++++ b/libdwfl/fts_.h	2014-11-07 15:26:00.806777392 +0000
 @@ -0,0 +1,131 @@
 +/*
 + * Copyright (c) 1989, 1993
@@ -1289,19 +1274,31 @@ Index: b/libdwfl/fts_.h
 +__END_DECLS
 +
 +#endif /* fts.h */
-Index: b/libdwfl/linux-kernel-modules.c
-===================================================================
---- a/libdwfl/linux-kernel-modules.c
-+++ b/libdwfl/linux-kernel-modules.c
+diff -Nrup a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
+--- a/libdwfl/linux-kernel-modules.c	2014-08-27 10:25:17.000000000 +0100
++++ b/libdwfl/linux-kernel-modules.c	2014-11-07 15:27:10.783974209 +0000
 @@ -29,7 +29,11 @@
  /* We include this before config.h because it can't handle _FILE_OFFSET_BITS.
     Everything we need here is fine if its declarations just come first.  */
- 
+
 +#ifdef HAVE_FTS_H
  #include <fts.h>
 +#else
 +#include "fts_.h"
 +#endif
- 
+
  #include <config.h>
- 
+
+diff -Nrup a/libdwfl/Makefile.am b/libdwfl/Makefile.am
+--- a/libdwfl/Makefile.am	2014-08-27 10:25:17.000000000 +0100
++++ b/libdwfl/Makefile.am	2014-11-07 15:17:57.682478408 +0000
+@@ -79,6 +79,9 @@ endif
+ if LZMA
+ libdwfl_a_SOURCES += lzma.c
+ endif
++if !HAVE_FTS
++libdwfl_a_SOURCES += fts.c
++endif
+
+ libdwfl = $(libdw)
+ libdw = ../libdw/libdw.so
diff --git a/package/elfutils/0005-disable-po.patch b/package/elfutils/0005-disable-po.patch
new file mode 100644
index 0000000..638dc0d
--- /dev/null
+++ b/package/elfutils/0005-disable-po.patch
@@ -0,0 +1,23 @@
+Disable the build of the po/ directory
+
+Building the po/ directory complains that the scripts in there have
+been generated with gettext 0.17, while we use gettext 0.18 in
+Buildroot. Since we don't care that much about po files anyway, just
+disable the build of this directory.
+
+Based on the former patch by Thomas Petazzoni.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -rup a/Makefile.am b/Makefile.am
+--- a/Makefile.am	2014-11-07 15:14:39.018060884 +0000
++++ b/Makefile.am	2014-11-07 15:30:02.864918229 +0000
+@@ -28,7 +28,7 @@ endif
+
+ # Add doc back when we have some real content.
+ SUBDIRS = config m4 lib libelf libebl libdwelf libdwfl libdw libcpu libasm \
+-	  backends $(PROGS_SUBDIR) po tests
++	  backends $(PROGS_SUBDIR) tests
+
+ EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
+	     COPYING COPYING-GPLV2 COPYING-LGPLV3
diff --git a/package/elfutils/elfutils-02-argp-support.patch b/package/elfutils/elfutils-02-argp-support.patch
deleted file mode 100644
index f81ac8f..0000000
--- a/package/elfutils/elfutils-02-argp-support.patch
+++ /dev/null
@@ -1,92 +0,0 @@
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
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -269,6 +269,13 @@
- 	enable_progs=yes)
- AM_CONDITIONAL(ENABLE_PROGS, test "$enable_progs" = yes)
- 
-+AC_CHECK_FUNC([argp_parse])
-+if test "$ac_cv_func_argp_parse" != yes; then
-+   AC_CHECK_LIB([argp],[argp_parse],ARGP_LIBS=-largp,
-+		AC_MSG_ERROR([No argp_parse function available.]))
-+fi
-+AC_SUBST(ARGP_LIBS)
-+
- dnl Test for zlib and bzlib, gives ZLIB/BZLIB .am
- dnl conditional and config.h USE_ZLIB/USE_BZLIB #define.
- save_LIBS="$LIBS"
-Index: b/src/Makefile.am
-===================================================================
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -98,26 +98,29 @@
- # Buggy old compilers.
- readelf_no_Werror = yes
- 
--readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
-+readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl \
-+	$(ARGP_LIBS)
- nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl \
--	   $(demanglelib)
--size_LDADD = $(libelf) $(libeu) $(libmudflap)
--strip_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
--ld_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
-+	   $(demanglelib) $(ARGP_LIBS)
-+size_LDADD = $(libelf) $(libeu) $(libmudflap) $(ARGP_LIBS)
-+strip_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl $(ARGP_LIBS)
-+ld_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl $(ARGP_LIBS)
- if NATIVE_LD
- # -ldl is always needed for libebl.
- ld_LDADD += libld_elf.a
- endif
- ld_LDFLAGS = -rdynamic
--elflint_LDADD  = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
--findtextrel_LDADD = $(libdw) $(libelf) $(libmudflap)
--addr2line_LDADD = $(libdw) $(libelf) $(libmudflap)
--elfcmp_LDADD = $(libebl) $(libelf) $(libmudflap) -ldl
--objdump_LDADD  = $(libasm) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
--ranlib_LDADD = libar.a $(libelf) $(libeu) $(libmudflap)
--strings_LDADD = $(libelf) $(libeu) $(libmudflap)
--ar_LDADD = libar.a $(libelf) $(libeu) $(libmudflap)
--unstrip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(libmudflap) -ldl
-+elflint_LDADD  = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl $(ARGP_LIBS)
-+findtextrel_LDADD = $(libdw) $(libelf) $(libmudflap) $(ARGP_LIBS)
-+addr2line_LDADD = $(libdw) $(libelf) $(libmudflap) $(ARGP_LIBS)
-+elfcmp_LDADD = $(libebl) $(libelf) $(libmudflap) -ldl $(ARGP_LIBS)
-+objdump_LDADD  = $(libasm) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl \
-+	$(ARGP_LIBS)
-+ranlib_LDADD = libar.a $(libelf) $(libeu) $(libmudflap) $(ARGP_LIBS)
-+strings_LDADD = $(libelf) $(libeu) $(libmudflap) $(ARGP_LIBS)
-+ar_LDADD = libar.a $(libelf) $(libeu) $(libmudflap) $(ARGP_LIBS)
-+unstrip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(libmudflap) -ldl \
-+	$(ARGP_LIBS)
- 
- ldlex.o: ldscript.c
- ldlex_no_Werror = yes
-Index: b/libdw/Makefile.am
-===================================================================
---- a/libdw/Makefile.am
-+++ b/libdw/Makefile.am
-@@ -111,7 +111,7 @@
- 		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
- 		-Wl,--version-script,$<,--no-undefined \
- 		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
--		-ldl $(zip_LIBS)
-+		-ldl $(zip_LIBS) $(ARGP_LIBS)
- 	if readelf -d $@ | fgrep -q TEXTREL; then exit 1; fi
- 	ln -fs $@ $@.$(VERSION)
- 
diff --git a/package/elfutils/elfutils-05-disable-po.patch b/package/elfutils/elfutils-05-disable-po.patch
deleted file mode 100644
index d98da0b..0000000
--- a/package/elfutils/elfutils-05-disable-po.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Disable the build of the po/ directory
-
-Building the po/ directory complains that the scripts in there have
-been generated with gettext 0.17, while we use gettext 0.18 in
-Buildroot. Since we don't care that much about po files anyway, just
-disable the build of this directory.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile.am
-===================================================================
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -28,7 +28,7 @@
- 
- # Add doc back when we have some real content.
- SUBDIRS = config m4 lib libelf libebl libdwfl libdw libcpu libasm backends \
--	  $(PROGS_SUBDIR) po tests
-+	  $(PROGS_SUBDIR) tests
- 
- EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
- 	     COPYING COPYING-GPLV2 COPYING-LGPLV3
-- 
1.7.1
