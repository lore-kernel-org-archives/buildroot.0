From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Sep 2013 00:20:56 +0200
Subject: [Buildroot] [git commit] gpu-viv-bin-mx6q: add pkgconfig files for
	EGL, OpenGLESv2 and OpenVG
Message-ID: <20130918222318.F2B379B737@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36274046516c7576e5b8229ccc4e290e2113d4f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/freescale-imx/gpu-viv-bin-mx6q/egl.pc      |   10 ++++++++++
 package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc   |   10 ++++++++++
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |    9 +++++++++
 package/freescale-imx/gpu-viv-bin-mx6q/vg.pc       |   10 ++++++++++
 4 files changed, 39 insertions(+), 0 deletions(-)

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
index 0338e13..1b9684a 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -51,6 +51,15 @@ endef
 
 define GPU_VIV_BIN_MX6Q_INSTALL_STAGING_CMDS
 	cp -r $(@D)/usr/* $(STAGING_DIR)/usr
+	for lib in egl glesv2 vg; do \
+		$(INSTALL) -m 0644 -D \
+			package/freescale-imx/gpu-viv-bin-mx6q/$${lib}.pc \
+			$(STAGING_DIR)/usr/lib/pkgconfig/$${lib}.pc; \
+		if [ "$(GPU_VIV_BIN_MX6Q_LIB_TARGET)" != "fb" ]; then \
+			$(SED) "s/-DEGL_API_FB=1//" \
+				$(STAGING_DIR)/usr/lib/pkgconfig/$${lib}.pc; \
+		fi; \
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
