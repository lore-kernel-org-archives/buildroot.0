From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Thu, 06 Aug 2009 14:17:26 +0200
Subject: [Buildroot] [PATCH] directfb: allow to enable debug and
	trace	support
In-Reply-To: <1249554495-26364-1-git-send-email-s.neumann@raumfeld.com>
References: <1249554495-26364-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1249561046.16366.4.camel@couak.urd44.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le jeudi 06 ao?t 2009 ? 12:28 +0200, Sven Neumann a ?crit :
> This change adds two new options, BR2_PACKAGE_DIRECTFB_DEBUG
> to enable lots of debugging output from DirectFB and
> BR2_PACKAGE_DIRECTFB_TRACE to enable support for call traces
> in case of a crash.
> 
> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
> ---
>  package/directfb/Config.in   |   13 ++++++++++++-
>  package/directfb/directfb.mk |   15 +++++++++++++++
>  2 files changed, 27 insertions(+), 1 deletions(-)
> 
> diff --git a/package/directfb/Config.in b/package/directfb/Config.in
> index 4642ee0..e616314 100644
> --- a/package/directfb/Config.in
> +++ b/package/directfb/Config.in
> @@ -11,7 +11,18 @@ config BR2_PACKAGE_DIRECTFB_MULTI
>  	select BR2_PACKAGE_LINUX_FUSION
>  	help
>  	  Enable use of multiple concurrent DirectFB applications
> -	  http://www.directfb.org/
> +
> +config BR2_PACKAGE_DIRECTFB_DEBUG
> +	bool "directfb debugging"
> +	depends on BR2_PACKAGE_DIRECTFB
> +	help
> +	  Compile DirectFB with lots of debug output
> +
> +config BR2_PACKAGE_DIRECTFB_TRACE
> +	bool "directfb call trace support"
> +	depends on BR2_PACKAGE_DIRECTFB
> +	help
> +	  Enable call tracing for DirectFB applications
>  
>  config BR2_PACKAGE_DIRECTFB_XSERVER
>  	bool "build with X server backend"
> diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
> index 8456798..b3af0ed 100644
> --- a/package/directfb/directfb.mk
> +++ b/package/directfb/directfb.mk
> @@ -19,6 +19,19 @@ else
>  DIRECTFB_MULTI:=
>  DIRECTFB_FUSION:=
>  endif
> +
> +ifeq ($(BR2_PACKAGE_DIRECTFB_DEBUG),y)
> +DIRECTFB_DEBUG:=--enable-debug
> +else
> +DIRECTFB_DEBUG:=
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DIRECTFB_TRACE),y)
> +DIRECTFB_TRACE:=--enable-trace
> +else
> +DIRECTFB_TRACE:=
> +endif
> +
>  ifeq ($(BR2_PACKAGE_XSERVER),y)
>  DIRECTFB_X:=--enable-x11
>  else
> @@ -114,6 +127,8 @@ DIRECTFB_CONF_OPT = \
>  	--enable-shared \
>  	--disable-explicit-deps \
>  	$(DIRECTFB_MULTI) \
> +	$(DIRECTFB_DEBUG) \
> +	$(DIRECTFB_TRACE) \
>  	$(DIRECTFB_X) \
>  	$(DIRECTFB_JPEG) \
>  	$(DIRECTFB_PNG) \

Also proposed in https://bugs.busybox.net/show_bug.cgi?id=471

I'm using --enable-debug and --enable-debug-support instead of
--enable-debug only. Does it make sense ?


-- 
Lionel Landwerlin <lionel.landwerlin@openwide.fr>
