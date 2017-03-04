From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 4 Mar 2017 12:50:42 +0100
Subject: [Buildroot] [RFC PATCH 3/9] core: sanitize HOST_DIR at the very
 end of the build
In-Reply-To: <1488550733-3956-4-git-send-email-wg@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
 <1488550733-3956-4-git-send-email-wg@grandegger.com>
Message-ID: <f750a98f-06db-9fe8-0b70-c8b99f95710b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-03-17 15:18, Wolfgang Grandegger wrote:
> From: Samuel Martin <s.martin49@gmail.com>
> 
> This patch adds host-patchelf to the list of package to build, and use
                                               packages              uses

> it in the SANITIZE_RPATH_HOST helper.
> 
> This SANITIZE_RPATH_HOST helper is executed in the world target, which
> ensure:
> - to be built after the target-post-image target (because of the
>   dependency);
> - to always be built since it is the only dependency of the all (and
>   default) target.

 I don't think it makes sense to put this in a separate SANITIZE_RPATH_HOST
variable; just put it directly in the rule.

 Also, I think it fits better as part of the target-post-image rule itself. I
like it that world is a dependency-only target, it feels cleaner :-) But that's
just bikeshedding of course.

> 
> The SANITIZE_RPATH_HOST helper calls patchelf to fix the ELF files'
> RPATH from the HOST_DIR location (excluding the sysroot).
> 
> After running this helper is run, the RPATH from any host ELF files is
> relative to the binary location itself.
> 
> Notes:
> - we avoid to fix RPATH in the sysroot.
> - we do not try to fix RPATH in the external toolchain installation
>   location as they may have been built in a way, this is already
                                                   that

>   correct; furthermore, attempting to fix RPATH in those programs may
>   result in breaking them.
> - the whole host directory is processed because a number of
>   host-package install programs that could be useful in places
>   different from $(HOST_DIR)/{bin,sbin,usr/bin,usr/sbin}.
> - the shared libraries are also processed in case they have a 'main'
>   function.

 And shared libraries can have their own RPATH, no?

> 
> As a step toward a fully relocatable SDK, this change allows to get the
> toolchain relocatable, but not yet the whole SDK.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 Wolfgang, you forgot to add your Sob.

 Regards,
 Arnout

> ---
>  Makefile | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 0308f9b..54c815b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -543,7 +543,19 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
>  
>  prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>  
> +# RPATH fixing
> +# - The host hook sets RPATH in host ELF binaries, using relative paths to the
> +#   library locations.
> +PACKAGES += host-patchelf
> +
> +define SANITIZE_RPATH_HOST
> +	PATCHELF=$(HOST_DIR)/usr/bin/patchelf \
> +	$(TOPDIR)/support/scripts/fix-rpath host $(HOST_DIR)
> +endef
> +
>  world: target-post-image
> +	@$(call MESSAGE,"Rendering the SDK relocatable")
> +	$(SANITIZE_RPATH_HOST)
>  
>  .PHONY: all world toolchain dirs clean distclean source outputmakefile \
>  	legal-info legal-info-prepare legal-info-clean printvars help \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
