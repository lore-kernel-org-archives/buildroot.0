From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 21:41:16 +0100
Subject: [Buildroot] [PATCH 1/2] xserver_xorg-server: fix build on AArch64
Message-ID: <1356727276-13075-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following build issue:

Making all in fb
  CC     libfb_la-fb24_32.lo
In file included from fb24_32.c:30:0:
fb.h:98:2: error: #error "GLYPHPADBYTES must be 4"

See:

 http://autobuild.buildroot.org/results/9135238abcde29918f8cb61002f1fb9279884a47/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xserver_xorg-server-aarch64-support.patch      |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-aarch64-support.patch

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-aarch64-support.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-aarch64-support.patch
new file mode 100644
index 0000000..ec497c8
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-aarch64-support.patch
@@ -0,0 +1,23 @@
+Add necessary definitions for AArch64
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: xserver_xorg-server-1.9.4/include/servermd.h
+===================================================================
+--- xserver_xorg-server-1.9.4.orig/include/servermd.h	2009-11-04 20:31:46.000000000 +0100
++++ xserver_xorg-server-1.9.4/include/servermd.h	2012-12-28 18:16:55.000000000 +0100
+@@ -68,6 +68,14 @@
+  * GLYPHPADBYTES is used.
+  */
+ 
++#ifdef __aarch64__
++
++# define IMAGE_BYTE_ORDER	LSBFirst
++# define BITMAP_BIT_ORDER       LSBFirst
++# define GLYPHPADBYTES		4
++
++#endif
++
+ #ifdef __avr32__
+ 
+ #define IMAGE_BYTE_ORDER        MSBFirst
-- 
1.7.9.5
