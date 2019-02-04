From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  4 Feb 2019 23:30:09 +0100
Subject: [Buildroot] [PATCH 2/3] board/qemu/xtensa-lx60: backport upsteam
 patch fixing kernel runtime issue with Binutils 2.32.
In-Reply-To: <20190204223010.19733-1-romain.naour@gmail.com>
References: <20190204223010.19733-1-romain.naour@gmail.com>
Message-ID: <20190204223010.19733-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Binutils 2.32, xtensa kernel <= 4.18 need an upstream patch from kernel 4.19 [1]

[1] https://www.sourceware.org/ml/binutils/2019-02/msg00015.html

Fixes:
https://gitlab.com/kubu93/toolchains-builder/-/jobs/155355484

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...sa-add-NOTES-section-to-the-linker-script.patch | 47 ++++++++++++++++++++++
 configs/qemu_xtensa_lx60_defconfig                 |  2 +
 configs/qemu_xtensa_lx60_nommu_defconfig           |  2 +
 3 files changed, 51 insertions(+)
 create mode 100644 board/qemu/xtensa-lx60/patches/linux/0001-xtensa-add-NOTES-section-to-the-linker-script.patch

diff --git a/board/qemu/xtensa-lx60/patches/linux/0001-xtensa-add-NOTES-section-to-the-linker-script.patch b/board/qemu/xtensa-lx60/patches/linux/0001-xtensa-add-NOTES-section-to-the-linker-script.patch
new file mode 100644
index 0000000000..8d82e9e168
--- /dev/null
+++ b/board/qemu/xtensa-lx60/patches/linux/0001-xtensa-add-NOTES-section-to-the-linker-script.patch
@@ -0,0 +1,47 @@
+From 72b5dcc807e664b705540b2a94ed318889b7a9af Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Mon, 29 Oct 2018 18:30:13 -0700
+Subject: [PATCH] xtensa: add NOTES section to the linker script
+
+This section collects all source .note.* sections together in the
+vmlinux image. Without it .note.Linux section may be placed at address
+0, while the rest of the kernel is at its normal address, resulting in a
+huge vmlinux.bin image that may not be linked into the xtensa Image.elf.
+
+Cc: stable at vger.kernel.org
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+(cherry picked from commit 4119ba211bc4f1bf638f41e50b7a0f329f58aa16)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ arch/xtensa/boot/Makefile        | 2 +-
+ arch/xtensa/kernel/vmlinux.lds.S | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/arch/xtensa/boot/Makefile b/arch/xtensa/boot/Makefile
+index 53e4178711e6..8c20a7965bda 100644
+--- a/arch/xtensa/boot/Makefile
++++ b/arch/xtensa/boot/Makefile
+@@ -34,7 +34,7 @@ boot-elf boot-redboot: $(addprefix $(obj)/,$(subdir-y)) \
+ 		       $(addprefix $(obj)/,$(host-progs))
+ 	$(Q)$(MAKE) $(build)=$(obj)/$@ $(MAKECMDGOALS)
+ 
+-OBJCOPYFLAGS = --strip-all -R .comment -R .note.gnu.build-id -O binary
++OBJCOPYFLAGS = --strip-all -R .comment -R .notes -O binary
+ 
+ vmlinux.bin: vmlinux FORCE
+ 	$(call if_changed,objcopy)
+diff --git a/arch/xtensa/kernel/vmlinux.lds.S b/arch/xtensa/kernel/vmlinux.lds.S
+index 70b731edc7b8..c430c96ea723 100644
+--- a/arch/xtensa/kernel/vmlinux.lds.S
++++ b/arch/xtensa/kernel/vmlinux.lds.S
+@@ -131,6 +131,7 @@ SECTIONS
+   .fixup   : { *(.fixup) }
+ 
+   EXCEPTION_TABLE(16)
++  NOTES
+   /* Data section */
+ 
+   _sdata = .;
+-- 
+2.14.5
+
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index a735c991c7..14fcc4e982 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -3,6 +3,8 @@ BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
 BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
 
+BR2_GLOBAL_PATCH_DIR="board/qemu/xtensa-lx60/patches/"
+
 # System
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index f4d6837bc1..b22716a65a 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -3,6 +3,8 @@ BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
 BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
 
+BR2_GLOBAL_PATCH_DIR="board/qemu/xtensa-lx60/patches/"
+
 # Toolchain
 BR2_PACKAGE_HOST_ELF2FLT=y
 # BR2_USE_MMU is not set
-- 
2.14.5
