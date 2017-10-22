From: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Sun, 22 Oct 2017 18:21:26 +0100
Subject: [Buildroot] [PATCH v2] mpv: add support for Raspberry Pi "rpi"
	output
Message-ID: <20171022172126.21775-1-mahyar.koshkouei@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mpv now compiles with the "rpi" video driver that provides hardware
acceleration on the Raspberry Pi.

Tested working on a Raspberry Pi 1 Model B+ and Zero.

Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>

---
Changes v1 -> v2:
  - Changed patch to use pkgconfig (thanks to github.com/Coacher)
---
 .../mpv/0003-rpi-build-Fix-linking-errors.patch    | 72 ++++++++++++++++++++++
 package/mpv/mpv.mk                                 |  9 ++-
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 package/mpv/0003-rpi-build-Fix-linking-errors.patch

diff --git a/package/mpv/0003-rpi-build-Fix-linking-errors.patch b/package/mpv/0003-rpi-build-Fix-linking-errors.patch
new file mode 100644
index 0000000000..d1db6a51fa
--- /dev/null
+++ b/package/mpv/0003-rpi-build-Fix-linking-errors.patch
@@ -0,0 +1,72 @@
+diff --git a/waftools/checks/custom.py b/waftools/checks/custom.py
+index d8065a35f..9086795b1 100644
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
+index dd4795639..33539d4c8 100644
+--- a/wscript
++++ b/wscript
+@@ -754,25 +754,9 @@ video_output_features = [
+         'deps': 'win32-desktop && gpl',
+         'func': check_cc(header_name='d3d9.h'),
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
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 730ced6c64..dfc3fa8f3b 100644
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
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE)$(BR2_PACKAGE_RPI_USERLAND),yy)
+MPV_CONF_OPTS += --enable-rpi --enable-gl
+FFMPEG_DEPENDENCIES += rpi-firmware rpi-userland
+else
+MPV_CONF_OPTS += --disable-rpi
+endif
+
 # va-api support
 # This requires one or more of the egl-drm, wayland, x11 backends
 # For now we support wayland and x11
-- 
2.14.2
