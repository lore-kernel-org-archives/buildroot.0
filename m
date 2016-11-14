From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 14 Nov 2016 12:29:47 +0100
Subject: [Buildroot] [PATCH 1/2] package/libnet: fix compilation with musl
In-Reply-To: <20161114112948.13292-1-tklauser@distanz.ch>
References: <20161114112948.13292-1-tklauser@distanz.ch>
Message-ID: <20161114112948.13292-2-tklauser@distanz.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch taken from from upstream:
https://github.com/sam-github/libnet/commit/ffd7fab744a9ad2893169a8fb6244074604d5d0d

Adjusted the file paths manually so the patch applies to the packaged
libnet sources.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 package/libnet/0001-support-musl-libc.patch | 50 +++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/libnet/0001-support-musl-libc.patch

diff --git a/package/libnet/0001-support-musl-libc.patch b/package/libnet/0001-support-musl-libc.patch
new file mode 100644
index 000000000000..0704157bb57e
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
-- 
2.11.0.rc0.7.gbe5a750
