From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Fri,  2 Feb 2018 17:55:26 +0300
Subject: [Buildroot] [PATCH v2 2/2] xf86-video-armada: new package
In-Reply-To: <20180202145526.20133-1-Evgeniy.Didin@synopsys.com>
References: <20180202145526.20133-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20180202145526.20133-3-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Evgeniy Didin <didin@synopsys.com>

xf86-video-armada is a Xorg driver for Etnaviv GPU.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
---
Changes since v1:
-Add entry in DEVELOPERS
-Some clean-up was made
-Add license file
-Use full Git hash

 DEVELOPERS                                         |  1 +
 package/x11r7/Config.in                            |  1 +
 package/x11r7/xdriver_xf86-video-armada/Config.in  | 11 +++++++
 .../xdriver_xf86-video-armada.hash                 |  6 ++++
 .../xdriver_xf86-video-armada.mk                   | 37 ++++++++++++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-armada/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.hash
 create mode 100644 package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f38ce61966..da41a28793 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -154,6 +154,7 @@ F:	package/wf111/
 N:	ARC Maintainers <arc-buildroot@synopsys.com>
 F:	arch/Config.in.arc
 F:	package/libdrm-armada
+F:	package/x11r7/xdriver_xf86-video-armada
 
 N:	Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
 F:	package/axfsutils/
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
index 0000000000..7fa0f525ed
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.hash
@@ -0,0 +1,6 @@
+# Locally calculated
+sha256	5df615507ca6579ffba6df8a2aea6f6b542aa3985598efae836f335f9752cb39	xdriver_xf86-video-armada-04748ff4fb30370086cc97b9487a32951c5600ba.tar.gz
+
+# Hashes for license files:
+sha256  57ed74a42ee9ea913ae81c5bac498340ade4ef1e70e9007f39b2da3de952e597	README
+sha256  9d8facadc083641f71b8bcf9f078bd53f27aba3545b170f100c38f07cf3a42a2	etna_viv/LICENSE
diff --git a/package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.mk b/package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.mk
new file mode 100644
index 0000000000..7cac256241
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# xdriver_xf86-video-armada
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_ARMADA_VERSION = 04748ff4fb30370086cc97b9487a32951c5600ba
+XDRIVER_XF86_VIDEO_ARMADA_SITE = http://git.arm.linux.org.uk/cgit/xf86-video-armada.git
+XDRIVER_XF86_VIDEO_ARMADA_SITE_METHOD = git
+XDRIVER_XF86_VIDEO_ARMADA_AUTORECONF = YES
+XDRIVER_XF86_VIDEO_ARMADA_DEPENDENCIES = \
+	libdrm-armada \
+	xserver_xorg-server
+
+XDRIVER_XF86_VIDEO_ARMADA_LICENSE_FILES= README etna_viv/LICENSE
+XDRIVER_XF86_VIDEO_ARMADA_LICENSE = BSD
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
