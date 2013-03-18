From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 14:05:02 +0100
Subject: [Buildroot] [PATCH 096/120] xlib_libXxf86dga: bump revision to
	X11R7.7
In-Reply-To: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
References: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611926-27105-37-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 .../xlib_libXxf86dga-fix-compilation.patch         |   30 ++++++++++++++++++++
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |    2 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga-fix-compilation.patch

diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga-fix-compilation.patch b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga-fix-compilation.patch
new file mode 100644
index 0000000..b11bd0b
--- /dev/null
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga-fix-compilation.patch
@@ -0,0 +1,30 @@
+Upstream-Status: pending
+
+Fix type conversion for x32. For x32 the off_t is 64bit and pointers are 32bit.
+so the conversion of pointer to off_t was resulting into this error:
+
+| XF86DGA2.c:931:24: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
+| cc1: some warnings being treated as errors
+| 
+| make[2]: *** [XF86DGA2.lo] Error 1
+
+Fixed it by typecasting pointer into unsigned long 1st and then again typecasting 
+unsigned long to off_t.
+
+Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/01/04
+
+
+Index: libXxf86dga-1.1.2/src/XF86DGA2.c
+===================================================================
+--- libXxf86dga/src/XF86DGA2.c.orig	2012-03-08 05:35:46.000000000 +0000
++++ libXxf86dga/src/XF86DGA2.c	2012-06-15 08:42:03.000000000 +0100
+@@ -928,7 +928,7 @@ DGAMapPhysical(
+     if ((pMap->fd = open(name, O_RDWR)) < 0)
+ 	return False;
+     pMap->virtual = mmap(NULL, size, PROT_READ | PROT_WRITE,
+-			MAP_FILE | MAP_SHARED, pMap->fd, (off_t)base);
++			MAP_FILE | MAP_SHARED, pMap->fd, (off_t)(unsigned long)base);
+     if (pMap->virtual == (void *)-1)
+ 	return False;
+     mprotect(pMap->virtual, size, PROT_READ | PROT_WRITE);
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index 2bd9ce7..d57b794 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXXF86DGA_VERSION = 1.1.2
+XLIB_LIBXXF86DGA_VERSION = 1.1.3
 XLIB_LIBXXF86DGA_SOURCE = libXxf86dga-$(XLIB_LIBXXF86DGA_VERSION).tar.bz2
 XLIB_LIBXXF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86DGA_INSTALL_STAGING = YES
-- 
1.7.10.4
