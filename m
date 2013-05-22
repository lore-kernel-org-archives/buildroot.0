From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 May 2013 08:08:22 +0200
Subject: [Buildroot] [PATCH 1/2] mxs-bootlets: add support for custom
 patches
In-Reply-To: <1368905110-23303-1-git-send-email-gustavo@zacarias.com.ar>
References: <1368905110-23303-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <519C60D6.5040207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/05/13 21:25, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   boot/mxs-bootlets/Config.in       | 9 +++++++++
>   boot/mxs-bootlets/mxs-bootlets.mk | 8 ++++++++
>   2 files changed, 17 insertions(+)
>
> diff --git a/boot/mxs-bootlets/Config.in b/boot/mxs-bootlets/Config.in
> index 2222ff6..9dc2d37 100644
> --- a/boot/mxs-bootlets/Config.in
> +++ b/boot/mxs-bootlets/Config.in
> @@ -37,6 +37,15 @@ config BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_VERSION
>
>   endif
>
> +config BR2_TARGET_MXS_BOOTLETS_CUSTOM_PATCH_DIR
> +	string "custom patch dir"
> +	help
> +	  If your board requires custom patches, add the path to the
> +	  directory containing the patches here. The patches must be
> +	  named mxs-bootlets-<something>.patch.
> +
> +	  Most users may leave this empty
> +

  Now that we have BR2_GLOBAL_PATCH_DIR, I would prefer to avoid adding 
config options like this... Admittedly, for bootloaders it is more likely 
that custom patches are needed than for any other package. But even so, 
the global patch dir is sufficient, it is quite useable, and it reduces 
complexity in the buildroot core.

  Regards,
  Arnout

>   choice
>   	prompt "Bootstream"
>   	help
> diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
> index f93ff81..6b18fcc 100644
> --- a/boot/mxs-bootlets/mxs-bootlets.mk
> +++ b/boot/mxs-bootlets/mxs-bootlets.mk
> @@ -4,6 +4,14 @@
>   #
>   #############################################################
>
> +ifneq ($(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_PATCH_DIR)),)
> +define MXS_BOOTLETS_APPLY_CUSTOM_PATCHES
> +	support/scripts/apply-patches.sh $(@D) $(BR2_TARGET_MXS_BOOTLETS_CUSTOM_PATCH_DIR) \
> +		mxs-bootlets-\*.patch
> +endef
> +MXS_BOOTLETS_POST_PATCH_HOOKS += MXS_BOOTLETS_APPLY_CUSTOM_PATCHES
> +endif
> +
>   ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL),y)
>   	MXS_BOOTLETS_TARBALL = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL))
>   	MXS_BOOTLETS_SITE = $(patsubst %/,%,$(dir $(MXS_BOOTLETS_TARBALL)))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
