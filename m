From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Nov 2016 10:34:19 +0100
Subject: [Buildroot] [PATCH v2] fs/ext2: fix double quoted label
In-Reply-To: <20161116230012.28080-1-gael.portay@savoirfairelinux.com>
References: <20161116230012.28080-1-gael.portay@savoirfairelinux.com>
Message-ID: <20161120093419.GA3659@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ga?l, All,

On 2016-11-16 18:00 -0500, Ga?l PORTAY spake thusly:
> Since the commit 6dd7bbb59134799ed3d7343f238b3b02592faebf, the label does
> not need anymore to be quoted. Even worse it *must* not be simple-quoted,
> unless the label will contain the double-quotes from the config variable
> BR2_TARGET_ROOTFS_EXT2_LABEL.
> 
> The commit mentionned above has replaced echo by printf:
> -	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
> +	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
> 
> Since this commit the rootfs label contains extra double-quotes.
> $ blkid
> /dev/mmcblk0: LABEL=""BR 2016.08"" UUID="xxx"
>                      ^          ^
> 
> With this fix, the extra double-quotes have disappeared:
> /dev/mmcblk0: LABEL="BR 2016.11-rc2" UUID="yyy"

You forgot to sign-off your patch.

Otherwise:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  fs/ext2/ext2.mk | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
> index 7417f81..cfb34c4 100644
> --- a/fs/ext2/ext2.mk
> +++ b/fs/ext2/ext2.mk
> @@ -20,12 +20,11 @@ ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
>  EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
>  endif
>  
> -# Not qstrip-ing the variable, because it may contain spaces, but we must
> -# qstrip it when checking. Furthermore, we need to further quote it, so
> -# that the quotes do not get eaten by the echo statement when creating the
> -# fakeroot script
> -ifneq ($(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_LABEL)),)
> -EXT2_OPTS += -l '$(BR2_TARGET_ROOTFS_EXT2_LABEL)'
> +# qstrip results in stripping consecutive spaces into a single one. So the
> +# variable is not qstrip-ed to preserve the integrity of the string value.
> +EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
> +ifneq ($(EXT2_LABEL),)
> +EXT2_OPTS += -l "$(EXT2_LABEL)"
>  endif
>  
>  ROOTFS_EXT2_DEPENDENCIES = host-mke2img
> -- 
> 2.10.2
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
