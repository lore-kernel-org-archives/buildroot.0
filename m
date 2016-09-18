From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 19:30:45 +0200
Subject: [Buildroot] [PATCH 1/1] configs: new defconfig for TI am335x-evm
In-Reply-To: <1471261882-5640-1-git-send-email-lothar.felten@gmail.com>
References: <1471261882-5640-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <20160918193045.15a33be3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Aug 2016 13:51:22 +0200, Lothar Felten wrote:
> This patch adds a target config for the ti am335x-evm based on the AM335x CPU.
> It also supports the beaglebone and beagleboneblack.

How can it support also the BeagleBone and BeagleBoneBlack when the
U-Boot is configured with:

+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"

I.e, isn't U-Boot consequently only working on the arm335x_evm
platform? Or is the am335x_evm U-Boot configuration also usable for
BeagleBone/BeagleBoneBlack?

It seems that it's the case thanks to:

CONFIG_OF_LIST="am335x-evm am335x-bone am335x-boneblack am335x-evmsk am335x-bonegreen am335x-icev2"

in the U-Boot configuration. Can you confirm?

If that's the case, then is the name of the defconfig really properly
chosen? Should we remove beaglebone_defconfig in favor of a common
defconfig for all am335x configurations?

I'd say, either we name the defconfig am335x_evm_defconfig, and it
should support only this board, or we name it am335x_defconfig and it
supports multiple boards and replaces other AM335x defconfigs we
already have.

> Uboot SD card patch:
> Early AM335x-evm boards can only use 1 bit communication to the SD card, on
> newer board revisions this might be fixed.
> Forcing 1 bit communication slows down the communication but will work
> regardless if the SD card is attached via 1 or 4 bits.
> If the board has a working 4 bit SD card interface, this patch can be removed,
> this will speed up the access.

Do you still have those early AM335x EVM boards? Are they widespread?
I'm wondering if it really makes sense to have this patch.

> +How to build it
> +===============
> +
> +Select the default configuration for the am335x-evm target:
> +$ make am335x-evm_defconfig

The defconfig name should be using _ as separator, not -.

> diff --git a/configs/am335x-evm_defconfig b/configs/am335x-evm_defconfig
> new file mode 100644
> index 0000000..c834b17
> --- /dev/null
> +++ b/configs/am335x-evm_defconfig
> @@ -0,0 +1,25 @@
> +BR2_arm=y
> +BR2_cortex_a8=y
> +BR2_GLOBAL_PATCH_DIR="board/ti/am335x-evm/patches"
> +BR2_KERNEL_HEADERS_4_1=y

Use "same headers as the kernel sources" option please.

> +BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"

Does this really work for the BeagleBone, which uses ttyO2 if I
remember correctly? Maybe another reason to have a defconfig that
supports just the am335x_evm.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
