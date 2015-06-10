From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Jun 2015 23:45:16 +0200
Subject: [Buildroot] [PATCH] directfb: add an option for debugging
	support
In-Reply-To: <1433882623-15782-1-git-send-email-cedric.marie@openmailbox.org>
References: <1433882623-15782-1-git-send-email-cedric.marie@openmailbox.org>
Message-ID: <5578AFEC.4020107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/09/15 22:43, C?dric Marie wrote:
> DirectFB debugging support is enabled by default. This new option makes
> it possible to disable it (--disable-debug-support) and build the
> library with no debug feature at all.
> 
> NB: When debugging support is disabled, the target installation path is
> suffixed with -pure.
> 
> Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>
> ---
>  package/directfb/Config.in   | 7 +++++++
>  package/directfb/directfb.mk | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/directfb/Config.in b/package/directfb/Config.in
> index 7759f8f..0015c0c 100644
> --- a/package/directfb/Config.in
> +++ b/package/directfb/Config.in
> @@ -20,8 +20,15 @@ config BR2_PACKAGE_DIRECTFB_MULTI
>  comment "directfb multi application needs a Linux kernel to be built"
>  	depends on !BR2_LINUX_KERNEL
>  
> +config BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT
> +	bool "directfb debugging support"
> +	default y
> +	help
> +	  Compile DirectFB with debugging support

 I think the explanation you gave in your first mail would be valuable here.
Certainly, the fact that the target installation path is suffixed with -pure
should be clarified.

 Do all the packages that depend on directfb still build correctly with this
-pure suffix?

 Regards,
 Arnout

> +
>  config BR2_PACKAGE_DIRECTFB_DEBUG
>  	bool "directfb debugging"
> +	depends on BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT
>  	help
>  	  Compile DirectFB with lots of debug output
>  
> diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
> index e3dc506..cf0609c 100644
> --- a/package/directfb/directfb.mk
> +++ b/package/directfb/directfb.mk
> @@ -39,9 +39,13 @@ DIRECTFB_CONF_OPTS += --enable-multi --enable-fusion
>  DIRECTFB_DEPENDENCIES += linux-fusion
>  endif
>  
> +ifeq ($(BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT),y)
>  ifeq ($(BR2_PACKAGE_DIRECTFB_DEBUG),y)
>  DIRECTFB_CONF_OPTS += --enable-debug
>  endif
> +else
> +DIRECTFB_CONF_OPTS += --disable-debug-support
> +endif
>  
>  ifeq ($(BR2_PACKAGE_DIRECTFB_TRACE),y)
>  DIRECTFB_CONF_OPTS += --enable-trace
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
