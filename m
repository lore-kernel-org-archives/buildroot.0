From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 14 Nov 2020 15:45:54 +0100
Subject: [Buildroot] [PATCH] package/piglit: Only support mesa and nvidia
 OpenGL provider
Message-ID: <20201114144554.1795422-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even if piglit could be used to test any OpenGl implementation, it's really a
mesa's project because it follow closely the mesa implementation (API).

Other OpenGl vendor (binary blob) are quickly out of date and incompatible with
piglit. Especially ARM OpenGl vendors such TI, Allwinner (sunxi) and rpi.

So introduce BR2_PACKAGE_PIGLIT_SUPPORTED_GL_PROVIDERS to list all supported
OpenGL providers. For now only mesa and Nvidia are supported.

Fixes:
[BR2_PACKAGE_PROVIDES_LIBEGL="sunxi-mali-mainline"]:
http://autobuild.buildroot.net/results/76212834a3065c4c3d479a49a16297d4679098a0

[BR2_PACKAGE_PROVIDES_LIBEGL="rpi-userland"]:
http://autobuild.buildroot.net/results/2cb799919d47e57eb401b7ece00b65707f9bd3ec

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/piglit/Config.in | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/piglit/Config.in b/package/piglit/Config.in
index 736fd95d71..bfa2ba4e9a 100644
--- a/package/piglit/Config.in
+++ b/package/piglit/Config.in
@@ -1,7 +1,19 @@
+config BR2_PACKAGE_PIGLIT_SUPPORTED_GL_PROVIDERS
+	bool
+	# Only mesa3d is officially supported, other opengl provider
+	# (binary blob) could break piglit at build or runtime.
+	# At least the binary-only driver blob for NVidia cards is
+	# still able to build piglit.
+	default y if BR2_PACKAGE_MESA3D_OPENGL_GLX || \
+		BR2_PACKAGE_MESA3D_OPENGL_EGL || \
+		BR2_PACKAGE_MESA3D_OPENGL_ES || \
+		BR2_PACKAGE_NVIDIA_DRIVER_XORG
+
 config BR2_PACKAGE_PIGLIT
 	bool "piglit"
 	depends on BR2_PACKAGE_PYTHON3 # python3 only script
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PIGLIT_SUPPORTED_GL_PROVIDERS
 	depends on BR2_PACKAGE_WAFFLE_SUPPORTS_GLX || \
 		BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND || \
 		BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL || \
@@ -32,4 +44,5 @@ config BR2_PACKAGE_PIGLIT
 	  https://piglit.freedesktop.org
 
 comment "piglit needs glibc or musl"
+	depends on BR2_PACKAGE_PIGLIT_SUPPORTED_GL_PROVIDERS
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
-- 
2.25.4
