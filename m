From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:53:17 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] ci20: Fix U-Boot build
 with codesourcery toolchain
Message-ID: <20181216214912.7D39E8B62D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b111168f769b57ab440e0e5232d1722db8f05d90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Currently, U-Boot is failing to build, due to some issues
with the toolchain and the U-Boot port.

Fix it.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aacf3acb8455682d8dac4a68cf0f7984dd71b549)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../uboot/0001-mips-Remove-default-endiannes.patch | 66 ++++++++++++++++++++++
 configs/ci20_defconfig                             |  1 +
 2 files changed, 67 insertions(+)

diff --git a/board/ci20/patches/uboot/0001-mips-Remove-default-endiannes.patch b/board/ci20/patches/uboot/0001-mips-Remove-default-endiannes.patch
new file mode 100644
index 0000000000..a6191804f1
--- /dev/null
+++ b/board/ci20/patches/uboot/0001-mips-Remove-default-endiannes.patch
@@ -0,0 +1,66 @@
+From b3a1e97498e7987073775d49a703932c20f2df1d Mon Sep 17 00:00:00 2001
+From: Ezequiel Garcia <ezequiel@collabora.com>
+Date: Mon, 12 Nov 2018 14:04:46 -0300
+Subject: [PATCH] mips: Remove default endiannes
+
+Currently, trying to build ci20_mmc fails on little-endian
+toolchains. The problem seems to be that some targets don't
+have CONFIG_SYS_LITTLE_ENDIAN properly set, and therefore
+the default -EB switch is selected.
+
+Let's get rid of the default switch entirely, and fix this problem.
+While this may be a hack, it is a quick solution until
+U-Boot gets CI20 proper support.
+
+make ARCH=mips CROSS_COMPILE=mips-linux-gnu- ci20_mmc
+Configuring for ci20_mmc - Board: ci20, Options: SPL_MMC_SUPPORT,ENV_IS_IN_MMC
+make
+make[1]: Entering directory '/home/zeta/repos/u-boot-ci20'
+Generating include/autoconf.mk
+Generating include/autoconf.mk.dep
+mips-linux-gnu-gcc: error: may not use both -EB and -EL
+mips-linux-gnu-gcc: error: may not use both -EB and -EL
+Generating include/spl-autoconf.mk
+mips-linux-gnu-gcc: error: may not use both -EB and -EL
+Generating include/tpl-autoconf.mk
+mips-linux-gnu-gcc: error: may not use both -EB and -EL
+mips-linux-gnu-gcc -DDO_DEPS_ONLY \
+	-g  -Os   -ffunction-sections -fdata-sections -D__KERNEL__ -I/home/zeta/repos/u-boot-ci20/include -fno-builtin -ffreestanding -nostdinc -isystem /home/zeta/repos/buildroot/mips/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/5.3.0/include -pipe  -DCONFIG_MIPS -D__MIPS__ -G 0 -EB -msoft-float -fpic -mabicalls -march=mips32 -mabi=32 -DCONFIG_32BIT -mno-branch-likely -Wall -Wstrict-prototypes       \
+	-o lib/asm-offsets.s lib/asm-offsets.c -c -S
+if [ -f arch/mips/cpu/xburst/jz4780/asm-offsets.c ];then \
+	mips-linux-gnu-gcc -DDO_DEPS_ONLY \
+	-g  -Os   -ffunction-sections -fdata-sections -D__KERNEL__ -I/home/zeta/repos/u-boot-ci20/include -fno-builtin -ffreestanding -nostdinc -isystem /home/zeta/repos/buildroot/mips/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/5.3.0/include -pipe  -DCONFIG_MIPS -D__MIPS__ -G 0 -EB -msoft-float -fpic -mabicalls -march=mips32 -mabi=32 -DCONFIG_32BIT -mno-branch-likely -Wall -Wstrict-prototypes       \
+		-o arch/mips/cpu/xburst/jz4780/asm-offsets.s arch/mips/cpu/xburst/jz4780/asm-offsets.c -c -S; \
+else \
+	touch arch/mips/cpu/xburst/jz4780/asm-offsets.s; \
+fi
+mips-linux-gnu-gcc: error: may not use both -EB and -EL
+make[1]: *** [Makefile:747: lib/asm-offsets.s] Error 1
+make[1]: *** Waiting for unfinished jobs....
+make[1]: Leaving directory '/home/zeta/repos/u-boot-ci20'
+make: *** [.boards.depend:463: ci20_mmc] Error 2
+
+Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
+---
+https://github.com/MIPS/CI20_u-boot/pull/19
+
+ arch/mips/config.mk | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/arch/mips/config.mk b/arch/mips/config.mk
+index c89279025507..43560abbc0e1 100644
+--- a/arch/mips/config.mk
++++ b/arch/mips/config.mk
+@@ -20,9 +20,6 @@ ifdef CONFIG_SYS_BIG_ENDIAN
+ ENDIANNESS := -EB
+ endif
+ 
+-# Default to EB if no endianess is configured
+-ENDIANNESS ?= -EB
+-
+ PLATFORM_CPPFLAGS += -DCONFIG_MIPS -D__MIPS__
+ 
+ #
+-- 
+2.19.1
+
diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index 6e860b1e7e..8f2604b07c 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -27,6 +27,7 @@ BR2_TARGET_UBOOT_BOARDNAME="ci20_mmc"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_u-boot"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa"
+BR2_TARGET_UBOOT_PATCH="board/ci20/patches/uboot"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
