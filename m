From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 6 Jun 2017 21:38:07 +0300
Subject: [Buildroot] [PATCH] package/tslib: enable statically linked
 building
In-Reply-To: <20170606160008.20503-1-martin.kepplinger@ginzinger.com>
References: <20170606160008.20503-1-martin.kepplinger@ginzinger.com>
Message-ID: <20170606183807.iybbhjhcjqdu7vak@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Martin,

On Tue, Jun 06, 2017 at 06:00:08PM +0200, Martin Kepplinger wrote:
> From: Martin Kepplinger <martink@posteo.de>
> 
> tslib can be configured to be built statically linked. So let's add this option.

Packages that select BR2_PACKAGE_TSLIB might now support static build as well.

baruch

> tslib is quite configurable and each module can be selected to be built into
> the static build. This configuration includes the hardware independent filter
> modules (obviously), and the Linux evdev input module.
> 
> This results in a configuration that fully supports multitouch in any
> combination.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
> ---
> 
> so strictly speaking this is a first idea of what static config to offer.
> It is an upgrade in any case, so almost any configuration should be safe to
> do now; but tslib includes old userspace driver modules that aren't really
> encouraged to use (evdev kernel drivers is the way to go) and they are not
> included in the build here.
> 
> 
>  package/tslib/Config.in |  4 ----
>  package/tslib/tslib.mk  | 12 ++++++++++++
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/package/tslib/Config.in b/package/tslib/Config.in
> index f1de56c12..a2e1e7ff7 100644
> --- a/package/tslib/Config.in
> +++ b/package/tslib/Config.in
> @@ -1,10 +1,6 @@
>  config BR2_PACKAGE_TSLIB
>  	bool "tslib"
> -	depends on !BR2_STATIC_LIBS # dlopen
>  	help
>  	  Tslib is a filtering layer for touchscreen panel events.
>  
>  	  http://tslib.org
> -
> -comment "tslib needs a toolchain w/ dynamic library"
> -	depends on BR2_STATIC_LIBS
> diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
> index 87eb5b734..a4e045a32 100644
> --- a/package/tslib/tslib.mk
> +++ b/package/tslib/tslib.mk
> @@ -17,4 +17,16 @@ ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6),)
>  TSLIB_CONF_OPTS += --disable-tools
>  endif
>  
> +ifeq ($(BR2_STATIC_LIBS),y)
> +TSLIB_CONF_OPTS += --disable-shared --enable-static \
> +		   --enable-input=static \
> +		   --enable-linear=static \
> +		   --enable-median=static \
> +		   --enable-pthres=static \
> +		   --enable-iir=static \
> +		   --enable-dejitter=static \
> +		   --enable-debounce=static \
> +		   --enable-skip=static
> +endif
> +
>  $(eval $(autotools-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
