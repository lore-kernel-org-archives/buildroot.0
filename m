From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 May 2021 23:11:33 +0200
Subject: [Buildroot] [git commit] boot/beaglev-secondboot: new package
Message-ID: <20210507212959.C05BB88392@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e746d27c085cac3567f86d45fef4f7f17aea553
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This packages allows to build the first stage bootloader used on the
BeagleV, which is used even before the DDR initialization and
OpenSBI/U-Boot. Yes, "secondboot" is strange for what is the first
stage bootloader, but that's the upstream name.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
[yann.morin.1998 at free.fr:
  - add hash file
  - commit is HEAD only right now, so don't reference HEAD
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                      |  1 +
 boot/Config.in                                  |  1 +
 boot/beaglev-secondboot/Config.in               |  9 ++++++++
 boot/beaglev-secondboot/beaglev-secondboot.hash |  2 ++
 boot/beaglev-secondboot/beaglev-secondboot.mk   | 29 +++++++++++++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0c3a3e3134..bbbb0ecfa8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2605,6 +2605,7 @@ F:	arch/Config.in.arm
 F:	board/beaglev/
 F:	board/stmicroelectronics/stm32mp157c-dk2/
 F:	boot/beaglev-ddrlnit/
+F:	boot/beaglev-secondboot/
 F:	boot/boot-wrapper-aarch64/
 F:	boot/grub2/
 F:	boot/gummiboot/
diff --git a/boot/Config.in b/boot/Config.in
index 4f89f0dad1..54c2b7605d 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -7,6 +7,7 @@ source "boot/at91dataflashboot/Config.in"
 source "boot/arm-trusted-firmware/Config.in"
 source "boot/barebox/Config.in"
 source "boot/beaglev-ddrlnit/Config.in"
+source "boot/beaglev-secondboot/Config.in"
 source "boot/binaries-marvell/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
 source "boot/grub2/Config.in"
diff --git a/boot/beaglev-secondboot/Config.in b/boot/beaglev-secondboot/Config.in
new file mode 100644
index 0000000000..a9695fc138
--- /dev/null
+++ b/boot/beaglev-secondboot/Config.in
@@ -0,0 +1,9 @@
+config BR2_TARGET_BEAGLEV_SECONDBOOT
+	bool "beaglev-secondboot"
+	depends on BR2_riscv
+	depends on BR2_HOSTARCH = "x86_64" # host-riscv64-elf-toolchain
+	help
+	  This package builds the SecondBoot firmware used on the
+	  BeagleV platform.
+
+	  https://github.com/starfive-tech/beagle_secondBoot
diff --git a/boot/beaglev-secondboot/beaglev-secondboot.hash b/boot/beaglev-secondboot/beaglev-secondboot.hash
new file mode 100644
index 0000000000..d936263d1a
--- /dev/null
+++ b/boot/beaglev-secondboot/beaglev-secondboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  b97dc40dbfc49ced591d6ef53d06adebf90b9c467d3754ec51b2626593d97cbd  beaglev-secondboot-a4f0b4307f877890f998b3216cffcc9f27a5f993.tar.gz
diff --git a/boot/beaglev-secondboot/beaglev-secondboot.mk b/boot/beaglev-secondboot/beaglev-secondboot.mk
new file mode 100644
index 0000000000..7bd97165de
--- /dev/null
+++ b/boot/beaglev-secondboot/beaglev-secondboot.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# beaglev-secondboot
+#
+################################################################################
+
+# Commit on the 'starfive' branch
+BEAGLEV_SECONDBOOT_VERSION = a4f0b4307f877890f998b3216cffcc9f27a5f993
+BEAGLEV_SECONDBOOT_SITE = $(call github,starfive-tech,beagle_secondBoot,$(BEAGLEV_SECONDBOOT_VERSION))
+BEAGLEV_SECONDBOOT_INSTALL_TARGET = NO
+BEAGLEV_SECONDBOOT_INSTALL_IMAGES = YES
+BEAGLEV_SECONDBOOT_DEPENDENCIES = host-riscv64-elf-toolchain
+# unfortunately, no real license file, but several sources files are
+# under GPL-2.0+, making the whole work GPL-2.0+
+BEAGLEV_SECONDBOOT_LICENSE = GPL-2.0+
+
+define BEAGLEV_SECONDBOOT_BUILD_CMDS
+	$(MAKE) -C $(@D)/build \
+		CROSSCOMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
+		SUFFIX=buildroot \
+		GIT_VERSION=$(BEAGLEV_SECONDBOOT_VERSION)
+endef
+
+define BEAGLEV_SECONDBOOT_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/build/bootloader-BEAGLEV-buildroot.bin.out \
+		$(BINARIES_DIR)/bootloader-BEAGLEV-buildroot.bin.out
+endef
+
+$(eval $(generic-package))
