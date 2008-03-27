From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 27 Mar 2008 03:23:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20080327102314.CDAA33C376@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-27 03:23:13 -0700 (Thu, 27 Mar 2008)
New Revision: 21513

Log:
uClibc 0.9.28.3: use optimized string ops on ppc

Use optimized string ops instead of dummy generic ones on PPC.


Added:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.3-ppc-string-ops.patch


Changeset:
Added: trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.3-ppc-string-ops.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.3-ppc-string-ops.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.3-ppc-string-ops.patch	2008-03-27 10:23:13 UTC (rev 21513)
@@ -0,0 +1,56 @@
+diff -urpN uClibc-0.9.28.3/libc/string/powerpc/string.c uClibc-0.9.28.3-patched/libc/string/powerpc/string.c
+--- uClibc-0.9.28.3/libc/string/powerpc/string.c	2005-06-21 16:03:15.000000000 +0200
++++ uClibc-0.9.28.3-patched/libc/string/powerpc/string.c	2008-03-27 00:22:16.000000000 +0100
+@@ -32,7 +32,7 @@
+ #include <locale.h> /* for __LOCALE_C_ONLY */
+ 
+ #ifdef L_memcpy
+-void attribute_hidden *__memcpy(void *to, const void *from, size_t n)
++void *memcpy(void *to, const void *from, size_t n)
+ /* PPC can do pre increment and load/store, but not post increment and load/store.
+    Therefore use *++ptr instead of *ptr++. */
+ {
+@@ -87,11 +87,10 @@ void attribute_hidden *__memcpy(void *to
+ 		goto copy_chunks;
+ 	goto lessthan8;
+ }
+-strong_alias(__memcpy, memcpy);
+ #endif
+ 
+ #ifdef L_memmove
+-void attribute_hidden *__memmove(void *to, const void *from, size_t n)
++void *memmove(void *to, const void *from, size_t n)
+ {
+ 	unsigned long rem, chunks, tmp1, tmp2;
+ 	unsigned char *tmp_to;
+@@ -142,7 +141,6 @@ void attribute_hidden *__memmove(void *t
+ 		goto copy_chunks;
+ 	goto lessthan8;
+ }
+-strong_alias(__memmove, memmove);
+ #endif
+ 
+ #ifdef L_memset
+@@ -156,7 +154,7 @@ static inline int expand_byte_word(int c
+ 	    : "=r" (c) : "0" (c));
+ 	return c;
+ }
+-void attribute_hidden *__memset(void *to, int c, size_t n)
++void *memset(void *to, int c, size_t n)
+ {
+ 	unsigned long rem, chunks;
+ 	unsigned char *tmp_to;
+@@ -202,12 +200,10 @@ void attribute_hidden *__memset(void *to
+ 		goto copy_chunks;
+ 	goto lessthan8;
+ }
+-strong_alias(__memset, memset);
+ #endif
+ 
+ #ifdef L_bzero
+-weak_alias(__bzero,bzero);
+-void __bzero(void *s, size_t n)
++void bzero(void *s, size_t n)
+ {
+ 	(void)memset(s, 0, n);
+ }
