From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Jun 2015 00:10:27 +0200
Subject: [Buildroot] [PATCH] directfb: add an option for debugging
	support
In-Reply-To: <1434398565-3061-1-git-send-email-cedric.marie@openmailbox.org>
References: <1434398565-3061-1-git-send-email-cedric.marie@openmailbox.org>
Message-ID: <5581F053.7050008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/15/15 22:02, C?dric Marie wrote:
> DirectFB provides two options for debug:
> * --enable-debug-support (default is yes)
> * --enable-debug (default is no)
> The first one provides the functions to print debug information. These
> functions can be called inside DirectFB, or by an external DirectFB
> driver in another package.
> The second one enables verbose mode in DirectFB, using these functions.
> 
> Buildroot currently provides an option for the second one only. The
> first one - which is necessary for the second one - is always enabled,
> because this is the default value.
> 
> The new option (BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT) makes it possible
> to disable debugging support (--disable-debug-support) in order to
> build the library with no debug feature at all.
> 
> When debugging support is disabled, the target installation path of
> drivers (/usr/lib/directfb-<version>) is suffixed with -pure. The
> public library (/usr/lib/libdirectfb.so) remains unchanged.
> 
> Some external DirectFB drivers will install into
> /usr/lib/directfb-<version>-pure in release mode. For that reason, it
> is important that DirectFB can be configured to use this directory.
> 
> Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 In the future, please give your patches a version number (using git
format-patch -v2 or --subject-prefix='PATCH v2') and include a changelog in the
commit message, e.g.:

---
v2: add explicit --disable-debug-support (Arnout)


The lines below --- will be automatically stripped from the commit message when
it is applied.

 Regards,
 Arnout

> ---
>  package/directfb/Config.in   | 14 ++++++++++++++
>  package/directfb/directfb.mk |  5 +++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/package/directfb/Config.in b/package/directfb/Config.in
> index 7759f8f..2b0d5c7 100644
> --- a/package/directfb/Config.in
> +++ b/package/directfb/Config.in
> @@ -20,8 +20,22 @@ config BR2_PACKAGE_DIRECTFB_MULTI
>  comment "directfb multi application needs a Linux kernel to be built"
>  	depends on !BR2_LINUX_KERNEL
>  
> +config BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT
> +	bool "directfb debugging support"
> +	default y
> +	help
> +	  Compile DirectFB with debugging support. It provides
> +	  functions to print debug information, for DirectFB as well as
> +	  external DirectFB drivers.
> +
> +	  When disabled, DirectFB does not print any debug information.
> +	  The drivers will be installed to and loaded from
> +	  /usr/lib/directfb-<version>-pure instead of
> +	  /usr/lib/directfb-<version>.
> +
>  config BR2_PACKAGE_DIRECTFB_DEBUG
>  	bool "directfb debugging"
> +	depends on BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT
>  	help
>  	  Compile DirectFB with lots of debug output
>  
> diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
> index e3dc506..ad1dd18 100644
> --- a/package/directfb/directfb.mk
> +++ b/package/directfb/directfb.mk
> @@ -39,9 +39,14 @@ DIRECTFB_CONF_OPTS += --enable-multi --enable-fusion
>  DIRECTFB_DEPENDENCIES += linux-fusion
>  endif
>  
> +ifeq ($(BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT),y)
> +DIRECTFB_CONF_OPTS += --enable-debug-support
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
