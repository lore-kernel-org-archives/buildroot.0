From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Dec 2015 12:01:32 +0100
Subject: [Buildroot] [PATCH 12/12] package/x11r7/xdriver_xf86-video-nouveau:
	new package
In-Reply-To: <1450522892-14611-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450522892-14611-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1450522892-14611-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/Config.in                            |  1 +
 package/x11r7/xdriver_xf86-video-nouveau/Config.in | 18 ++++++++++++++++
 .../xdriver_xf86-video-nouveau.hash                |  2 ++
 .../xdriver_xf86-video-nouveau.mk                  | 25 ++++++++++++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-nouveau/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
 create mode 100644 package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 4e996fc..2f87cbd 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -173,6 +173,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-video-mach64/Config.in
 		source package/x11r7/xdriver_xf86-video-mga/Config.in
 		source package/x11r7/xdriver_xf86-video-neomagic/Config.in
+		source package/x11r7/xdriver_xf86-video-nouveau/Config.in
 		source package/x11r7/xdriver_xf86-video-nv/Config.in
 		source package/x11r7/xdriver_xf86-video-openchrome/Config.in
 		source package/x11r7/xdriver_xf86-video-qxl/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/Config.in b/package/x11r7/xdriver_xf86-video-nouveau/Config.in
new file mode 100644
index 0000000..7e756e2
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-nouveau/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NOUVEAU
+	bool "xf86-video-nouveau"
+	depends on BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBDRM_NOUVEAU
+	select BR2_PACKAGE_XPROTO_DRI2PROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	help
+	  Nouveau video driver
+
+	  http://nouveau.freedesktop.org
+
+comment "xf86-video-nouveau needs mesa3d"
+	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
new file mode 100644
index 0000000..9633641
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-December/002662.html
+sha256	0ea057ad7fc31caba2d4e46c7e418fe2b3c762b04fb8d382f53383397fd8391e	xf86-video-nouveau-1.0.12.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
new file mode 100644
index 0000000..af84e79
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# xdriver_xf86-video-nouveau
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_NOUVEAU_VERSION = 1.0.12
+XDRIVER_XF86_VIDEO_NOUVEAU_SOURCE = xf86-video-nouveau-$(XDRIVER_XF86_VIDEO_NOUVEAU_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_NOUVEAU_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_NOUVEAU_LICENSE = MIT
+XDRIVER_XF86_VIDEO_NOUVEAU_LICENSE_FILES = COPYING
+XDRIVER_XF86_VIDEO_NOUVEAU_DEPENDENCIES = \
+	host-pkgconf \
+	libdrm \
+	xproto_dri2proto \
+	xproto_randrproto \
+	xproto_renderproto \
+	xproto_videoproto \
+	xproto_xextproto \
+	xserver_xorg-server
+
+# xdriver_xf86-video-nouveau requires O_CLOEXEC
+XDRIVER_XF86_VIDEO_NOUVEAU_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+
+$(eval $(autotools-package))
-- 
2.6.4
