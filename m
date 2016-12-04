From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 22:16:06 +0100
Subject: [Buildroot] [git commit] ti-cgt-pru: add package for PRU Host
	toolchain
Message-ID: <20161204211858.807718082A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c84a2cb9aae778d3e89b23268640fbe08b3bc2bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TI provides a binary code generation toolchain to develop firmware for
the programmable real-time unit/co-processor found in some SOCs such as
some models in the AM335x line. This toolchain includes C/C++ support
(clpru) rather than just assembler (pasm) supported by the pre-existing
am335x-pru-package [1].  Following the lead of the Yocto meta-ti
layer [2], this package provides a host toolchain suitable for an x86
(or x86_64) Linux targeting an ARM-based PRU core.

[1] http://processors.wiki.ti.com/index.php/PRU_Assembly_Instructions#pasm_vs._clpru
[2] http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb

Signed-off-by: Ash Charles <ash.charles@savoirfairelinux.com>
[Thomas: add BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS boolean option,
so that packages selecting host-ti-cgt-pru can easily inherit its
architecture dependencies.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host             |  1 +
 package/ti-cgt-pru/Config.in.host  | 17 +++++++++++++++++
 package/ti-cgt-pru/ti-cgt-pru.hash |  2 ++
 package/ti-cgt-pru/ti-cgt-pru.mk   | 34 ++++++++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 3b115c5..e244694 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -39,6 +39,7 @@ menu "Host utilities"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/tegrarcm/Config.in.host"
+	source "package/ti-cgt-pru/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
 	source "package/vboot-utils/Config.in.host"
diff --git a/package/ti-cgt-pru/Config.in.host b/package/ti-cgt-pru/Config.in.host
new file mode 100644
index 0000000..a366337
--- /dev/null
+++ b/package/ti-cgt-pru/Config.in.host
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_arm
+
+config BR2_PACKAGE_HOST_TI_CGT_PRU
+	bool "host ti-cgt-pru"
+	depends on BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS
+	help
+	  This package provides the Code Generation Tools for the PRU
+	  unit found on some TI processors e.g. AM3358.
+
+	  Note: this is a binary cross toolchain that runs on x86 hosts
+	  targeting PRU cores found alongside some ARM processors.
+
+	  http://processors.wiki.ti.com/index.php/Programmable_Realtime_Unit_Software_Development
diff --git a/package/ti-cgt-pru/ti-cgt-pru.hash b/package/ti-cgt-pru/ti-cgt-pru.hash
new file mode 100644
index 0000000..1c19b33
--- /dev/null
+++ b/package/ti-cgt-pru/ti-cgt-pru.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	df85cd1ed3aea12d577854ece11bf5f2af6ace8c39959eea4cf2fa5973924e0e	ti_cgt_pru_2.1.3_linux_installer_x86.bin
diff --git a/package/ti-cgt-pru/ti-cgt-pru.mk b/package/ti-cgt-pru/ti-cgt-pru.mk
new file mode 100644
index 0000000..7c89444
--- /dev/null
+++ b/package/ti-cgt-pru/ti-cgt-pru.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# ti-cgt-pru
+#
+################################################################################
+
+TI_CGT_PRU_VERSION = 2.1.3
+TI_CGT_PRU_SOURCE = ti_cgt_pru_$(TI_CGT_PRU_VERSION)_linux_installer_x86.bin
+TI_CGT_PRU_SITE = http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/$(TI_CGT_PRU_VERSION)
+TI_CGT_PRU_LICENSE = TI Technology and Software Publicly Available License (compiler + PRU library), \
+	Boost Software License 1.0 (compiler), \
+	BSD-2c, BSD-3c, MIT, Academic Free License 3.0, Hewlett-Packard (PRU library)
+TI_CGT_PRU_LICENSE_FILES = PRU_Code_Generation_Tools_2.1.x_manifest.html \
+	PRU_CodeGen_Library_2.1_0222433C-30C1-442d-B5C6-2073BD97F80F.spdx.tag
+
+define HOST_TI_CGT_PRU_EXTRACT_CMDS
+	chmod +x $(DL_DIR)/$(TI_CGT_PRU_SOURCE)
+	$(DL_DIR)/$(TI_CGT_PRU_SOURCE) --prefix $(@D) --mode unattended
+	mv $(@D)/ti-cgt-pru_$(TI_CGT_PRU_VERSION)/* $(@D)
+	rmdir $(@D)/ti-cgt-pru_$(TI_CGT_PRU_VERSION)/
+endef
+
+# Since this is largely prebuilt toolchain and likes to live in its
+# own directory, put is in $(HOST_DIR)/usr/share/ti-cgt-pru/.
+# Packages wanting to use this toolchain need to use this path as TI's
+# standard PRU_CGT path e.g. make PRU_CGT=$(TI_CGT_PRU_INSTALLDIR)...
+TI_CGT_PRU_INSTALLDIR = $(HOST_DIR)/usr/share/ti-cgt-pru
+
+define HOST_TI_CGT_PRU_INSTALL_CMDS
+	mkdir -p $(TI_CGT_PRU_INSTALLDIR)
+	cp -dpfr $(@D)/* $(TI_CGT_PRU_INSTALLDIR)
+endef
+
+$(eval $(host-generic-package))
