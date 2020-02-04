From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  4 Feb 2020 11:01:26 +0100
Subject: [Buildroot] [PATCH] package/can-utils: bump to version 2020.02.0
Message-ID: <20200204100126.26131-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Remove the upstreamed patch and change the license information.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...o-find-SIOCGSTAMP-with-latest-kernel.patch | 109 ------------------
 package/can-utils/can-utils.hash              |   5 +-
 package/can-utils/can-utils.mk                |   6 +-
 3 files changed, 6 insertions(+), 114 deletions(-)
 delete mode 100644 package/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch

diff --git a/package/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch b/package/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
deleted file mode 100644
index 3cde5b42af..0000000000
--- a/package/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From e9590b1ca75d360eaf3211bebd86058214d48064 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 14 Jul 2019 21:50:43 +0200
-Subject: [PATCH] fix include to find SIOCGSTAMP with latest kernel
-
-In linux kernel commit 0768e17073dc527ccd18ed5f96ce85f9985e9115
-the asm-generic/sockios.h header no longer defines SIOCGSTAMP.
-Instead it provides only SIOCGSTAMP_OLD.
-
-The linux/sockios.h header now defines SIOCGSTAMP using either
-SIOCGSTAMP_OLD or SIOCGSTAMP_NEW as appropriate. This linux only
-header file is not pulled so we get a build failure.
-
-canlogserver.c: In function 'main':
-canlogserver.c:404:21: error: 'SIOCGSTAMP' undeclared (first use in this function); did you mean 'SIOCGRARP'?
-     if (ioctl(s[i], SIOCGSTAMP, &tv) < 0)
-                     ^~~~~~~~~~
-                     SIOCGRARP
-canlogserver.c:404:21: note: each undeclared identifier is reported only once for each function it appears in
-
-Fixes:
- - http://autobuild.buildroot.org/results/363de7d9bf433be8bc47ba4ee52ae0bb80fa9021
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/linux-can/can-utils/pull/147]
----
- canlogserver.c | 1 +
- cansniffer.c   | 1 +
- isotpdump.c    | 1 +
- isotpperf.c    | 1 +
- isotpsniffer.c | 1 +
- slcanpty.c     | 1 +
- 6 files changed, 6 insertions(+)
-
-diff --git a/canlogserver.c b/canlogserver.c
-index f9ae159..4429ccd 100644
---- a/canlogserver.c
-+++ b/canlogserver.c
-@@ -62,6 +62,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- #include <signal.h>
- #include <errno.h>
- 
-diff --git a/cansniffer.c b/cansniffer.c
-index b710058..0ff29b4 100644
---- a/cansniffer.c
-+++ b/cansniffer.c
-@@ -62,6 +62,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/bcm.h>
-+#include <linux/sockios.h>
- 
- #include "terminal.h"
- 
-diff --git a/isotpdump.c b/isotpdump.c
-index 1ab9416..97baeca 100644
---- a/isotpdump.c
-+++ b/isotpdump.c
-@@ -57,6 +57,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- #include "terminal.h"
- 
- #define NO_CAN_ID 0xFFFFFFFFU
-diff --git a/isotpperf.c b/isotpperf.c
-index 6ee6ede..5ad302a 100644
---- a/isotpperf.c
-+++ b/isotpperf.c
-@@ -57,6 +57,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- 
- #define NO_CAN_ID 0xFFFFFFFFU
- #define PERCENTRES 2 /* resolution in percent for bargraph */
-diff --git a/isotpsniffer.c b/isotpsniffer.c
-index 6c19c8b..5d61872 100644
---- a/isotpsniffer.c
-+++ b/isotpsniffer.c
-@@ -56,6 +56,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/isotp.h>
-+#include <linux/sockios.h>
- #include "terminal.h"
- 
- #define NO_CAN_ID 0xFFFFFFFFU
-diff --git a/slcanpty.c b/slcanpty.c
-index e90b32a..5fdfa55 100644
---- a/slcanpty.c
-+++ b/slcanpty.c
-@@ -37,6 +37,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- 
- /* maximum rx buffer len: extended CAN frame with timestamp */
- #define SLC_MTU (sizeof("T1111222281122334455667788EA5F\r")+1)
--- 
-2.20.1
-
diff --git a/package/can-utils/can-utils.hash b/package/can-utils/can-utils.hash
index 403c59787e..adbf5b0bca 100644
--- a/package/can-utils/can-utils.hash
+++ b/package/can-utils/can-utils.hash
@@ -1,3 +1,4 @@
 # Locally computed
-sha256  370ad4b19447c29099f7300548f1a3362d6e123c4a6a827dbbd3110bc2c26839  can-utils-2018.02.0.tar.gz
-sha256  c258939ebb09c3857f5fc7704a449e5077cc881090c87b38f9a81332b96fa075  Makefile
+sha256  ea0f96a02af37f16713284c7bdccdbae716d9bcb979ccfb51185d696c31f9ecf  can-utils-2020.02.0.tar.gz
+sha256  c3dc748f5e725cf5ed89784fe78e4ff1b05d309bf1e7ade4c572e8fde1b8406c  LICENSES/BSD-3-Clause
+sha256  995a31f60a9ddb4c609214cc7d17ca94cc3cbc7f37e1e64dba81e7f8ea9d4f91  LICENSES/GPL-2.0-only.txt
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 7e919a3efa..cd4dba5616 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-CAN_UTILS_VERSION = 2018.02.0
+CAN_UTILS_VERSION = 2020.02.0
 CAN_UTILS_SITE = $(call github,linux-can,can-utils,v$(CAN_UTILS_VERSION))
-CAN_UTILS_LICENSE = BSD-3-Clause or GPL-2.0, GPL-2.0+
-CAN_UTILS_LICENSE_FILES = Makefile
+CAN_UTILS_LICENSE = BSD-3-Clause or GPL-2.0
+CAN_UTILS_LICENSE_FILES = LICENSES/BSD-3-Clause LICENSES/GPL-2.0-only.txt
 CAN_UTILS_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.17.0
