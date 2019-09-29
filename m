From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Sep 2019 08:47:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: remove -mno-compact-eh for
 Code Sourcery MIPS
Message-ID: <20190929064724.4245-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://git.buildroot.net/buildroot/commit/package/mesa3d?id=e032a29604e843c8adc551d5ceb3c45bc7715b4d
added -mno-compact-eh to CFLAGS/CXXFLAGS.

This breaks mesa build since its switch to meson:

Sanity check compile stderr:
cc: error: unrecognized command line option ?-mno-compact-eh?; did you mean ?-fno-compare-elim??

It turns out that mesa3d still builds now with this option.

Fixes:
http://autobuild.buildroot.net/results/37f/37fce69751aa31ae467d502e660d7db513333d4d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b47c6b9b2e..35fe2bdbe5 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -54,14 +54,6 @@ ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS),y)
 MESA3D_DEPENDENCIES += elfutils
 endif
 
-# The Sourcery MIPS toolchain has a special (non-upstream) feature to
-# have "compact exception handling", which unfortunately breaks with
-# mesa3d, so we disable it here by passing -mno-compact-eh.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS),y)
-MESA3D_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mno-compact-eh"
-MESA3D_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -mno-compact-eh"
-endif
-
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
 # Disable-mangling not yet supported by meson build system.
 # glx:
-- 
2.20.1
