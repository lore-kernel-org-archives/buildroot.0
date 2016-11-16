From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Nov 2016 23:58:23 +0100
Subject: [Buildroot] [PATCH] fs/ext2: fix double quoted label
In-Reply-To: <20161116195543.6456-2-gael.portay@savoirfairelinux.com>
References: <20161116195543.6456-1-gael.portay@savoirfairelinux.com>
 <20161116195543.6456-2-gael.portay@savoirfairelinux.com>
Message-ID: <e96fb5e7-1604-fb57-93c3-6aa38fefb683@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-11-16 20:55, Ga?l PORTAY wrote:
> Since the commit 6dd7bbb59134799ed3d7343f238b3b02592faebf, the label does
> not need anymore to be quoted. Even worse it *must* not be simple-quoted,
> unless the label will contain the double-quotes from the config variable
> BR2_TARGET_ROOTFS_EXT2_LABEL.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  fs/ext2/ext2.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
> index 7417f81..49b44e4 100644
> --- a/fs/ext2/ext2.mk
> +++ b/fs/ext2/ext2.mk
> @@ -20,12 +20,8 @@ ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
>  EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
>  endif
>  
> -# Not qstrip-ing the variable, because it may contain spaces, but we must
> -# qstrip it when checking. Furthermore, we need to further quote it, so
> -# that the quotes do not get eaten by the echo statement when creating the
> -# fakeroot script
>  ifneq ($(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_LABEL)),)
> -EXT2_OPTS += -l '$(BR2_TARGET_ROOTFS_EXT2_LABEL)'
> +EXT2_OPTS += -l $(BR2_TARGET_ROOTFS_EXT2_LABEL)

 We usually don't rely on the quotes added by Kconfig, because it's possible
that the variable is overridden on the command line like
make BR2_TARGET_ROOTFS_EXT2_LABEL="foo bar"

So it should be
EXT2_OPTS += -l '$(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_LABEL))'

 Regards,
 Arnout

>  endif
>  
>  ROOTFS_EXT2_DEPENDENCIES = host-mke2img
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
