From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 21:40:38 +0100
Subject: [Buildroot] [PATCH] libserial: add patch to fix build failure on
	sparc/sparc64
Message-ID: <1447879238-29695-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like c-periphery and lua-periphery, libserial fails to build because
it tries to use some baud rate definitions that are not available on
sparc and sparc64 (the highest baud rates).

This commit fixes that by introducing a patch to libserial to make the
use of these high baud rates conditional on their availability.

Fixes:

  http://autobuild.buildroot.org/results/f9b/f9bbb8a6636cd3e3203b059f627aac7b1d511eb2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...n-t-use-high-baudrates-when-not-available.patch | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 package/libserial/0002-Don-t-use-high-baudrates-when-not-available.patch

diff --git a/package/libserial/0002-Don-t-use-high-baudrates-when-not-available.patch b/package/libserial/0002-Don-t-use-high-baudrates-when-not-available.patch
new file mode 100644
index 0000000..f2ad61a
--- /dev/null
+++ b/package/libserial/0002-Don-t-use-high-baudrates-when-not-available.patch
@@ -0,0 +1,65 @@
+From 47ca0621ccd2100e4ba0d7f4e2a861d14f05f63c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 17 Nov 2015 23:50:14 +0100
+Subject: [PATCH] Don't use high baudrates when not available
+
+On certain architectures (namely Sparc), the maximum baud rate exposed
+by the kernel headers is B2000000. Therefore, the current libserial
+code doesn't build for the Sparc and Sparc64 architectures due to
+this.
+
+In order to address this problem, this patch tests the value of
+__MAX_BAUD. If it's higher than B2000000 then we assume we're on an
+architecture that supports all baud rates up to B4000000. Otherwise,
+we simply don't support the baud rates above B2000000.
+
+Fixes build failures such as:
+
+./SerialPort.h:88:24: error: 'B2500000' was not declared in this scope
+         BAUD_2500000 = B2500000,
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/SerialPort.h      | 2 ++
+ src/SerialStreamBuf.h | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/src/SerialPort.h b/src/SerialPort.h
+index 6c0baaa..0b1af4c 100644
+--- a/src/SerialPort.h
++++ b/src/SerialPort.h
+@@ -85,11 +85,13 @@ public:
+         BAUD_1152000 = B1152000, 
+         BAUD_1500000 = B1500000,
+         BAUD_2000000 = B2000000,
++#if __MAX_BAUD > B2000000
+         BAUD_2500000 = B2500000,
+         BAUD_3000000 = B3000000,
+         BAUD_3500000 = B3500000,
+         BAUD_4000000 = B4000000,
+ #endif
++#endif /* __linux__ */
+         BAUD_DEFAULT = BAUD_57600
+     } ;
+ 
+diff --git a/src/SerialStreamBuf.h b/src/SerialStreamBuf.h
+index ccbb996..174f31c 100644
+--- a/src/SerialStreamBuf.h
++++ b/src/SerialStreamBuf.h
+@@ -85,11 +85,13 @@ extern "C++"
+                 BAUD_1152000 = SerialPort::BAUD_1152000, 
+                 BAUD_1500000 = SerialPort::BAUD_1500000, 
+                 BAUD_2000000 = SerialPort::BAUD_2000000, 
++#if __MAX_BAUD > B2000000
+                 BAUD_2500000 = SerialPort::BAUD_2500000, 
+                 BAUD_3000000 = SerialPort::BAUD_3000000, 
+                 BAUD_3500000 = SerialPort::BAUD_3500000, 
+                 BAUD_4000000 = SerialPort::BAUD_4000000, 
+ #endif
++#endif /* __linux__ */
+                 BAUD_DEFAULT = SerialPort::BAUD_DEFAULT,
+                 BAUD_INVALID = -1
+             } ;
+-- 
+2.6.3
+
-- 
2.6.3
