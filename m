From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Nov 2016 22:39:38 +0100
Subject: [Buildroot] [PATCH v1] Makefile: add missing targets to
 noconfig_targets and nobuild_targets
In-Reply-To: <1479207800-26263-1-git-send-email-Rahul.Jain@imgtec.com>
References: <1479207800-26263-1-git-send-email-Rahul.Jain@imgtec.com>
Message-ID: <7062674d-d99e-7a8e-e426-41a2b09b0223@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-11-16 12:03, Rahul Jain wrote:
> currently some buildroot targets fails (list-defconfigs,
> graph-build, etc), if there is an issue with configuration.
> For example, enabling uboot package without providing custom
> version name results in failing of various targets.
> 
> Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>

 You missed a few nobuild_targets: printvars, savedefconfig.

 With that:
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I did
grep '^[-a-zA-Z0-9_]*:' Makefile | cut -d : -f 1 | sort -u
and verified that everything mentioned there was handled appropriately.

 It might have been useful to also add %-extract and %-patch, but it turns out
that these may depend on other packages so better not.

 Regards,
 Arnout

> ---
>  Makefile | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index a860218..5c3d1c7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -86,7 +86,8 @@ export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlo
>  noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
>  	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
>  	randpackageconfig allyespackageconfig allnopackageconfig \
> -	print-version olddefconfig distclean
> +	print-version olddefconfig distclean manual manual-html manual-split-html \
> +	manual-pdf manual-text manual-epub
>  
>  # Some global targets do not trigger a build, but are used to collect
>  # metadata, or do various checks. When such targets are triggered,
> @@ -97,9 +98,11 @@ noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconf
>  # We're building in two situations: when MAKECMDGOALS is empty
>  # (default target is to build), or when MAKECMDGOALS contains
>  # something else than one of the nobuild_targets.
> -nobuild_targets := source source-check \
> -	legal-info external-deps _external-deps \
> -	clean distclean help
> +nobuild_targets := source %-source source-check \
> +	legal-info %-legal-info external-deps _external-deps \
> +	clean distclean help show-targets graph-depends \
> +	%-graph-depends %-show-depends %-show-version \
> +	graph-build graph-size list-defconfigs
>  ifeq ($(MAKECMDGOALS),)
>  BR_BUILDING = y
>  else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
