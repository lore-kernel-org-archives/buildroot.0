From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 19:02:28 +0200
Subject: [Buildroot] [PATCH v3 2/4] configs/stm32mp157*: use trusted
 configuration
In-Reply-To: <20201007144945.1697081-2-shlomi.39sd@gmail.com>
References: <20201007144945.1697081-1-shlomi.39sd@gmail.com>
 <20201007144945.1697081-2-shlomi.39sd@gmail.com>
Message-ID: <20201014190228.6eb7b739@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Oct 2020 17:49:43 +0300
Shlomi Vaknin <shlomi.39sd@gmail.com> wrote:

> Adding support for trusted configuration for stm32mp157c-dk2 and stm32mp157a-dk1.
> This patch change using uboot spl as fsbl to using arm trusted firmware.
> The reason for this change is that st recommends to use this configuration (or optee)
> and not the basic.
> In addition, this commit enables gadget support in `linux.config`.
> 
> In addition, removing partition-type from genimage.cfg is mandatory,
> since it creates a hybrid MBR partition table which causes ATF to not find ssbl parition.
> 
> Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>

Thanks, I have applied, with some changes. See below.

> +main()
> +{
> +	local ATFBIN="$(atf_image)"
> +	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
> +	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +	sed -e "s/%ATFBIN%/${ATFBIN}/" \
> +
> board/stmicroelectronics/common/stm32mp157/genimage.cfg.template >
> ${GENIMAGE_CFG} +
> +	rm -rf "${GENIMAGE_TMP}"
> +
> +	genimage \
> +		--rootpath "${TARGET_DIR}" \
> +		--tmppath "${GENIMAGE_TMP}" \
> +		--inputpath "${BINARIES_DIR}" \
> +		--outputpath "${BINARIES_DIR}" \
> +		--config "${GENIMAGE_CFG}"
> +
> +	rm -f ${GENIMAGE_CFG}
> +
> +	exit $?
> +}

I have replaced the manual call to genimage by a call to
support/scripts/genimage.sh.

> diff --git a/board/stmicroelectronics/stm32mp157a-dk1/linux.config b/board/stmicroelectronics/stm32mp157a-dk1/linux.config
> index 95c834e431..47729ea97c 100644
> --- a/board/stmicroelectronics/stm32mp157a-dk1/linux.config
> +++ b/board/stmicroelectronics/stm32mp157a-dk1/linux.config

I have dropped those changes to the Linux kernel configuration, as they
are not related to the switch to a trusted configuration.

> diff --git a/board/stmicroelectronics/stm32mp157c-dk2/linux.config b/board/stmicroelectronics/stm32mp157c-dk2/linux.config
> index 878a0c39f1..c03eb748b4 100644
> --- a/board/stmicroelectronics/stm32mp157c-dk2/linux.config
> +++ b/board/stmicroelectronics/stm32mp157c-dk2/linux.config

Same.

> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y

I have changed to used a fixed version of arm-trusted-firmware, i.e
v2.2, so that the defconfig will always use the same configuration
instead of "the latest".

> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y

Same here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
