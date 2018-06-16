From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 16 Jun 2018 13:25:31 +0200
Subject: [Buildroot] [PATCH 1/2] qemu/sh4-r2d: restore the old sh-sci driver
 behaviour
Message-ID: <20180616112532.26275-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 18e8cf159177100e69d528293f8cf6875c0b1bca (kernel)

The last Qemu kernel update [1] introduced a regresion in sh4 SCIF
serial device. Some keyboard presses are very slow to be taken into
account, perhaps not even taken into account at all. This would
explain why our test infrastructure doesn?t manage to login as root
[2][3][4].

git bisect reported a kernel patch from 4.11, increasing RX FIFO
trigger defaults value for sh-sci (H)SCIF. The kernel patch itself
looks good but the Qemu emulation is not ready to handle this new
setting.

From Qemu (2.12.0): target/sh4/README.sh4
"Configuration of the second serial port (SCIF) is supported. FIFO
handling infrastructure has been started but is not completed yet."

We can't use the first serial port (ttySC0) because it's the second
SH UART that's emulated by Qemu.

In order to be able to test sh4 architecture with newer kernel,
revert to the old behaviour.

[1] 03fb00f2175cdb4565e26fcb9b3da1c1059de1bd
[2] https://gitlab.com/free-electrons/toolchains-builder/-/jobs/72006425
[3] https://gitlab.com/free-electrons/toolchains-builder/-/jobs/72006427
[4] https://gitlab.com/free-electrons/toolchains-builder/-/jobs/72006426

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...al-sh-sci-increase-RX-FIFO-trigger-defaul.patch | 61 ++++++++++++++++++++++
 configs/qemu_sh4_r2d_defconfig                     |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 board/qemu/sh4-r2d/patches/linux/0001-Revert-serial-sh-sci-increase-RX-FIFO-trigger-defaul.patch

diff --git a/board/qemu/sh4-r2d/patches/linux/0001-Revert-serial-sh-sci-increase-RX-FIFO-trigger-defaul.patch b/board/qemu/sh4-r2d/patches/linux/0001-Revert-serial-sh-sci-increase-RX-FIFO-trigger-defaul.patch
new file mode 100644
index 0000000000..36c82d84ef
--- /dev/null
+++ b/board/qemu/sh4-r2d/patches/linux/0001-Revert-serial-sh-sci-increase-RX-FIFO-trigger-defaul.patch
@@ -0,0 +1,61 @@
+From aaaced6d2d6f796ed77e4725ed7ccbedb189c180 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 15 Jun 2018 17:43:38 +0200
+Subject: [PATCH] Revert: serial: sh-sci: increase RX FIFO trigger defaults for
+ (H)SCIF
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This reverts commit 18e8cf159177100e69d528293f8cf6875c0b1bca (kernel)
+
+The last Qemu kernel update [1] introduced a regresion in sh4 SCIF
+serial device. Some keyboard presses are very slow to be taken into
+account, perhaps not even taken into account at all. This would
+explain why our test infrastructure doesn?t manage to login as root
+[2][3][4].
+
+git bisect reported a kernel patch from 4.11, increasing RX FIFO
+trigger defaults value for sh-sci (H)SCIF. The kernel patch itself
+looks good but the Qemu emulation is not ready to handle this new
+setting.
+
+From Qemu (2.12.0): target/sh4/README.sh4
+"Configuration of the second serial port (SCIF) is supported. FIFO
+handling infrastructure has been started but is not completed yet."
+
+In order to be able to test sh4 architecture with newer kernel,
+revert to the old behaviour.
+
+[1] https://git.buildroot.net/buildroot/commit/?id=03fb00f2175cdb4565e26fcb9b3da1c1059de1bd
+[2] https://gitlab.com/free-electrons/toolchains-builder/-/jobs/72006425
+[3] https://gitlab.com/free-electrons/toolchains-builder/-/jobs/72006427
+[4] https://gitlab.com/free-electrons/toolchains-builder/-/jobs/72006426
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ drivers/tty/serial/sh-sci.c | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
+index ab757546c6db..138e4dec44fb 100644
+--- a/drivers/tty/serial/sh-sci.c
++++ b/drivers/tty/serial/sh-sci.c
+@@ -2793,11 +2793,8 @@ static int sci_init_single(struct platform_device *dev,
+ 		sci_port->rx_trigger = 32;
+ 		break;
+ 	case PORT_SCIF:
+-		if (p->regtype == SCIx_SH7705_SCIF_REGTYPE)
+-			/* RX triggering not implemented for this IP */
+-			sci_port->rx_trigger = 1;
+-		else
+-			sci_port->rx_trigger = 8;
++		/* RX triggering not implemented in Qemu emulation */
++		sci_port->rx_trigger = 1;
+ 		break;
+ 	default:
+ 		sci_port->rx_trigger = 1;
+-- 
+2.14.4
+
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 8ddcb80b02..ec4a91c999 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -3,6 +3,7 @@ BR2_sh=y
 BR2_sh4=y
 
 # System
+BR2_GLOBAL_PATCH_DIR="board/qemu/sh4-r2d/patches"
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 
-- 
2.14.4
