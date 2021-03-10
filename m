From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 10 Mar 2021 20:21:39 +0100
Subject: [Buildroot] [PATCH 2/2] package/libnet: bump to version 1.2
In-Reply-To: <20210310192139.265084-1-fontaine.fabrice@gmail.com>
References: <20210310192139.265084-1-fontaine.fabrice@gmail.com>
Message-ID: <20210310192139.265084-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- As stated in https://sourceforge.net/projects/libnet-dev/, "this
  project no longer uses sourceforge", so switch site to
  https://github.com/libnet/libnet
- Drop patch (already in version)
- Use the new LICENSE file:
  https://github.com/libnet/libnet/commit/e4fb7e9a1ac7b1695235519ac81bfda616776504
- Update indentation in hash file (two spaces)

https://github.com/libnet/libnet/releases/tag/v1.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...d-of-__int64_t-for-mingw-cross-build.patch | 31 ++++++++++++
 package/libnet/0001-support-musl-libc.patch   | 50 -------------------
 package/libnet/Config.in                      |  2 +-
 package/libnet/libnet.hash                    |  8 +--
 package/libnet/libnet.mk                      |  7 +--
 5 files changed, 40 insertions(+), 58 deletions(-)
 create mode 100644 package/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-cross-build.patch
 delete mode 100644 package/libnet/0001-support-musl-libc.patch

diff --git a/package/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-cross-build.patch b/package/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-cross-build.patch
new file mode 100644
index 0000000000..793b3069c8
--- /dev/null
+++ b/package/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-cross-build.patch
@@ -0,0 +1,31 @@
+From a1659e261888bdbed51803132d52d9a6c6803c8a Mon Sep 17 00:00:00 2001
+From: Joachim Nilsson <troglobit@gmail.com>
+Date: Sat, 19 Oct 2019 12:26:26 +0200
+Subject: [PATCH] Use standard int64_t instead of __int64_t for mingw cross
+ build
+
+Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
+[Retrieved from:
+https://github.com/libnet/libnet/commit/a1659e261888bdbed51803132d52d9a6c6803c8a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/libnet/libnet-structures.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/include/libnet/libnet-structures.h b/include/libnet/libnet-structures.h
+index 6084caa..34fffc6 100644
+--- a/include/libnet/libnet-structures.h
++++ b/include/libnet/libnet-structures.h
+@@ -49,9 +49,9 @@ struct libnet_port_list_chain
+ /* libnet statistics structure */
+ struct libnet_stats
+ {
+-    __int64_t packets_sent;               /* packets sent */
+-    __int64_t packet_errors;              /* packets errors */
+-    __int64_t bytes_written;              /* bytes written */
++    int64_t packets_sent;               /* packets sent */
++    int64_t packet_errors;              /* packets errors */
++    int64_t bytes_written;              /* bytes written */
+ };
+ 
+ 
diff --git a/package/libnet/0001-support-musl-libc.patch b/package/libnet/0001-support-musl-libc.patch
deleted file mode 100644
index 0704157bb5..0000000000
--- a/package/libnet/0001-support-musl-libc.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From ffd7fab744a9ad2893169a8fb6244074604d5d0d Mon Sep 17 00:00:00 2001
-From: rofl0r <retnyg@gmx.net>
-Date: Tue, 12 Aug 2014 21:51:39 +0200
-Subject: [PATCH] Support musl libc, remove support for glibc < 2.1
-
-The workarounds for glibc < 2.1 (was released february 1999) break the
-build with musl libc.
-
-It is very unlikely that 2.0 or earlier is still in use, and if so,
-1) that's a big security hole
-2) code wouldnt compile anyway since noone tested build in the last decade
-3) user of it wouldn't expect anyway to get bleeding edge sw built on it,
-   so he would just use the latest version that works for him.
-
-Closes #52
----
- libnet/src/libnet_link_linux.c | 11 -----------
- 1 file changed, 11 deletions(-)
-
-diff --git a/libnet/src/libnet_link_linux.c b/libnet/src/libnet_link_linux.c
-index 054458d..3c6df3c 100644
---- a/src/libnet_link_linux.c
-+++ b/src/libnet_link_linux.c
-@@ -30,26 +30,15 @@
- #include <sys/time.h>
- 
- #include <net/if.h>
--#if (__GLIBC__)
- #include <netinet/if_ether.h>
- #include <net/if_arp.h>
--#else
--#include <linux/if_arp.h>
--#include <linux/if_ether.h>
--#endif
- 
- #if (HAVE_PACKET_SOCKET)
- #ifndef SOL_PACKET
- #define SOL_PACKET 263
- #endif  /* SOL_PACKET */
--#if __GLIBC__ >= 2 && __GLIBC_MINOR >= 1
- #include <netpacket/packet.h>
- #include <net/ethernet.h>     /* the L2 protocols */
--#else
--#include <asm/types.h>
--#include <linux/if_packet.h>
--#include <linux/if_ether.h>   /* The L2 protocols */
--#endif
- #endif  /* HAVE_PACKET_SOCKET */
- 
- #include "../include/libnet.h"
diff --git a/package/libnet/Config.in b/package/libnet/Config.in
index 7186972b7e..135f97e948 100644
--- a/package/libnet/Config.in
+++ b/package/libnet/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBNET
 	  libnet provides a portable framework for low-level network
 	  packet construction.
 
-	  http://sourceforge.net/projects/libnet-dev
+	  https://github.com/libnet/libnet
diff --git a/package/libnet/libnet.hash b/package/libnet/libnet.hash
index 9f62aeda60..1f03d8f983 100644
--- a/package/libnet/libnet.hash
+++ b/package/libnet/libnet.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libnet-dev/files/
-sha1 dffff71c325584fdcf99b80567b60f8ad985e34c libnet-1.1.6.tar.gz
-md5 710296fe424a49344e5fcc0d09e53317 libnet-1.1.6.tar.gz
+# From https://github.com/libnet/libnet/releases/download/v1.2/libnet-1.2.tar.gz.md5
+md5  a36c669e0cdfda6a2aa3adfb1f6fe60a libnet-1.2.tar.gz
 # Locally computed
-sha256  961355c8bac6de11ecb8f634111986712e80a88272c0bb0954fd1810e6f47cab  doc/COPYING
+sha256  caa4868157d9e5f32e9c7eac9461efeff30cb28357f7f6bf07e73933fb4edaa7  libnet-1.2.tar.gz
+sha256  a06f600f67f239898d85f083aeed82ce6015b1c57599ab1def00fb68787ef388  LICENSE
diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
index 5c5071b9c3..da7d5db3ed 100644
--- a/package/libnet/libnet.mk
+++ b/package/libnet/libnet.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-LIBNET_VERSION = 1.1.6
-LIBNET_SITE = http://sourceforge.net/projects/libnet-dev/files
+LIBNET_VERSION = 1.2
+LIBNET_SITE = \
+	https://github.com/libnet/libnet/releases/download/v$(LIBNET_VERSION)
 LIBNET_INSTALL_STAGING = YES
 # PF_PACKET is always available on Linux
 LIBNET_CONF_OPTS = libnet_cv_have_packet_socket=yes
 LIBNET_LICENSE = BSD-2-Clause, BSD-3-Clause
-LIBNET_LICENSE_FILES = doc/COPYING
+LIBNET_LICENSE_FILES = LICENSE
 LIBNET_CPE_ID_VENDOR = libnet_project
 
 $(eval $(autotools-package))
-- 
2.30.0
