From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 23:07:28 +0200
Subject: [Buildroot] [git commit] package/rtptools: fix build for toolchains
	missinf SUN RPC headers
Message-ID: <20160417210738.7364580D9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df7496540455f3da0218ed33162cd3349ae0a5ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use a configure check rather than checking explicitly for uClibc.

Make the patch a git patch at the same time.

Fixes:
    http://autobuild.buildroot.org/results/1cf/1cfe3e019a627e7c092dbd94e4b891179e35bedd/
    http://autobuild.buildroot.org/results/5ba/5bad40610316392c3f213c3e2a27ac76abd88de6/
    http://autobuild.buildroot.org/results/789/789ebdc6a96fc62ca5c98bdd6b90de20872ea221/
    ... and numerous similar build failures

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../rtptools/0001-host2ip-no-nis-on-uClibc.patch   | 45 -------------
 ...isable-NIS-support-for-toolchains-lacking.patch | 73 ++++++++++++++++++++++
 package/rtptools/rtptools.mk                       |  1 +
 3 files changed, 74 insertions(+), 45 deletions(-)

diff --git a/package/rtptools/0001-host2ip-no-nis-on-uClibc.patch b/package/rtptools/0001-host2ip-no-nis-on-uClibc.patch
deleted file mode 100644
index f1a72f9..0000000
--- a/package/rtptools/0001-host2ip-no-nis-on-uClibc.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-host2ip.c: disable NIS support when building with uClibc
-
-uClibc doesn't have NIS support, so simply disable the fallback.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- host2ip.c |   11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-Index: rtptools-1.20/host2ip.c
-===================================================================
---- rtptools-1.20.orig/host2ip.c
-+++ rtptools-1.20/host2ip.c
-@@ -3,7 +3,16 @@
- #include <netdb.h>           /* gethostbyname() */
- #include <netinet/in.h>      /* sockaddr_in */
- #include <arpa/inet.h>       /* inet_addr() */
-+
-+#include <features.h>
-+#ifndef __UCLIBC__
-+#define HAVE_YP
-+#endif
-+
-+#ifdef HAVE_YP
- #include <rpcsvc/ypclnt.h>   /* YP */
-+#endif
-+
- #include <string.h>          /* strlen() added by Akira 12/27/01 */ 
- #include "sysdep.h"
- 
-@@ -28,6 +37,7 @@
-   else if ((hep = gethostbyname(host))) {
-     in = *(struct in_addr *)(hep->h_addr_list[0]);
-   }
-+#ifdef HAVE_YP
-   /* As a last resort, try YP. */
-   else {
-     static char *domain = 0;  /* YP domain */
-@@ -39,5 +49,6 @@
-       in.s_addr = inet_addr(value);
-     }
-   }
-+#endif
-   return in;
- } /* host2ip */
diff --git a/package/rtptools/0001-host2ip.c-disable-NIS-support-for-toolchains-lacking.patch b/package/rtptools/0001-host2ip.c-disable-NIS-support-for-toolchains-lacking.patch
new file mode 100644
index 0000000..1bf7c13
--- /dev/null
+++ b/package/rtptools/0001-host2ip.c-disable-NIS-support-for-toolchains-lacking.patch
@@ -0,0 +1,73 @@
+From f8ffde6c0c0a9008cd65601f6c9712899106e42c Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Mon, 11 Apr 2016 23:03:48 +0200
+Subject: [PATCH] host2ip.c: disable NIS support for toolchains lacking SUN RPC
+
+Some toolchains are missing SUN RPC; this is the case for toolchains
+based on uClibc, and some glibc-based toolchains (when SUN RPC headers
+were taken out of glibc).
+
+Add a configure check for the required SUN RPC header, and make the code
+using SUN RPC conditional on the result.
+
+Also drop the legacy AM_C_PROTOTYPES: it is no longer supported by
+autoconf and breaks autoreconf.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[yann.morin.1998 at free.fr: add the ./configure check; do not include
+ features.h; do not check specifically for uClibc]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ configure.in | 3 ++-
+ host2ip.c    | 5 +++++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index de394cf..889e6ed 100644
+--- a/configure.in
++++ b/configure.in
+@@ -39,9 +39,10 @@ CU_CHECK_LIB(socket, socket)
+ dnl Checks for header files.
+ AC_HEADER_STDC
+ AC_CHECK_HEADERS(search.h sys/time.h unistd.h)
++AC_CHECK_HEADER([rpcsvc/ypclnt.h],
++                [AC_DEFINE([HAVE_YP],[1],[Define to 1 if you have rpcsvc/ypclnt.h])])
+ 
+ dnl Checks for typedefs, structures, and compiler characteristics.
+-AM_C_PROTOTYPES
+ AC_C_CONST
+ AC_C_BIGENDIAN
+ AC_TYPE_UID_T
+diff --git a/host2ip.c b/host2ip.c
+index b094343..95014cd 100644
+--- a/host2ip.c
++++ b/host2ip.c
+@@ -3,7 +3,10 @@
+ #include <netdb.h>           /* gethostbyname() */
+ #include <netinet/in.h>      /* sockaddr_in */
+ #include <arpa/inet.h>       /* inet_addr() */
++#ifdef HAVE_YP
+ #include <rpcsvc/ypclnt.h>   /* YP */
++#endif
++
+ #include <string.h>          /* strlen() added by Akira 12/27/01 */ 
+ #include "sysdep.h"
+ 
+@@ -28,6 +31,7 @@ struct in_addr host2ip(char *host)
+   else if ((hep = gethostbyname(host))) {
+     in = *(struct in_addr *)(hep->h_addr_list[0]);
+   }
++#ifdef HAVE_YP
+   /* As a last resort, try YP. */
+   else {
+     static char *domain = 0;  /* YP domain */
+@@ -39,5 +43,6 @@ struct in_addr host2ip(char *host)
+       in.s_addr = inet_addr(value);
+     }
+   }
++#endif
+   return in;
+ } /* host2ip */
+-- 
+1.9.1
+
diff --git a/package/rtptools/rtptools.mk b/package/rtptools/rtptools.mk
index d93a911..7990e8f 100644
--- a/package/rtptools/rtptools.mk
+++ b/package/rtptools/rtptools.mk
@@ -8,5 +8,6 @@ RTPTOOLS_VERSION = 1.20
 RTPTOOLS_SITE = http://www.cs.columbia.edu/irt/software/rtptools/download
 RTPTOOLS_LICENSE = MIT-like (research and education only)
 RTPTOOLS_LICENSE_FILES = COPYRIGHT
+RTPTOOLS_AUTORECONF = YES
 
 $(eval $(autotools-package))
