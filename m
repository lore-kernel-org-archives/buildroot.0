From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 22:37:10 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-amdgpu:
	new package
Message-ID: <20160413203800.C8EFA81E21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2ece356077681da2e56457e0f68140c3e4ad706
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/Config.in                            |  1 +
 package/x11r7/xdriver_xf86-video-amdgpu/Config.in  | 22 +++++++++++++++++
 .../xdriver_xf86-video-amdgpu.hash                 |  2 ++
 .../xdriver_xf86-video-amdgpu.mk                   | 28 ++++++++++++++++++++++
 4 files changed, 53 insertions(+)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index fb6195d..40aa80c 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -154,6 +154,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-input-synaptics/Config.in
 		source package/x11r7/xdriver_xf86-input-tslib/Config.in
 		source package/x11r7/xdriver_xf86-input-vmmouse/Config.in
+		source package/x11r7/xdriver_xf86-video-amdgpu/Config.in
 		source package/x11r7/xdriver_xf86-video-ark/Config.in
 		source package/x11r7/xdriver_xf86-video-ast/Config.in
 		source package/x11r7/xdriver_xf86-video-ati/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
new file mode 100644
index 0000000..968c5e7
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
+	bool "xf86-video-amdgpu"
+	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBDRM_AMDGPU
+	select BR2_PACKAGE_LIBEPOXY
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
+	select BR2_PACKAGE_XPROTO_DRI3PROTO
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  AMD GPU video driver
+
+comment "xf86-video-amdgpu needs egl/opengl support from mesa3d"
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
+		!BR2_PACKAGE_MESA3D_DRI_DRIVER
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
new file mode 100644
index 0000000..6754fb5
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
@@ -0,0 +1,2 @@
+# From https://lists.x.org/archives/xorg-announce/2016-April/002686.html
+sha256	69f5d0ded9f4d5ce529099b6b581268e8f4dcff5608f1441d4ebc110ebc57931	xf86-video-amdgpu-1.1.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
new file mode 100644
index 0000000..45177b2
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# xdriver_xf86-video-amdgpu
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 1.1.0
+XDRIVER_XF86_VIDEO_AMDGPU_SOURCE = xf86-video-amdgpu-$(XDRIVER_XF86_VIDEO_AMDGPU_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_AMDGPU_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
+XDRIVER_XF86_VIDEO_AMDGPU_LICENSE_FILES = COPYING
+XDRIVER_XF86_VIDEO_AMDGPU_DEPENDENCIES = \
+	libdrm \
+	xlib_libXcomposite \
+	xproto_dri3proto \
+	xproto_fontsproto \
+	xproto_glproto \
+	xproto_randrproto \
+	xproto_videoproto \
+	xproto_xextproto \
+	xproto_xf86driproto \
+	xproto_xproto \
+	xserver_xorg-server
+
+# xdriver_xf86-video-amdgpu requires O_CLOEXEC
+XDRIVER_XF86_VIDEO_AMDGPU_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+
+$(eval $(autotools-package))
