From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 28 Feb 2020 11:28:40 +0100
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.33
Message-ID: <20200228102840.4vv4wuqw42kmm37s@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...lude-ctype.h-drop-is-_l-macro-definitions.patch | 72 ----------------------
 ...de-ctype.h-restore-__isctype_l-definition.patch | 32 ----------
 package/uclibc/uclibc.hash                         |  4 +-
 package/uclibc/uclibc.mk                           |  2 +-
 4 files changed, 3 insertions(+), 107 deletions(-)
 delete mode 100644 package/uclibc/0001-include-ctype.h-drop-is-_l-macro-definitions.patch
 delete mode 100644 package/uclibc/0002-include-ctype.h-restore-__isctype_l-definition.patch

diff --git a/package/uclibc/0001-include-ctype.h-drop-is-_l-macro-definitions.patch b/package/uclibc/0001-include-ctype.h-drop-is-_l-macro-definitions.patch
deleted file mode 100644
index 5557a9c1e7..0000000000
--- a/package/uclibc/0001-include-ctype.h-drop-is-_l-macro-definitions.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From d1a3ca7ca56630fddde7311a0474eed4a21335a7 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Mon, 3 Feb 2020 13:57:32 -0800
-Subject: [PATCH] include/ctype.h: drop is*_l macro definitions
-
-ctype locale-specific macro definitions are broken because they result
-in dereference of pointer to structure of incomplete type.
-Drop these macros since they are optional and let applications use
-functions with the same names.
-
-This change fixes parted-3.3 build with uClibc-ng:
-  http://autobuild.buildroot.net/results/b7ba1210d5aa184b133f0171da621d2b0083ec39/build-end.log
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- include/ctype.h | 33 ---------------------------------
- 1 file changed, 33 deletions(-)
-
-diff --git a/include/ctype.h b/include/ctype.h
-index ecd5e730886a..e934cf3321a6 100644
---- a/include/ctype.h
-+++ b/include/ctype.h
-@@ -350,46 +350,13 @@ libc_hidden_proto(tolower_l)
- /* Return the uppercase version of C.  */
- extern int toupper_l (int __c, __locale_t __l) __THROW;
- 
--# if __GNUC__ >= 2 && defined __OPTIMIZE__ && !defined __cplusplus
--#  define tolower_l(c, locale) __tobody(c, tolower_l, (locale)->__ctype_tolower, (c, locale))
--#  define toupper_l(c, locale) __tobody(c, toupper_l, (locale)->__ctype_toupper, (c, locale))
--# endif	/* Optimizing gcc */
--
--
--# define __isctype_l(c, type, locale) ((locale)->__ctype_b[(int) (c)] & (__ctype_mask_t) type)
- # ifndef __NO_CTYPE
--#  define __isalnum_l(c,l)	__isctype_l((c), _ISalnum, (l))
--#  define __isalpha_l(c,l)	__isctype_l((c), _ISalpha, (l))
--#  define __iscntrl_l(c,l)	__isctype_l((c), _IScntrl, (l))
--#  define __isdigit_l(c,l)	__isctype_l((c), _ISdigit, (l))
--#  define __islower_l(c,l)	__isctype_l((c), _ISlower, (l))
--#  define __isgraph_l(c,l)	__isctype_l((c), _ISgraph, (l))
--#  define __isprint_l(c,l)	__isctype_l((c), _ISprint, (l))
--#  define __ispunct_l(c,l)	__isctype_l((c), _ISpunct, (l))
--#  define __isspace_l(c,l)	__isctype_l((c), _ISspace, (l))
--#  define __isupper_l(c,l)	__isctype_l((c), _ISupper, (l))
--#  define __isxdigit_l(c,l)	__isctype_l((c), _ISxdigit, (l))
--#  define __isblank_l(c,l)	__isctype_l((c), _ISblank, (l))
--
- #  if (defined __USE_SVID || defined __USE_MISC || defined __USE_XOPEN) \
- 	&& defined __UCLIBC_SUSV4_LEGACY__
- #   define __isascii_l(c,l)	((l), __isascii (c))
- #   define __toascii_l(c,l)	((l), __toascii (c))
- #  endif
- 
--#  define isalnum_l(c,l)	__isalnum_l ((c), (l))
--#  define isalpha_l(c,l)	__isalpha_l ((c), (l))
--#  define iscntrl_l(c,l)	__iscntrl_l ((c), (l))
--#  define isdigit_l(c,l)	__isdigit_l ((c), (l))
--#  define islower_l(c,l)	__islower_l ((c), (l))
--#  define isgraph_l(c,l)	__isgraph_l ((c), (l))
--#  define isprint_l(c,l)	__isprint_l ((c), (l))
--#  define ispunct_l(c,l)	__ispunct_l ((c), (l))
--#  define isspace_l(c,l)	__isspace_l ((c), (l))
--#  define isupper_l(c,l)	__isupper_l ((c), (l))
--#  define isxdigit_l(c,l)	__isxdigit_l ((c), (l))
--#  define isblank_l(c,l)	__isblank_l ((c), (l))
--
- #  if (defined __USE_SVID || defined __USE_MISC || defined __USE_XOPEN) \
- 	&& defined __UCLIBC_SUSV4_LEGACY__
- #   define isascii_l(c,l)	__isascii_l ((c), (l))
--- 
-2.20.1
-
diff --git a/package/uclibc/0002-include-ctype.h-restore-__isctype_l-definition.patch b/package/uclibc/0002-include-ctype.h-restore-__isctype_l-definition.patch
deleted file mode 100644
index a0e115c763..0000000000
--- a/package/uclibc/0002-include-ctype.h-restore-__isctype_l-definition.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7a9a3e4b36955e8530756823d3443f6822562c56 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Sun, 9 Feb 2020 22:29:53 +0100
-Subject: [PATCH] include/ctype.h: restore __isctype_l definition
-
-Recent is*_l fix broke uclibc build because removed __isctype_l
-definition was used in libc/misc/ctype/ctype.c. Restore it.
-
-Fixes: d1a3ca7ca566 ("include/ctype.h: drop is*_l macro definitions")
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Upstream status:
-https://mailman.uclibc-ng.org/pipermail/devel/2020-February/001940.html
----
- include/ctype.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/ctype.h b/include/ctype.h
-index e934cf332..05f21c553 100644
---- a/include/ctype.h
-+++ b/include/ctype.h
-@@ -350,6 +350,7 @@ libc_hidden_proto(tolower_l)
- /* Return the uppercase version of C.  */
- extern int toupper_l (int __c, __locale_t __l) __THROW;
- 
-+# define __isctype_l(c, type, locale) ((locale)->__ctype_b[(int) (c)] & (__ctype_mask_t) type)
- # ifndef __NO_CTYPE
- #  if (defined __USE_SVID || defined __USE_MISC || defined __USE_XOPEN) \
- 	&& defined __UCLIBC_SUSV4_LEGACY__
--- 
-2.20.1
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index c1f161fa15..3c79d63575 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.32/uClibc-ng-1.0.32.tar.xz.sha256
-sha256  891b5e4573855e4c11e51d3a518f89a82e490d9aa73280c05ce3e4d7e739a370  uClibc-ng-1.0.32.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.33/uClibc-ng-1.0.33.tar.xz.sha256
+sha256  4dfa9d438863f741a5a2f384d467fa9da397fd82acfcb9bb26f5d5634d70153a  uClibc-ng-1.0.33.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 2af666c208..3975e7e743 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.32
+UCLIBC_VERSION = 1.0.33
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.11.0
