From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 16:21:59 +0100
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xserver_xorg-server: fix musl
	build
In-Reply-To: <1453648919-16172-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453648919-16172-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453648919-16172-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autobuilders did not catch the error yet because they failed
earlier with other packages, but I am continuing the build based
on the defconfig from:
http://autobuild.buildroot.net/results/6fb/6fbe96af007803acfe9deacf26399cb19e5f2b47/defconfig

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0002-musl-arm-inb-outb.patch                   | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/x11r7/xserver_xorg-server/0002-musl-arm-inb-outb.patch

diff --git a/package/x11r7/xserver_xorg-server/0002-musl-arm-inb-outb.patch b/package/x11r7/xserver_xorg-server/0002-musl-arm-inb-outb.patch
new file mode 100644
index 0000000..14ddc1c
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/0002-musl-arm-inb-outb.patch
@@ -0,0 +1,25 @@
+Fix musl build
+
+Downloaded from http://patchwork.openembedded.org/patch/111661/
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+inb/outb family for arm is only implemented on glibc
+so assumption across linux is wrong
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: xorg-server-1.18.0/hw/xfree86/common/compiler.h
+===================================================================
+--- xorg-server-1.18.0.orig/hw/xfree86/common/compiler.h
++++ xorg-server-1.18.0/hw/xfree86/common/compiler.h
+@@ -758,7 +758,7 @@ inl(unsigned short port)
+     return xf86ReadMmio32Le((void *) ioBase, port);
+ }
+ 
+-#elif defined(__arm__) && defined(__linux__)
++#elif defined(__arm__) && defined(__GLIBC__)
+ 
+ /* for Linux on ARM, we use the LIBC inx/outx routines */
+ /* note that the appropriate setup via "ioperm" needs to be done */
-- 
2.7.0.rc3
