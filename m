From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 19 Apr 2018 08:28:37 +0300
Subject: [Buildroot] [PATCH] multicat: bump to version 2.2
Message-ID: <c2ce3c90b5f2b419e3d2e621db03832c5bae1901.1524115717.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patches.

Add upstream patch fixing build with musl libc.

Add license file hash.

Set LDLIBS to TARGET_LDFLAGS for TARGET_LDFLAGS to be added to the link
commands. Makefile does not use the LDFLAGS environment variable. This
fixes static linking.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-Fix-build-with-musl-libc.patch       | 62 +++++++++++++++++++
 .../multicat/0001-Fix-missing-pthread.patch   | 20 ------
 package/multicat/0002-Fix-musl-build.patch    | 47 --------------
 ...Fix-have-clock-nanosleep-with-uclibc.patch | 24 -------
 package/multicat/multicat.hash                |  7 ++-
 package/multicat/multicat.mk                  |  6 +-
 6 files changed, 70 insertions(+), 96 deletions(-)
 create mode 100644 package/multicat/0001-Fix-build-with-musl-libc.patch
 delete mode 100644 package/multicat/0001-Fix-missing-pthread.patch
 delete mode 100644 package/multicat/0002-Fix-musl-build.patch
 delete mode 100644 package/multicat/0003-Fix-have-clock-nanosleep-with-uclibc.patch

diff --git a/package/multicat/0001-Fix-build-with-musl-libc.patch b/package/multicat/0001-Fix-build-with-musl-libc.patch
new file mode 100644
index 000000000000..d68b861a1d28
--- /dev/null
+++ b/package/multicat/0001-Fix-build-with-musl-libc.patch
@@ -0,0 +1,62 @@
+From 19c37f8d02cfe3a0490981cd9c3370fe544b76ac Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Cl=C3=A9ment=20Vasseur?= <clement.vasseur@gmail.com>
+Date: Thu, 30 Nov 2017 16:05:49 +0000
+Subject: [PATCH] Fix build with musl libc
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 19c37f8d02cf
+
+ multicat.c | 7 ++-----
+ util.h     | 3 ++-
+ 2 files changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/multicat.c b/multicat.c
+index eeab930fc1db..e8b6874d6f4c 100644
+--- a/multicat.c
++++ b/multicat.c
+@@ -1,7 +1,7 @@
+ /*****************************************************************************
+  * multicat.c: netcat-equivalent for multicast
+  *****************************************************************************
+- * Copyright (C) 2009, 2011-2012, 2015-2016 VideoLAN
++ * Copyright (C) 2009, 2011-2012, 2015-2017 VideoLAN
+  * $Id$
+  *
+  * Authors: Christophe Massiot <massiot@via.ecp.fr>
+@@ -43,10 +43,7 @@
+ #include <poll.h>
+ #include <sys/ioctl.h>
+ #include <syslog.h>
+-
+-#ifdef __FreeBSD__
+-#   include <sys/uio.h>
+-#endif
++#include <sys/uio.h>
+ 
+ #ifdef SIOCGSTAMPNS
+ #   define HAVE_TIMESTAMPS
+diff --git a/util.h b/util.h
+index 1959a2edb155..724e7d843d22 100644
+--- a/util.h
++++ b/util.h
+@@ -1,7 +1,7 @@
+ /*****************************************************************************
+  * util.h: Utils for the multicat suite
+  *****************************************************************************
+- * Copyright (C) 2009, 2011, 2014-2016 VideoLAN
++ * Copyright (C) 2009, 2011, 2014-2017 VideoLAN
+  * $Id$
+  *
+  * Authors: Christophe Massiot <massiot@via.ecp.fr>
+@@ -23,6 +23,7 @@
+ 
+ #include <netinet/udp.h>
+ #include <netinet/ip.h>
++#include <sys/types.h>
+ 
+ #if defined(__APPLE__) || defined(__FreeBSD__)
+ #define POLLRDHUP 0
+-- 
+2.17.0
+
diff --git a/package/multicat/0001-Fix-missing-pthread.patch b/package/multicat/0001-Fix-missing-pthread.patch
deleted file mode 100644
index 1ad2c9877218..000000000000
--- a/package/multicat/0001-Fix-missing-pthread.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Makefile: link with pthread
-
-Otherwise building multicat in a static context fails:
-  aggregartp.c:381: undefined reference to `pthread_self'
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
-Sent upstream: https://mailman.videolan.org/pipermail/multicat-devel/2016-March/000125.html
-
-diff -purN multicat-2.1.orig/Makefile multicat-2.1/Makefile
---- multicat-2.1.orig/Makefile	2015-10-05 18:36:29.000000000 +0200
-+++ multicat-2.1/Makefile	2016-03-19 21:47:59.467745127 +0100
-@@ -4,7 +4,7 @@ VERSION = 2.1
- CFLAGS += -Wall -Wformat-security -O3 -fomit-frame-pointer -D_FILE_OFFSET_BITS=64 -D_ISOC99_SOURCE -D_BSD_SOURCE
- CFLAGS += -g
- # Comment out the following line for Mac OS X build
--LDLIBS += -lrt
-+LDLIBS += -lrt -pthread
- 
- OBJ_MULTICAT = multicat.o util.o
- OBJ_INGESTS = ingests.o util.o
diff --git a/package/multicat/0002-Fix-musl-build.patch b/package/multicat/0002-Fix-musl-build.patch
deleted file mode 100644
index 07e15a353a0a..000000000000
--- a/package/multicat/0002-Fix-musl-build.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Fix musl build
-
-Defining _GNU_SOURCE is required to get proper member names in `struct udphdr`
-when building against musl. Build error:
-
-  util.c: In function 'RawFillHeaders':
-  util.c:481:9: error: 'struct udphdr' has no member named 'source'
-       udph->source = htons(portsrc);
-           ^
-  util.c:482:9: error: 'struct udphdr' has no member named 'dest'
-       udph->dest   = htons(portdst);
-           ^
-  util.c:483:9: error: 'struct udphdr' has no member named 'len'
-       udph->len    = htons(sizeof(struct udphdr) + len);
-           ^
-  util.c:484:9: error: 'struct udphdr' has no member named 'check'
-       udph->check  = 0;
-
-Including <sys/types.h> in needed for mode_t, otherwise musl build fails:
-  util.h:91:1: error: unknown type name 'mode_t'
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
-Sent upstream: https://mailman.videolan.org/pipermail/multicat-devel/2016-March/000126.html
-
-diff -purN multicat-2.1.orig/util.c multicat-2.1/util.c
---- multicat-2.1.orig/util.c	2015-07-17 18:03:17.000000000 +0200
-+++ multicat-2.1/util.c	2016-03-19 22:21:01.110178772 +0100
-@@ -21,6 +21,8 @@
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301, USA.
-  *****************************************************************************/
- 
-+#define _GNU_SOURCE
-+
- #include <stdlib.h>
- #include <stdio.h>
- #include <stdint.h>
-diff -purN multicat-2.1.orig/util.h multicat-2.1/util.h
---- multicat-2.1.orig/util.h	2015-07-15 22:47:39.000000000 +0200
-+++ multicat-2.1/util.h	2016-03-19 22:21:58.649834990 +0100
-@@ -21,6 +21,7 @@
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301, USA.
-  *****************************************************************************/
- 
-+#include <sys/types.h>
- #include <netinet/udp.h>
- #include <netinet/ip.h>
- 
diff --git a/package/multicat/0003-Fix-have-clock-nanosleep-with-uclibc.patch b/package/multicat/0003-Fix-have-clock-nanosleep-with-uclibc.patch
deleted file mode 100644
index 108fb0b85b8f..000000000000
--- a/package/multicat/0003-Fix-have-clock-nanosleep-with-uclibc.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-uClibc may be configured without support for clock_nanosleep(). The function is
-only available with uClibc if the C library is build with NPTL support (sets
-__UCLIBC_HAS_THREADS_NATIVE__) and __UCLIBC_HAS_ADVANCED_REALTIME__ set.
-
-Upstream status: Pending
-https://mailman.videolan.org/pipermail/multicat-devel/2016-March/000129.html
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
-
-diff -purN multicat-2.1.orig/util.h multicat-2.1/util.h
---- multicat-2.1.orig/util.h	2015-07-15 22:47:39.000000000 +0200
-+++ multicat-2.1/util.h	2016-03-20 18:13:51.899780405 +0100
-@@ -26,7 +26,10 @@
- 
- #ifdef __APPLE__
- #define POLLRDHUP 0
--#else
-+/* uClibc may not have clock_nanosleep() available */
-+#elif !defined (__UCLIBC__) || \
-+       defined (__UCLIBC__) && defined (__UCLIBC_HAS_THREADS_NATIVE__) \
-+                            && defined (__UCLIBC_HAS_ADVANCED_REALTIME__)
- #define HAVE_CLOCK_NANOSLEEP
- #endif
- 
diff --git a/package/multicat/multicat.hash b/package/multicat/multicat.hash
index 38cf9d7dc4e3..0f718d0e0e69 100644
--- a/package/multicat/multicat.hash
+++ b/package/multicat/multicat.hash
@@ -1,4 +1,5 @@
-# from https://get.videolan.org/multicat/2.1/multicat-2.1.tar.bz2.md5
-md5 2e3ecd8dee64f5bd32a61733d4cc2226 multicat-2.1.tar.bz2
+# from https://get.videolan.org/multicat/2.2/multicat-2.2.tar.bz2.md5
+md5 91bd35aa5aa94c370664276bd5af6f48 multicat-2.2.tar.bz2
 # locally calculated
