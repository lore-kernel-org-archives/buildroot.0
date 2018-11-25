From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Nov 2018 18:57:42 +0100
Subject: [Buildroot] [PATCH next v6 10/10] package/pkg-kconfig: handle
 KCONFIG_DEPENDENCIES with per-package directories
In-Reply-To: <20181123145815.13008-11-thomas.petazzoni@bootlin.com>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-11-thomas.petazzoni@bootlin.com>
Message-ID: <20181125175742.GE28830@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-23 15:58 +0100, Thomas Petazzoni spake thusly:
> The pkg-kconfig infrastructure hijacks the regular chain of build
> steps to insert its own step to prepare the configuration of kconfig
> packages. This additional step may have dependencies of its own, such
> as host-flex, host-bison or toolchain.
> 
> In the context of per-package directory support, those dependencies
> must be copied to the per-package directory of the current package
> prior to doing the config preparation. This commit implements this
> logic by adding a call to prepare-per-package-directory at the right
> spot.
> 
> Reported-by: Andreas Naumann <anaumann@ultratronik.de>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-kconfig.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index d6c95b897e..bf43632adc 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -113,6 +113,7 @@ endef
>  # Since the file could be a defconfig file it needs to be expanded to a
>  # full .config first.
>  $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
> +	$$(call prepare-per-package-folder,$$($(2)_KCONFIG_DEPENDENCIES))
>  	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
>  		$$($(2)_KCONFIG_MAKE) $$($(2)_KCONFIG_DEFCONFIG), \
>  		$$(INSTALL) -m 0644 -D $$($(2)_KCONFIG_FILE) $$(@))
> -- 
> 2.19.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
