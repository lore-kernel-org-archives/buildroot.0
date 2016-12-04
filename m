From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 22:18:36 +0100
Subject: [Buildroot] [git commit] pru-software-support: add library for PRU
	firmware
Message-ID: <20161204211858.9104580796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd438fc06f3fc8b509994c02d100bc05c0ac13b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TI provides a set of headers files and libraries useful in developing
firmware for real-time (PRU) cores embedded in some processors e.g.
AM3358.  This package stages these files for any packages creating
PRU firmware.

Note: As per [1], use commit v4.0.2 to sync with common TI Linux
      versions.

[1] http://e2e.ti.com/support/arm/sitara_arm/f/791/p/552190/2018113#2018113

Signed-off-by: Ash Charles <ash.charles@savoirfairelinux.com>
[Thomas:
 - rename BR2_PACKAGE_PRU_EXAMPLES to BR2_PACKAGE_PRU_SOFTWARE_SUPPORT,
   since the package directory name should match the Config.in option
   for this package
 - use select for BR2_PACKAGE_HOST_TI_CGT_PRU, and therefore add the
   appropriate "depends on BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS".]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 package/Config.in.host                             |  1 +
 package/pru-software-support/Config.in             |  9 ++++++
 package/pru-software-support/Config.in.host        | 11 +++++++
 .../pru-software-support/pru-software-support.hash |  2 ++
 .../pru-software-support/pru-software-support.mk   | 37 ++++++++++++++++++++++
 package/pru-software-support/readme.txt            | 21 ++++++++++++
 7 files changed, 82 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f16e56d..ecb8afb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -437,6 +437,7 @@ endmenu
 	source "package/pifmrds/Config.in"
 	source "package/powertop/Config.in"
 	source "package/pps-tools/Config.in"
+	source "package/pru-software-support/Config.in"
 	source "package/pulseview/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rfkill/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index e244694..840313a 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -33,6 +33,7 @@ menu "Host utilities"
 	source "package/openocd/Config.in.host"
 	source "package/parted/Config.in.host"
 	source "package/patchelf/Config.in.host"
+	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/sam-ba/Config.in.host"
diff --git a/package/pru-software-support/Config.in b/package/pru-software-support/Config.in
new file mode 100644
index 0000000..4e34806
--- /dev/null
+++ b/package/pru-software-support/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PRU_SOFTWARE_SUPPORT
+	bool "pru-software-support"
+	depends on BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_PRU_SOFTWARE_SUPPORT
+	help
+	  PRU firmware examples extracted from TI's PRU software
+	  support package. See readme.txt for installation details.
+
+	  https://git.ti.com/pru-software-support-package/pru-software-support-package
diff --git a/package/pru-software-support/Config.in.host b/package/pru-software-support/Config.in.host
new file mode 100644
index 0000000..d362ac5
--- /dev/null
+++ b/package/pru-software-support/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_PRU_SOFTWARE_SUPPORT
+	bool "host pru-software-support"
+	depends on BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_TI_CGT_PRU
+	help
+	  This package provides useful headers and libraries for the
+	  PRU unit found on some TI processors e.g. AM3358. Note that
+	  the included labs and examples aren't built, they can be
+	  built using the corresponding target package.
+
+	  https://git.ti.com/pru-software-support-package/pru-software-support-package
diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
new file mode 100644
index 0000000..8f624da
--- /dev/null
+++ b/package/pru-software-support/pru-software-support.hash
@@ -0,0 +1,2 @@
+# Locally-calculated hash
+sha256	b257535ca9b1641d1a238795f3c7004064c573a91cf4a1fa566e3f7c2360c38f	pru-software-support-804b548e69ef9fdf44445f6d0968d81cb8a1e7b4.tar.gz
diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
new file mode 100644
index 0000000..95d1e03
--- /dev/null
+++ b/package/pru-software-support/pru-software-support.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# pru-software-support
+#
+################################################################################
+
+PRU_SOFTWARE_SUPPORT_VERSION = 804b548e69ef9fdf44445f6d0968d81cb8a1e7b4
+PRU_SOFTWARE_SUPPORT_SITE = git://git.ti.com/pru-software-support-package/pru-software-support-package.git
+PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3c
+PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU_Package-v5.0-Manifest.html
+PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
+HOST_PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru
+
+define HOST_PRU_SOFTWARE_SUPPORT_BUILD_CMDS
+	$(MAKE) PRU_CGT=$(TI_CGT_PRU_INSTALLDIR) -C $(@D)/lib/src
+endef
+
+# install this library support alongside PRU toolchain i.e.
+# everything in TI_CGT_PRU_INSTALLDIR as PRU_CGT
+define HOST_PRU_SOFTWARE_SUPPORT_INSTALL_CMDS
+	mkdir -p $(TI_CGT_PRU_INSTALLDIR)/usr/include
+	cp -dpfr $(@D)/include/* $(TI_CGT_PRU_INSTALLDIR)/usr/include
+	mkdir -p $(TI_CGT_PRU_INSTALLDIR)/usr/lib
+	cp -dpfr $(@D)/lib/src/*/gen/*.lib $(TI_CGT_PRU_INSTALLDIR)/usr/lib/
+endef
+
+define PRU_SOFTWARE_SUPPORT_BUILD_CMDS
+	$(MAKE) PRU_CGT=$(TI_CGT_PRU_INSTALLDIR) -C $(@D)/examples
+endef
+
+define PRU_SOFTWARE_SUPPORT_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/pru-software-support
+	cp -dpfr $(@D)/examples/* $(TARGET_DIR)/usr/share/pru-software-support/
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/package/pru-software-support/readme.txt b/package/pru-software-support/readme.txt
new file mode 100644
index 0000000..85d7af8
--- /dev/null
+++ b/package/pru-software-support/readme.txt
@@ -0,0 +1,21 @@
+PRU Software Support
+====================
+
+Two different packages are provided from the TI PRU software support
+code base.
+
+1. The include files and rpmsg static library for the PRU are
+   installed alongside the host package for the PRU code generation
+   tools package i.e. $(TI_CGT_PRU_INSTALLDIR).
+
+2. A target package for all the examples installed to
+   /usr/share/pru-software-support/. Users wanting to test a specific
+   example should copy or link it to a directory where the kernel
+   looks for firmware, e.g:
+
+ # cp /usr/share/pru-software-support/am335x/PRU_gpioToggle/gen/PRU_gpioToggle.out \
+   /lib/firmware/am335x-pru0-fw
+
+To get started with the PRU, have a look at the labs [1].
+
+[1] http://processors.wiki.ti.com/index.php/PRU_Training:_Hands-on_Labs
