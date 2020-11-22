From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 22 Nov 2020 19:27:40 +0200
Subject: [Buildroot] [PATCH v2 1/1] boot/arm-trusted-firmware: Forward
 stack protection configuration
In-Reply-To: <20201122143731.3374802-2-christoph.muellner@theobroma-systems.com>
References: <20201122143731.3374802-1-christoph.muellner@theobroma-systems.com>
 <20201122143731.3374802-2-christoph.muellner@theobroma-systems.com>
Message-ID: <87wnydwbcj.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christoph,

On Sun, Nov 22 2020, Christoph M?llner wrote:
> TF-A supports stack smashing protection (-fstack-protector-*).
> However it currenlty fails to build when built with BR2_SSP_*
> enabled, because stack protection needs to be enabled for the
> TF-A build process itself as well to generate the required
> symbols (e.g. __stack_chk_guard).

So you are saying that the toolchain wrapper actually breaks ATF build
when SSP is enabled. Is that correct? If so, this patch is not (only)
about enabling the SSP feature for ATF, but about fixing the ATF
build. Can you add the build failure error message to the commit log?

Also, the subject line should say something like "fix build with SSP
enabled".

This patch should be applied to the master branch, and backported to
stable branches, I believe.

baruch

> So in case we see that BR2_SSP_* is enabled, let's enable
> the corresponding build flag for TF-A as documented in
> the TF-A user guide.
>
> Tested on a Rockchip PX30 based system.
>
> Signed-off-by: Christoph M?llner <christoph.muellner@theobroma-systems.com>
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index a3553e36cf..0597cecf71 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -100,6 +100,14 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
>  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
>  endif
>  
> +ifeq ($(BR2_SSP_REGULAR),y)
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=default
> +else ifeq ($(BR2_SSP_STRONG),y)
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=strong
> +else ifeq ($(BR2_SSP_ALL),y)
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=all
> +endif
> +
>  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
>  
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
