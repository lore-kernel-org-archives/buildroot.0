From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Oct 2011 09:10:31 -0300
Subject: [Buildroot] [PATCH 2/2] qemu_sh4_r2d: update to fix serial console
	support
In-Reply-To: <1319544631-31988-1-git-send-email-gustavo@zacarias.com.ar>
References: <1319544631-31988-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1319544631-31988-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sh4-r2d has a serial port, however it's the second SH UART that's
emulated by Qemu so we need to adjust the kernel configuration for it to
see the relevant UART and adjust the qemu command line for it too.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/sh4-r2d/linux-3.1.config |    1 -
 board/qemu/sh4-r2d/readme.txt       |    6 ++++--
 configs/qemu_sh4_r2d_defconfig      |    2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/board/qemu/sh4-r2d/linux-3.1.config b/board/qemu/sh4-r2d/linux-3.1.config
index 638e4e0..287f36a 100644
--- a/board/qemu/sh4-r2d/linux-3.1.config
+++ b/board/qemu/sh4-r2d/linux-3.1.config
@@ -48,7 +48,6 @@ CONFIG_INPUT_FF_MEMLESS=m
 CONFIG_VT_HW_CONSOLE_BINDING=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_SH_SCI=y
-CONFIG_SERIAL_SH_SCI_NR_UARTS=1
 CONFIG_SERIAL_SH_SCI_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_SPI=y
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index 76eafac..875e3d0 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -1,5 +1,7 @@
 Run the emulation with:
 
-  qemu-system-sh4 -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide -append "root=/dev/sda noiotrap"
+  qemu-system-sh4 -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide -append "root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio
+
+The login prompt will appear in the terminal that started Qemu.
+The graphical window is the framebuffer.
 
-The login prompt will appear in the graphical window.
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 32835de..8f92a93 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -4,7 +4,7 @@ BR2_sh4=y
 
 # system
 BR2_TARGET_GENERIC_GETTY=y
-BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-- 
1.7.3.4
