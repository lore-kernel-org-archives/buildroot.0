From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun,  8 May 2016 13:32:06 +0200
Subject: [Buildroot] [PATCH] ipsec-tools: add patches to fix musl build
Message-ID: <1462707126-21048-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a series of patches to fix build issues with the musl C library.

The following issues with musl are fixed:

1) Fix missing definition of __P() macro:

__P was used for compatibility with some old K&R C compilers, when there were
no prototypes (which were introduced to C with C89).

This macro definition is not available when building with the musl C library,
so the local compatibility header "gnuc.h" already present in one of the
subdirs is made available for all subdirs and the necessary include is added
to the needed header and source files.

2) Remove unneeded <sys/sysctl.h>

This header file is not available on musl. However, including this header file
is not necessary as the syscalls are called directly, so remove it.

3) Check for GLOB_TILDE

GLOB_TILDE is a GNU extension and not (yet) available on musl. Define it with
a value of '0'.

4) Check for strtouq

strtouq() is a BSD function and not available on musl. Add a autoconf check
for its present and if not available, replace it with its equivalent strtoull
or strtoul (if strtoull is not available).

Note that the patches touch configure.ac, so we need to run autoreconfigure
the package. Although this package uses autoconf, it does not work with the
autoreconf tool, so we need to call their bootstrap script which does the
reconfiguration.

Upstream status: Pending
https://sourceforge.net/p/ipsec-tools/mailman/message/35071943/

Fixes:
http://autobuild.buildroot.net/results/132/132bc19bc108237e1e1616d37a6b8d410e2bb074/
http://autobuild.buildroot.net/results/ffe/ffe66373c44aa4f6e74ca80b1783c156f43488b7/
http://autobuild.buildroot.net/results/2e7/2e7b9760eda0326094288349143b1b10351b0ae9/
http://autobuild.buildroot.net/results/d4c/d4cb3aa166c9fd47f1996b28d3f95469c094f584/
.. and many more.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../ipsec-tools/0002-Fix-missing-macro-__P.patch   | 661 +++++++++++++++++++++
 package/ipsec-tools/0003-Remove-sys-sysctl.patch   |  46 ++
 .../ipsec-tools/0004-Check-for-GLOB_TILDE.patch    |  26 +
 package/ipsec-tools/0005-Check-for-strtouq.patch   |  43 ++
 package/ipsec-tools/ipsec-tools.mk                 |   9 +
 5 files changed, 785 insertions(+)
 create mode 100644 package/ipsec-tools/0002-Fix-missing-macro-__P.patch
 create mode 100644 package/ipsec-tools/0003-Remove-sys-sysctl.patch
 create mode 100644 package/ipsec-tools/0004-Check-for-GLOB_TILDE.patch
 create mode 100644 package/ipsec-tools/0005-Check-for-strtouq.patch

