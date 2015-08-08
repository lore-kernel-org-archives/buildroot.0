From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 22:59:06 +0200
Subject: [Buildroot] [git commit] c-periphery: fix SPARC build issue
Message-ID: <20150808210004.C20E7818E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5e96d8935016456bea342db170ae6a139a8470f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some of the serial port highest speed are not defined on SPARC, so
c-periphery should not use them, so we add a patch to fix that.

Fixes:

  http://autobuild.buildroot.net/results/a5d34ef58d45be6fe0b6c8a71ed665d5dc29dfd9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/c-periphery/0002-Fix-build-on-SPARC.patch |   70 +++++++++++++++++++++
 1 files changed, 70 insertions(+), 0 deletions(-)

diff --git a/package/c-periphery/0002-Fix-build-on-SPARC.patch b/package/c-periphery/0002-Fix-build-on-SPARC.patch
new file mode 100644
index 0000000..e491f6f
--- /dev/null
+++ b/package/c-periphery/0002-Fix-build-on-SPARC.patch
@@ -0,0 +1,70 @@
+From 295316c3f44c3e779e85d7453424496a3bb4bc48 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 8 Aug 2015 22:56:09 +0200
+Subject: [PATCH] Fix build on SPARC
+
+On SPARC, the definitions of B2500000, B3000000, B3500000 and B4000000
+are not necessarily available, so use those values only if defined in
+the kernel headers.
+
+It fixes SPARC build failures such as:
+
+src/serial.c: In function '_serial_baudrate_to_bits':
+src/serial.c:73:30: error: 'B2500000' undeclared (first use in this function)
+         case 2500000: return B2500000;
+                              ^
+src/serial.c:73:30: note: each undeclared identifier is reported only once for each function it appears in
+src/serial.c:74:30: error: 'B3000000' undeclared (first use in this function)
+         case 3000000: return B3000000;
+                              ^
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/serial.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/src/serial.c b/src/serial.c
+index e385309..efd425e 100644
+--- a/src/serial.c
++++ b/src/serial.c
+@@ -70,10 +70,18 @@ static int _serial_baudrate_to_bits(uint32_t baudrate) {
+         case 1152000: return B1152000;
+         case 1500000: return B1500000;
+         case 2000000: return B2000000;
++#ifdef B2500000
+         case 2500000: return B2500000;
++#endif
++#ifdef B3000000
+         case 3000000: return B3000000;
++#endif
++#ifdef B3500000
+         case 3500000: return B3500000;
++#endif
++#ifdef B4000000
+         case 4000000: return B4000000;
++#endif
+         default: return -1;
+     }
+ }
+@@ -107,10 +115,18 @@ static int _serial_bits_to_baudrate(uint32_t bits) {
+         case B1152000: return 1152000;
+         case B1500000: return 1500000;
+         case B2000000: return 2000000;
++#ifdef B2500000
+         case B2500000: return 2500000;
++#endif
++#ifdef B3000000
+         case B3000000: return 3000000;
++#endif
++#ifdef B3500000
+         case B3500000: return 3500000;
++#endif
++#ifdef B4000000
+         case B4000000: return 4000000;
++#endif
+         default: return -1;
+     }
+ }
+-- 
+2.5.0
+
