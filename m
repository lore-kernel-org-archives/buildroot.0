From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Jul 2015 21:54:03 -0300
Subject: [Buildroot] [PATCH 1/2] xdriver_xf86-video-qxl: new package
Message-ID: <1436403244-1367-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the QEMU paravirt QXL video driver.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/Config.in                            |  1 +
 package/x11r7/xdriver_xf86-video-qxl/Config.in     | 10 +++++++
 .../xdriver_xf86-video-qxl.hash                    |  2 ++
 .../xdriver_xf86-video-qxl.mk                      | 32 ++++++++++++++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-qxl/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.hash
 create mode 100644 package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 24316a4..859e895 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -174,6 +174,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-video-neomagic/Config.in
 		source package/x11r7/xdriver_xf86-video-nv/Config.in
 		source package/x11r7/xdriver_xf86-video-openchrome/Config.in
+		source package/x11r7/xdriver_xf86-video-qxl/Config.in
 		source package/x11r7/xdriver_xf86-video-r128/Config.in
 		source package/x11r7/xdriver_xf86-video-savage/Config.in
 		source package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-qxl/Config.in b/package/x11r7/xdriver_xf86-video-qxl/Config.in
new file mode 100644
index 0000000..c797dd4
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-qxl/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_QXL
+	bool "xf86-video-qxl"
+	depends on (BR2_i386 || BR2_x86_64)
+	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_HAS_UDEV # for KMS
+	select BR2_PACKAGE_LIBPCIACCESS
+	select BR2_PACKAGE_SPICE_PROTOCOL
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  QEMU QXL paravirt video driver
diff --git a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.hash b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.hash
new file mode 100644
index 0000000..1648c29
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/spice-devel/2015-April/019356.html
+sha256	e57ad22f0b1daf8979e722be0cc38d351bfcc2e41568edc566d2bade5a621105	xf86-video-qxl-0.1.4.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
new file mode 100644
index 0000000..74606c9
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# xdriver_xf86-video-qxl
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_QXL_VERSION = 0.1.4
+XDRIVER_XF86_VIDEO_QXL_SOURCE = xf86-video-qxl-$(XDRIVER_XF86_VIDEO_QXL_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_QXL_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_QXL_LICENSE = MIT
+XDRIVER_XF86_VIDEO_QXL_LICENSE_FILES = COPYING
+
+XDRIVER_XF86_VIDEO_QXL_CONF_OPTS = \
+	--enable-xspice=no
+
+# configure doesn't look for drm headers in the appropiate place, so help it
+# libdrm is only useful with udev for KMS
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+XDRIVER_XF86_VIDEO_QXL_CONF_ENV += REQUIRED_MODULES=libdrm
+XDRIVER_XF86_VIDEO_QXL_DEPENDENCIES += libdrm
+else
+XDRIVER_XF86_VIDEO_QXL_CONF_OPTS += --disable-kms
+endif
+
+XDRIVER_XF86_VIDEO_QXL_DEPENDENCIES = \
+	libpciaccess \
+	spice-protocol \
+	xproto_fontsproto \
+	xproto_xproto \
+	xserver_xorg-server
+
+$(eval $(autotools-package))
-- 
2.3.6
