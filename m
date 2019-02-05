From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Feb 2019 08:15:09 +0100
Subject: [Buildroot] [git commit] package/gnu-efi: fix build on armv5
Message-ID: <20190205071432.7539983881@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37a1c59c4caaaf0460f958008c1e2985c6f97de8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't override the user-provided ARCH when cross-compiling otherwise
ARCH won't be correct for armv5, aarch64 and x86_64

Fixes:
 - http://autobuild.buildroot.org/results/2dfc0e10da25a8382a43557420d7dc3444c02dbb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ts-don-t-override-ARCH-when-cross-compili.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/gnu-efi/0002-Make.defaults-don-t-override-ARCH-when-cross-compili.patch b/package/gnu-efi/0002-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
new file mode 100644
index 0000000000..c256541781
--- /dev/null
+++ b/package/gnu-efi/0002-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
@@ -0,0 +1,32 @@
+From 3452721eafae90749f4af63264c412f398460b15 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 20 Jan 2019 21:07:11 +0100
+Subject: [PATCH] Make.defaults: don't override ARCH when cross-compiling
+
+Don't override the user-provided ARCH when cross-compiling otherwise
+ARCH won't be correct for armv5, aarch64 and x86_64
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2dfc0e10da25a8382a43557420d7dc3444c02dbb
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Make.defaults | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Make.defaults b/Make.defaults
+index ba743f1..a0e5632 100755
+--- a/Make.defaults
++++ b/Make.defaults
+@@ -67,7 +67,7 @@ ARCH         ?= $(shell $(HOSTCC) -dumpmachine | cut -f1 -d- | sed -e s,i[345678
+ 
+ # Get ARCH from the compiler if cross compiling 
+ ifneq ($(CROSS_COMPILE),)
+-  override ARCH := $(shell $(CC) -dumpmachine | cut -f1 -d-| sed -e s,i[3456789]86,ia32, -e 's,armv7.*,arm,' )
++  ARCH := $(shell $(CC) -dumpmachine | cut -f1 -d-| sed -e s,i[3456789]86,ia32, -e 's,armv7.*,arm,' )
+ endif
+ 
+ # FreeBSD (and possibly others) reports amd64 instead of x86_64
+-- 
+2.14.1
+
