From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Apr 2015 00:31:38 +0200
Subject: [Buildroot] [PATCHv2 21/21] Makefile: remove unneeded variables
In-Reply-To: <1428856685-4403-22-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-22-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <552D954A.8070504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/15 18:38, Thomas Petazzoni wrote:
> Now that all the external-deps, source-check and source targets are
> properly implemented based on the package infrastructure, the
> PACKAGES_SOURCE, TARGET_HOST_DEPS, HOST_DEPS and HOST_SOURCE variables
> are no longer needed. This is a good thing since they were anyway
> incorrect, as they were only doing a two level recursion in the
> dependencies of host packages.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

with 'make source' (actually together with the next patch).

 Regards,
 Arnout

> ---
>  Makefile | 21 ---------------------
>  1 file changed, 21 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 06a9f05..a598063 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -389,27 +389,6 @@ include fs/common.mk
>  
>  include $(BR2_EXTERNAL)/external.mk
>  
> -PACKAGES_SOURCE := $(patsubst %,%-source,$(PACKAGES))
> -
> -# host-* dependencies have to be handled specially, as those aren't
> -# visible in Kconfig and hence not added to a variable like PACKAGES.
> -# instead, find all the host-* targets listed in each <PKG>_DEPENDENCIES
> -# variable for each enabled target.
> -# Notice: this only works for newstyle gentargets/autotargets packages
> -TARGETS_HOST_DEPS = $(sort $(filter host-%,$(foreach dep,\
> -		$(addsuffix _DEPENDENCIES,\
> -			$(call UPPERCASE,$(PACKAGES) $(TARGETS_ROOTFS))),\
> -		$($(dep)))))
> -# Host packages can in turn have their own dependencies. Likewise find
> -# all the package names listed in the HOST_<PKG>_DEPENDENCIES for each
> -# host package found above. Ideally this should be done recursively until
> -# no more packages are found, but that's hard to do in make, so limit to
> -# 1 level for now.
> -HOST_DEPS = $(sort $(foreach dep,\
> -		$(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS_HOST_DEPS))),\
> -		$($(dep))))
> -HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
> -
>  dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
>  	$(HOST_DIR) $(BINARIES_DIR)
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
