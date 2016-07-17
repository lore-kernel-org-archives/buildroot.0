From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 17 Jul 2016 13:14:34 +0200
Subject: [Buildroot] [PATCH] package/alljoyn: fix SPARC build issue
Message-ID: <1468754074-14740-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some of the serial port highest speed are not defined on SPARC, so
alljoyn should not use them, so we add a patch to fix that.

From:
c5e96d8935016456bea342db170ae6a139a8470f

Fixes:
http://autobuild.buildroot.net/results/e5b/e5b30b5e0d86b44b97410d434b771e1fb7b18de0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../0001-UARTStreamLinux-fix-build-on-sparc.patch  | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/alljoyn/0001-UARTStreamLinux-fix-build-on-sparc.patch

diff --git a/package/alljoyn/0001-UARTStreamLinux-fix-build-on-sparc.patch b/package/alljoyn/0001-UARTStreamLinux-fix-build-on-sparc.patch
new file mode 100644
index 0000000..efca67f
--- /dev/null
+++ b/package/alljoyn/0001-UARTStreamLinux-fix-build-on-sparc.patch
@@ -0,0 +1,56 @@
+From b8e35cf95184ff18bcf923f900439f56c93609db Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 16 Jul 2016 15:23:41 +0200
+Subject: [PATCH] UARTStreamLinux: fix build on sparc
+
+Some of the serial port highest speed are not defined on SPARC, so
+alljoyn should not use them, so we add a patch to fix that.
+
+From:
+https://git.buildroot.org/buildroot/commit/?id=c5e96d8935016456bea342db170ae6a139a8470f
+
+Fixes:
+http://autobuild.buildroot.net/results/e5b/e5b30b5e0d86b44b97410d434b771e1fb7b18de0
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ common/os/posix/UARTStreamLinux.cc | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/common/os/posix/UARTStreamLinux.cc b/common/os/posix/UARTStreamLinux.cc
+index c193b70..ae81d9d 100644
+--- a/common/os/posix/UARTStreamLinux.cc
++++ b/common/os/posix/UARTStreamLinux.cc
+@@ -111,21 +111,29 @@ QStatus UART(const qcc::String& devName, uint32_t baud, uint8_t databits, const
+         speed = B2000000;
+         break;
+ 
++#ifdef B2500000
+     case 2500000:
+         speed = B2500000;
+         break;
++#endif
+ 
++#ifdef B3000000
+     case 3000000:
+         speed = B3000000;
+         break;
++#endif
+ 
++#ifdef B3500000
+     case 3500000:
+         speed = B3500000;
+         break;
++#endif
+ 
++#ifdef B4000000
+     case 4000000:
+         speed = B4000000;
+         break;
++#endif
+ 
+     default:
+         QCC_LogError(ER_BAD_ARG_2, ("Invalid baud %d", baud));
+-- 
+2.5.5
+
-- 
2.5.5
