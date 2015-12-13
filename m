From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2015 21:32:24 +0100
Subject: [Buildroot] [PATCH v2 2/4] libfslcodec: add missing configure
 options
In-Reply-To: <1449755560-2911-3-git-send-email-gary.bisson@boundarydevices.com>
References: <1449755560-2911-1-git-send-email-gary.bisson@boundarydevices.com>
 <1449755560-2911-3-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20151213203224.GC27769@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, All,

On 2015-12-10 14:52 +0100, Gary Bisson spake thusly:
> Enable VPU and hard float support when the proper configuration is setup.
> BR2_ARM_EABIHF=y
> BR2_PACKAGE_IMX_VPU=y
> 
> See Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/blob/fido/recipes-
> multimedia/libfslcodec/libfslcodec.inc
> 
> Tested with the Linaro ARM 2014.09 toolchain.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> 
> Thanks to those options, I could see that:
> - lib_jpeg_dec_arm11_elinux_novpu.so isn't copied
> - lib_peq_arm11_elinux.so.1.fhw is copied instead of the fsw version
> 
> Regards,
> Gary
> 
> ---
>  package/libfslcodec/libfslcodec.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
> index f8c6aa8..05e5edb 100644
> --- a/package/libfslcodec/libfslcodec.mk
> +++ b/package/libfslcodec/libfslcodec.mk
> @@ -13,6 +13,14 @@ LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c
>  LIBFSLCODEC_LICENSE_FILES = EULA COPYING
>  LIBFSLCODEC_REDISTRIBUTE = NO
>  
> +ifeq ($(BR2_ARM_EABIHF),y)
> +LIBFSLCODEC_CONF_OPTS += --enable-fhw
> +endif

What about adding --disable-fhw when not EABIhf?

> +ifeq ($(BR2_PACKAGE_IMX_VPU),y)
> +LIBFSLCODEC_CONF_OPTS += --enable-vpu
> +endif

Ditto when imx-vpu is not enabled?

Regards,
Yann E. MORIN.

>  define LIBFSLCODEC_EXTRACT_CMDS
>  	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(LIBFSLCODEC_SOURCE))
>  endef
> -- 
> 2.6.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
