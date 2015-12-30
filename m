From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Dec 2015 00:27:53 +0100
Subject: [Buildroot] [PATCH 10/84 RFC] package/angularjs: simplify
 modules selection
In-Reply-To: <ff46e42197b59eabccfd4c74e92c671e0e9f9e1e.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <ff46e42197b59eabccfd4c74e92c671e0e9f9e1e.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <56846879.90902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-12-15 22:24, Yann E. MORIN wrote:
> Remove the superfluous config option, and make all modules default to
> 'y', which provides exactly the same functionality.
> 
> simplify (and slightly beautofy) the handling of modules in the .mk:
> since the modules' symbols are always meaningful now, we can get rid of
> the else-clause, and always build the list of modules using the Kconfig
> options.
> 
> Re-order the list alphabetically (message <-> message-format).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/angularjs/Config.in    | 35 +++++++++++++++++++++--------------
>  package/angularjs/angularjs.mk | 24 +++++++++++++++---------
>  2 files changed, 36 insertions(+), 23 deletions(-)
> 
> diff --git a/package/angularjs/Config.in b/package/angularjs/Config.in
> index 206b3d8..ee1dbbf 100644
> --- a/package/angularjs/Config.in
> +++ b/package/angularjs/Config.in
> @@ -7,16 +7,17 @@ menuconfig BR2_PACKAGE_ANGULARJS
>  
>  if BR2_PACKAGE_ANGULARJS
>  
> -config BR2_ANGULARJS_MODULES
> -	bool "angularjs modules"
> -	help
> -	  Select which modules to install. If disabled, all modules
> -	  will be installed.
> +# All the modules default to 'y' to keep backward-compatibility

 I don't think this comment is needed, because it will no longer be true in the
future.

> +# Keep this list in sync and in the same (alphabetical) order as # the
> +# one in angularjs.mk. However, always keep 'angular' first in the list.

 I don't think this comment is needed either. We don't have something like that
at the top of package/Config.in for instance. And it's not that things stop to
work if it's not alphabetical.

>  
> -if BR2_ANGULARJS_MODULES
> +config BR2_ANGULARJS_MODULE_ANGULAR
> +	bool
> +	default y

 I don't like this part either, see below.

[snip]

> diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
> index 60dbdb6..20a129d 100644
> --- a/package/angularjs/angularjs.mk
> +++ b/package/angularjs/angularjs.mk
> @@ -17,18 +17,24 @@ define ANGULARJS_EXTRACT_CMDS
>  	rmdir $(@D)/angular-$(ANGULARJS_VERSION)
>  endef
>  
> -ANGULARJS_FILES = angular

 I prefered it like this, with the angular bit always there and the rest added
by Kconfig options. Simpler than adding a dummy Kconfig option for angular itself.

 Regards,
 Arnout

> +# This list mirrors the list of available modules from Config.in.
> +# Keep this list in sync and in the same (alphabetical) order as the
> +# one in Config.in. However, always keep 'angular' first in the list.
> +ANGULARJS_MODULES = \
> +	angular \
> +	animate \
> +	aria \
> +	cookies \
> +	messages \
> +	message-format \
> +	resource \
> +	route \
> +	sanitize \
> +	touch
>  
> -ANGULARJS_MODULES = animate aria cookies message-format messages resource \
> -	route sanitize touch
> -
> -ifeq ($(BR2_ANGULARJS_MODULES),y)
> -ANGULARJS_FILES += $(foreach mod,$(ANGULARJS_MODULES),\
> +ANGULARJS_FILES = $(foreach mod,$(ANGULARJS_MODULES),\
>  			$(if $(BR2_ANGULARJS_MODULE_$(call UPPERCASE,$(mod))),\
>  				angular-$(mod)))
> -else
> -ANGULARJS_FILES += $(foreach mod,$(ANGULARJS_MODULES),angular-$(mod))
> -endif
>  
>  define ANGULARJS_INSTALL_TARGET_CMDS
>  	$(foreach f,$(ANGULARJS_FILES),\
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
