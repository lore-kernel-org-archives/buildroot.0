From: Jens Kleintje <scooby22@web.de>
Date: Wed,  6 Nov 2019 16:56:10 +0100
Subject: [Buildroot] [PATCH 1/2] package/gcnano-binaries: new package
In-Reply-To: <20191106155611.31575-1-scooby22@web.de>
References: <20191106155611.31575-1-scooby22@web.de>
Message-ID: <20191106155611.31575-2-scooby22@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New package which provides the driver and binary blob libraries for the
STM32MP157 vivante gcnano gpu.
The precompiled libaries depends on wayland and libdrm.
Since the github repo has no releases/tags we use the standard git method
with explicit SHA.
---
 package/Config.in                            |  1 +
 package/gcnano-binaries/gcnano-binaries.hash |  2 +
 package/gcnano-binaries/gcnano-binaries.mk   | 87 ++++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 package/gcnano-binaries/gcnano-binaries.hash
 create mode 100644 package/gcnano-binaries/gcnano-binaries.mk

diff --git a/package/Config.in b/package/Config.in
index dc5ec56d6b..1a88da547d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -449,6 +449,7 @@ endmenu
 	source "package/freescale-imx/Config.in"
 	source "package/fxload/Config.in"
 	source "package/gadgetfs-test/Config.in"
+	source "package/gcnano-binaries/Config.in"
 	source "package/gpm/Config.in"
 	source "package/gpsd/Config.in"
 	source "package/gptfdisk/Config.in"
diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
new file mode 100644
index 0000000000..fae7e56deb
--- /dev/null
+++ b/package/gcnano-binaries/gcnano-binaries.hash
@@ -0,0 +1,2 @@
+sha256 19f3fe4e83ec95fd2ecb70d5cb03c7b00a13357966a9b6e56b59e5788c550c88  gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed.tar.gz
+sha256 7d209718473d18f69f75adb7caf9cb5d4b0a31da068756aa011bea617de3dc57  EULA
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
new file mode 100644
index 0000000000..806abd7840
--- /dev/null
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -0,0 +1,87 @@
+################################################################################
+#
+# VIVANTE GCNANO BINARIES
+#
+################################################################################
+
+
+GCNANO_BINARIES_FILE_VERSION = 6.2.4.p4
+GCNANO_BINARIES_VERSION = c01642ed5e18cf09ecd905af193e935cb3be95ed
+GCNANO_BINARIES_SITE = https://github.com/STMicroelectronics/gcnano-binaries.git
+GCNANO_BINARIES_SITE_METHOD = git
+
+GCNANO_BINARIES_LICENSE = MIT, Vivante End User Software License Terms
+GCNANO_BINARIES_LICENSE_FILES = EULA
+GCNANO_BINARIES_REDISTRIBUTE = NO
+
+GCNANO_BINARIES_DEPENDENCIES = linux wayland libdrm
+
+GCNANO_BINARIES_INSTALL_STAGING = YES
+
+GCNANO_BINARIES_PROVIDES = libegl libgles
+
+define GCNANO_BINARIES_EXTRACT_HELPER
+        awk 'BEGIN      { start = 0; } \
+             /^EOEULA/  { start = 0; } \
+                        { if (start) print; } \
+             /<<EOEULA/ { start = 1; }' \
+            $(1) > $(@D)/EULA
+        cd $(@D) && sh $(1) --auto-accept
+        find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
+        rmdir $(@D)/$(basename $(notdir $(1)))
+endef
+
+
+define GCNANO_BINARIES_EXTRACT_CMDS
+gzip -d -c $(GCNANO_BINARIES_DL_DIR)/gcnano-binaries-$(GCNANO_BINARIES_VERSION).tar.gz | tar --strip-components=1 -C $(@D) -xf -
+tar --strip-components=1 -xJf $(@D)/gcnano-driver-$(GCNANO_BINARIES_FILE_VERSION).tar.xz -C $(@D)
+$(call GCNANO_BINARIES_EXTRACT_HELPER,$(@D)/gcnano-userland-multi-$(GCNANO_BINARIES_FILE_VERSION)-20190626.bin)
+endef
+
+GCNANO_BINARIES_MODULE_MAKE_OPTS = \
+	KERNEL_DIR=$(LINUX_DIR) \
+	SOC_PLATFORM=st-st\
+	AQROOT=$(@D)\
+	DEBUG=0
+
+define GCNANO_BINARIES_INSTALL_STAGING_CMDS
+	cp $(@D)/usr/lib/pkgconfig/* $(STAGING_DIR)/usr/lib/pkgconfig/
+	cp -r $(@D)/usr/lib/* $(STAGING_DIR)/usr/lib/
+	cd $(STAGING_DIR)/usr/lib; \
+	ln -sf gbm_viv.6.2.4.multi.release.so gbm_viv.so; \
+	ln -sf libEGL.6.2.4.multi.release.so libEGL.so; \
+	ln -sf libEGL.so libEGL.so.1; \
+	ln -sf libGAL.6.2.4.multi.release.so libGAL.so; \
+	ln -sf libgbm.6.2.4.multi.release.so libgbm.so; \
+	ln -sf libgbm.so libgbm.so.1; \
+	ln -sf libGLESv1_CM.6.2.4.multi.release.so libGLESv1_CM.so; \
+	ln -sf libGLESv2.6.2.4.multi.release.so libGLESv2.so; \
+	ln -sf libGLESv2.so libGLESv2.so.2; \
+	ln -sf libGLSLC.6.2.4.multi.release.so libGLSLC.so; \
+	ln -sf libOpenVG.6.2.4.multi.release.so libOpenVG.so; \
+	ln -sf libVSC.6.2.4.multi.release.so libVSC.so
+	rm -f $(STAGING_DIR)/usr/lib/pkgconfig/wayland-egl.pc
+	cp -r $(@D)/usr/include/* $(STAGING_DIR)/usr/include/
+endef
+
+GCNANO_BINARIES_POST_INSTALL_TARGET_HOOKS += GCNANO_BINARIES_COPY_LIBS
+
+define GCNANO_BINARIES_COPY_LIBS
+	cp -r $(@D)/usr/lib/* $(TARGET_DIR)/usr/lib/
+	cd $(TARGET_DIR)/usr/lib; \
+	ln -sf gbm_viv.6.2.4.multi.release.so gbm_viv.so; \
+	ln -sf libEGL.6.2.4.multi.release.so libEGL.so; \
+	ln -sf libEGL.so libEGL.so.1; \
+	ln -sf libGAL.6.2.4.multi.release.so libGAL.so; \
+	ln -sf libgbm.6.2.4.multi.release.so libgbm.so; \
+	ln -sf libgbm.so libgbm.so.1; \
+	ln -sf libGLESv1_CM.6.2.4.multi.release.so libGLESv1_CM.so; \
+	ln -sf libGLESv2.6.2.4.multi.release.so libGLESv2.so; \
+	ln -sf libGLESv2.so libGLESv2.so.2; \
+	ln -sf libGLSLC.6.2.4.multi.release.so libGLSLC.so; \
+	ln -sf libOpenVG.6.2.4.multi.release.so libOpenVG.so; \
+	ln -sf libVSC.6.2.4.multi.release.so libVSC.so;
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
--
2.17.1
