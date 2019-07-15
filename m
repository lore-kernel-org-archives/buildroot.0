From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 15 Jul 2019 10:48:49 +0200
Subject: [Buildroot] [PATCH v2] package/x11r7/xlib_libXfont: work around gcc
 bug 85180
Message-ID: <20190715084849.5393-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building xlib_libXfont with optimization but not when
building with -O0. To work around this, if
BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we force using -O0.

Fixes:
http://autobuild.buildroot.net/results/7c6/7c64becbf06a1e00e41b7ddb95dd0c65bf364eb7/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
V1->V2:
* Use <pkg>_CONF_ENV instead of <pkg>_CONF_OPTS
 package/x11r7/xlib_libXfont/xlib_libXfont.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index a1acfba83b..eeddfeebc9 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -30,5 +30,13 @@ ifeq ($(BR2_microblaze),y)
 XLIB_LIBXFONT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D__ELF__"
 endif
 
+XLIB_LIBXFONT_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+XLIB_LIBXFONT_CFLAGS += -O0
+endif
+
+XLIB_LIBXFONT_CONF_ENV += CFLAGS="$(XLIB_LIBXFONT_CFLAGS)"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.17.1
