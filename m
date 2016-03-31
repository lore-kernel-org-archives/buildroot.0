From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 18:15:46 +0200
Subject: [Buildroot] [git commit] norm: fix build failure with old headers
Message-ID: <20160331161559.38C3781D34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=117af296f819f26599985eff2521d829bfc61c91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The version check for the nfq_get_payload prototype is wrong since it's
done against linux headers when in fact it changed with the 1.0.0
release of libnetfilter_queue, leading to build failure in toolchains
that have old headers when libnetfilter_queue is present. Fixes:
http://autobuild.buildroot.net/results/c0e/c0e897a6db888d4a7e0302cdc1e0cbec7d1e88f3/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-protolib-drop-linux-version-check.patch   | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/norm/0002-protolib-drop-linux-version-check.patch b/package/norm/0002-protolib-drop-linux-version-check.patch
new file mode 100644
index 0000000..7852a30
--- /dev/null
+++ b/package/norm/0002-protolib-drop-linux-version-check.patch
@@ -0,0 +1,38 @@
+The char * to unsigned char * change happened for the libnetfilter_queue
+1.0.0 release, not the linux headers.
+So drop the linux headers version check since it causes more harm than
+good by trying the old API when the toolchain uses old linux headers
+with a new-enough libnetfilter_queue.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura norm-1.5r6.orig/protolib/src/linux/linuxDetour.cpp norm-1.5r6/protolib/src/linux/linuxDetour.cpp
+--- norm-1.5r6.orig/protolib/src/linux/linuxDetour.cpp	2016-03-31 10:17:20.674745597 -0300
++++ norm-1.5r6/protolib/src/linux/linuxDetour.cpp	2016-03-31 10:36:58.923084395 -0300
+@@ -16,8 +16,6 @@
+ #include <linux/if_ether.h>  // for ETH_P_IP
+ #include <net/if_arp.h>   // for ARPHRD_ETHER
+ 
+-#include <linux/version.h>  // for LINUX_VERSION_CODE
+-
+ /** NOTES: 
+  *
+  * 1) This newer implementation of LinuxDetour uses netfilter_queue
+@@ -591,17 +589,7 @@
+     
+     // Finally record packet length and cache pointer to IP packet data
+     
+-    // A change to the nfq_get_payload() prototype seemed to kick in around Linux header files
+-    // version 3.6?  (This will probably need to be fine tuned for the right version threshold.)
+-
+-#define LINUX_VERSION_MAJOR (LINUX_VERSION_CODE/65536)
+-#define LINUX_VERSION_MINOR ((LINUX_VERSION_CODE - (LINUX_VERSION_MAJOR*65536)) / 256)
+-
+-#if ((LINUX_VERSION_MAJOR > 3) || ((LINUX_VERSION_MAJOR == 3) && (LINUX_VERSION_MINOR > 5)))
+     linuxDetour->nfq_pkt_len = nfq_get_payload(nfqData, (unsigned char**)(&linuxDetour->nfq_pkt_data));
+-#else
+-    linuxDetour->nfq_pkt_len = nfq_get_payload(nfqData, &linuxDetour->nfq_pkt_data);
+-#endif //
+     return 0;
+ }  // end LinuxDetour::NfqCallback()
+ 
