From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jul 2017 01:31:21 +0200
Subject: [Buildroot] [PATCH v7 3/9] core: sanitize RPATH in staging tree
 at the end of target finalization
In-Reply-To: <1499273594-12106-4-git-send-email-wg@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-4-git-send-email-wg@grandegger.com>
Message-ID: <1de12c00-3be6-7aed-3ddf-eccd0be0edb4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-17 18:53, Wolfgang Grandegger wrote:
> We need that pachelf utility for RPATH sanitization.
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index a22e87f..cdc3a64 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -456,6 +456,9 @@ else
>  export BR_NO_CCACHE
>  endif
>  
> +# We need patchelf for RPATH sanitization
> +PACKAGES += host-patchelf

 This really should be a separate patch. Also, I would do it differently.
Instead of adding it explicitly to PACKAGES, add a Config.in.host for patchelf,
with a hidden symbol BR2_PACKAGE_HOST_PATCHELF, and default it to y. We want to
create Config.in.host files with hidden symbols for all host packages, so doing
it that way is already a step in the right direction.


> +
>  # Scripts in support/ or post-build scripts may need to reference
>  # these locations, so export them so it is easier to use
>  export BR2_CONFIG
> @@ -720,6 +723,9 @@ endif
>  		$(call MESSAGE,"Executing post-build script $(s)"); \
>  		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
>  
> +	@$(call MESSAGE,"Sanitizing RPATH in staging tree")
> +	$(TOPDIR)/support/scripts/fix-rpath staging

 I don't think we should do this in target-finalize. But I'll discuss this in
patch 5.


 Regards,
 Arnout

> +
>  .PHONY: target-post-image
>  target-post-image: $(TARGETS_ROOTFS) target-finalize
>  	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
