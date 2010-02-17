From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Feb 2010 11:10:23 +0100
Subject: [Buildroot] [git commit master] argus: fix compile breakage
Message-ID: <20100217101056.6EE8D7711B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5f41cfe3cdcda3b66b757c0f5832c6ade6d32438
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch that includes pcap.h instead of hardcoding an incorrect
prototype for a function provided by libpcap.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../argus-3.0.0.rc.34-01-use-pcap-header.patch     |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/argus/argus-3.0.0.rc.34-01-use-pcap-header.patch

diff --git a/package/argus/argus-3.0.0.rc.34-01-use-pcap-header.patch b/package/argus/argus-3.0.0.rc.34-01-use-pcap-header.patch
new file mode 100644
index 0000000..2060c93
--- /dev/null
+++ b/package/argus/argus-3.0.0.rc.34-01-use-pcap-header.patch
@@ -0,0 +1,27 @@
+Instead of hardcoding a wrong prototype for a libcap function, include
+the correct header.
+
+Index: argus-3.0.0.rc.34/argus/ArgusSource.c
+===================================================================
+--- argus-3.0.0.rc.34.orig/argus/ArgusSource.c	2010-02-09 22:57:21.000000000 +0100
++++ argus-3.0.0.rc.34/argus/ArgusSource.c	2010-02-09 22:57:29.000000000 +0100
+@@ -53,6 +53,7 @@
+ #define PPP_HDRLEN      4       /* length of PPP header */
+ #endif
+ 
++#include <pcap.h>
+ 
+ void ArgusGetInterfaceStatus (struct ArgusSourceStruct *src);
+ 
+Index: argus-3.0.0.rc.34/argus/ArgusSource.h
+===================================================================
+--- argus-3.0.0.rc.34.orig/argus/ArgusSource.h	2010-02-09 22:57:35.000000000 +0100
++++ argus-3.0.0.rc.34/argus/ArgusSource.h	2010-02-09 22:57:54.000000000 +0100
+@@ -381,7 +381,6 @@
+ 
+ int ArgusCreatePktFromFddi(const struct fddi_header *, struct ether_header *, int);
+ 
+-extern char *bpf_image(struct bpf_insn *, int);
+ 
+ 
+ #else /* defined(ArgusSource) */
-- 
1.6.3.3
