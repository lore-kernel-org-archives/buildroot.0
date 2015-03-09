From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 9 Mar 2015 06:46:28 +0200
Subject: [Buildroot] [PATCH 1/3] Added new package 'mc' (Midnight
 Commander).
In-Reply-To: <1425850629-14725-1-git-send-email-mc5686@mclink.it>
References: <1425850629-14725-1-git-send-email-mc5686@mclink.it>
Message-ID: <20150309044627.GF2518@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mauro,

On Sun, Mar 08, 2015 at 10:37:07PM +0100, Mauro Condarelli wrote:
> 
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in    |    1 +
>  package/mc/Config.in |   10 ++++++++++
>  package/mc/mc.mk     |   27 +++++++++++++++++++++++++++

A .hash file would be nice.

[...]

> diff --git a/package/mc/mc.mk b/package/mc/mc.mk
> new file mode 100644
> index 0000000..678e1f7
> --- /dev/null
> +++ b/package/mc/mc.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# mc
> +#
> +################################################################################
> +
> +MC_VERSION_MAJOR = 4.8
> +MC_VERSION = $(MC_VERSION_MAJOR).13

No need to split the major version part if it is not used on its own.

> +MC_SOURCE = mc-$(MC_VERSION).tar.bz2
> +MC_SITE = http://ftp.midnight-commander.org
> +MC_INSTALL_STAGING = YES

Why is this needed?

> +MC_INSTALL_TARGET = YES

This is the default, please remove.

> +MC_CONF_OPTS = --disable-shared

This options is automatically handled by the autotools infrastructure. If this 
package does not support static build it should depend on !BR2_STATIC_LIBS.

> +MC_DEPENDENCIES = libglib2 host-pkgconf
> +
> +# mc prefers slang, so use that if enabled, otherwise
> +# fallback to using ncurses.
> +# Either or both will be enabled, but we prefer slang.
> +ifeq ($(BR2_PACKAGE_SLANG),y)
> +MC_DEPENDENCIES += slang
> +MC_CONF_OPTS += --with-screen=slang
> +else
> +MC_DEPENDENCIES += ncurses
> +MC_CONF_OPTS += --with-screen=ncurses
> +endif
> +
> +$(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
