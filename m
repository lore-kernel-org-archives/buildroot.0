From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Jan 2019 21:26:52 +0100
Subject: [Buildroot] [PATCH 1/1] gnu-efi: fix build on armv5
Message-ID: <20190120202652.4419-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't override the user-provided ARCH when cross-compiling otherwise
ARCH won't be correct for armv5, aarch64 and x86_64

Fixes:
 - http://autobuild.buildroot.org/results/2dfc0e10da25a8382a43557420d7dc3444c02dbb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ts-don-t-override-ARCH-when-cross-compili.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/gnu-efi/0002-Make.defaults-don-t-override-ARCH-when-cross-compili.patch

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
-- 
2.14.1
