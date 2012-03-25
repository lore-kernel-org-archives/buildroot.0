From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Mar 2012 22:55:57 +0200
Subject: [Buildroot] [PATCH] ccache: allow dynamic selection of cache
	directory
In-Reply-To: <3be175a4efe814978ed4.1332514323@beantl019720>
References: <3be175a4efe814978ed4.1332514323@beantl019720>
Message-ID: <201203252255.58002.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 23 March 2012 15:52:03 Thomas De Schampheleire wrote:
[snip]
> ---
> Note: I'm not sure what to do with the recently added COMPILERCHECK. Should
> it remain hardcoded, or also use the wrapper script for uniformity?

 I would say: use the wrapper script.


>  ifeq ($(BR2_CCACHE),y)
> -CCACHE:=$(HOST_DIR)/usr/bin/ccache
> -CCACHE_CACHE_DIR=$(HOME)/.buildroot-ccache
> +CCACHE:=$(HOST_DIR)/usr/bin/ccache-wrapper
> +CCACHE_BIN:=$(HOST_DIR)/usr/bin/ccache
> +CCACHE_CACHE_DIR:=$(call qstrip,$(BR2_CCACHE_DIR))
> +export CCACHE_CACHE_DIR

 You could take the opportunity to fix up the whitespace here.  Also,
there is no need for the := (except maybe for the _DIR itself, I'm a
bit confused as how assignment interacts with export).

 I would also rename the variable to BUILDROOT_CCACHE_DIR to clearly
distinguish it from and relate it to the normal CCACHE_DIR.

> -# We directly hardcode configuration into the binary, as it is much
> +# We directly hardcode some configuration into the binary, as it is much
>  # easier to handle than passing an environment variable. Our
 This statement has become rather ridiculous, since after this patch we
do both: setting environment variables and fixing up the executable.
And it becomes completely wrong if COMPILERCHECK moves to the wrapper
as well.

>  # configuration is:
> -#  - the cache location
>  #  - the fact that ccache shouldn't use the compiler binary mtime to
> -#  - detect a change in the compiler, because in the context of
> -#  - Buildroot, that completely defeats the purpose of ccache. Of
> -#  - course, that leaves the user responsible for purging its cache
> -#  - when the compiler changes.
> +#    detect a change in the compiler, because in the context of
> +#    Buildroot, that completely defeats the purpose of ccache. Of
> +#    course, that leaves the user responsible for purging its cache
> +#    when the compiler changes.
>  define HOST_CCACHE_FIX_CCACHE_DIR
> -	sed -i 's,getenv("CCACHE_DIR"),"$(CCACHE_CACHE_DIR)",' $(@D)/ccache.c

 An alternative implementation would be to do the following here:
sed -i 's,getenv("CCACHE_DIR"),getenv("BUILDROOT_CCACHE_DIR"),' $(@D)/ccache.c

 I actually prefer moving everything to a wrapper script, though.
Patching source files is inherently more fragile.

>  	sed -i 's,getenv("CCACHE_COMPILERCHECK"),"none",' $(@D)/ccache.c
>  endef
>  
>  HOST_CCACHE_POST_CONFIGURE_HOOKS += \
>  	HOST_CCACHE_FIX_CCACHE_DIR
>  
> +define HOST_CCACHE_CREATE_WRAPPER
> +	echo "#!/bin/sh" > $(CCACHE)
> +	echo 'CCACHE_DIR=$$CCACHE_CACHE_DIR $(CCACHE_BIN) "$$@"' >> $(CCACHE)

 Small optimization: use exec, i.e.
echo 'CCACHE_DIR=$$CCACHE_CACHE_DIR exec $(CCACHE_BIN) "$$@"' >> $(CCACHE)

 I think it's cleaner to create the wrapper as a file in package/ccache
and install it to the host directory.  It can autodiscover the location
of the ccache bin like so:

CCACHE_BIN="$(dirname $0)/ccache"


> +	chmod +x $(CCACHE)
> +endef
> +
> +HOST_CCACHE_POST_INSTALL_HOOKS += \
> +	HOST_CCACHE_CREATE_WRAPPER
> +
>  $(eval $(call AUTOTARGETS))
>  $(eval $(call AUTOTARGETS,host))


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
