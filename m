From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 13:45:07 +0100
Subject: [Buildroot] [git commit] mpv: add support for Raspberry Pi "rpi"
 output
Message-ID: <20180101144311.1EE0381137@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e741412d444f9fd2a9af75bf33066a083f7f81b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mpv now compiles with the "rpi" video driver that provides hardware
acceleration on the Raspberry Pi.

Tested working on a Raspberry Pi 1 Model B+ and Zero.

Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
[Thomas: drop unneeded dependency on rpi-firmware.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpv/0003-rpi-fix-linking-errors.patch | 90 +++++++++++++++++++++++++++
 package/mpv/mpv.mk                            |  9 ++-
 2 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/package/mpv/0003-rpi-fix-linking-errors.patch b/package/mpv/0003-rpi-fix-linking-errors.patch
new file mode 100644
index 0000000..0e65a5a
--- /dev/null
+++ b/package/mpv/0003-rpi-fix-linking-errors.patch
@@ -0,0 +1,90 @@
+From fe482a600d507dc7ce77f6d154a9e8b395f74fdd Mon Sep 17 00:00:00 2001
+From: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
+Date: Tue, 24 Oct 2017 09:47:38 +0100
+Subject: [PATCH] rpi: fix linking errors
+
+Fixes linking issues when compiling with Raspberry Pi support.
+
+Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
+---
+Status: pull request https://github.com/mpv-player/mpv/pull/4883
+---
+ waftools/checks/custom.py | 26 +++++++++++++++++++++++++-
+ wscript                   | 18 +-----------------
+ 2 files changed, 26 insertions(+), 18 deletions(-)
+
+diff --git a/waftools/checks/custom.py b/waftools/checks/custom.py
+index d8065a3..9086795 100644
+--- a/waftools/checks/custom.py
++++ b/waftools/checks/custom.py
+@@ -4,7 +4,7 @@ from waflib import Utils
+ import os
+ 
+ __all__ = ["check_pthreads", "check_iconv", "check_lua",
+-           "check_cocoa", "check_openal"]
++           "check_cocoa", "check_openal", "check_rpi"]
+ 
+ pthreads_program = load_fragment('pthreads.c')
+ 
+@@ -103,3 +103,27 @@ def check_openal(ctx, dependency_identifier):
+         if fn(ctx, dependency_identifier):
+             return True
+     return False
++
++def check_rpi(ctx, dependency_identifier):
++    # We need MMAL/bcm_host/dispmanx APIs.
++    # Upstream keeps pkgconfig files in '/opt/vc/lib/pkgconfig'.
++    # See https://github.com/raspberrypi/userland/issues/245
++    # PKG_CONFIG_SYSROOT_DIR helps with cross compilation.
++    prev_pkg_path = os.getenv('PKG_CONFIG_PATH', '')
++    os.environ['PKG_CONFIG_PATH'] = os.pathsep.join(
++        filter(None, [os.path.join(os.getenv('PKG_CONFIG_SYSROOT_DIR', '/'),
++                                   'opt/vc/lib/pkgconfig'),
++                      prev_pkg_path]))
++
++    checks = [
++        # We still need all OpenGL symbols, because the vo_opengl code is
++        # generic and supports anything from GLES2/OpenGL 2.1 to OpenGL 4 core.
++        check_pkg_config('bcm_host', uselib_store='bcm_host'),
++        check_pkg_config('egl'),
++        check_pkg_config('glesv2'),
++        check_cc(lib=['mmal_core', 'mmal_util', 'mmal_vc_client'], use=['bcm_host']),
++    ]
++
++    ret = all((fn(ctx, dependency_identifier) for fn in checks))
++    os.environ['PKG_CONFIG_PATH'] = prev_pkg_path
++    return ret
+diff --git a/wscript b/wscript
+index 9d88588..84e5f2e 100644
+--- a/wscript
++++ b/wscript
+@@ -732,25 +732,9 @@ video_output_features = [
+         'desc': 'Android support',
+         'func': check_statement('android/api-level.h', '(void)__ANDROID__'),  # arbitrary android-specific header
+     }, {
+-        # We need MMAL/bcm_host/dispmanx APIs. Also, most RPI distros require
+-        # every project to hardcode the paths to the include directories. Also,
+-        # these headers are so broken that they spam tons of warnings by merely
+-        # including them (compensate with -isystem and -fgnu89-inline).
+         'name': '--rpi',
+         'desc': 'Raspberry Pi support',
+-        'func': compose_checks(
+-            check_cc(cflags="-isystem/opt/vc/include/ "+
+-                            "-isystem/opt/vc/include/interface/vcos/pthreads " +
+-                            "-isystem/opt/vc/include/interface/vmcs_host/linux " +
+-                            "-fgnu89-inline",
+-                     linkflags="-L/opt/vc/lib",
+-                     header_name="bcm_host.h",
+-                     lib=['mmal_core', 'mmal_util', 'mmal_vc_client', 'bcm_host']),
+-            # We still need all OpenGL symbols, because the vo_opengl code is
+-            # generic and supports anything from GLES2/OpenGL 2.1 to OpenGL 4 core.
+-            check_cc(lib="EGL"),
+-            check_cc(lib="GLESv2"),
+-        ),
++        'func': check_rpi,
+     } , {
+         'name': '--ios-gl',
+         'desc': 'iOS OpenGL ES hardware decoding interop support',
+-- 
+2.14.2
+
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 730ced6..b7dfb36 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -26,7 +26,6 @@ MPV_CONF_OPTS = \
 	--disable-cuda-hwaccel \
 	--disable-libv4l2 \
 	--disable-opensles \
-	--disable-rpi \
 	--disable-rsound \
 	--disable-rubberband \
 	--disable-uchardet \
@@ -169,6 +168,14 @@ else
 MPV_CONF_OPTS += --disable-sdl1 --disable-sdl2
 endif
 
+# Raspberry Pi support
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+MPV_CONF_OPTS += --enable-rpi --enable-gl
+FFMPEG_DEPENDENCIES += rpi-userland
+else
+MPV_CONF_OPTS += --disable-rpi
+endif
+
 # va-api support
 # This requires one or more of the egl-drm, wayland, x11 backends
 # For now we support wayland and x11
