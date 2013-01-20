From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Jan 2013 14:56:14 +0100
Subject: [Buildroot] [PATCH 3/6] toolchain/crosstool-ng: sprinkle with
 some calls to MESSAGE
In-Reply-To: <f69a7b3d3f92b370d81f7f99e03771eebdb7c134.1358379198.git.yann.morin.1998@free.fr>
References: <cover.1358379198.git.yann.morin.1998@free.fr>
 <f69a7b3d3f92b370d81f7f99e03771eebdb7c134.1358379198.git.yann.morin.1998@free.fr>
Message-ID: <50FBF77E.3040106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/17/13 00:41, Yann E. MORIN wrote:
> Thus, the failing step can be easily extracted by autobuilders,
> to ease with post-mortem analysis.
>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


> ---
>   toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> index c09f732..be14e08 100644
> --- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> +++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> @@ -68,9 +68,9 @@ $(STAMP_DIR)/ct-ng-toolchain-installed: $(STAMP_DIR)/ct-ng-toolchain-built
>   	$(Q)mkdir -p $(TARGET_DIR)/lib
>   	$(Q)CTNG_TUPLE="$$( $(call ctng,show-tuple 2>&1) )";                \
>   	    CTNG_SYSROOT="$(HOST_DIR)/usr/$${CTNG_TUPLE}/sysroot";          \
> +	    $(call MESSAGE,"Copy external toolchain libraries to target..."); \

  You could correct this to "Copying".

>   	    echo "CTNG_TUPLE='$${CTNG_TUPLE}'";                             \
>   	    echo "CTNG_SYSROOT='$${CTNG_SYSROOT}'";                         \

  What are these two echoes doing there? git blame points to you, Yann...

> -	    echo "Copy external toolchain libraries to target...";          \
>   	    for libs in $(CTNG_LIBS_LIB); do                                \
>   	        $(call copy_toolchain_lib_root,$${CTNG_SYSROOT},,lib,$$libs,/lib); \
>   	    done;                                                           \
> @@ -85,6 +85,7 @@ $(STAMP_DIR)/ct-ng-toolchain-installed: $(STAMP_DIR)/ct-ng-toolchain-built
>   #       depending on the selected C library. Those deps are added later
>
>   $(STAMP_DIR)/ct-ng-toolchain-built: $(CTNG_DIR)/.config
> +	$(Q)$(call MESSAGE,"Building the toolchain")

  Just to make things crystal clear when it appears in autobuilder results:

"Building the crosstool-ng toolchain"


  Regards,
  Arnout

>   	$(Q)$(call ctng,build.$(PARALLEL_JOBS))
>   	$(Q)printf "\n"
>   	$(Q)touch $@


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
