From: Michael Walle <michael@walle.cc>
Date: Thu, 14 Jan 2021 23:11:02 +0100
Subject: [Buildroot] [PATCH] uboot: fix binman with a new dependency
In-Reply-To: <20210112091806.906954-1-francois.perrad@gadz.org>
References: <20210112091806.906954-1-francois.perrad@gadz.org>
Message-ID: <d7be54607e5dc1b892211dfe1970b1cf@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

Am 2021-01-12 10:18, schrieb Francois Perrad:
> since 2021.01, tools/binman is broken.
> tools/binman/control.py imports pkg_resources
> the module pkg_resources is supplied by setuptools,
> so this new dependency is required.
> 
> binman is used only for building SPL

is it? AFAIK binman is just for generating images and can as
well be used without SPL. There is also a CONFIG_BINMAN.
I don't know if we could check the u-boot config for that.
Otherwise, I guess we'd need yet another "u-boot uses binman"
config option. I don't think checking of SPL is enough.

-michael

> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  boot/uboot/uboot.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index d2b4e8dc6..a3d949a55 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -167,8 +167,14 @@ endif
> 
>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON2),y)
>  UBOOT_DEPENDENCIES += host-python
> +ifeq ($(BR2_TARGET_UBOOT_SPL),y)
> +UBOOT_DEPENDENCIES += host-python-setuptools
> +endif
>  else ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
>  UBOOT_DEPENDENCIES += host-python3
> +ifeq ($(BR2_TARGET_UBOOT_SPL),y)
> +UBOOT_DEPENDENCIES += host-python3-setuptools
> +endif
>  endif
> 
>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
