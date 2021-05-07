From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 May 2021 23:10:37 +0200
Subject: [Buildroot] [git commit] boot/beaglev-ddrlnit: new package
Message-ID: <20210507212959.B4F99880B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3dd9ebae0f6768041ac08c4c3828b6dac55c970
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a package for the DDR initialization code used on the
BeagleV platform.

The typo in the package name is upstream's typo, and we just keep it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
[yann.morin.1998 at free.fr:
  - upstream name is beaglev_ddrlnit, not *init (keep their typo)
  - rename package and variables accordingly
  - the referenced commit is no longer the HEAD of said branch
  - add a hash file
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                |  1 +
 boot/Config.in                            |  1 +
 boot/beaglev-ddrlnit/Config.in            |  9 +++++++++
 boot/beaglev-ddrlnit/beaglev-ddrlnit.hash |  2 ++
 boot/beaglev-ddrlnit/beaglev-ddrlnit.mk   | 29 +++++++++++++++++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bcf42dc9cb..0c3a3e3134 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2604,6 +2604,7 @@ N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
 F:	board/beaglev/
 F:	board/stmicroelectronics/stm32mp157c-dk2/
+F:	boot/beaglev-ddrlnit/
 F:	boot/boot-wrapper-aarch64/
 F:	boot/grub2/
 F:	boot/gummiboot/
diff --git a/boot/Config.in b/boot/Config.in
index b3adbfc8bc..4f89f0dad1 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -6,6 +6,7 @@ source "boot/at91bootstrap3/Config.in"
 source "boot/at91dataflashboot/Config.in"
 source "boot/arm-trusted-firmware/Config.in"
 source "boot/barebox/Config.in"
+source "boot/beaglev-ddrlnit/Config.in"
 source "boot/binaries-marvell/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
 source "boot/grub2/Config.in"
diff --git a/boot/beaglev-ddrlnit/Config.in b/boot/beaglev-ddrlnit/Config.in
new file mode 100644
index 0000000000..e9d6e08ab9
--- /dev/null
+++ b/boot/beaglev-ddrlnit/Config.in
@@ -0,0 +1,9 @@
+config BR2_TARGET_BEAGLEV_DDRLNIT
+	bool "beaglev-ddrlnit"
+	depends on BR2_riscv
+	depends on BR2_HOSTARCH = "x86_64" # host-riscv64-elf-toolchain
+	help
+	  This package builds the DDRinit firmware used on the BeagleV
+	  platform.
+
+	  https://github.com/starfive-tech/beagle_ddrlnit
diff --git a/boot/beaglev-ddrlnit/beaglev-ddrlnit.hash b/boot/beaglev-ddrlnit/beaglev-ddrlnit.hash
new file mode 100644
index 0000000000..fe699b038d
--- /dev/null
+++ b/boot/beaglev-ddrlnit/beaglev-ddrlnit.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  dee7f8003ee02d7799d07b598dd5823e10b42f50fae6135b2320a8d7e1fa77bf  beaglev-ddrlnit-15b80de81263996affb2a29332aa681925709983.tar.gz
diff --git a/boot/beaglev-ddrlnit/beaglev-ddrlnit.mk b/boot/beaglev-ddrlnit/beaglev-ddrlnit.mk
new file mode 100644
index 0000000000..042878f1c2
--- /dev/null
+++ b/boot/beaglev-ddrlnit/beaglev-ddrlnit.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# beaglev-ddrlnit
+#
+################################################################################
+
+# Commit on the 'starfive' branch
+BEAGLEV_DDRLNIT_VERSION = 15b80de81263996affb2a29332aa681925709983
+BEAGLEV_DDRLNIT_SITE = $(call github,starfive-tech,beagle_ddrlnit,$(BEAGLEV_DDRLNIT_VERSION))
+BEAGLEV_DDRLNIT_INSTALL_TARGET = NO
+BEAGLEV_DDRLNIT_INSTALL_IMAGES = YES
+BEAGLEV_DDRLNIT_DEPENDENCIES = host-riscv64-elf-toolchain
+# unfortunately, no real license file, but several sources files are
+# under GPL-2.0+, making the whole work GPL-2.0+
+BEAGLEV_DDRLNIT_LICENSE = GPL-2.0+
+
+define BEAGLEV_DDRLNIT_BUILD_CMDS
+	$(MAKE) -C $(@D)/build \
+		CROSSCOMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
+		SUFFIX=buildroot \
+		GIT_VERSION=$(BEAGLEV_DDRLNIT_VERSION)
+endef
+
+define BEAGLEV_DDRLNIT_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/build/ddrinit-2133-buildroot.bin.out \
+		$(BINARIES_DIR)/ddrinit-2133-buildroot.bin.out
+endef
+
+$(eval $(generic-package))
