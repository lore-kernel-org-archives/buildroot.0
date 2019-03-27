From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 23:19:31 +0100
Subject: [Buildroot] [git commit] package/rtptools: bump to version 1.0.22
Message-ID: <20190327221945.0ECE587F43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b3aaec681cc2d105b9fbf6ac745b3695249c797
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version) and drop autoreconf
- Replace COPYRIGHT by LICENSE (and add its hash)
- License is now BSD-3-Clause:
  https://github.com/cu-irt/rtptools/commit/ed971d5e2b875294f22c0762d60aa7e409823789
- Disable clang (enabled by default)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...isable-NIS-support-for-toolchains-lacking.patch | 73 ----------------------
 package/rtptools/rtptools.hash                     |  3 +-
 package/rtptools/rtptools.mk                       |  8 +--
 3 files changed, 6 insertions(+), 78 deletions(-)

diff --git a/package/rtptools/0001-host2ip.c-disable-NIS-support-for-toolchains-lacking.patch b/package/rtptools/0001-host2ip.c-disable-NIS-support-for-toolchains-lacking.patch
deleted file mode 100644
index 1bf7c13491..0000000000
--- a/package/rtptools/0001-host2ip.c-disable-NIS-support-for-toolchains-lacking.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From f8ffde6c0c0a9008cd65601f6c9712899106e42c Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Mon, 11 Apr 2016 23:03:48 +0200
-Subject: [PATCH] host2ip.c: disable NIS support for toolchains lacking SUN RPC
-
-Some toolchains are missing SUN RPC; this is the case for toolchains
-based on uClibc, and some glibc-based toolchains (when SUN RPC headers
-were taken out of glibc).
-
-Add a configure check for the required SUN RPC header, and make the code
-using SUN RPC conditional on the result.
-
-Also drop the legacy AM_C_PROTOTYPES: it is no longer supported by
-autoconf and breaks autoreconf.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[yann.morin.1998 at free.fr: add the ./configure check; do not include
- features.h; do not check specifically for uClibc]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- configure.in | 3 ++-
- host2ip.c    | 5 +++++
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/configure.in b/configure.in
-index de394cf..889e6ed 100644
---- a/configure.in
-+++ b/configure.in
-@@ -39,9 +39,10 @@ CU_CHECK_LIB(socket, socket)
- dnl Checks for header files.
- AC_HEADER_STDC
- AC_CHECK_HEADERS(search.h sys/time.h unistd.h)
-+AC_CHECK_HEADER([rpcsvc/ypclnt.h],
-+                [AC_DEFINE([HAVE_YP],[1],[Define to 1 if you have rpcsvc/ypclnt.h])])
- 
- dnl Checks for typedefs, structures, and compiler characteristics.
--AM_C_PROTOTYPES
- AC_C_CONST
- AC_C_BIGENDIAN
- AC_TYPE_UID_T
-diff --git a/host2ip.c b/host2ip.c
-index b094343..95014cd 100644
---- a/host2ip.c
-+++ b/host2ip.c
-@@ -3,7 +3,10 @@
- #include <netdb.h>           /* gethostbyname() */
- #include <netinet/in.h>      /* sockaddr_in */
- #include <arpa/inet.h>       /* inet_addr() */
-+#ifdef HAVE_YP
- #include <rpcsvc/ypclnt.h>   /* YP */
-+#endif
-+
- #include <string.h>          /* strlen() added by Akira 12/27/01 */ 
- #include "sysdep.h"
- 
-@@ -28,6 +31,7 @@ struct in_addr host2ip(char *host)
-   else if ((hep = gethostbyname(host))) {
-     in = *(struct in_addr *)(hep->h_addr_list[0]);
-   }
-+#ifdef HAVE_YP
-   /* As a last resort, try YP. */
-   else {
-     static char *domain = 0;  /* YP domain */
-@@ -39,5 +43,6 @@ struct in_addr host2ip(char *host)
-       in.s_addr = inet_addr(value);
-     }
-   }
-+#endif
-   return in;
- } /* host2ip */
--- 
-1.9.1
-
diff --git a/package/rtptools/rtptools.hash b/package/rtptools/rtptools.hash
index bf5b4a6f04..11c8c2ab4b 100644
--- a/package/rtptools/rtptools.hash
+++ b/package/rtptools/rtptools.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	99d681f6e328486fa1fc16581b0a5974e31eb2708101683ee9c8a0b6bed31050	rtptools-1.20.tar.gz
+sha256	2c76b2a423fb943820c91194372133a44cbdc456ebf69c51616ec50eeb068c28	rtptools-1.22.tar.gz
+sha256	f864592065e232c0b444ae9682a7a1a2c6aafe96712999f794bec24d4441a6a9	LICENSE
diff --git a/package/rtptools/rtptools.mk b/package/rtptools/rtptools.mk
index 7990e8f1c6..2148b759ac 100644
--- a/package/rtptools/rtptools.mk
+++ b/package/rtptools/rtptools.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-RTPTOOLS_VERSION = 1.20
+RTPTOOLS_VERSION = 1.22
 RTPTOOLS_SITE = http://www.cs.columbia.edu/irt/software/rtptools/download
-RTPTOOLS_LICENSE = MIT-like (research and education only)
-RTPTOOLS_LICENSE_FILES = COPYRIGHT
-RTPTOOLS_AUTORECONF = YES
+RTPTOOLS_LICENSE = BSD-3-Clause
+RTPTOOLS_LICENSE_FILES = LICENSE
+RTPTOOLS_CONF_ENV = ac_cv_prog_FOUND_CLANG=no
 
 $(eval $(autotools-package))
