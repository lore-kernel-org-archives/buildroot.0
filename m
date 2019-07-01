From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  1 Jul 2019 15:48:00 -0400
Subject: [Buildroot] [PATCH 3/3] package/x11r7/xlib_libX11: Fix reliance on
 a host static libc.
In-Reply-To: <20190701194800.67133-1-aduskett@gmail.com>
References: <20190701194800.67133-1-aduskett@gmail.com>
Message-ID: <20190701194800.67133-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

As per: https://gitlab.freedesktop.org/xorg/lib/libx11/commit/4645e219133458781e3fb48eaea6a74cccb1b9aa

"For Windows targets, libtool uses a wrapper executable, not a wrapper
script (see [1]), which it compiles with the host compiler.  This
doesn't work when cross-compiling."

Because of this change, builds fail on Linux hosts without a static libc, this
patch reverts this change as we are guaranteed to build in a Linux environment.

Fixes:
http://autobuild.buildroot.net/results/ac7c777e5fe31b6eda8b8b662881b07299e57ae9

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .../0002-remove-reliance-on-static-libc.patch | 36 +++++++++++++++++++
 package/x11r7/xlib_libX11/xlib_libX11.mk      |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 package/x11r7/xlib_libX11/0002-remove-reliance-on-static-libc.patch

diff --git a/package/x11r7/xlib_libX11/0002-remove-reliance-on-static-libc.patch b/package/x11r7/xlib_libX11/0002-remove-reliance-on-static-libc.patch
new file mode 100644
index 0000000000..68fda2889e
--- /dev/null
+++ b/package/x11r7/xlib_libX11/0002-remove-reliance-on-static-libc.patch
@@ -0,0 +1,36 @@
+From fc3c35853429ac7b4b7a1d91f639b7c3b946e1b6 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Mon, 1 Jul 2019 15:26:00 -0400
+Subject: [PATCH] remove reliance on static libc.
+
+As per commit: https://gitlab.freedesktop.org/xorg/lib/libx11/commit/4645e219133458781e3fb48eaea6a74cccb1b9aa
+
+"For Windows targets, libtool uses a wrapper executable, not a wrapper
+script (see [1]), which it compiles with the host compiler.  This
+doesn't work when cross-compiling."
+
+Because of this change, builds fail on Linux hosts without a static libc, this
+patch reverts this change.
+
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ src/util/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/util/Makefile.am b/src/util/Makefile.am
+index 3731437..a051567 100644
+--- a/src/util/Makefile.am
++++ b/src/util/Makefile.am
+@@ -10,7 +10,7 @@ AM_CPPFLAGS = \
+ CC = @CC_FOR_BUILD@
+ CPPFLAGS = @CPPFLAGS_FOR_BUILD@
+ CFLAGS = @CFLAGS_FOR_BUILD@
+-LDFLAGS = @LDFLAGS_FOR_BUILD@ -all-static
++LDFLAGS = @LDFLAGS_FOR_BUILD@
+ LIBS =
+ EXEEXT = @EXEEXT_FOR_BUILD@
+ 
+-- 
+2.21.0
+
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 352d07dfde..c51bb53cdb 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -10,6 +10,7 @@ XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
 XLIB_LIBX11_LICENSE_FILES = COPYING
 XLIB_LIBX11_INSTALL_STAGING = YES
+XLIB_LIBX11_AUTORECONF = YES
 XLIB_LIBX11_DEPENDENCIES = \
 	libxcb \
 	xutil_util-macros \
-- 
2.21.0
