From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Feb 2010 11:26:55 +0100
Subject: [Buildroot] [git commit master] Add patch to fix uClibc build
	failure with locale enabled
Message-ID: <20100217102826.9D4D77770C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2bf5840e578bf5ac8245f6ce27eb395acdbfd805
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes the undefined reference to `__iconv_codesets'
reported at
http://www.mail-archive.com/uclibc at uclibc.org/msg04970.html. The patch
has been taken from the upstream Git repository, and will be part of
uClibc 0.9.30.3. In the mean time, let's integrate it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...libc-0.9.30.2-fix-make-install-host-utils.patch |  153 ++++++++++++++++++++
 1 files changed, 153 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.30.2-fix-make-install-host-utils.patch

diff --git a/toolchain/uClibc/uClibc-0.9.30.2-fix-make-install-host-utils.patch b/toolchain/uClibc/uClibc-0.9.30.2-fix-make-install-host-utils.patch
new file mode 100644
index 0000000..526dfb1
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.30.2-fix-make-install-host-utils.patch
@@ -0,0 +1,153 @@
+From d75ad2e129b3f22296cead3db53c784527deab60 Mon Sep 17 00:00:00 2001
+From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Date: Fri, 18 Sep 2009 14:07:31 +0000
+Subject: fix make {,install_}{,host}utils
+
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+diff --git a/extra/locale/programs/locale.c b/extra/locale/programs/locale.c
+index 462a579..dfd2029 100644
+--- a/extra/locale/programs/locale.c
++++ b/extra/locale/programs/locale.c
+@@ -10,10 +10,9 @@
+  *
+  */
+ 
+-
++#include <string.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-#include <string.h>
+ #include <langinfo.h>
+ #include <unistd.h>
+ #ifdef __UCLIBC_HAS_GETOPT_LONG__
+diff --git a/libc/misc/wchar/wchar.c b/libc/misc/wchar/wchar.c
+index 290e680..3ce884d 100644
+--- a/libc/misc/wchar/wchar.c
++++ b/libc/misc/wchar/wchar.c
+@@ -171,7 +171,6 @@ extern size_t _wchar_utf8sntowcs(wchar_t *__restrict pwc, size_t wn,
+ 
+ extern size_t _wchar_wcsntoutf8s(char *__restrict s, size_t n,
+ 					const wchar_t **__restrict src, size_t wn) attribute_hidden;
+-
+ #endif /* _LIBC */
+ /**********************************************************************/
+ #ifdef L_btowc
+@@ -1201,45 +1200,6 @@ typedef struct {
+ 	int skip_invalid_input;		/* To support iconv -c option. */
+ } _UC_iconv_t;
+ 
+-
+-
+-#ifdef L_iconv
+-
+-#include <iconv.h>
+-#include <string.h>
+-#include <endian.h>
+-#include <byteswap.h>
+-
+-#if (__BYTE_ORDER != __BIG_ENDIAN) && (__BYTE_ORDER != __LITTLE_ENDIAN)
+-#error unsupported endianness for iconv
+-#endif
+-
+-#ifndef __CTYPE_HAS_8_BIT_LOCALES
+-#error currently iconv requires 8 bit locales
+-#endif
+-#ifndef __CTYPE_HAS_UTF_8_LOCALES
+-#error currently iconv requires UTF-8 locales
+-#endif
+-
+-
+-enum {
+-	IC_WCHAR_T = 0xe0,
+-	IC_MULTIBYTE = 0xe0,
+-#if __BYTE_ORDER == __BIG_ENDIAN
+-	IC_UCS_4 =	0xec,
+-	IC_UTF_32 = 0xe4,
+-	IC_UCS_2 =	0xe2,
+-	IC_UTF_16 = 0xea,
+-#else
+-	IC_UCS_4 =	0xed,
+-	IC_UTF_32 = 0xe5,
+-	IC_UCS_2 =	0xe3,
+-	IC_UTF_16 = 0xeb,
+-#endif
+-	IC_UTF_8 = 2,
+-	IC_ASCII = 1
+-};
+-
+ /* For the multibyte
+  * bit 0 means swap endian
+  * bit 1 means 2 byte
+@@ -1247,8 +1207,13 @@ enum {
+  *
+  */
+ 
++#if defined L_iconv && defined _LIBC
++/* Used externally only by iconv utility */
+ extern const unsigned char __iconv_codesets[];
+ libc_hidden_proto(__iconv_codesets)
++#endif
++
++#if defined L_iconv || defined L_iconv_main
+ const unsigned char __iconv_codesets[] =
+ 	"\x0a\xe0""WCHAR_T\x00"		/* superset of UCS-4 but platform-endian */
+ #if __BYTE_ORDER == __BIG_ENDIAN
+@@ -1281,7 +1246,48 @@ const unsigned char __iconv_codesets[] =
+ 	"\x08\x02""UTF-8\x00"
+ 	"\x0b\x01""US-ASCII\x00"
+ 	"\x07\x01""ASCII";			/* Must be last! (special case to save a nul) */
++#endif
++#if defined L_iconv && defined _LIBC
+ libc_hidden_data_def(__iconv_codesets)
++#endif
++
++
++#ifdef L_iconv
++
++#include <iconv.h>
++#include <string.h>
++#include <endian.h>
++#include <byteswap.h>
++
++#if (__BYTE_ORDER != __BIG_ENDIAN) && (__BYTE_ORDER != __LITTLE_ENDIAN)
++#error unsupported endianness for iconv
++#endif
++
++#ifndef __CTYPE_HAS_8_BIT_LOCALES
++#error currently iconv requires 8 bit locales
++#endif
++#ifndef __CTYPE_HAS_UTF_8_LOCALES
++#error currently iconv requires UTF-8 locales
++#endif
++
++
++enum {
++	IC_WCHAR_T = 0xe0,
++	IC_MULTIBYTE = 0xe0,
++#if __BYTE_ORDER == __BIG_ENDIAN
++	IC_UCS_4 =	0xec,
++	IC_UTF_32 = 0xe4,
++	IC_UCS_2 =	0xe2,
++	IC_UTF_16 = 0xea,
++#else
++	IC_UCS_4 =	0xed,
++	IC_UTF_32 = 0xe5,
++	IC_UCS_2 =	0xe3,
++	IC_UTF_16 = 0xeb,
++#endif
++	IC_UTF_8 = 2,
++	IC_ASCII = 1
++};
+ 
+ /* Experimentally off - libc_hidden_proto(strcasecmp) */
+ 
+@@ -1575,6 +1581,4 @@ size_t weak_function iconv(iconv_t cd, char **__restrict inbuf,
+ 	}
+ 	return nrcount;
+ }
+-
+ #endif
+-
+--
+cgit v0.8.2.1
-- 
1.6.3.3