diff --git a/package/ipsec-tools/0002-Fix-missing-macro-__P.patch b/package/ipsec-tools/0002-Fix-missing-macro-__P.patch
new file mode 100644
index 0000000..bb7cb9b
--- /dev/null
+++ b/package/ipsec-tools/0002-Fix-missing-macro-__P.patch
@@ -0,0 +1,661 @@
+Fix missing macro __P on musl
+
+__P was used for compatibility with some old K&R C compilers, when there were
+no prototypes (which were introduced to C with C89).
+
+This macro definition is not available when building with the musl C library.
+
+There is already a compatibility header gnuc.h present for racoon, which defines
+__P. However, this file is not included in all case whenever needed and
+furthermore this header file is not available for the other subdirs. So this
+header file is moved into subdir include-glibc, so it is also available for
+libipsec and setkey.
+
+Upstream status: Pending
+https://sourceforge.net/p/ipsec-tools/mailman/message/35071944/
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+
+diff -purN ipsec-tools-0.8.2.orig/src/include-glibc/gnuc.h ipsec-tools-0.8.2-1/src/include-glibc/gnuc.h
+--- ipsec-tools-0.8.2.orig/src/include-glibc/gnuc.h	1970-01-01 01:00:00.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/include-glibc/gnuc.h	2016-05-08 12:03:00.874662084 +0200
+@@ -0,0 +1,46 @@
++/*	$NetBSD: gnuc.h,v 1.4 2006/09/09 16:22:09 manu Exp $	*/
++
++/* Id: gnuc.h,v 1.4 2004/11/18 15:14:44 ludvigm Exp */
++
++/* Define __P() macro, if necessary */
++#undef __P
++#ifndef __P
++#if __STDC__
++#define __P(protos) protos
++#else
++#define __P(protos) ()
++#endif
++#endif
++
++/* inline foo */
++#ifdef __GNUC__
++#define inline __inline
++#else
++#define inline
++#endif
++
++/*
++ * Handle new and old "dead" routine prototypes
++ *
++ * For example:
++ *
++ *	__dead void foo(void) __attribute__((volatile));
++ *
++ */
++#ifdef __GNUC__
++#ifndef __dead
++#define __dead volatile
++#endif
++#if __GNUC__ < 2  || (__GNUC__ == 2 && __GNUC_MINOR__ < 5)
++#ifndef __attribute__
++#define __attribute__(args)
++#endif
++#endif
++#else
++#ifndef __dead
++#define __dead
++#endif
++#ifndef __attribute__
++#define __attribute__(args)
++#endif
++#endif
+diff -purN ipsec-tools-0.8.2.orig/src/libipsec/ipsec_strerror.h ipsec-tools-0.8.2-1/src/libipsec/ipsec_strerror.h
+--- ipsec-tools-0.8.2.orig/src/libipsec/ipsec_strerror.h	2006-09-09 18:22:09.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/libipsec/ipsec_strerror.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _IPSEC_STRERROR_H
+ #define _IPSEC_STRERROR_H
+ 
++#include "gnuc.h"
++
+ extern int __ipsec_errcode;
+ extern void __ipsec_set_strerror __P((const char *));
+ 
+diff -purN ipsec-tools-0.8.2.orig/src/libipsec/libpfkey.h ipsec-tools-0.8.2-1/src/libipsec/libpfkey.h
+--- ipsec-tools-0.8.2.orig/src/libipsec/libpfkey.h	2012-08-23 13:10:45.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/libipsec/libpfkey.h	2016-05-08 12:03:00.874662084 +0200
+@@ -37,6 +37,8 @@
+ #ifndef KAME_LIBPFKEY_H
+ #define KAME_LIBPFKEY_H
+ 
++#include "gnuc.h"
++
+ #define PRIORITY_LOW        0xC0000000
+ #define PRIORITY_DEFAULT    0x80000000
+ #define PRIORITY_HIGH       0x40000000
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/admin.h ipsec-tools-0.8.2-1/src/racoon/admin.h
+--- ipsec-tools-0.8.2.orig/src/racoon/admin.h	2010-11-12 10:08:26.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/racoon/admin.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _ADMIN_H
+ #define _ADMIN_H
+ 
++#include "gnuc.h"
++
+ #define ADMINSOCK_PATH ADMINPORTDIR "/racoon.sock"
+ 
+ extern char *adminsock_path;
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/backupsa.h ipsec-tools-0.8.2-1/src/racoon/backupsa.h
+--- ipsec-tools-0.8.2.orig/src/racoon/backupsa.h	2006-12-09 06:52:57.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/racoon/backupsa.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _BACKUPSA_H
+ #define _BACKUPSA_H
+ 
++#include "gnuc.h"
++
+ extern int backupsa_to_file __P((struct pfkey_send_sa_args *));
+ extern int backupsa_from_file __P((void));
+ extern int backupsa_clean __P((void));
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/cfparse_proto.h ipsec-tools-0.8.2-1/src/racoon/cfparse_proto.h
+--- ipsec-tools-0.8.2.orig/src/racoon/cfparse_proto.h	2006-09-09 18:22:09.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/cfparse_proto.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _CFPARSE_PROTO_H
+ #define _CFPARSE_PROTO_H
+ 
++#include "gnuc.h"
++
+ /* cfparse.y */
+ extern int yyparse __P((void));
+ extern int cfparse __P((void));
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/cftoken_proto.h ipsec-tools-0.8.2-1/src/racoon/cftoken_proto.h
+--- ipsec-tools-0.8.2.orig/src/racoon/cftoken_proto.h	2012-08-23 13:10:45.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/cftoken_proto.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _CFTOKEN_PROTO_H
+ #define _CFTOKEN_PROTO_H
+ 
++#include "gnuc.h"
++
+ extern int yyerrorcount;
+ 
+ extern int yylex __P((void));
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/crypto_openssl.h ipsec-tools-0.8.2-1/src/racoon/crypto_openssl.h
+--- ipsec-tools-0.8.2.orig/src/racoon/crypto_openssl.h	2009-08-17 13:59:10.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/crypto_openssl.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _CRYPTO_OPENSSL_H
+ #define _CRYPTO_OPENSSL_H
+ 
++#include "gnuc.h"
++
+ #include <openssl/x509v3.h>
+ #include <openssl/rsa.h>
+ 
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/debugrm.h ipsec-tools-0.8.2-1/src/racoon/debugrm.h
+--- ipsec-tools-0.8.2.orig/src/racoon/debugrm.h	2006-09-09 18:22:09.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/debugrm.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _DEBUGRM_H
+ #define _DEBUGRM_H
+ 
++#include "gnuc.h"
++
+ #define DRMDUMPFILE	"/var/tmp/debugrm.dump"
+ 
+ #ifdef NONEED_DRM
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/dnssec.h ipsec-tools-0.8.2-1/src/racoon/dnssec.h
+--- ipsec-tools-0.8.2.orig/src/racoon/dnssec.h	2009-03-12 11:57:26.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/racoon/dnssec.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _DNSSEC_H
+ #define _DNSSEC_H
+ 
++#include "gnuc.h"
++
+ extern vchar_t *dnssec_getcert __P((vchar_t *));
+ 
+ #endif /* _DNSSEC_H */
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/dump.h ipsec-tools-0.8.2-1/src/racoon/dump.h
+--- ipsec-tools-0.8.2.orig/src/racoon/dump.h	2006-09-09 18:22:09.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/dump.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _DUMP_H
+ #define _DUMP_H
+ 
++#include "gnuc.h"
++
+ extern int isakmp_dump_open __P((char *));
+ extern int isakmp_dump_close __P((void));
+ extern int isakmp_dump __P((vchar_t *, struct sockaddr *, struct sockaddr *));
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/evt.h ipsec-tools-0.8.2-1/src/racoon/evt.h
+--- ipsec-tools-0.8.2.orig/src/racoon/evt.h	2008-12-23 15:03:12.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/racoon/evt.h	2016-05-08 12:03:00.874662084 +0200
+@@ -35,6 +35,8 @@
+ #ifndef _EVT_H
+ #define _EVT_H
+ 
++#include "gnuc.h"
++
+ /*
+  * Old style (deprecated) events which are polled.
+  */
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/gcmalloc.h ipsec-tools-0.8.2-1/src/racoon/gcmalloc.h
+--- ipsec-tools-0.8.2.orig/src/racoon/gcmalloc.h	2006-09-09 18:22:09.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/gcmalloc.h	2016-05-08 12:03:00.874662084 +0200
+@@ -38,6 +38,8 @@
+ #ifndef _GCMALLOC_H_DEFINED
+ #define _GCMALLOC_H_DEFINED
+ 
++#include "gnuc.h"
++
+ /* ElectricFence needs no special handling. */
+ 
+ /*
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/gnuc.h ipsec-tools-0.8.2-1/src/racoon/gnuc.h
+--- ipsec-tools-0.8.2.orig/src/racoon/gnuc.h	2006-09-09 18:22:09.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/gnuc.h	1970-01-01 01:00:00.000000000 +0100
+@@ -1,46 +0,0 @@
+-/*	$NetBSD: gnuc.h,v 1.4 2006/09/09 16:22:09 manu Exp $	*/
+-
+-/* Id: gnuc.h,v 1.4 2004/11/18 15:14:44 ludvigm Exp */
+-
+-/* Define __P() macro, if necessary */
+-#undef __P
+-#ifndef __P
+-#if __STDC__
+-#define __P(protos) protos
+-#else
+-#define __P(protos) ()
+-#endif
+-#endif
+-
+-/* inline foo */
+-#ifdef __GNUC__
+-#define inline __inline
+-#else
+-#define inline
+-#endif
+-
+-/*
+- * Handle new and old "dead" routine prototypes
+- *
+- * For example:
+- *
+- *	__dead void foo(void) __attribute__((volatile));
+- *
+- */
+-#ifdef __GNUC__
+-#ifndef __dead
+-#define __dead volatile
+-#endif
+-#if __GNUC__ < 2  || (__GNUC__ == 2 && __GNUC_MINOR__ < 5)
+-#ifndef __attribute__
+-#define __attribute__(args)
+-#endif
+-#endif
+-#else
+-#ifndef __dead
+-#define __dead
+-#endif
+-#ifndef __attribute__
+-#define __attribute__(args)
+-#endif
+-#endif
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/grabmyaddr.h ipsec-tools-0.8.2-1/src/racoon/grabmyaddr.h
+--- ipsec-tools-0.8.2.orig/src/racoon/grabmyaddr.h	2009-04-21 20:38:32.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/grabmyaddr.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _GRABMYADDR_H
+ #define _GRABMYADDR_H
+ 
++#include "gnuc.h"
++
+ extern void myaddr_init_lists __P((void));
+ extern int myaddr_init __P((void));
+ extern void myaddr_close __P((void));
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/gssapi.h ipsec-tools-0.8.2-1/src/racoon/gssapi.h
+--- ipsec-tools-0.8.2.orig/src/racoon/gssapi.h	2006-09-09 18:22:09.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/gssapi.h	2016-05-08 12:03:00.874662084 +0200
+@@ -40,6 +40,8 @@
+ #include <gssapi/gssapi.h>
+ #endif
+ 
++#include "gnuc.h"
++
+ #define GSSAPI_DEF_NAME         "host"
+ 
+ struct ph1handle;
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/handler.h ipsec-tools-0.8.2-1/src/racoon/handler.h
+--- ipsec-tools-0.8.2.orig/src/racoon/handler.h	2010-11-17 11:40:41.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/racoon/handler.h	2016-05-08 12:03:00.874662084 +0200
+@@ -39,6 +39,7 @@
+ 
+ #include <sys/time.h>
+ 
++#include "gnuc.h"
+ #include "isakmp_var.h"
+ #include "oakley.h"
+ #include "schedule.h"
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/ipsec_doi.h ipsec-tools-0.8.2-1/src/racoon/ipsec_doi.h
+--- ipsec-tools-0.8.2.orig/src/racoon/ipsec_doi.h	2012-08-23 13:10:45.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/ipsec_doi.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,7 @@
+ #ifndef _IPSEC_DOI_H
+ #define _IPSEC_DOI_H
+ 
++#include "gnuc.h"
+ #include "isakmp.h"
+ 
+ /* refered to RFC2407 */
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/isakmp_agg.h ipsec-tools-0.8.2-1/src/racoon/isakmp_agg.h
+--- ipsec-tools-0.8.2.orig/src/racoon/isakmp_agg.h	2006-09-09 18:22:09.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/isakmp_agg.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _ISAKMP_AGG_H
+ #define _ISAKMP_AGG_H
+ 
++#include "gnuc.h"
++
+ extern int agg_i1send __P((struct ph1handle *, vchar_t *));
+ extern int agg_i2recv __P((struct ph1handle *, vchar_t *));
+ extern int agg_i2send __P((struct ph1handle *, vchar_t *));
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/isakmp_base.h ipsec-tools-0.8.2-1/src/racoon/isakmp_base.h
+--- ipsec-tools-0.8.2.orig/src/racoon/isakmp_base.h	2006-09-09 18:22:09.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/isakmp_base.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _ISAKMP_BASE_H
+ #define _ISAKMP_BASE_H
+ 
++#include "gnuc.h"
++
+ extern int base_i1send __P((struct ph1handle *, vchar_t *));
+ extern int base_i2recv __P((struct ph1handle *, vchar_t *));
+ extern int base_i2send __P((struct ph1handle *, vchar_t *));
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/isakmp_ident.h ipsec-tools-0.8.2-1/src/racoon/isakmp_ident.h
+--- ipsec-tools-0.8.2.orig/src/racoon/isakmp_ident.h	2006-09-09 18:22:09.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/isakmp_ident.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _ISAKMP_IDENT_H
+ #define _ISAKMP_IDENT_H
+ 
++#include "gnuc.h"
++
+ extern int ident_i1send __P((struct ph1handle *, vchar_t *));
+ extern int ident_i2recv __P((struct ph1handle *, vchar_t *));
+ extern int ident_i2send __P((struct ph1handle *, vchar_t *));
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/isakmp_inf.h ipsec-tools-0.8.2-1/src/racoon/isakmp_inf.h
+--- ipsec-tools-0.8.2.orig/src/racoon/isakmp_inf.h	2008-07-14 07:40:13.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/isakmp_inf.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _ISAKMP_INF_H
+ #define _ISAKMP_INF_H
+ 
++#include "gnuc.h"
++
+ struct saproto;
+ extern int isakmp_info_recv __P((struct ph1handle *, vchar_t *));
+ extern int isakmp_info_send_d1 __P((struct ph1handle *));
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/isakmp_newg.h ipsec-tools-0.8.2-1/src/racoon/isakmp_newg.h
+--- ipsec-tools-0.8.2.orig/src/racoon/isakmp_newg.h	2006-09-09 18:22:09.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/isakmp_newg.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _ISAKMP_NEWG_H
+ #define _ISAKMP_NEWG_H
+ 
++#include "gnuc.h"
++
+ extern int isakmp_newgroup_r __P((struct ph1handle *, vchar_t *));
+ 
+ #endif /* _ISAKMP_NEWG_H */
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/isakmp_quick.h ipsec-tools-0.8.2-1/src/racoon/isakmp_quick.h
+--- ipsec-tools-0.8.2.orig/src/racoon/isakmp_quick.h	2006-09-09 18:22:09.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/isakmp_quick.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _ISAKMP_QUICK_H
+ #define _ISAKMP_QUICK_H
+ 
++#include "gnuc.h"
++
+ extern int quick_i1prep __P((struct ph2handle *, vchar_t *));
+ extern int quick_i1send __P((struct ph2handle *, vchar_t *));
+ extern int quick_i2recv __P((struct ph2handle *, vchar_t *));
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/isakmp_var.h ipsec-tools-0.8.2-1/src/racoon/isakmp_var.h
+--- ipsec-tools-0.8.2.orig/src/racoon/isakmp_var.h	2010-11-12 11:36:37.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/racoon/isakmp_var.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,7 @@
+ #ifndef _ISAKMP_VAR_H
+ #define _ISAKMP_VAR_H
+ 
++#include "gnuc.h"
+ #include "vmbuf.h"
+ #include "policy.h"
+ 
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/localconf.h ipsec-tools-0.8.2-1/src/racoon/localconf.h
+--- ipsec-tools-0.8.2.orig/src/racoon/localconf.h	2012-08-23 13:10:45.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/localconf.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _LOCALCONF_H
+ #define _LOCALCONF_H
+ 
++#include "gnuc.h"
++
+ /* local configuration */
+ 
+ #define LC_DEFAULT_CF	SYSCONFDIR "/racoon.conf"
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/logger.h ipsec-tools-0.8.2-1/src/racoon/logger.h
+--- ipsec-tools-0.8.2.orig/src/racoon/logger.h	2006-09-09 18:22:09.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/logger.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _LOGGER_H
+ #define _LOGGER_H
+ 
++#include "gnuc.h"
++
+ struct log {
+ 	int head;
+ 	int siz;
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/Makefile.am ipsec-tools-0.8.2-1/src/racoon/Makefile.am
+--- ipsec-tools-0.8.2.orig/src/racoon/Makefile.am	2009-12-11 10:04:04.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/racoon/Makefile.am	2016-05-08 12:03:00.874662084 +0200
+@@ -67,7 +67,7 @@ noinst_HEADERS = \
+ 	admin.h           dnssec.h      isakmp_base.h   oakley.h      session.h \
+ 	admin_var.h       dump.h        isakmp_ident.h  pfkey.h       sockmisc.h \
+ 	algorithm.h       gcmalloc.h    isakmp_inf.h    plog.h        str2val.h \
+-	backupsa.h        gnuc.h        isakmp_newg.h   policy.h      strnames.h \
++	backupsa.h        isakmp_newg.h   policy.h      strnames.h \
+ 	grabmyaddr.h      isakmp_quick.h  proposal.h    var.h         evt.h \
+ 	gssapi.h          isakmp_var.h	vendorid.h      nattraversal.h\
+ 	crypto_openssl.h  handler.h     localconf.h     remoteconf.h  vmbuf.h \
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/misc.h ipsec-tools-0.8.2-1/src/racoon/misc.h
+--- ipsec-tools-0.8.2.orig/src/racoon/misc.h	2008-07-15 02:47:09.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/misc.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _MISC_H
+ #define _MISC_H
+ 
++#include "gnuc.h"
++
+ #define BIT2STR(b) bit2str(b, sizeof(b)<<3)
+ 
+ #ifdef HAVE_FUNC_MACRO
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/missing/crypto/sha2/sha2.h ipsec-tools-0.8.2-1/src/racoon/missing/crypto/sha2/sha2.h
+--- ipsec-tools-0.8.2.orig/src/racoon/missing/crypto/sha2/sha2.h	2006-09-09 18:22:36.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/missing/crypto/sha2/sha2.h	2016-05-08 12:03:00.874662084 +0200
+@@ -40,6 +40,8 @@
+ #ifndef __SHA2_H__
+ #define __SHA2_H__
+ 
++#include "gnuc.h"
++
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/netdb_dnssec.h ipsec-tools-0.8.2-1/src/racoon/netdb_dnssec.h
+--- ipsec-tools-0.8.2.orig/src/racoon/netdb_dnssec.h	2006-09-09 18:22:09.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/netdb_dnssec.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _NETDB_DNSSEC_H
+ #define _NETDB_DNSSEC_H
+ 
++#include "gnuc.h"
++
+ #ifndef T_CERT
+ #define T_CERT	37		/* defined by RFC2538 section 2 */
+ #endif
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/oakley.h ipsec-tools-0.8.2-1/src/racoon/oakley.h
+--- ipsec-tools-0.8.2.orig/src/racoon/oakley.h	2009-03-12 11:57:26.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/racoon/oakley.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,7 @@
+ #ifndef _OAKLEY_H
+ #define _OAKLEY_H
+ 
++#include "gnuc.h"
+ #include "vmbuf.h"
+ 
+ /* refer to RFC 2409 */
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/pfkey.h ipsec-tools-0.8.2-1/src/racoon/pfkey.h
+--- ipsec-tools-0.8.2.orig/src/racoon/pfkey.h	2009-07-03 08:40:10.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/pfkey.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _PFKEY_H
+ #define _PFKEY_H
+ 
++#include "gnuc.h"
++
+ struct pfkey_satype {
+ 	u_int8_t	ps_satype;
+ 	const char	*ps_name;
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/plog.h ipsec-tools-0.8.2-1/src/racoon/plog.h
+--- ipsec-tools-0.8.2.orig/src/racoon/plog.h	2007-10-02 11:47:40.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/plog.h	2016-05-08 12:03:00.874662084 +0200
+@@ -41,6 +41,8 @@
+ #endif
+ #include <syslog.h>
+ 
++#include "gnuc.h"
++
+ /*
+  * INFO: begin negotiation, SA establishment/deletion/expiration.
+  * NOTIFY: just notifiable.
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/policy.h ipsec-tools-0.8.2-1/src/racoon/policy.h
+--- ipsec-tools-0.8.2.orig/src/racoon/policy.h	2008-12-05 07:02:20.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/racoon/policy.h	2016-05-08 12:03:00.874662084 +0200
+@@ -35,7 +35,7 @@
+ #define _POLICY_H
+ 
+ #include <sys/queue.h>
+-
++#include "gnuc.h"
+ 
+ #ifdef HAVE_SECCTX
+ #define MAX_CTXSTR_SIZE 50
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/privsep.h ipsec-tools-0.8.2-1/src/racoon/privsep.h
+--- ipsec-tools-0.8.2.orig/src/racoon/privsep.h	2008-12-08 07:00:54.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/racoon/privsep.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _PRIVSEP_H
+ #define _PRIVSEP_H
+ 
++#include "gnuc.h"
++
+ #define PRIVSEP_EAY_GET_PKCS1PRIVKEY	0x0801	/* admin_com_bufs follows */
+ #define PRIVSEP_SCRIPT_EXEC		0x0803	/* admin_com_bufs follows */
+ #define PRIVSEP_GETPSK			0x0804	/* admin_com_bufs follows */
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/proposal.h ipsec-tools-0.8.2-1/src/racoon/proposal.h
+--- ipsec-tools-0.8.2.orig/src/racoon/proposal.h	2010-02-10 00:05:16.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/racoon/proposal.h	2016-05-08 12:03:00.874662084 +0200
+@@ -35,6 +35,7 @@
+ #define _PROPOSAL_H
+ 
+ #include <sys/queue.h>
++#include "gnuc.h"
+ 
+ /*
+  *   A. chained list of transform, only for single proto_id
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/remoteconf.h ipsec-tools-0.8.2-1/src/racoon/remoteconf.h
+--- ipsec-tools-0.8.2.orig/src/racoon/remoteconf.h	2011-03-14 16:50:36.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/racoon/remoteconf.h	2016-05-08 12:03:00.874662084 +0200
+@@ -37,6 +37,7 @@
+ /* remote configuration */
+ 
+ #include <sys/queue.h>
++#include "gnuc.h"
+ #include "genlist.h"
+ #ifdef ENABLE_HYBRID
+ #include "isakmp_var.h"
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/safefile.h ipsec-tools-0.8.2-1/src/racoon/safefile.h
+--- ipsec-tools-0.8.2.orig/src/racoon/safefile.h	2006-09-09 18:22:10.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/safefile.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _SAFEFILE_H
+ #define _SAFEFILE_H
+ 
++#include "gnuc.h"
++
+ extern int safefile __P((const char *, int));
+ 
+ #endif /* _SAFEFILE_H */
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/sainfo.h ipsec-tools-0.8.2-1/src/racoon/sainfo.h
+--- ipsec-tools-0.8.2.orig/src/racoon/sainfo.h	2011-02-02 16:21:34.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/racoon/sainfo.h	2016-05-08 12:03:00.874662084 +0200
+@@ -35,6 +35,7 @@
+ #define _SAINFO_H
+ 
+ #include <sys/queue.h>
++#include "gnuc.h"
+ 
+ #define SAINFO_ANONYMOUS	((void *)NULL)
+ #define	SAINFO_CLIENTADDR	((void *)~0)
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/session.h ipsec-tools-0.8.2-1/src/racoon/session.h
+--- ipsec-tools-0.8.2.orig/src/racoon/session.h	2010-10-21 08:15:28.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/session.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _SESSION_H
+ #define _SESSION_H
+ 
++#include "gnuc.h"
++
+ extern int session __P((void));
+ extern RETSIGTYPE signal_handler __P((int));
+ 
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/sockmisc.h ipsec-tools-0.8.2-1/src/racoon/sockmisc.h
+--- ipsec-tools-0.8.2.orig/src/racoon/sockmisc.h	2011-03-14 18:18:13.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/racoon/sockmisc.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _SOCKMISC_H
+ #define _SOCKMISC_H
+ 
++#include "gnuc.h"
++
+ #ifndef IP_IPSEC_POLICY
+ #define IP_IPSEC_POLICY 16	/* XXX: from linux/in.h */
+ #endif
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/str2val.h ipsec-tools-0.8.2-1/src/racoon/str2val.h
+--- ipsec-tools-0.8.2.orig/src/racoon/str2val.h	2006-09-09 18:22:10.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/str2val.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _STR2VAL_H
+ #define _STR2VAL_H
+ 
++#include "gnuc.h"
++
+ extern caddr_t val2str __P((const char *, size_t));
+ extern char *str2val __P((const char *, int, size_t *));
+ 
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/strnames.h ipsec-tools-0.8.2-1/src/racoon/strnames.h
+--- ipsec-tools-0.8.2.orig/src/racoon/strnames.h	2006-09-09 18:22:10.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/strnames.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _STRNAMES_H
+ #define _STRNAMES_H
+ 
++#include "gnuc.h"
++
+ extern char *num2str __P((int n));
+ 
+ extern char *s_isakmp_state __P((int, int, int));
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/throttle.h ipsec-tools-0.8.2-1/src/racoon/throttle.h
+--- ipsec-tools-0.8.2.orig/src/racoon/throttle.h	2009-01-23 09:25:07.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/racoon/throttle.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,7 @@
+ #ifndef _THROTTLE_H
+ #define _THROTTLE_H
+ 
++#include "gnuc.h"
+ #include "schedule.h"
+ 
+ struct throttle_entry {
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/vendorid.h ipsec-tools-0.8.2-1/src/racoon/vendorid.h
+--- ipsec-tools-0.8.2.orig/src/racoon/vendorid.h	2009-01-23 09:06:56.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/racoon/vendorid.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _VENDORID_H
+ #define _VENDORID_H
+ 
++#include "gnuc.h"
++
+ #ifndef BIT
+ #define BIT(x) (1 << (x))
+ #endif
+diff -purN ipsec-tools-0.8.2.orig/src/racoon/vmbuf.h ipsec-tools-0.8.2-1/src/racoon/vmbuf.h
+--- ipsec-tools-0.8.2.orig/src/racoon/vmbuf.h	2006-09-09 18:22:10.000000000 +0200
++++ ipsec-tools-0.8.2-1/src/racoon/vmbuf.h	2016-05-08 12:03:00.874662084 +0200
+@@ -34,6 +34,8 @@
+ #ifndef _VMBUF_H
+ #define _VMBUF_H
+ 
++#include "gnuc.h"
++
+ /*
+  *	bp      v
+  *	v       v
+diff -purN ipsec-tools-0.8.2.orig/src/setkey/extern.h ipsec-tools-0.8.2-1/src/setkey/extern.h
+--- ipsec-tools-0.8.2.orig/src/setkey/extern.h	2009-03-06 12:45:03.000000000 +0100
++++ ipsec-tools-0.8.2-1/src/setkey/extern.h	2016-05-08 12:03:00.874662084 +0200
+@@ -1,6 +1,6 @@
+ /*	$NetBSD: extern.h,v 1.5 2009/03/06 11:45:03 tteras Exp $	*/
+ 
+-
++#include "gnuc.h"
+ 
+ void parse_init __P((void));
+ int parse __P((FILE **));
diff --git a/package/ipsec-tools/0003-Remove-sys-sysctl.patch b/package/ipsec-tools/0003-Remove-sys-sysctl.patch
new file mode 100644
index 0000000..8a7dab0
--- /dev/null
+++ b/package/ipsec-tools/0003-Remove-sys-sysctl.patch
@@ -0,0 +1,46 @@
+Remove <sys/sysctl.h>
+
+Including this header file is not necessary as ipsec-tools does not use the 
+sysctl() function (declared in <sys/sysctl.h>), but does the call syscall()
+directly.
+
+This fixes build errors with the musl C library.
+
+Upstream status: Pending
+https://sourceforge.net/p/ipsec-tools/mailman/message/35071951/
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+
+diff -purN ipsec-tools-0.8.2-1/src/racoon/grabmyaddr.c ipsec-tools-0.8.2-2/src/racoon/grabmyaddr.c
+--- ipsec-tools-0.8.2-1/src/racoon/grabmyaddr.c	2016-05-08 12:02:23.574894033 +0200
++++ ipsec-tools-0.8.2-2/src/racoon/grabmyaddr.c	2016-05-08 12:07:55.112876449 +0200
+@@ -47,7 +47,6 @@
+ #include <net/route.h>
+ #include <net/if.h>
+ #include <net/if_dl.h>
+-#include <sys/sysctl.h>
+ #define USE_ROUTE
+ #endif
+ 
+diff -purN ipsec-tools-0.8.2-1/src/racoon/pfkey.c ipsec-tools-0.8.2-2/src/racoon/pfkey.c
+--- ipsec-tools-0.8.2-1/src/racoon/pfkey.c	2016-05-08 12:02:23.574894033 +0200
++++ ipsec-tools-0.8.2-2/src/racoon/pfkey.c	2016-05-08 12:07:55.112876449 +0200
+@@ -59,7 +59,6 @@
+ #include <sys/param.h>
+ #include <sys/socket.h>
+ #include <sys/queue.h>
+-#include <sys/sysctl.h>
+ 
+ #include <net/route.h>
+ #include <net/pfkeyv2.h>
+diff -purN ipsec-tools-0.8.2-1/src/setkey/setkey.c ipsec-tools-0.8.2-2/src/setkey/setkey.c
+--- ipsec-tools-0.8.2-1/src/setkey/setkey.c	2016-05-08 12:02:23.574894033 +0200
++++ ipsec-tools-0.8.2-2/src/setkey/setkey.c	2016-05-08 12:07:55.112876449 +0200
+@@ -40,7 +40,6 @@
+ #include <sys/socket.h>
+ #include <sys/time.h>
+ #include <sys/stat.h>
+-#include <sys/sysctl.h>
+ #include <err.h>
+ #include <netinet/in.h>
+ #include <net/pfkeyv2.h>
diff --git a/package/ipsec-tools/0004-Check-for-GLOB_TILDE.patch b/package/ipsec-tools/0004-Check-for-GLOB_TILDE.patch
new file mode 100644
index 0000000..9bda0fe
--- /dev/null
+++ b/package/ipsec-tools/0004-Check-for-GLOB_TILDE.patch
@@ -0,0 +1,26 @@
+Check for GLOB_TILDE
+
+GLOB_TILDE is a GNU extension and might not be available on some C libraries.
+
+This fixes build errors with the musl C library.
+
+Upstream status: Pending
+https://sourceforge.net/p/ipsec-tools/mailman/message/35071952/
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+
+diff -purN ipsec-tools-0.8.2-2/src/racoon/misc.h ipsec-tools-0.8.2-3/src/racoon/misc.h
+--- ipsec-tools-0.8.2-2/src/racoon/misc.h	2016-05-08 12:07:38.622974834 +0200
++++ ipsec-tools-0.8.2-3/src/racoon/misc.h	2016-05-08 12:09:28.132324323 +0200
+@@ -62,6 +62,11 @@ extern void close_on_exec __P((int fd));
+     TAILQ_FOREACH_REVERSE(var, head, headname, field)
+ #endif
+ 
++/* GLOB_TILDE is a GNU extension and might not be available on some C libs. */
++#ifndef GLOB_TILDE
++#define GLOB_TILDE 0
++#endif
++
+ #ifndef HAVE_STRLCPY
+ #define strlcpy(d,s,l) (strncpy(d,s,l), (d)[(l)-1] = '\0')
+ #endif
diff --git a/package/ipsec-tools/0005-Check-for-strtouq.patch b/package/ipsec-tools/0005-Check-for-strtouq.patch
new file mode 100644
index 0000000..497512f
--- /dev/null
+++ b/package/ipsec-tools/0005-Check-for-strtouq.patch
@@ -0,0 +1,43 @@
+Check for strtouq
+
+strtouq() is a BSD function and might not be available on some C libraries, so
+add an autoconf check and if not available, replace it with its equivalent
+strtoull or strtoul.
+
+This fixes build errors with the musl C library.
+
+Upstream status: Pending
+https://sourceforge.net/p/ipsec-tools/mailman/message/35071953/
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+
+diff -purN ipsec-tools-0.8.2-3/configure.ac ipsec-tools-0.8.2-4/configure.ac
+--- ipsec-tools-0.8.2-3/configure.ac	2016-05-08 12:09:07.692445249 +0200
++++ ipsec-tools-0.8.2-4/configure.ac	2016-05-08 12:11:17.661679674 +0200
+@@ -124,7 +124,7 @@ AC_STRUCT_TM
+ AC_FUNC_MEMCMP
+ AC_TYPE_SIGNAL
+ AC_FUNC_VPRINTF
+-AC_CHECK_FUNCS(gettimeofday select socket strerror strtol strtoul strlcpy strlcat)
++AC_CHECK_FUNCS(gettimeofday select socket strerror strtol strtoul strtoull strtouq strlcpy strlcat)
+ AC_REPLACE_FUNCS(strdup)
+ RACOON_CHECK_VA_COPY
+ 
+diff -purN ipsec-tools-0.8.2-3/src/racoon/misc.h ipsec-tools-0.8.2-4/src/racoon/misc.h
+--- ipsec-tools-0.8.2-3/src/racoon/misc.h	2016-05-08 12:09:28.132324323 +0200
++++ ipsec-tools-0.8.2-4/src/racoon/misc.h	2016-05-08 12:11:17.661679674 +0200
+@@ -75,6 +75,14 @@ extern void close_on_exec __P((int fd));
+ #define strlcat(d,s,l) strncat(d,s,(l)-strlen(d)-1)
+ #endif
+ 
++#ifndef HAVE_STRTOUQ
++#  ifdef HAVE_STRTOULL
++#    define strtouq strtoull
++#  elif HAVE_STRTOUL
++#    define strtouq strtoul
++#  endif
++#endif
++
+ #define STRDUP_FATAL(x) if (x == NULL) {			\
+ 	plog(LLV_ERROR, LOCATION, NULL, "strdup failed\n");	\
+ 	exit(1);						\
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 98216ea..7c2c384 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -11,6 +11,15 @@ IPSEC_TOOLS_INSTALL_STAGING = YES
 IPSEC_TOOLS_MAKE = $(MAKE1)
 IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
 
+# We are patch configure.ac, so we need to run autoreconfigure the package.
+# Although this package uses autoconf, it does not work with the autoreconf
+# tool, so we # need to call their bootstrap script which does the
+# reconfiguration.
+define IPSEC_TOOLS_RUN_BOOTSTRAP
+	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
+endef
+IPSEC_TOOLS_PRE_CONFIGURE_HOOKS += IPSEC_TOOLS_RUN_BOOTSTRAP
+
 # configure hardcodes -Werror, so override CFLAGS on make invocation
 IPSEC_TOOLS_MAKE_OPTS = CFLAGS='$(TARGET_CFLAGS)'
 
-- 
2.8.2
