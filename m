From: Ash Charles <ashcharles@gmail.com>
Date: Wed, 16 Nov 2016 14:24:32 -0500
Subject: [Buildroot] [PATCH 1/2] ti-cgt-pru: add package for PRU Host
	toolchain
Message-ID: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/Config.in.host             |  1 +
 package/ti-cgt-pru/Config.in.host  | 11 +++++++++++
 package/ti-cgt-pru/ti-cgt-pru.hash |  2 ++
 package/ti-cgt-pru/ti-cgt-pru.mk   | 29 +++++++++++++++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 package/ti-cgt-pru/Config.in.host
 create mode 100644 package/ti-cgt-pru/ti-cgt-pru.hash
 create mode 100644 package/ti-cgt-pru/ti-cgt-pru.mk

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
index 0000000..440f774
--- /dev/null
+++ b/package/ti-cgt-pru/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_TI_CGT_PRU
+	bool "host ti-cgt-pru"
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	help
+	  This package provides the Code Generation Tools for the PRU
+	  unit found on some TI processors e.g. AM3358.
+
+	  Note: this is a binary cross toolchain that runs on x86 hosts
+	        targeting ARM PRU cores.
+
+	  https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm#PRU
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
index 0000000..a4c8566
--- /dev/null
+++ b/package/ti-cgt-pru/ti-cgt-pru.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# ti-cgt-pru
+#
+################################################################################
+
+TI_CGT_PRU_VERSION = 2.1.3
+TI_CGT_PRU_SOURCE = ti_cgt_pru_$(TI_CGT_PRU_VERSION)_linux_installer_x86.bin
+TI_CGT_PRU_SITE = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/$(TI_CGT_PRU_VERSION)/"
+TI_CGT_PRU_LICENSE =  BSD-3c, MIT, TI-TSPA
+TI_CGT_PRU_LICENSE_FILES = PRU_Code_Generation_Tools_2.1.x_manifest.html
+
+define HOST_TI_CGT_PRU_EXTRACT_CMDS
+	chmod +x $(DL_DIR)/$(TI_CGT_PRU_SOURCE)
+	$(DL_DIR)/$(TI_CGT_PRU_SOURCE) --prefix $(@D) --mode unattended
+endef
+
+# Since this is largely prebuilt toolchain and likes to live in its own
+# directory, put is in $(HOST_DIR)/ti-cgt-pru_$(CGT_PRU_VERION)
+# Packages wanting to use this toolchain need to use this path as TI's
+# standard PRU_CGT path.
+
+PRU_CGT = $(HOST_DIR)/ti-cgt-pru_$(TI_CGT_PRU_VERSION)
+define HOST_TI_CGT_PRU_INSTALL_CMDS
+	$(INSTALL) -d $(PRU_CGT)
+	cp -af $(@D)/$(notdir $(PRU_CGT)) $(HOST_DIR)
+endef
+
+$(eval $(host-generic-package))
-- 
2.7.4
