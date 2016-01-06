From: Sam Thursfield <sam.thursfield@codethink.co.uk>
Date: Wed, 6 Jan 2016 17:18:32 +0000
Subject: [Buildroot] [v5,
 2/5] Makefile: add HOST_FIX_RPATH_HOOK to TARGET_FINALIZE_HOOKS
In-Reply-To: <1436824511-1601-2-git-send-email-s.martin49@gmail.com>
References: <1436824511-1601-2-git-send-email-s.martin49@gmail.com>
Message-ID: <568D4C68.1000700@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/07/15 22:55, Samuel Martin wrote:
> This patch adds host-patchelf as a target-finalize dependency, and
> introduces the HOST_FIX_RPATH_HOOK hook fixing the ELF files' RPATH of
> the HOST_DIR location (excluding the sysroot).
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
> changes v4->v5:
> - add verbose support
>
> changes v3->v4:
> - add host-patchelf to PACKAGES instead of target-finalize (Baruch)
> - add comment
>
> changes v2->v3:
> - move hook in Makefile (Baruch)
> ---
>   Makefile | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 546bcd3..4b88116 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -555,6 +555,22 @@ endef
>   TARGET_FINALIZE_HOOKS += PURGE_LOCALES
>   endif
>
> +# RPATH fixing
> +# - The host hook sets RPATH in host ELF binaries, using relative paths to the
> +#   library locations.
> +PACKAGES += host-patchelf

This should be TARGETS, not PACKAGES.


-- 
Sam Thursfield, Codethink Ltd.
Office telephone: +44 161 236 5575
