From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 22 Jul 2017 14:34:02 +0200
Subject: [Buildroot] [PATCH 03/20] package/skeleton: add macro to rsync
 skeleton directory
In-Reply-To: <05879dad2f97f99ddce2b01753aae0e3111f4a43.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <05879dad2f97f99ddce2b01753aae0e3111f4a43.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <8452eb57-948f-9a36-ab28-a41b3a01d9cf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 19:25, Yann E. MORIN wrote:
> The rsync command is currently called from a single location. In
> follow-up patches, it will be called from various places then.
> 
> It will be easier to update and fix this command if it is defined in a
> single location, rather than if duplicated in many places.
> 
> Define a macro that skeleton packages can call to install their skeleton
> directories. Since at least one occurence of it will want to install in
> staging, the macro must accept a destination path, rather than hard-code
> target as the destination.
> 
> Since it is to be used by other skeleton packages, define it early,
> outside of any conditional block.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/skeleton/skeleton.mk | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index 9b7407a236..017479a990 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -14,6 +14,18 @@ SKELETON_ADD_SKELETON_DEPENDENCY = NO
>  # The skeleton also handles the merged /usr case in the sysroot
>  SKELETON_INSTALL_STAGING = YES
>  
> +############
> +# Macros available for use by any skeleton package:
> +# - SKELETON_RSYNC
> +
> +# This function rsyncs the skeleton directory in $(1) to the destination
> +# in $(2), which should be either $(TARTGET_DIR) or $(STAGING_DIR)
> +define SKELETON_RSYNC
> +	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
> +		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
> +		$(1)/ $(2)/
> +endef

 Another thing I hate is make functions - they're difficult to understand. So
instead, I'd just define

SKELETON_RSYNC_ARGS = -a --ignore-times ...

 Adding the / after $(1) and $(2) is the only reason to claim this should be a
macro, but really I don't think that that's enough.


 The above is bikeshedding though, so feel free to commit the current solution.

 Regards,
 Arnout

> +
>  ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
>  
>  SKELETON_PATH = $(call qstrip,$(BR2_ROOTFS_SKELETON_CUSTOM_PATH))
> @@ -89,9 +101,7 @@ SKELETON_LIB_SYMLINK = lib32
>  endif
>  
>  define SKELETON_INSTALL_TARGET_CMDS
> -	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
> -		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
> -		$(SKELETON_PATH)/ $(TARGET_DIR)/
> +	$(call SKELETON_RSYNC,$(SKELETON_PATH),$(TARGET_DIR))
>  	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
>  	ln -snf lib $(TARGET_DIR)/$(SKELETON_LIB_SYMLINK)
>  	ln -snf lib $(TARGET_DIR)/usr/$(SKELETON_LIB_SYMLINK)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
