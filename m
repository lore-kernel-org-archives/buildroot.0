From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 23:20:38 +0100
Subject: [Buildroot] [git commit branch/next] package/gcnano-binaries: new
 package
Message-ID: <20191115221346.815108F06A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af408cfa4d8c15b46f7fa117e7558c2ec3d1c430
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

New package which provides the driver and binary blob libraries for
the STM32MP157 vivante gcnano gpu. The precompiled libraries depend
on wayland and libdrm.

Signed-off-by: Jens Kleintje <scooby22@web.de>
[Thomas:
 - add missing dependency on glibc
 - add missing dependencies on threads (wayland, libdrm) and !static
   (wayland)
 - introduce GCNANO_BINARIES_LIB_VERSION,
   GCNANO_BINARIES_DRIVER_VERSION and GCNANO_BINARIES_USERLAND_VERSION
   variables to simplify code a bit
 - greatly simplify the installation, by using more the available
   libraries/files. This also avoids the installation of duplicate
   release/debug libraries]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  3 ++
 package/Config.in                            |  1 +
 package/gcnano-binaries/Config.in            | 33 +++++++++++++
 package/gcnano-binaries/gcnano-binaries.hash |  3 ++
 package/gcnano-binaries/gcnano-binaries.mk   | 69 ++++++++++++++++++++++++++++
 5 files changed, 109 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2cb272d2d6..054f83ce5e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1172,6 +1172,9 @@ F:	package/quota/
 N:	Jason Pruitt <jrspruitt@gmail.com>
 F:	package/librtlsdr/
 
+N:	Jens Kleintje <scooby22@web.de>
+F:	package/gcnano-binaries/
+
 N:	Jens Rosenboom <j.rosenboom@x-ion.de>
 F:	package/sl/
 
diff --git a/package/Config.in b/package/Config.in
index 20c3eeb9c7..fd30562ea5 100644
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
index 0000000000..01e1aacf1d
--- /dev/null
+++ b/package/gcnano-binaries/Config.in
@@ -0,0 +1,33 @@
+comment "gcnano-binaries needs a Linux kernel to be built"
+	depends on BR2_arm
+	depends on !BR2_LINUX_KERNEL
+
+comment "gcnano-binaries needs a glibc toolchain w/ threads, dynamic library"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
+
+config BR2_PACKAGE_GCNANO_BINARIES
+	bool "gcnano-binaries"
+	depends on BR2_arm
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
+	depends on !BR2_STATIC_LIBS
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
index 0000000000..e753f944a3
--- /dev/null
+++ b/package/gcnano-binaries/gcnano-binaries.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 255db9c58627f5f54fd15263647cc97a55927363fec42e7c8d7486170a65d84d  gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed.tar.gz
+sha256 7d209718473d18f69f75adb7caf9cb5d4b0a31da068756aa011bea617de3dc57  EULA
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
new file mode 100644
index 0000000000..4bfb5ad952
--- /dev/null
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -0,0 +1,69 @@
+################################################################################
+#
+# gcnano-binaries
+#
+################################################################################
+
+GCNANO_BINARIES_LIB_VERSION = 6.2.4
+GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_VERSION).p4
+GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_VERSION).p4-20190626
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
+	tar --strip-components=1 -xJf $(@D)/gcnano-driver-$(GCNANO_BINARIES_DRIVER_VERSION).tar.xz -C $(@D)
+	awk 'BEGIN      { start = 0; } \
+		/^EOEULA/  { start = 0; } \
+			{ if (start) print; } \
+		/<<EOEULA/ { start = 1; }' \
+		$(@D)/gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION).bin > $(@D)/EULA
+	cd $(@D) && sh gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION).bin --auto-accept
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
+GCNANO_BINARIES_LIBRARIES = \
+	gbm_viv libEGL libGAL libgbm libGLESv1_CM \
+	libGLESv2 libGLSLC libOpenVG libVSC
+
+GCNANO_BINARIES_USERLAND_SUBDIR = gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION)
+
+define GCNANO_BINARIES_INSTALL
+	$(foreach lib,$(GCNANO_BINARIES_LIBRARIES), \
+		$(INSTALL) -D -m 0755 $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/$(lib).$(GCNANO_BINARIES_LIB_VERSION).multi.release.so \
+			$(1)/usr/lib/$(lib).$(GCNANO_BINARIES_LIB_VERSION).multi.release.so ; \
+		cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/$(lib).so* $(1)/usr/lib
+	)
+	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/include/* $(1)/usr/include/
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
