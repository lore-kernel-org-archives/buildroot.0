From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Dec 2015 18:28:42 +0100
Subject: [Buildroot] [PATCH 1/1 v1] nfs-utils: install /etc/nfsmount.conf
In-Reply-To: <1450804337-23440-1-git-send-email-yba@tkos.co.il>
References: <1450804337-23440-1-git-send-email-yba@tkos.co.il>
Message-ID: <20151222172842.GC21998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan, All,

On 2015-12-22 19:12 +0200, Jonathan Ben-Avraham spake thusly:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> Installs /etc/nfsmount.conf on the target, mainly to be able to configure the
> the NFS version that mount.nfs uses by default. Without this ability you are
> likely to encounter mount errors when automounting directories from NFS
> version 3 servers.
> 
> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, see below...

> ---
>  package/nfs-utils/nfs-utils.mk |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index 30f12fd..6dd175c 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -38,6 +38,8 @@ endif
>  define NFS_UTILS_INSTALL_FIXUP
>  	rm -f $(NFS_UTILS_TARGETS_)
>  	touch $(TARGET_DIR)/etc/exports
> +	$(INSTALL) -D -m 644 \
> +		$(@D)/utils/mount/nfsmount.conf $(TARGET_DIR)/etc/nfsmount.conf

This file is only comments, save for a single un-commented line;
    [ NFSMount_Global_Options ]

Would it not be better that we just generate a file with just that line,
and a comment to see the sources for the format, like so:

    # See utils/mount/nfsmount.conf in nfs-utils sources
    # for the format of this file.
    [ NFSMount_Global_Options ]

Either way, I'm OK.

Regards,
Yann E. MORIN.

>  endef
>  NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
>  
> -- 
> 1.7.9.5
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
