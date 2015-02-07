From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Feb 2015 21:11:16 +0100
Subject: [Buildroot] [PATCH 03/35] package/x11r7/libepoxy: New package
In-Reply-To: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
References: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1423339908-2960-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xdriver_xf86-video-ati needs glamor support from xserver_xorg-server,
which in turn depends on libepoxy.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/Config.in            |    1 +
 package/x11r7/libepoxy/Config.in   |    7 +++++++
 package/x11r7/libepoxy/libepoxy.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/x11r7/libepoxy/Config.in
 create mode 100644 package/x11r7/libepoxy/libepoxy.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 2fd1ff0..f60c752 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -15,6 +15,7 @@ if BR2_PACKAGE_XORG7
 	endmenu
 	menu "X11R7 Libraries"
 		source package/x11r7/libxcb/Config.in
+		source package/x11r7/libepoxy/Config.in
 		source package/x11r7/xcb-util/Config.in
 		source package/x11r7/xcb-util-image/Config.in
 		source package/x11r7/xcb-util-keysyms/Config.in
diff --git a/package/x11r7/libepoxy/Config.in b/package/x11r7/libepoxy/Config.in
new file mode 100644
index 0000000..c4f5794
--- /dev/null
+++ b/package/x11r7/libepoxy/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBEPOXY
+	bool "epoxy"
+	depends on BR2_PACKAGE_MESA3D
+	help
+	  Epoxy is a library for handling OpenGL function pointer management for you.
+
+	  https://github.com/anholt/libepoxy
diff --git a/package/x11r7/libepoxy/libepoxy.mk b/package/x11r7/libepoxy/libepoxy.mk
new file mode 100644
index 0000000..7468cdc
--- /dev/null
+++ b/package/x11r7/libepoxy/libepoxy.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libepoxy
+#
+#################################################################################
+
+LIBEPOXY_VERSION = v1.2
+LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
+LIBEPOXY_INSTALL_STAGING = YES
+LIBEPOXY_AUTORECONF = YES
+LIBEPOXY_DEPENDENCIES = mesa3d
+
+$(eval $(autotools-package))
-- 
1.7.10.4
