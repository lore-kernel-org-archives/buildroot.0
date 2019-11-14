From: Jens Kleintje <scooby22@web.de>
Date: Thu, 14 Nov 2019 09:55:28 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/gcnano-binaries: new package
In-Reply-To: <20191114085529.733-1-scooby22@web.de>
References: <20191114085529.733-1-scooby22@web.de>
Message-ID: <20191114085529.733-2-scooby22@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New package which provides the driver and binary blob libraries for the
STM32MP157 vivante gcnano gpu.
The precompiled libaries depends on wayland and libdrm.

Signed-off-by: Jens Kleintje <scooby22@web.de>
---
 DEVELOPERS                                   |  3 +
 package/Config.in                            |  1 +
 package/gcnano-binaries/Config.in            | 24 +++++++
 package/gcnano-binaries/gcnano-binaries.hash |  2 +
 package/gcnano-binaries/gcnano-binaries.mk   | 74 ++++++++++++++++++++
 5 files changed, 104 insertions(+)
 create mode 100644 package/gcnano-binaries/Config.in
 create mode 100644 package/gcnano-binaries/gcnano-binaries.hash
 create mode 100644 package/gcnano-binaries/gcnano-binaries.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cdd44be37c..9c39bbd41e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2536,3 +2536,6 @@ F:	package/tinc/
 N:  Aussedat Louis <aussedat.louis@gmail.com>
 F:	board/friendlyarm/nanopi-neo-plus2/
 F:	configs/friendlyarm_nanopi_neo_plus2_defconfig
+
+N:	Jens Kleintje <scooby22@web.de>
+F:	package/gcnano-binaries
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
diff --git a/package/gcnano-binaries/Config.in b/package/gcnano-binaries/Config.in
new file mode 100644
index 0000000000..9cc9d149c0
--- /dev/null
+++ b/package/gcnano-binaries/Config.in
@@ -0,0 +1,24 @@
+comment "gcnano binaries  needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_GCNANO_BINARIES
+	bool "gcnano binaries"
+	depends on BR2_arm
+	depends on BR2_LINUX_KERNEL
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_WAYLAND
+	help
+	  Driver and libaries for stm vivante gcnano gpu.
+	  https://github.com/STMicroelectronics/gcnano-binaries/
+
+if BR2_PACKAGE_GCNANO_BINARIES
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "gcnano-binaries"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "gcnano-binaries"
+
+endif
diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
new file mode 100644
index 0000000000..0e4faa988d
--- /dev/null
+++ b/package/gcnano-binaries/gcnano-binaries.hash
@@ -0,0 +1,2 @@
+sha256 255db9c58627f5f54fd15263647cc97a55927363fec42e7c8d7486170a65d84d  gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed.tar.gz
+sha256 7d209718473d18f69f75adb7caf9cb5d4b0a31da068756aa011bea617de3dc57  EULA
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
new file mode 100644
index 0000000000..9342bcc04c
--- /dev/null
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -0,0 +1,74 @@
+################################################################################
+#
+# gcnano-binaries
+#
+################################################################################
+
+GCNANO_BINARIES_FILE_VERSION = 6.2.4.p4
+GCNANO_BINARIES_VERSION = c01642ed5e18cf09ecd905af193e935cb3be95ed
+GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))
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
+# The Github repository doesn't contain the source code as-is: it
+# contains a tarball with the kernel driver source code, and a
+# self-extractible binary for the user-space parts. So we extract both
+# below, and also extract the EULA text from the self-extractible binary
+define GCNANO_BINARIES_EXTRACT_HELPER
+	tar --strip-components=1 -xJf $(@D)/gcnano-driver-$(GCNANO_BINARIES_FILE_VERSION).tar.xz -C $(@D)
+	awk 'BEGIN      { start = 0; } \
+		/^EOEULA/  { start = 0; } \
+			{ if (start) print; } \
+		/<<EOEULA/ { start = 1; }' \
+		$(@D)/gcnano-userland-multi-$(GCNANO_BINARIES_FILE_VERSION)-20190626.bin > $(@D)/EULA
+	cd $(@D) && sh gcnano-userland-multi-$(GCNANO_BINARIES_FILE_VERSION)-20190626.bin --auto-accept
+endef
+
+GCNANO_BINARIES_POST_EXTRACT_HOOKS += GCNANO_BINARIES_EXTRACT_HELPER
+
+GCNANO_BINARIES_MODULE_MAKE_OPTS = \
+	KERNEL_DIR=$(LINUX_DIR) \
+	SOC_PLATFORM=st-st \
+	AQROOT=$(@D) \
+	DEBUG=0
+
+# The wayland-egl.pc and libwayland-egl.so are provided by the wayland package
+define GCNANO_BINARIES_INSTALL
+	rm -f $(@D)/gcnano-userland-multi-$(GCNANO_BINARIES_FILE_VERSION)-20190626/usr/lib/pkgconfig/wayland-egl.pc
+	rm -f $(@D)/gcnano-userland-multi-$(GCNANO_BINARIES_FILE_VERSION)-20190626/usr/lib/libwayland-egl.so.1
+	rm -f $(@D)/gcnano-userland-multi-$(GCNANO_BINARIES_FILE_VERSION)-20190626/usr/lib/libwayland-egl.so
+	cp -r $(@D)/gcnano-userland-multi-$(GCNANO_BINARIES_FILE_VERSION)-20190626/usr/lib/* $(1)/usr/lib/
+	cd $(1)/usr/lib; \
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
+	cp -r $(@D)/gcnano-userland-multi-$(GCNANO_BINARIES_FILE_VERSION)-20190626/usr/include/* $(1)/usr/include/
+endef
+
+define GCNANO_BINARIES_INSTALL_TARGET_CMDS
+	$(call GCNANO_BINARIES_INSTALL,$(TARGET_DIR))
+endef
+
+define GCNANO_BINARIES_INSTALL_STAGING_CMDS
+	$(call GCNANO_BINARIES_INSTALL,$(STAGING_DIR))
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
--
2.17.1
