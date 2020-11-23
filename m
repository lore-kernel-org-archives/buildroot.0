From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 23 Nov 2020 20:23:59 +0200
Subject: [Buildroot] [PATCH v4 1/1] boot/arm-trusted-firmware: Forward
 stack protection configuration
In-Reply-To: <20201123131506.834183-1-christoph.muellner@theobroma-systems.com>
References: <20201123131506.834183-1-christoph.muellner@theobroma-systems.com>
Message-ID: <87o8jovsn4.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christoph,

On Mon, Nov 23 2020, Christoph M?llner wrote:
> TF-A supports stack smashing protection (-fstack-protector-*).
> However, that feature is currenlty silently disabled because
> ENABLE_STACK_PROTECTOR is not set during build time.
>
> As documented in the TF-A user guide, the flag ENABLE_STACK_PROTECTOR
> is required to enable stack protection support. When enabled the symbols
> for the stack protector (e.g. __stack_chk_guard) are built.
> This needs to be done because TF-A does not link against an external
> library that provides that symbols (e.g. libc).
>
> So in case we see that BR2_SSP_* is enabled, let's enable the corresponding
> ENABLE_STACK_PROTECTOR build flag for TF-A as documented in the TF-A user guide.
>
> This patch also fixes a the following linker errors with older TF-A versions
> if BR2_SSP_* is enabled (i.e. -fstack-protector-* is used as compiler flag)
> and ENABLE_STACK_PROTECTOR is not set, which are caused by the missing
> stack protector symbols:
>
>   [...]
>   params_setup.c:(.text.params_early_setup+0xc): undefined reference to `__stack_chk_guard'
>   aarch64-none-linux-gnu-ld: params_setup.c:(.text.params_early_setup+0x14): undefined reference to `__stack_chk_guard'
>   aarch64-none-linux-gnu-ld: params_setup.c:(.text.params_early_setup+0x104): undefined reference to `__stack_chk_guard'
>   aarch64-none-linux-gnu-ld: params_setup.c:(.text.params_early_setup+0x118): undefined reference to `__stack_chk_fail'
>   aarch64-none-linux-gnu-ld: ./build/px30/release/bl31/pmu.o: in function `rockchip_soc_sys_pwr_dm_suspend':
>   pmu.c:(.text.rockchip_soc_sys_pwr_dm_suspend+0xc): undefined reference to `__stack_chk_guard'
>   [...]
>
> TF-A releases after Nov 2019, that include 7af195e29a4, will circumvent
> these issue by explicitliy and silently disabling the stack protector
> by appending '-fno-stack-protector' to the compiler flags in case
> ENABLE_STACK_PROTECTOR is not set.
>
> Tested on a Rockchip PX30 based system (TF-A v2.2 and upstream/master).
>
> Signed-off-by: Christoph M?llner <christoph.muellner@theobroma-systems.com>

Thanks. FWIW,

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

baruch

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
