From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 12 Jul 2019 11:04:07 +0200
Subject: [Buildroot] [PATCH] package/x11r7/xlib_libXfont2: work around gcc
 bug 85180
Message-ID: <20190712090407.54154-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building xlib_libXfont2 with optimization but not when
building with -O0. To work around this, if
BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we force using -O0.

Fixes:
http://autobuild.buildroot.net/results/210/21099d27c03948daaca2d1c149eeba084427e3af/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index ba2c7540cb..37e20e5e11 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -27,5 +27,13 @@ HOST_XLIB_LIBXFONT2_DEPENDENCIES = \
 XLIB_LIBXFONT2_CONF_OPTS = --disable-devel-docs
 HOST_XLIB_LIBXFONT2_CONF_OPTS = --disable-devel-docs
 
+XLIB_LIBXFONT2_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+XLIB_LIBXFONT2_CFLAGS += -O0
+endif
+
+XLIB_LIBXFONT2_CONF_OPTS += CFLAGS="$(XLIB_LIBXFONT2_CFLAGS)"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.17.1
