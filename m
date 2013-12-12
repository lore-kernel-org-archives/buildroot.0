From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Dec 2013 23:11:17 +0100
Subject: [Buildroot] [PATCH 1/2] pkg-generick.mk: support for multiple
 patch dirs
In-Reply-To: <1386784684-6546-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1386784684-6546-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <52AA3485.2050604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/12/13 18:58, Ryan Barnett wrote:
> Adding support for specifying multiple directories in
> BR2_GLOBAL_PATCH_DIR. This will allow for a layered approach for the
> patching of a package.

[snip]

> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 1fce71b..53d96c9 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -134,8 +134,11 @@ endif
>   # The RAWNAME variable is the lowercased package name, which allows to
>   # find the package directory (typically package/<pkgname>) and the
>   # prefix of the patches
> +#
> +# For BR2_GLOBAL_PATCH_DIR, only generate if it is defined
>   $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
> -$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(call qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)
> +$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS =  $($(PKG)_DIR_PREFIX)/$(RAWNAME)
> +$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS += $(if $(BR2_GLOBAL_PATCH_DIR),$(foreach pdir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),$(pdir)/$(RAWNAME)))

  I guess you meant to avoid the "overhead" of the foreach when 
BR2_GLOBAL_PATCH_DIR is empty? Unfortunately, the condition will always 
be true because it is "" when empty, and "" is non-empty... So you'd have 
to qstrip it first. But anyway, the overhead of foreach is nothing, so I 
think it's both more efficient and easier to read if the condition is 
removed.

  Minor detail: I would have used
$(addsuffix /$(RAWNAME),$(BR2_GLOBAL_PATCH_DIR))
but I guess that's a matter of taste.

  Regards,
  Arnout

>   $(BUILD_DIR)/%/.stamp_patched:
>   	@$(call step_start,patch)
>   	@$(call MESSAGE,"Patching")
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
