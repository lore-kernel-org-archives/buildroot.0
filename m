From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 14:15:34 +0200
Subject: [Buildroot] [PATCH 1/2] package/jh71xx-tools: new package
In-Reply-To: <20210514220316.1942381-2-thomas.petazzoni@bootlin.com>
References: <20210514220316.1942381-1-thomas.petazzoni@bootlin.com>
 <20210514220316.1942381-2-thomas.petazzoni@bootlin.com>
Message-ID: <20210515121534.GF2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-05-15 00:03 +0200, Thomas Petazzoni spake thusly:
> Add jh71xx-tools as a new host package, it includes a tool that allows
> to recover the bootloader of JH71xx-based platforms, such as the
> BeagleV.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks. But see below...

[--SNIP--]
> diff --git a/package/Config.in.host b/package/Config.in.host
> index ba6a68c728..cef36cebc1 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -40,6 +40,7 @@ menu "Host utilities"
>  	source "package/imx-mkimage/Config.in.host"
>  	source "package/imx-usb-loader/Config.in.host"
>  	source "package/jq/Config.in.host"
> +	source "package/jh71xx-tools/Config.in.host"

Alphabetical order fixed, as spotted by Bin.

[--SNIP--]
> diff --git a/package/jh71xx-tools/jh71xx-tools.mk b/package/jh71xx-tools/jh71xx-tools.mk
> new file mode 100644
> index 0000000000..b9f3974931
> --- /dev/null
> +++ b/package/jh71xx-tools/jh71xx-tools.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# jh71xx-tools
> +#
> +################################################################################
> +
> +JH71XX_TOOLS_VERSION = 7a29f4b9d2355aa39afa8680680909bb74e4991d
> +JH71XX_TOOLS_SITE = $(call github,kprasadvnsi,JH71xx-tools,$(JH71XX_TOOLS_VERSION))
> +JH71XX_TOOLS_LICENSE = MIT
> +JH71XX_TOOLS_LICENSE_FILES = jh7100-recover.c

Not sure why you choose to use the source file as license file, when
there is an actual LICENSE file in the tree. So I've switched to using
that.

Regards,
Yann E. MORIN.

> +define HOST_JH71XX_TOOLS_BUILD_CMDS
> +	$(HOSTCC) -o $(@D)/jh7100-recover $(@D)/jh7100-recover.c
> +endef
> +
> +define HOST_JH71XX_TOOLS_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/jh7100-recover $(HOST_DIR)/bin/jh7100-recover
> +endef
> +
> +$(eval $(host-generic-package))
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