-sha256 5eabe8d9a3dde452b2d348683cc7da213680551a9d4059c356f7319c6aa9b3d1 multicat-2.1.tar.bz2
+sha256 fa4e48b38665658df7719293f9358df08f59f3eb7f7b77df510b35951e316b40 multicat-2.2.tar.bz2
+sha256 94f68aec169fb6c9937eade757251714d38a56812be5dbfc3973914a71ad8d2d COPYING
diff --git a/package/multicat/multicat.mk b/package/multicat/multicat.mk
index 6f882667bd76..67cebec26adb 100644
--- a/package/multicat/multicat.mk
+++ b/package/multicat/multicat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MULTICAT_VERSION = 2.1
+MULTICAT_VERSION = 2.2
 MULTICAT_SOURCE = multicat-$(MULTICAT_VERSION).tar.bz2
 MULTICAT_SITE = https://get.videolan.org/multicat/$(MULTICAT_VERSION)
 MULTICAT_LICENSE = GPL-2.0+
@@ -12,7 +12,9 @@ MULTICAT_LICENSE_FILES = COPYING
 
 MULTICAT_DEPENDENCIES = bitstream
 
-MULTICAT_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS)
+# Makefile does not use LDFLAGS. Use LDLIBS for that instead.
+MULTICAT_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+	LDLIBS="$(TARGET_LDFLAGS)"
 
 define MULTICAT_BUILD_CMDS
 	$(MULTICAT_MAKE_ENV) $(MAKE) -C $(@D)
-- 
2.17.0
