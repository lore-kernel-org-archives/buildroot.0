From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 18 Sep 2013 14:03:44 +0300
Subject: [Buildroot] [PATCH v2] gpu-viv-bin-mx6q: add pkgconfig files for
	EGL, OpenGLESv2 and OpenVG
Message-ID: <1379502224-4999-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
Changes v1 -> v2:
  - Add .pc files to package dir instead of patching (suggested by
    Arnout Vandecappelle)
  - EGL library needs requires -lGAL, too (suggested by Arnout
    Vandecappelle)
  - Added .pc file for OpenVG (suggested by Arnout Vandecappelle)
---
 package/freescale-imx/gpu-viv-bin-mx6q/egl.pc              |   10 ++++++++++
 package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc           |   10 ++++++++++
 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk |    5 +++++
 package/freescale-imx/gpu-viv-bin-mx6q/vg.pc               |   10 ++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/freescale-imx/gpu-viv-bin-mx6q/egl.pc
 create mode 100644 package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc
 create mode 100644 package/freescale-imx/gpu-viv-bin-mx6q/vg.pc

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/egl.pc b/package/freescale-imx/gpu-viv-bin-mx6q/egl.pc
new file mode 100644
index 0000000..c984247
--- /dev/null
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/egl.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: egl
+Description: Freescale gpu-viv-bin-mx6q implementation of EGL
+Version: 1.0
+Libs: -L${libdir} -lGAL -lEGL
+Cflags: -I${includedir}/ -DEGL_API_FB=1
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc b/package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc
new file mode 100644
index 0000000..7cfb5e7
--- /dev/null
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: glesv2
+Description: Freescale gpu-viv-bin-mx6q implementation of OpenGL ESv2
+Version: 2.0
+Libs: -L${libdir} -lGAL -lEGL -lGLESv2
+Cflags: -I${includedir}/ -DEGL_API_FB=1
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index 0338e13..9883d82 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -51,6 +51,11 @@ endef
 
 define GPU_VIV_BIN_MX6Q_INSTALL_STAGING_CMDS
 	cp -r $(@D)/usr/* $(STAGING_DIR)/usr
+	for lib in egl glesv2 vg; do \
+		$(INSTALL) -m 0644 -D \
+			package/freescale-imx/gpu-viv-bin-mx6q/$${lib}.pc \
+			$(STAGING_DIR)/usr/lib/pkgconfig/$${lib}.pc; \
+	done
 endef
 
 ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_EXAMPLES),y)
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/vg.pc b/package/freescale-imx/gpu-viv-bin-mx6q/vg.pc
new file mode 100644
index 0000000..fb14005
--- /dev/null
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/vg.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: vg
+Description: Freescale gpu-viv-bin-mx6q implementation of OpenVG
+Version: 1.1
+Libs: -L${libdir} -lGAL -lEGL -lOpenVG
+Cflags: -I${includedir}/ -DEGL_API_FB=1
-- 
1.7.10.4
