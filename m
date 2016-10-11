From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Tue, 11 Oct 2016 13:56:14 +0100
Subject: [Buildroot] [RESEND] [PATCH v3 2/3] new package: scpfirmware
In-Reply-To: <cover.1467737979.git.jpinto@synopsys.com>
References: <cover.1467737979.git.jpinto@synopsys.com>
Message-ID: <59041f202d937ed5d6a7e4cfd6daa407a112fab0.1467737979.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a new package to buildroot: scpfirmware.
It is a hidden package that only serves to get the scp binary
from Linaro repository to be used by ATFirmware (Juno requirement).

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
---
Changes v2->v3:
- atfirmware and scpfirmware were broken into 2 patches
Changes v1->v2:
- Nothing changed (just to keep up with patch set version).

 boot/Config.in                  |  1 +
 boot/scpfirmware/Config.in      | 23 +++++++++++++++++++++++
 boot/scpfirmware/scpfirmware.mk | 18 ++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 boot/scpfirmware/Config.in
 create mode 100644 boot/scpfirmware/scpfirmware.mk

diff --git a/boot/Config.in b/boot/Config.in
index ce0b50a..246d6a1 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -12,6 +12,7 @@ source "boot/gummiboot/Config.in"
 source "boot/lpc32xxcdl/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/syslinux/Config.in"
+source "boot/scpfirmware/Config.in"
 source "boot/uboot/Config.in"
 source "boot/xloader/Config.in"
 
diff --git a/boot/scpfirmware/Config.in b/boot/scpfirmware/Config.in
new file mode 100644
index 0000000..f2acc24
--- /dev/null
+++ b/boot/scpfirmware/Config.in
@@ -0,0 +1,23 @@
+config BR2_TARGET_SCPFIRMWARE
+	bool
+	depends on BR2_aarch64
+
+if BR2_TARGET_SCPFIRMWARE
+
+config BR2_TARGET_SCPFIRMWARE_VERSION
+	string
+	default BR2_TARGET_SCPFIRMWARE_CUSTOM_GIT_VERSION
+
+config BR2_TARGET_SCPFIRMWARE_CUSTOM_GIT
+	bool
+	default "y"
+
+config BR2_TARGET_SCPFIRMWARE_CUSTOM_GIT_REPO_URL
+	string
+	default "https://git.linaro.org/arm/vexpress-firmware.git"
+
+config BR2_TARGET_SCPFIRMWARE_CUSTOM_GIT_VERSION
+	string
+	default "901f81977c3b367a2e0bf3d6444be302822d97a3"
+
+endif
diff --git a/boot/scpfirmware/scpfirmware.mk b/boot/scpfirmware/scpfirmware.mk
new file mode 100644
index 0000000..0508a21
--- /dev/null
+++ b/boot/scpfirmware/scpfirmware.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# System Control Processor (SCP) Firmware
+#
+################################################################################
+
+SCPFIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_SCPFIRMWARE_VERSION))
+SCPFIRMWARE_SITE = $(call qstrip,$(BR2_TARGET_SCPFIRMWARE_CUSTOM_GIT_REPO_URL))
+SCPFIRMWARE_SITE_METHOD = git
+
+SCPFIRMWARE_INSTALL_IMAGES = YES
+
+define SCPFIRMWARE_INSTALL_IMAGES_CMDS
+	mv $(@D)/SOFTWARE/bl30.bin $(@D)/SOFTWARE/scp-fw.bin ;	\
+	cp -dpf $(@D)/SOFTWARE/scp-fw.bin $(BINARIES_DIR)/ ;
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.5
