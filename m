From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jul 2015 11:32:21 +0300
Subject: [Buildroot] [PATCH v2 2/4] package/patchelf: add
 HOST_FIX_RPATH_HOOK to TARGET_FINALIZE_HOOKS
In-Reply-To: <1436775527-2484-3-git-send-email-s.martin49@gmail.com>
References: <1436775527-2484-1-git-send-email-s.martin49@gmail.com>
 <1436775527-2484-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20150713083221.GI2451@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Mon, Jul 13, 2015 at 10:18:45AM +0200, Samuel Martin wrote:
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
> ---
>  package/patchelf/patchelf.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

I think that top level Makefile is a more appropriate place for this. The same 
goes for patch #3 in this series.

baruch

> diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
> index 043224d..c831fcd 100644
> --- a/package/patchelf/patchelf.mk
> +++ b/package/patchelf/patchelf.mk
> @@ -10,3 +10,15 @@ PATCHELF_LICENSE = GPLv3+
>  PATCHELF_LICENSE_FILES = COPYING
>  
>  $(eval $(host-autotools-package))
> +
> +target-finalize: host-patchelf
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

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
