From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 00:01:39 +0100
Subject: [Buildroot] [git commit branch/next] package/libnet: enable on musl
	configurations
Message-ID: <20161115102609.D974F7FE3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=966e0e8e10d33407775c5e8b6beb98d0a8810072
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Thanks to a patch taken from upstream
(https://github.com/sam-github/libnet/commit/ffd7fab744a9ad2893169a8fb6244074604d5d0d),
we can enable the libnet package on musl toolchain.

Adjusted the file paths manually so the patch applies to the packaged
libnet sources.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
[Thomas: allow the package to be selected with the musl C library.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnet/0001-support-musl-libc.patch | 50 +++++++++++++++++++++++++++++
 package/libnet/Config.in                    |  5 ---
 2 files changed, 50 insertions(+), 5 deletions(-)

diff --git a/package/libnet/0001-support-musl-libc.patch b/package/libnet/0001-support-musl-libc.patch
new file mode 100644
index 0000000..0704157
--- /dev/null
+++ b/package/libnet/0001-support-musl-libc.patch
@@ -0,0 +1,50 @@
+From ffd7fab744a9ad2893169a8fb6244074604d5d0d Mon Sep 17 00:00:00 2001
+From: rofl0r <retnyg@gmx.net>
+Date: Tue, 12 Aug 2014 21:51:39 +0200
+Subject: [PATCH] Support musl libc, remove support for glibc < 2.1
+
+The workarounds for glibc < 2.1 (was released february 1999) break the
+build with musl libc.
+
+It is very unlikely that 2.0 or earlier is still in use, and if so,
+1) that's a big security hole
+2) code wouldnt compile anyway since noone tested build in the last decade
+3) user of it wouldn't expect anyway to get bleeding edge sw built on it,
+   so he would just use the latest version that works for him.
+
+Closes #52
+---
+ libnet/src/libnet_link_linux.c | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/libnet/src/libnet_link_linux.c b/libnet/src/libnet_link_linux.c
+index 054458d..3c6df3c 100644
+--- a/src/libnet_link_linux.c
++++ b/src/libnet_link_linux.c
+@@ -30,26 +30,15 @@
+ #include <sys/time.h>
+ 
+ #include <net/if.h>
+-#if (__GLIBC__)
+ #include <netinet/if_ether.h>
+ #include <net/if_arp.h>
+-#else
+-#include <linux/if_arp.h>
+-#include <linux/if_ether.h>
+-#endif
+ 
+ #if (HAVE_PACKET_SOCKET)
+ #ifndef SOL_PACKET
+ #define SOL_PACKET 263
+ #endif  /* SOL_PACKET */
+-#if __GLIBC__ >= 2 && __GLIBC_MINOR >= 1
+ #include <netpacket/packet.h>
+ #include <net/ethernet.h>     /* the L2 protocols */
+-#else
+-#include <asm/types.h>
+-#include <linux/if_packet.h>
+-#include <linux/if_ether.h>   /* The L2 protocols */
+-#endif
+ #endif  /* HAVE_PACKET_SOCKET */
+ 
+ #include "../include/libnet.h"
diff --git a/package/libnet/Config.in b/package/libnet/Config.in
index 0c5c230..7186972 100644
--- a/package/libnet/Config.in
+++ b/package/libnet/Config.in
@@ -1,12 +1,7 @@
 config BR2_PACKAGE_LIBNET
 	bool "libnet"
-	# Build with musl fails due to header issues
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  libnet provides a portable framework for low-level network
 	  packet construction.
 
 	  http://sourceforge.net/projects/libnet-dev
-
-comment "libnet needs a glibc or uClibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_MUSL
