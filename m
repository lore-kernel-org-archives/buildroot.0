From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Aug 2015 19:11:32 +0200
Subject: [Buildroot] [PATCH] fs/common: add <fs>_POST_GEN_HOOKS support
In-Reply-To: <1438331000-26534-1-git-send-email-nrubinstein@aldebaran.com>
References: <1438331000-26534-1-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <20150810171132.GF3676@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No?, All,

On 2015-07-31 10:23 +0200, No? Rubinstein spake thusly:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> The common filesystem infrastructure already supports a
> <fs>_PRE_GEN_HOOKS variable, which allows filesystem makefiles to
> register some actions to be done before the root filesystem image is
> generated.
> 
> This commit adds a similiar <fs>_POST_GEN_HOOKS variable, which will
> allow filesystem makefiles to do some actions after the filesystem
> image has been generated. It will initially be used by the iso9660
> filesystem to delete the temporary directory it creates.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Since this patch was marked as "Changes Requested" in Patchwork, it no
longer shows up. I'll mark it as New again, so it can get picked up to
be applied.

Regards,
Yann E. MORIN.

> ---
> Re-sending this patch to fix hybrid ISO generation as added by patch 
> 5bac06e8810eb86e7bddc771fda68f0c59a3c3fa.
> 
>  fs/common.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index ad1bcf3..528e194 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -16,6 +16,9 @@
>  #  ROOTFS_$(FSTYPE)_PRE_GEN_HOOKS, a list of hooks to call before
>  #  generating the filesystem image
>  #
> +#  ROOTFS_$(FSTYPE)_POST_GEN_HOOKS, a list of hooks to call after
> +#  generating the filesystem image
> +#
>  #  ROOTFS_$(FSTYPE)_POST_TARGETS, the list of targets that should be
>  #  run after running the main filesystem target. This is useful for
>  #  initramfs, to rebuild the kernel once the initramfs is generated.
> @@ -96,6 +99,7 @@ endif
>  ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
>  	PATH=$$(BR_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
>  endif
> +	$$(foreach hook,$$(ROOTFS_$(2)_POST_GEN_HOOKS),$$(call $$(hook))$$(sep))
>  
>  rootfs-$(1)-show-depends:
>  	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
