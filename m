From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jun 2015 23:18:40 +0200
Subject: [Buildroot] [PATCH 04/12] fs/iso9660: enable Joliet extension
In-Reply-To: <1433430330-2166-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150605211840.GD3641@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-04 17:05 +0200, Thomas Petazzoni spake thusly:
> We already enable the Rockridge extension by default when building
> ISO9660, so let's also enable the Joliet extension which allows to
> support Unicode file names and long file names.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, see a comment, below...

> ---
>  fs/iso9660/iso9660.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index 5a29673..6a04fe6 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -44,7 +44,7 @@ endef
>  ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_PREPARATION
>  
>  define ROOTFS_ISO9660_CMD
> -	$(HOST_DIR)/usr/bin/genisoimage -R -b boot/grub/stage2_eltorito \
> +	$(HOST_DIR)/usr/bin/genisoimage -J -R -b boot/grub/stage2_eltorito \

Only tangentially related to your change:

-R is for RockRidge, but it seems using -r would be better:

    -r  This is like the -R option, but file ownership and modes are set
        to more useful values. [--snip--]

Reading the full entry for -r is instructive, and makes it sound like
that's what we would want to use instead of -R.

Regards,
Yann E. MORIN.

>  		-no-emul-boot -boot-load-size 4 -boot-info-table \
>  		-o $@ $(ISO9660_TARGET_DIR)
>  endef
> -- 
> 2.1.0
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
