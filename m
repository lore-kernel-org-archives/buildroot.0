From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 21 Nov 2020 18:59:55 +0200
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: Forward
 stack protection configuration
In-Reply-To: <20201120212912.2993985-1-christoph.muellner@theobroma-systems.com>
References: <20201120212912.2993985-1-christoph.muellner@theobroma-systems.com>
Message-ID: <87eekmy7as.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christoph,

On Fri, Nov 20 2020, Christoph M?llner wrote:
> TF-A supports stack smashing protection (-fstack-protector-*).
> Since we already forward the required compiler flag, let's
> also tell TF-A that we actually want the required symbols
> (e.g. __stack_chk_guard) to be available.
>
> Signed-off-by: Christoph M?llner <christoph.muellner@theobroma-systems.com>
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index a3553e36cf..f5be39100e 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -100,6 +100,18 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
>  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
>  endif
>  
> +ifeq ($(BR2_SSP_REGULAR),y)
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=default
> +endif
> +
> +ifeq ($(BR2_SSP_STRONG),y)
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=strong
> +endif
> +
> +ifeq ($(BR2_SSP_ALL),y)
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=all
> +endif

It looks like the toolchain wrapper does that already. See
toolchain/toolchain-wrapper.mk. Are you sure this is needed?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
