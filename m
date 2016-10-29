From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Oct 2016 14:12:13 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libfribidi: remove optional
	dependency to libglib
Message-ID: <20161029121213.25695-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes vdr compile error:
http://autobuild.buildroot.net/results/725/7252decffe29e19051eed0554786651aee216573/

Instead of fixing fribidi.pc or adding optional CFLAGS to the vdr
package we remove the optional libglib dependency as proposed by an
pull request.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added patch 0003 to fix fribidi.pc

 package/libfribidi/0001-minor.patch                |  49 ++
 package/libfribidi/0002-drop-glib.patch            | 643 +++++++++++++++++++++
 ...in-remove-MISC_PACKAGES-follow-up-patch-t.patch |  29 +
 package/libfribidi/libfribidi.mk                   |   7 +-
 4 files changed, 722 insertions(+), 6 deletions(-)
 create mode 100644 package/libfribidi/0001-minor.patch
 create mode 100644 package/libfribidi/0002-drop-glib.patch
 create mode 100644 package/libfribidi/0003-fribidi.pc.in-remove-MISC_PACKAGES-follow-up-patch-t.patch

diff --git a/package/libfribidi/0001-minor.patch b/package/libfribidi/0001-minor.patch
new file mode 100644
index 0000000..97e0cbf
--- /dev/null
+++ b/package/libfribidi/0001-minor.patch
@@ -0,0 +1,49 @@
+From 7fd7d2badedffce5a3328301ba86204a24eed0a3 Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Thu, 26 Nov 2015 18:12:29 -0500
+Subject: [PATCH] Minor
+
+Downloaded from upstream commit:
+https://github.com/behdad/fribidi/commit/7fd7d2badedffce5a3328301ba86204a24eed0a3.patch
+
+This patch is needed to apply the patch from
+https://github.com/behdad/fribidi/pull/14
+to remove the glib dependency.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+
+ lib/common.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/common.h b/lib/common.h
+index 3e484b0..10ca13c 100644
+--- a/lib/common.h
++++ b/lib/common.h
+@@ -113,7 +113,7 @@
+ # define fribidi_free free
+ #else /* fribidi_malloc */
+ # ifndef fribidi_free
+-#  error You should define fribidi_free too when you define fribidi_malloc.
++#  error "lYou should define fribidi_free too when you define fribidi_malloc."
+ # endif	/* !fribidi_free */
+ #endif /* fribidi_malloc */
+ 
+@@ -140,7 +140,7 @@
+ # endif	/* !HAVE_ASM_PAGE_H */
+ #else /* FRIBIDI_CHUNK_SIZE */
+ # if FRIBIDI_CHUNK_SIZE < 256
+-#  error FRIBIDI_CHUNK_SIZE now should define the size of a chunk in bytes.
++#  error "FRIBIDI_CHUNK_SIZE now should define the size of a chunk in bytes."
+ # endif	/* FRIBIDI_CHUNK_SIZE < 256 */
+ #endif /* FRIBIDI_CHUNK_SIZE */
+ 
+@@ -166,7 +166,7 @@
+ #if HAVE_STRINGIZE+0
+ # define STRINGIZE(symbol) #symbol
+ #else /* !HAVE_STRINGIZE */
+-# define STRINGIZE(symbol) (no stringize operator available)
++#  error "No stringize operator available?"
+ #endif /* !HAVE_STRINGIZE */
+ 
+ /* As per recommendation of GNU Coding Standards. */
diff --git a/package/libfribidi/0002-drop-glib.patch b/package/libfribidi/0002-drop-glib.patch
new file mode 100644
index 0000000..7aa5bee
--- /dev/null
+++ b/package/libfribidi/0002-drop-glib.patch
@@ -0,0 +1,643 @@
+From 8e991bb1a3842f10995773dd086450e5709a0b06 Mon Sep 17 00:00:00 2001
+From: Khaled Hosny <khaledhosny@eglug.org>
+Date: Fri, 8 Jan 2016 15:59:26 +0400
+Subject: [PATCH 1/7] Typo
+
+Downloaded from upstream PR: https://github.com/behdad/fribidi/pull/14
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+---
+ lib/common.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/common.h b/lib/common.h
+index 10ca13c..055f935 100644
+--- a/lib/common.h
++++ b/lib/common.h
+@@ -113,7 +113,7 @@
+ # define fribidi_free free
+ #else /* fribidi_malloc */
+ # ifndef fribidi_free
+-#  error "lYou should define fribidi_free too when you define fribidi_malloc."
++#  error "You should define fribidi_free too when you define fribidi_malloc."
+ # endif	/* !fribidi_free */
+ #endif /* fribidi_malloc */
+ 
+
+From 4f8dcc39277f2aa5cf2e34860bf5d5dc20b7c635 Mon Sep 17 00:00:00 2001
+From: Khaled Hosny <khaledhosny@eglug.org>
+Date: Fri, 8 Jan 2016 15:57:43 +0400
+Subject: [PATCH 2/7] Provide non-Glib definition for LIKELY/UNLIKELY
+
+---
+ lib/common.h | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/lib/common.h b/lib/common.h
+index 055f935..adbf211 100644
+--- a/lib/common.h
++++ b/lib/common.h
+@@ -155,8 +155,22 @@
+ /* LIKEYLY and UNLIKELY are used to give a hint on branch prediction to the
+  * compiler. */
+ #ifndef LIKELY
+-# define LIKELY
+-# define UNLIKELY
++# ifdef __GNUC__
++#  define FRIBIDI_BOOLEAN_EXPR(expr)              \
++   __extension__ ({                               \
++     int fribidi_bool_var;                        \
++     if (expr)                                    \
++        fribidi_bool_var = 1;                     \
++     else                                         \
++        fribidi_bool_var = 0;                     \
++     fribidi_bool_var;                            \
++   })
++#  define LIKELY(expr) (__builtin_expect (FRIBIDI_BOOLEAN_EXPR(expr), 1))
++#  define UNLIKELY(expr) (__builtin_expect (FRIBIDI_BOOLEAN_EXPR(expr), 0))
++# else
++#  define LIKELY
++#  define UNLIKELY
++# endif /* _GNUC_ */
+ #endif /* !LIKELY */
+ 
+ #ifndef FRIBIDI_EMPTY_STMT
+
+From 88d5fba391d242e7cafb292903ba4cf412b55db9 Mon Sep 17 00:00:00 2001
+From: Khaled Hosny <khaledhosny@eglug.org>
+Date: Fri, 8 Jan 2016 23:03:01 +0400
+Subject: [PATCH 3/7] These definition does not depend on Glib
+
+---
+ lib/fribidi-common.h | 24 +++++++++++-------------
+ 1 file changed, 11 insertions(+), 13 deletions(-)
+
+diff --git a/lib/fribidi-common.h b/lib/fribidi-common.h
+index ffcb27a..12afb6a 100644
+--- a/lib/fribidi-common.h
++++ b/lib/fribidi-common.h
+@@ -64,25 +64,23 @@
+ # define FRIBIDI_END_DECLS		G_END_DECLS
+ # define FRIBIDI_GNUC_CONST		G_GNUC_CONST
+ # define FRIBIDI_GNUC_DEPRECATED	G_GNUC_DEPRECATED
+-# if __GNUC__ > 2
+-#  define FRIBIDI_GNUC_WARN_UNUSED	\
+-	__attribute__((__warn_unused_result__))
+-#  define FRIBIDI_GNUC_MALLOC		\
+-	__attribute__((__malloc__))
+-#  define FRIBIDI_GNUC_HIDDEN		\
+-	__attribute__((__visibility__ ("hidden")))
+-# else /* __GNUC__ <= 2 */
+-#  define FRIBIDI_GNUC_WARN_UNUSED
+-#  define FRIBIDI_GNUC_MALLOC
+-#  define FRIBIDI_GNUC_HIDDEN
+-# endif	/* __GNUC__ <= 2 */
+ #else /* !FRIBIDI_USE_GLIB */
+ # define FRIBIDI_GNUC_CONST
+ # define FRIBIDI_GNUC_DEPRECATED
++#endif /* !FRIBIDI_USE_GLIB */
++
++#ifdef __GNUC__
++# define FRIBIDI_GNUC_WARN_UNUSED	\
++       __attribute__((__warn_unused_result__))
++# define FRIBIDI_GNUC_MALLOC		\
++       __attribute__((__malloc__))
++# define FRIBIDI_GNUC_HIDDEN		\
++       __attribute__((__visibility__ ("hidden")))
++#else /* __GNUC__ */
+ # define FRIBIDI_GNUC_WARN_UNUSED
+ # define FRIBIDI_GNUC_MALLOC
+ # define FRIBIDI_GNUC_HIDDEN
+-#endif /* !FRIBIDI_USE_GLIB */
++#endif	/* __GNUC__ */
+ 
+ /* FRIBIDI_BEGIN_DECLS should be used at the beginning of your declarations,
+  * so that C++ compilers don't mangle their names.  Use FRIBIDI_END_DECLS at
+
+From c46772a6e7b5f0e8251e5c0edd2585388e3a7e40 Mon Sep 17 00:00:00 2001
+From: Khaled Hosny <khaledhosny@eglug.org>
+Date: Fri, 8 Jan 2016 23:08:43 +0400
+Subject: [PATCH 4/7] Just use the GCC attribute here directly as well
+
+---
+ lib/fribidi-common.h | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/lib/fribidi-common.h b/lib/fribidi-common.h
+index 12afb6a..2c80882 100644
+--- a/lib/fribidi-common.h
++++ b/lib/fribidi-common.h
+@@ -62,11 +62,6 @@
+ # endif	/* !__FRIBIDI_DOC */
+ # define FRIBIDI_BEGIN_DECLS		G_BEGIN_DECLS
+ # define FRIBIDI_END_DECLS		G_END_DECLS
+-# define FRIBIDI_GNUC_CONST		G_GNUC_CONST
+-# define FRIBIDI_GNUC_DEPRECATED	G_GNUC_DEPRECATED
+-#else /* !FRIBIDI_USE_GLIB */
+-# define FRIBIDI_GNUC_CONST
+-# define FRIBIDI_GNUC_DEPRECATED
+ #endif /* !FRIBIDI_USE_GLIB */
+ 
+ #ifdef __GNUC__
+@@ -76,10 +71,16 @@
+        __attribute__((__malloc__))
+ # define FRIBIDI_GNUC_HIDDEN		\
+        __attribute__((__visibility__ ("hidden")))
++# define FRIBIDI_GNUC_CONST             \
++       __attribute__((__const__))
++# define FRIBIDI_GNUC_DEPRECATED        \
++       __attribute__((__unused__))
+ #else /* __GNUC__ */
+ # define FRIBIDI_GNUC_WARN_UNUSED
+ # define FRIBIDI_GNUC_MALLOC
+ # define FRIBIDI_GNUC_HIDDEN
++# define FRIBIDI_GNUC_CONST
++# define FRIBIDI_GNUC_DEPRECATED
+ #endif	/* __GNUC__ */
+ 
+ /* FRIBIDI_BEGIN_DECLS should be used at the beginning of your declarations,
+
+From 0b6cd9e42ba28aae440f7e9b05e6fc84b2be7f2b Mon Sep 17 00:00:00 2001
+From: Khaled Hosny <khaledhosny@eglug.org>
+Date: Fri, 8 Jan 2016 23:24:42 +0400
+Subject: [PATCH 5/7] Drop Glib dependency
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+We weren?t using it for any thing substantial that justifies the
+dependency and already had fallback code for most of Glib uses, the
+remaining bit were added in the previous commits the need for Glib less
+so.
+---
+ README                      |  5 ++---
+ bin/Makefile.am             |  5 ++---
+ charset/Makefile.am         |  3 +--
+ charset/fribidi-char-sets.c | 11 +++--------
+ configure.ac                | 34 ----------------------------------
+ gen.tab/Makefile.am         |  5 +----
+ lib/Makefile.am             |  4 ++--
+ lib/common.h                | 39 ---------------------------------------
+ lib/fribidi-common.h        |  8 --------
+ lib/fribidi-config.h.in     |  3 ---
+ lib/fribidi-types.h         | 14 --------------
+ lib/fribidi.c               |  5 -----
+ 12 files changed, 11 insertions(+), 125 deletions(-)
+
+diff --git a/README b/README
+index 16b7a10..54536e8 100644
+--- a/README
++++ b/README
+@@ -24,9 +24,8 @@ and GNOME using GNU FriBidi), AbiWord, MLTerm, MPlayer, and BiCon.
+ Dependencies
+ ============
+ 
+-Currently GNU FriBidi does not depend on any other library, but uses Glib if
+-available.  It uses GNU Build System for build and installation on POSIX
+-systems.
++Currently GNU FriBidi does not depend on any other library.  It uses GNU Build
++System for build and installation on POSIX systems.
+ 
+ Downloading
+ ===========
+diff --git a/bin/Makefile.am b/bin/Makefile.am
+index fd495ad..7aab22e 100644
+--- a/bin/Makefile.am
++++ b/bin/Makefile.am
+@@ -14,10 +14,9 @@ fribidi_benchmark_SOURCES = fribidi-benchmark.c $(getopt_SOURCES)
+ AM_CPPFLAGS = \
+ 		-I$(top_builddir)/lib \
+ 		-I$(top_srcdir)/lib \
+-		-I$(top_srcdir)/charset \
+-		$(MISC_CFLAGS)
++		-I$(top_srcdir)/charset
+ 
+-LDADD = $(top_builddir)/lib/libfribidi.la $(MISC_LIBS)
++LDADD = $(top_builddir)/lib/libfribidi.la
+ 
+ if FRIBIDI_CHARSETS
+ else # !FRIBIDI_CHARSETS
+diff --git a/charset/Makefile.am b/charset/Makefile.am
+index 6caf121..3709c1d 100644
+--- a/charset/Makefile.am
++++ b/charset/Makefile.am
+@@ -2,8 +2,7 @@ noinst_LTLIBRARIES = libfribidi-char-sets.la
+ 
+ AM_CPPFLAGS = \
+ 		-I$(top_builddir)/lib \
+-		-I$(top_srcdir)/lib \
+-		$(MISC_CFLAGS)
++		-I$(top_srcdir)/lib
+ 
+ pkginclude_HEADERS =
+ 
+diff --git a/charset/fribidi-char-sets.c b/charset/fribidi-char-sets.c
+index 214105f..63f7c44 100644
+--- a/charset/fribidi-char-sets.c
++++ b/charset/fribidi-char-sets.c
+@@ -113,12 +113,8 @@ static FriBidiCharSetHandler char_sets[FRIBIDI_CHAR_SETS_NUM + 1] = {
+ # undef _FRIBIDI_ADD_CHAR_SET_ONE2ONE
+ };
+ 
+-#if FRIBIDI_USE_GLIB+0
+-# include <glib.h>
+-# define fribidi_strcasecmp g_ascii_strcasecmp
+-#else /* !FRIBIDI_USE_GLIB */
+ static char
+-toupper (
++fribidi_toupper (
+   /* input */
+   char c
+ )
+@@ -133,14 +129,13 @@ fribidi_strcasecmp (
+   const char *s2
+ )
+ {
+-  while (*s1 && toupper (*s1) == toupper (*s2))
++  while (*s1 && fribidi_toupper (*s1) == fribidi_toupper (*s2))
+     {
+       s1++;
+       s2++;
+     }
+-  return toupper (*s1) - toupper (*s2);
++  return fribidi_toupper (*s1) - fribidi_toupper (*s2);
+ }
+-#endif /* !FRIBIDI_USE_GLIB */
+ 
+ FRIBIDI_ENTRY FriBidiCharSet
+ fribidi_parse_charset (
+diff --git a/configure.ac b/configure.ac
+index ac80e09..ccb5475 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -167,40 +167,6 @@ fi
+ AC_SUBST(FRIBIDI_CHARSETS)
+ AM_CONDITIONAL(FRIBIDI_CHARSETS, test x$FRIBIDI_CHARSETS = x1)
+ 
+-# --with[out]-glib
+-AC_ARG_WITH(glib,
+-              AC_HELP_STRING([--with-glib=@<:@no/auto/yes@:>@],
+-                             [use Glib @<:@default=auto@:>@]))
+-GLIB_PACKAGE=glib-2.0
+-GLIB_MINVERSION=2.4
+-GLIB_LIBS=
+-GLIB_CFLAGS=
+-if test x$with_glib = xyes; then
+-	PKG_CHECK_MODULES(GLIB,$GLIB_PACKAGE >= $GLIB_MINVERSION)
+-	FRIBIDI_USE_GLIB=1
+-else
+-if test x$with_glib = xno; then
+-	FRIBIDI_USE_GLIB=0
+-else
+-	PKG_CHECK_MODULES(GLIB,$GLIB_PACKAGE >= $GLIB_MINVERSION,
+-		FRIBIDI_USE_GLIB=1,
+-		FRIBIDI_USE_GLIB=0)
+-fi
+-fi
+-if test x$FRIBIDI_USE_GLIB = x0; then
+-	GLIB_PACKAGE=
+-fi
+-AC_SUBST(FRIBIDI_USE_GLIB)
+-AM_CONDITIONAL(FRIBIDI_USE_GLIB, test x$FRIBIDI_USE_GLIB = x1)
+-
+-
+-MISC_CFLAGS="$GLIB_CFLAGS"
+-MISC_LIBS="$GLIB_LIBS"
+-MISC_PACKAGES="$GLIB_PACKAGE"
+-AC_SUBST(MISC_CFLAGS)
+-AC_SUBST(MISC_LIBS)
+-AC_SUBST(MISC_PACKAGES)
+-
+ # Generate output
+ AC_CONFIG_FILES([fribidi.pc
+ 		 lib/fribidi-config.h
+diff --git a/gen.tab/Makefile.am b/gen.tab/Makefile.am
+index 3b185a9..0275a40 100644
+--- a/gen.tab/Makefile.am
++++ b/gen.tab/Makefile.am
+@@ -17,10 +17,7 @@ DISTCLEANFILES =
+ AM_CPPFLAGS = \
+ 		-I$(top_builddir)/lib \
+ 		-I$(top_srcdir)/lib \
+-		-I$(top_srcdir)/charset \
+-		$(MISC_CFLAGS)
+-
+-LDADD = $(MISC_LIBS)
++		-I$(top_srcdir)/charset
+ 
+ VPATH += \
+ 		$(builddir)/unidata \
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 30496b1..646780d 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -2,10 +2,10 @@ EXTRA_DIST = fribidi.def
+ 
+ lib_LTLIBRARIES = libfribidi.la
+ 
+-AM_CPPFLAGS = $(MISC_CFLAGS)
++AM_CPPFLAGS =
+ 
+ libfribidi_la_LDFLAGS = -no-undefined -version-info $(LT_VERSION_INFO)
+-libfribidi_la_LIBADD = $(MISC_LIBS)
++libfribidi_la_LIBADD =
+ libfribidi_la_DEPENDENCIES =
+ 
+ if OS_WIN32
+diff --git a/lib/common.h b/lib/common.h
+index adbf211..4387d8b 100644
+--- a/lib/common.h
++++ b/lib/common.h
+@@ -45,45 +45,6 @@
+ # define FRIBIDI_PRIVATESPACE(SYMBOL) FRIBIDI_PRIVATESPACE0(_,FRIBIDI_NAMESPACE(_##SYMBOL##__internal__))
+ #endif /* !FRIBIDI_PRIVATESPACE */
+ 
+-#if FRIBIDI_USE_GLIB+0
+-# ifndef SIZEOF_LONG
+-#  define SIZEOF_LONG GLIB_SIZEOF_LONG
+-# endif	/* !SIZEOF_LONG */
+-# ifndef SIZEOF_VOID_P
+-#  define SIZEOF_VOID_P GLIB_SIZEOF_VOID_P
+-# endif	/* !SIZEOF_VOID_P */
+-# ifndef __FRIBIDI_DOC
+-#  include <glib.h>
+-# endif	/* !__FRIBIDI_DOC */
+-# ifndef fribidi_malloc
+-#  define fribidi_malloc g_try_malloc
+-#  define fribidi_free g_free
+-# endif	/* !fribidi_malloc */
+-# ifndef fribidi_assert
+-#  ifndef __FRIBIDI_DOC
+-#   include <glib.h>
+-#  endif /* !__FRIBIDI_DOC */
+-#  define fribidi_assert g_assert
+-# endif	/* !fribidi_assert */
+-# ifndef __FRIBIDI_DOC
+-#  include <glib.h>
+-# endif	/* !__FRIBIDI_DOC */
+-# ifndef FRIBIDI_BEGIN_STMT
+-#  define FRIBIDI_BEGIN_STMT G_STMT_START {
+-#  define FRIBIDI_END_STMT } G_STMT_END
+-# endif	/* !FRIBIDI_BEGIN_STMT */
+-# ifndef LIKELY
+-#  define LIKELY G_LIKELY
+-#  define UNLIKELY G_UNLIKELY
+-# endif	/* !LIKELY */
+-# ifndef false
+-#  define false FALSE
+-# endif	/* !false */
+-# ifndef true
+-#  define true TRUE
+-# endif	/* !true */
+-#endif /* FRIBIDI_USE_GLIB */
+-
+ #ifndef false
+ # define false (0)
+ # endif	/* !false */
+diff --git a/lib/fribidi-common.h b/lib/fribidi-common.h
+index 2c80882..8f545d1 100644
+--- a/lib/fribidi-common.h
++++ b/lib/fribidi-common.h
+@@ -56,14 +56,6 @@
+ #  define FRIBIDI_ENTRY		/* empty */
+ #endif /* !FRIBIDI_ENTRY */
+ 
+-#if FRIBIDI_USE_GLIB+0
+-# ifndef __FRIBIDI_DOC
+-#  include <glib.h>
+-# endif	/* !__FRIBIDI_DOC */
+-# define FRIBIDI_BEGIN_DECLS		G_BEGIN_DECLS
+-# define FRIBIDI_END_DECLS		G_END_DECLS
+-#endif /* !FRIBIDI_USE_GLIB */
+-
+ #ifdef __GNUC__
+ # define FRIBIDI_GNUC_WARN_UNUSED	\
+        __attribute__((__warn_unused_result__))
+diff --git a/lib/fribidi-config.h.in b/lib/fribidi-config.h.in
+index 7e10261..4587b65 100644
+--- a/lib/fribidi-config.h.in
++++ b/lib/fribidi-config.h.in
+@@ -17,9 +17,6 @@
+ /* Define to 1 if you want charset conversion codes in the library */
+ #define FRIBIDI_CHARSETS @FRIBIDI_CHARSETS@
+ 
+-/* Define to 1 if you want to use glib */
+-#define FRIBIDI_USE_GLIB @FRIBIDI_USE_GLIB@
+-
+ /* The size of a `int', as computed by sizeof. */
+ #define FRIBIDI_SIZEOF_INT @SIZEOF_INT@
+ 
+diff --git a/lib/fribidi-types.h b/lib/fribidi-types.h
+index 89778df..a72f740 100644
+--- a/lib/fribidi-types.h
++++ b/lib/fribidi-types.h
+@@ -38,19 +38,6 @@
+ #include "fribidi-begindecls.h"
+ 
+ 
+-#if FRIBIDI_USE_GLIB+0
+-# ifndef __FRIBIDI_DOC
+-#  include <glib.h>
+-# endif	/* !__FRIBIDI_DOC */
+-# define FRIBIDI_INT8_LOCAL		gint8
+-# define FRIBIDI_INT16_LOCAL		gint16
+-# define FRIBIDI_INT32_LOCAL		gint32
+-# define FRIBIDI_UINT8_LOCAL		guint8
+-# define FRIBIDI_UINT16_LOCAL		guint16
+-# define FRIBIDI_UINT32_LOCAL		guint32
+-# define FRIBIDI_BOOLEAN_LOCAL		gboolean
+-# define FRIBIDI_UNICHAR_LOCAL		gunichar
+-#else /* !FRIBIDI_USE_GLIB */
+ # if defined(HAVE_INTTYPES_H) || defined(HAVE_STDINT_H)
+ #  ifndef __FRIBIDI_DOC
+ #   if HAVE_INTTYPES_H
+@@ -96,7 +83,6 @@
+ # else /* SIZEOF_WCHAR_T < 4 */
+ #  define FRIBIDI_UNICHAR_LOCAL		fribidi_uint32
+ # endif	/* SIZEOF_WCHAR_T < 4 */
+-#endif /* !FRIBIDI_USE_GLIB */
+ 
+ #if FRIBIDI_INT_TYPES+0
+ #else
+diff --git a/lib/fribidi.c b/lib/fribidi.c
+index 36b84ee..8adac2f 100644
+--- a/lib/fribidi.c
++++ b/lib/fribidi.c
+@@ -82,11 +82,6 @@ const char *fribidi_version_info =
+ #else
+   " --disable-charsets"
+ #endif /* !FRIBIDI_CHARSETS */
+-#if FRIBIDI_USE_GLIB+0
+-  " --with-glib"
+-#else /* !FRIBIDI_USE_GLIB */
+-  " --without-glib"
+-#endif /* !FRIBIDI_USE_GLIB */
+   ".\n\n"
+   "Copyright (C) 2004  Sharif FarsiWeb, Inc.\n"
+   "Copyright (C) 2001, 2002, 2004, 2005  Behdad Esfahbod\n"
+
+From 6d4c8829c6dcb70a19bc74e5919d7d4a426c3f6f Mon Sep 17 00:00:00 2001
+From: Khaled Hosny <khaledhosny@eglug.org>
+Date: Fri, 8 Jan 2016 23:29:42 +0400
+Subject: [PATCH 6/7] Simplify
+
+---
+ lib/fribidi-common.h | 16 +++++-----
+ lib/fribidi-types.h  | 88 ++++++++++++++++++++++++++--------------------------
+ 2 files changed, 51 insertions(+), 53 deletions(-)
+
+diff --git a/lib/fribidi-common.h b/lib/fribidi-common.h
+index 8f545d1..8fac79d 100644
+--- a/lib/fribidi-common.h
++++ b/lib/fribidi-common.h
+@@ -78,15 +78,13 @@
+ /* FRIBIDI_BEGIN_DECLS should be used at the beginning of your declarations,
+  * so that C++ compilers don't mangle their names.  Use FRIBIDI_END_DECLS at
+  * the end of C declarations. */
+-#ifndef FRIBIDI_BEGIN_DECLS
+-# ifdef __cplusplus
+-#  define FRIBIDI_BEGIN_DECLS extern "C" {
+-#  define FRIBIDI_END_DECLS }
+-# else /* !__cplusplus */
+-#  define FRIBIDI_BEGIN_DECLS	/* empty */
+-#  define FRIBIDI_END_DECLS	/* empty */
+-# endif	/* !__cplusplus */
+-#endif /* !FRIBIDI_BEGIN_DECLS */
++#ifdef __cplusplus
++# define FRIBIDI_BEGIN_DECLS extern "C" {
++# define FRIBIDI_END_DECLS }
++#else /* !__cplusplus */
++# define FRIBIDI_BEGIN_DECLS	/* empty */
++# define FRIBIDI_END_DECLS	/* empty */
++#endif	/* !__cplusplus */
+ 
+ 
+ 
+diff --git a/lib/fribidi-types.h b/lib/fribidi-types.h
+index a72f740..3fac49f 100644
+--- a/lib/fribidi-types.h
++++ b/lib/fribidi-types.h
+@@ -38,51 +38,51 @@
+ #include "fribidi-begindecls.h"
+ 
+ 
+-# if defined(HAVE_INTTYPES_H) || defined(HAVE_STDINT_H)
+-#  ifndef __FRIBIDI_DOC
+-#   if HAVE_INTTYPES_H
+-#    include <inttypes.h>
+-#   elif HAVE_STDINT_H
+-#    include <stdint.h>
+-#   endif /* !HAVE_STDINT_H */
+-#  endif /* !__FRIBIDI_DOC */
+-#  define FRIBIDI_INT8_LOCAL		int8_t
+-#  define FRIBIDI_INT16_LOCAL		int16_t
+-#  define FRIBIDI_INT32_LOCAL		int32_t
+-#  define FRIBIDI_UINT8_LOCAL		uint8_t
+-#  define FRIBIDI_UINT16_LOCAL		uint16_t
+-#  define FRIBIDI_UINT32_LOCAL		uint32_t
+-# else /* no int types */
+-#  define FRIBIDI_INT8_LOCAL		signed char
+-#  define FRIBIDI_UINT8_LOCAL		unsigned char
+-#  if !defined(FRIBIDI_SIZEOF_INT) || FRIBIDI_SIZEOF_INT >= 4
+-#   define FRIBIDI_INT16_LOCAL		signed short
+-#   define FRIBIDI_UINT16_LOCAL		unsigned short
+-#   define FRIBIDI_INT32_LOCAL		signed int
+-#   define FRIBIDI_UINT32_LOCAL		unsigned int
+-#  else	/* SIZEOF_INT < 4 */
+-#   define FRIBIDI_INT16_LOCAL		signed int
+-#   define FRIBIDI_UINT16_LOCAL		unsigned int
+-#   define FRIBIDI_INT32_LOCAL		signed long
+-#   define FRIBIDI_UINT32_LOCAL		unsigned long
+-#  endif /* SIZEOF_INT < 4 */
+-# endif	/* no int types */
+-# define FRIBIDI_BOOLEAN_LOCAL		int
+-# if SIZEOF_WCHAR_T >= 4
+-#  ifndef __FRIBIDI_DOC
+-#   if STDC_HEADERS
++#if defined(HAVE_INTTYPES_H) || defined(HAVE_STDINT_H)
++# ifndef __FRIBIDI_DOC
++#  if HAVE_INTTYPES_H
++#   include <inttypes.h>
++#  elif HAVE_STDINT_H
++#   include <stdint.h>
++#  endif /* !HAVE_STDINT_H */
++# endif /* !__FRIBIDI_DOC */
++# define FRIBIDI_INT8_LOCAL		int8_t
++# define FRIBIDI_INT16_LOCAL		int16_t
++# define FRIBIDI_INT32_LOCAL		int32_t
++# define FRIBIDI_UINT8_LOCAL		uint8_t
++# define FRIBIDI_UINT16_LOCAL		uint16_t
++# define FRIBIDI_UINT32_LOCAL		uint32_t
++#else /* no int types */
++# define FRIBIDI_INT8_LOCAL		signed char
++# define FRIBIDI_UINT8_LOCAL		unsigned char
++# if !defined(FRIBIDI_SIZEOF_INT) || FRIBIDI_SIZEOF_INT >= 4
++#  define FRIBIDI_INT16_LOCAL		signed short
++#  define FRIBIDI_UINT16_LOCAL		unsigned short
++#  define FRIBIDI_INT32_LOCAL		signed int
++#  define FRIBIDI_UINT32_LOCAL		unsigned int
++# else	/* SIZEOF_INT < 4 */
++#  define FRIBIDI_INT16_LOCAL		signed int
++#  define FRIBIDI_UINT16_LOCAL		unsigned int
++#  define FRIBIDI_INT32_LOCAL		signed long
++#  define FRIBIDI_UINT32_LOCAL		unsigned long
++# endif /* SIZEOF_INT < 4 */
++#endif	/* no int types */
++#define FRIBIDI_BOOLEAN_LOCAL		int
++#if SIZEOF_WCHAR_T >= 4
++# ifndef __FRIBIDI_DOC
++#  if STDC_HEADERS
++#   include <stdlib.h>
++#   include <stddef.h>
++#  else /* !STDC_HEADERS */
++#   if HAVE_STDLIB_H
+ #    include <stdlib.h>
+-#    include <stddef.h>
+-#   else /* !STDC_HEADERS */
+-#    if HAVE_STDLIB_H
+-#     include <stdlib.h>
+-#    endif /* !HAVE_STDLIB_H */
+-#   endif /* !STDC_HEADERS */
+-#  endif /* !__FRIBIDI_DOC */
+-#  define FRIBIDI_UNICHAR_LOCAL		wchar_t
+-# else /* SIZEOF_WCHAR_T < 4 */
+-#  define FRIBIDI_UNICHAR_LOCAL		fribidi_uint32
+-# endif	/* SIZEOF_WCHAR_T < 4 */
++#   endif /* !HAVE_STDLIB_H */
++#  endif /* !STDC_HEADERS */
++# endif /* !__FRIBIDI_DOC */
++# define FRIBIDI_UNICHAR_LOCAL		wchar_t
++#else /* SIZEOF_WCHAR_T < 4 */
++# define FRIBIDI_UNICHAR_LOCAL		fribidi_uint32
++#endif	/* SIZEOF_WCHAR_T < 4 */
+ 
+ #if FRIBIDI_INT_TYPES+0
+ #else
+
+From 4419e1af139758ff3f7a53cf363a9d7ac5747a8b Mon Sep 17 00:00:00 2001
+From: Khaled Hosny <khaledhosny@eglug.org>
+Date: Fri, 8 Jan 2016 23:30:33 +0400
+Subject: [PATCH 7/7] Unused macro
+
+---
+ lib/fribidi-types.h | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/lib/fribidi-types.h b/lib/fribidi-types.h
+index 3fac49f..d76bc9d 100644
+--- a/lib/fribidi-types.h
++++ b/lib/fribidi-types.h
+@@ -116,12 +116,6 @@ typedef FRIBIDI_UNICHAR FriBidiChar;
+ typedef FRIBIDI_STR_INDEX FriBidiStrIndex;
+ 
+ 
+-#ifndef FRIBIDI_MAX_STRING_LENGTH
+-# define FRIBIDI_MAX_STRING_LENGTH (sizeof (FriBidiStrIndex) == 2 ?	\
+-		0x7FFF : (sizeof (FriBidiStrIndex) == 1 ? \
+-		0x7F : 0x7FFFFFFFL))
+-#endif
+-
+ /* A few macros for working with bits */
+ 
+ #define FRIBIDI_TEST_BITS(x, mask) (((x) & (mask)) ? 1 : 0)
diff --git a/package/libfribidi/0003-fribidi.pc.in-remove-MISC_PACKAGES-follow-up-patch-t.patch b/package/libfribidi/0003-fribidi.pc.in-remove-MISC_PACKAGES-follow-up-patch-t.patch
new file mode 100644
index 0000000..d4e4d9b
--- /dev/null
+++ b/package/libfribidi/0003-fribidi.pc.in-remove-MISC_PACKAGES-follow-up-patch-t.patch
@@ -0,0 +1,29 @@
+From b5df5943b4fd0593490427fcb20b23e23ed797cd Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 29 Oct 2016 13:50:38 +0200
+Subject: [PATCH 1/1] fribidi.pc.in: remove MISC_PACKAGES, follow-up patch to
+ remove glib dependency
+
+Reported upstream:
+https://github.com/behdad/fribidi/pull/14#issuecomment-257087158
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ fribidi.pc.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/fribidi.pc.in b/fribidi.pc.in
+index 7988fca..bb3a51c 100644
+--- a/fribidi.pc.in
++++ b/fribidi.pc.in
+@@ -7,7 +7,6 @@ includedir=@includedir@
+ 
+ Name: @PACKAGE_NAME@
+ Description: Unicode Bidirectional Algorithm Library
+-Requires: @MISC_PACKAGES@
+ Version: @VERSION@
+ Libs: -L${libdir} -lfribidi
+ Cflags: -I${includedir}/@PACKAGE@
+-- 
+2.10.1
+
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 4e82a5e..1aac93c 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -12,13 +12,8 @@ LIBFRIBIDI_LICENSE_FILES = COPYING
 LIBFRIBIDI_INSTALL_STAGING = YES
 # Ships a beta libtool version hence our patch doesn't apply.
 # Run autoreconf to regenerate ltmain.sh.
+# Also needed for 0002-drop-glib.patch
 LIBFRIBIDI_AUTORECONF = YES
 LIBFRIBIDI_DEPENDENCIES = host-pkgconf
 
-ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-LIBFRIBIDI_DEPENDENCIES += libglib2
-else
-LIBFRIBIDI_CONF_OPTS += --with-glib=no
-endif
-
 $(eval $(autotools-package))
-- 
2.10.1
