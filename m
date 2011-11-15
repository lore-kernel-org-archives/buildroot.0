From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Nov 2011 22:43:45 +0000
Subject: [Buildroot] [PATCH 1 of 5 RFC] dependencies: check core
	dependencies before anything else
In-Reply-To: <268352ac0f111e4fdf72.1320911666@devws108>
References: <patchbomb.1320911665@devws108>
 <268352ac0f111e4fdf72.1320911666@devws108>
Message-ID: <201111152243.45470.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 10 November 2011 19:31:51 Thomas De Schampheleire wrote:
> Currently, the dependencies target (that runs dependencies.sh) depends on
> DEPENDENCIES_HOST_PREREQ. This means that the dependencies listed in
> DEPENDENCIES_HOST_PREREQ (currently host-sstrip if sstrip is selected) are
> built *before* the dependencies.sh script is run.
> 
> As a result, if e.g. there is no gcc compiler present on the build system,
> the dependencies in DEPENDENCIES_HOST_PREREQ will fail to build, and
> buildroot will fail non-gracefully.
> 
> This patch makes sure that the DEPENDENCIES_HOST_PREREQ are checked *after*
> the dependencies.sh script, so that any problem in the build system is
> reported in a clean way by dependencies.sh.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> 
> ---
>  toolchain/dependencies/dependencies.mk |  6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/dependencies/dependencies.mk
> b/toolchain/dependencies/dependencies.mk ---
> a/toolchain/dependencies/dependencies.mk
> +++ b/toolchain/dependencies/dependencies.mk
> @@ -16,12 +16,14 @@ DL_TOOLS = \
>  	$(findstring git,$(DL_TOOLS_DEPENDENCIES)) \
>  	$(findstring bzr,$(DL_TOOLS_DEPENDENCIES))
> 
> -dependencies: $(DEPENDENCIES_HOST_PREREQ)
> +core-dependencies:
>  	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
>  		CONFIG_FILE="$(CONFIG_DIR)/.config" \
>  		DL_TOOLS="$(DL_TOOLS)" \
>  		$(TOPDIR)/toolchain/dependencies/dependencies.sh
> 
> +dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
> +
>  dependencies-source:
> 
>  dependencies-clean:
> @@ -35,5 +37,5 @@ dependencies-dirclean:
>  # Toplevel Makefile options
>  #
>  #############################################################
> -.PHONY: dependencies
> +.PHONY: dependencies core-dependencies
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
