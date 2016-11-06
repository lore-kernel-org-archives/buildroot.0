From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  6 Nov 2016 20:43:09 +0200
Subject: [Buildroot] [RFC 3/3] Revert "norm: add patch to fix musl build"
In-Reply-To: <0cb3afed06c399b9e7d721aa3dafe6ba0eb7e5e5.1478457789.git.baruch@tkos.co.il>
References: <0cb3afed06c399b9e7d721aa3dafe6ba0eb7e5e5.1478457789.git.baruch@tkos.co.il>
Message-ID: <3cedb4424b0826b35f827d529339d8349b3f0d5d.1478457789.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit e74d4fc4932df4ea42381acb44d616241275b79a.

With the applied musl/kernel headers conflict workaround this patch is no
longer necessary.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...03-remove-kernel-headers-include-musl-fix.patch | 55 ----------------------
 1 file changed, 55 deletions(-)
 delete mode 100644 package/norm/0003-remove-kernel-headers-include-musl-fix.patch

diff --git a/package/norm/0003-remove-kernel-headers-include-musl-fix.patch b/package/norm/0003-remove-kernel-headers-include-musl-fix.patch
deleted file mode 100644
index 7581c10b79bb..000000000000
--- a/package/norm/0003-remove-kernel-headers-include-musl-fix.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Remove kernel header includes causing issues with musl
-
-Include the kernel headers from netfilter causes a conflict with the
-<netinet/in.h> way of defining the IPPROTO_* constants, resulting in
-the following build failure:
-
-In file included from /home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/netdb.h:9:0,
-                 from /home/peko/autobuild/instance-0/output/build/norm-1.5r6/protolib/include/protoAddress.h:13,
-                 from /home/peko/autobuild/instance-0/output/build/norm-1.5r6/protolib/include/protoDetour.h:5,
-                 from ../protolib/src/linux/linuxDetour.cpp:3:
-/home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/in.h:28:3: error: expected identifier before numeric constant
-   IPPROTO_IP = 0,  /* Dummy protocol for TCP  */
-   ^
-/home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/in.h:28:3: error: expected '}' before numeric constant
-/home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/in.h:28:3: error: expected unqualified-id before numeric constant
-In file included from /home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/netfilter.h:7:0,
-                 from /home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/netfilter_ipv4.h:8,
-                 from ../protolib/src/linux/linuxDetour.cpp:10:
-/home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/in.h:79:1: error: expected declaration before '}' token
- };
- ^
-
-Since from musl's developers perspective including kernel headers is
-seen as being unsafe, we simply duplicate the necessary netfilter
-definitions (there are just a few) instead of including some kernel
-headers.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/protolib/src/linux/linuxDetour.cpp
-===================================================================
---- a/protolib/src/linux/linuxDetour.cpp
-+++ b/protolib/src/linux/linuxDetour.cpp
-@@ -7,15 +7,18 @@
- #include <stdlib.h>  // for atoi(), getenv()
- #include <stdio.h>
- #include <unistd.h>  // for close()
--#include <linux/netfilter_ipv4.h>  // for NF_IP_LOCAL_OUT, etc
--#include <linux/netfilter_ipv6.h>  // for NF_IP6_LOCAL_OUT, etc
--#include <linux/netfilter.h>  // for NF_ACCEPT, etc
- #include <libnetfilter_queue/libnetfilter_queue.h>
- 
- #include <fcntl.h>  // for fcntl(), etc
- #include <linux/if_ether.h>  // for ETH_P_IP
- #include <net/if_arp.h>   // for ARPHRD_ETHER
- 
-+/* From netfilter kernel headers */
-+#define NF_IP_LOCAL_OUT		3
-+
-+#define NF_DROP 		0
-+#define NF_ACCEPT 		1
-+
- /** NOTES: 
-  *
-  * 1) This newer implementation of LinuxDetour uses netfilter_queue
-- 
2.10.2
