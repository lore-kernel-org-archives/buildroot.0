From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 21:20:14 +0200
Subject: [Buildroot] [PATCH] board: solidrun: add Clearfog GT-8K
In-Reply-To: <0131577d7afceede1aa59bf7b98dc3bda9249df5.1560673127.git.baruch@tkos.co.il>
References: <0131577d7afceede1aa59bf7b98dc3bda9249df5.1560673127.git.baruch@tkos.co.il>
Message-ID: <20190617212014.25208cc9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

This mostly looks good, I just have one question (below), and some
minor nits that I would have ignored if I didn't had the question.

The commit title should preferably be:

	configs/solidrun_clearfog_gt_8k: new defconfig

On Sun, 16 Jun 2019 11:18:47 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 4cc8c9d0877e..9bf2d334e522 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -253,6 +253,8 @@ F:	package/pulseview/
>  F:	package/sigrok-cli/
>  
>  N:	Baruch Siach <baruch@tkos.co.il>
> +F:	board/solidrun/clearfog_gt_8k/

I think we more commonly use "-" as a separate in board directory names
instead of "_", so there's not a strong convention on this.


> diff --git a/board/solidrun/clearfog_gt_8k/linux-extras.config b/board/solidrun/clearfog_gt_8k/linux-extras.config
> new file mode 100644
> index 000000000000..bce2a2e9d20c
> --- /dev/null
> +++ b/board/solidrun/clearfog_gt_8k/linux-extras.config
> @@ -0,0 +1,4 @@
> +CONFIG_MARVELL_PHY=y
> +CONFIG_SFP=y
> +CONFIG_NET_DSA=y
> +CONFIG_NET_DSA_MV88E6XXX=y

So the switch driver is enabled to be built in the kernel image
itself...

> +Enable the switch (yellow) Ethernet ports
> +=========================================
> +
> +To enable the Clearfog GT-8K internal switch port make sure to load the
> +'mv88e6xxx' kernel module, and up the switch up-link port (eth2 by default):
> +
> +  modprobe mv88e6xxx

... but you tell people to load it as a kernel module ?

This seems weird. Am I missing something ?

> diff --git a/configs/solidrun_clearfog_gt_8k_defconfig b/configs/solidrun_clearfog_gt_8k_defconfig
> new file mode 100644
> index 000000000000..a44038e66392
> --- /dev/null
> +++ b/configs/solidrun_clearfog_gt_8k_defconfig
> @@ -0,0 +1,46 @@
> +BR2_aarch64=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
> +BR2_TARGET_GENERIC_HOSTNAME="clearfog-gt-8k"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for SolidRun Clearfog GT-8K"
> +
> +# Firmware
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
> +# This commit corresponds to release armada-18.09.4
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="711ecd32afe465b38052b5ba374c825b158eea18"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"

So there is no ATF configuration specifically for the GT-8K platform ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
