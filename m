From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jul 2015 13:28:21 +0300
Subject: [Buildroot] [PATCH v3 2/4] Makefile: add HOST_FIX_RPATH_HOOK to
 TARGET_FINALIZE_HOOKS
In-Reply-To: <1436782677-12557-2-git-send-email-s.martin49@gmail.com>
References: <1436782677-12557-1-git-send-email-s.martin49@gmail.com>
 <1436782677-12557-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20150713102821.GN2451@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Mon, Jul 13, 2015 at 12:17:55PM +0200, Samuel Martin wrote:
> This patch adds host-patchelf as a target-finalize dependency, and
> introduces the HOST_FIX_RPATH_HOOK hook fixing the ELF files' RPATH of
> the host tree (excluding the sysroot).
> 
> After running this hook, the RPATH from any host ELF files is relative to
> the binary location itself.
> 
> Note that, we avoid to fix RPATH in the sysroot, and in the external
> toolcahin installation location.
> 
> As a first step toward a fully relocatable SDK, this change allows to get
> the toolchain relocatable, but not yet the whole SDK.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v2->v3:
> - move hook in Makefile (Baruch)
> ---
>  Makefile | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index daf692e..ac387ea 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -544,6 +544,18 @@ endif
>  
>  $(TARGETS_ROOTFS): target-finalize
>  
> +target-finalize: host-patchelf

Instead of duplicating the target-finalize target, why not add host-patchelf 
to $(PACKAGES) like we already do for host-localedef?

> +
> +define HOST_FIX_RPATH_HOOK
> +	$(TOPDIR)/support/scripts/fix_rpaths \
> +		set $(HOST_DIR) \
> +		--patchelf-program $(HOST_DIR)/usr/bin/patchelf \
> +		--libdirs $(HOST_DIR)/usr/lib \
> +		--exclude-dirs sysroot opt/ext-toolchain
> +endef
> +
> +TARGET_FINALIZE_HOOKS += HOST_FIX_RPATH_HOOK
> +
>  target-finalize: $(PACKAGES)
>  	@$(call MESSAGE,"Finalizing target directory")
>  	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
