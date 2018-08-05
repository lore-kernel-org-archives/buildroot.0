From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 14:47:09 +0200
Subject: [Buildroot] [PATCH 1/2] qemu/sh4-r2d: restore the old sh-sci
 driver behaviour
In-Reply-To: <20180616112532.26275-1-romain.naour@gmail.com>
References: <20180616112532.26275-1-romain.naour@gmail.com>
Message-ID: <20180805144709.2b2b319e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Jun 2018 13:25:31 +0200, Romain Naour wrote:
> This reverts commit 18e8cf159177100e69d528293f8cf6875c0b1bca (kernel)
> 
> The last Qemu kernel update [1] introduced a regresion in sh4 SCIF
> serial device. Some keyboard presses are very slow to be taken into
> account, perhaps not even taken into account at all. This would
> explain why our test infrastructure doesn?t manage to login as root
> [2][3][4].
> 
> git bisect reported a kernel patch from 4.11, increasing RX FIFO
> trigger defaults value for sh-sci (H)SCIF. The kernel patch itself
> looks good but the Qemu emulation is not ready to handle this new
> setting.
> 
> From Qemu (2.12.0): target/sh4/README.sh4
> "Configuration of the second serial port (SCIF) is supported. FIFO
> handling infrastructure has been started but is not completed yet."
> 
> We can't use the first serial port (ttySC0) because it's the second
> SH UART that's emulated by Qemu.
> 
> In order to be able to test sh4 architecture with newer kernel,
> revert to the old behaviour.
> 
> [1] 03fb00f2175cdb4565e26fcb9b3da1c1059de1bd
> [2] https://gitlab.com/free-electrons/toolchains-builder/-/jobs/72006425
> [3] https://gitlab.com/free-electrons/toolchains-builder/-/jobs/72006427
> [4] https://gitlab.com/free-electrons/toolchains-builder/-/jobs/72006426
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...al-sh-sci-increase-RX-FIFO-trigger-defaul.patch | 61 ++++++++++++++++++++++
>  configs/qemu_sh4_r2d_defconfig                     |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 board/qemu/sh4-r2d/patches/linux/0001-Revert-serial-sh-sci-increase-RX-FIFO-trigger-defaul.patch

Both applied to master. Has the issue been reported to upstream Qemu ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
