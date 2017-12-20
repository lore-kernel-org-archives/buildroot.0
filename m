From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Wed, 20 Dec 2017 18:08:43 +0300
Subject: [Buildroot] [PATCH 2/2] xf86-video-armada: new package
In-Reply-To: <20171220150843.21154-1-didin@synopsys.com>
References: <20171220150843.21154-1-didin@synopsys.com>
Message-ID: <20171220150843.21154-3-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xf86-video-armada is a Xorg driver for Etnaviv GPU.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
---
 package/x11r7/Config.in                            |  1 +
 package/x11r7/xdriver_xf86-video-armada/Config.in  | 11 +++++++
 .../xdriver_xf86-video-armada.hash                 |  2 ++
 .../xdriver_xf86-video-armada.mk                   | 36 ++++++++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-armada/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.hash
 create mode 100644 package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index ddceaa407f..e791419083 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -157,6 +157,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-input-vmmouse/Config.in
 		source package/x11r7/xdriver_xf86-video-amdgpu/Config.in
 		source package/x11r7/xdriver_xf86-video-ark/Config.in
+		source package/x11r7/xdriver_xf86-video-armada/Config.in
 		source package/x11r7/xdriver_xf86-video-ast/Config.in
 		source package/x11r7/xdriver_xf86-video-ati/Config.in
 		source package/x11r7/xdriver_xf86-video-cirrus/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-armada/Config.in b/package/x11r7/xdriver_xf86-video-armada/Config.in
new file mode 100644
index 0000000000..ade8a75643
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-armada/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ARMADA
+	bool "xf86-video-armada"
+	depends on BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_LIBDRM_ARMADA
+	help
+	 Xorg driver for Etnaviv GPU.
+
+	 http://git.arm.linux.org.uk/cgit/xf86-video-armada.git
+
+comment "xf86-video-armada needs mesa3d"
+        depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.hash b/package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.hash
new file mode 100644
index 0000000000..003e817cb3
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	456d0a23bdc8320e9bd1f2431b098343a59a3605856c2574871d776b40fe515e	xdriver_xf86-video-armada-04748f.tar.gz
diff --git a/package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.mk b/package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.mk
new file mode 100644
index 0000000000..cc1598f158
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# xdriver_xf86-video-armada
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_ARMADA_VERSION = 04748f
+XDRIVER_XF86_VIDEO_ARMADA_SOURCE = xdriver_xf86-video-armada-$(XDRIVER_XF86_VIDEO_ARMADA_VERSION).tar.gz
+XDRIVER_XF86_VIDEO_ARMADA_SITE = http://git.arm.linux.org.uk/cgit/xf86-video-armada.git
+XDRIVER_XF86_VIDEO_ARMADA_SITE_METHOD = git
+XDRIVER_XF86_VIDEO_ARMADA_AUTORECONF = YES
+XDRIVER_XF86_VIDEO_ARMADA_DEPENDENCIES = \
+	libdrm-armada \
+	xserver_xorg-server
+
+
+#Need etna_viv source files for driver
+define XDRIVER_XF86_VIDEO_ARMADA_ETNASRC
+	git clone https://github.com/laanwj/etna_viv.git $(@D)/etna_viv
+        mkdir $(@D)/m4
+endef
+
+XDRIVER_XF86_VIDEO_ARMADA_POST_PATCH_HOOKS += XDRIVER_XF86_VIDEO_ARMADA_ETNASRC
+
+define XDRIVER_XF86_VIDEO_ARMADA_INSTALL_CONF_FILE
+        $(INSTALL) -m 0644 -D $(@D)/conf/xorg-sample.conf $(TARGET_DIR)/etc/X11/xorg.conf
+endef
+
+XDRIVER_XF86_VIDEO_ARMADA_POST_INSTALL_TARGET_HOOKS += XDRIVER_XF86_VIDEO_ARMADA_INSTALL_CONF_FILE
+
+
+XDRIVER_XF86_VIDEO_ARMADA_CONF_OPTS = \
+  --prefix=/usr --disable-vivante --disable-etnaviv \
+  --with-etnaviv-source=$(@D)/etna_viv
+
+$(eval $(autotools-package))
-- 
2.11.0
