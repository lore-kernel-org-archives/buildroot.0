From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jun 2016 23:09:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: fix fsck when using
 systemd
In-Reply-To: <1465661756-11389-1-git-send-email-martin@barkynet.com>
References: <1465661756-11389-1-git-send-email-martin@barkynet.com>
Message-ID: <20160612210901.GI3711@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All

On 2016-06-11 17:15 +0100, Martin Bark spake thusly:
> Commit a93fc34 modified e2fsprogs to symlink /usr/sbin/fsck to /sbin/fsck
> to keep systemd happy.  However, later on commit c5bd8af6 has forced
> /usr/sbin to be a symlink to /sbin when using systemd.  This means fsck
> gets destroyed as a symlink to itself when using systemd or when setting
> BR2_ROOTFS_MERGED_USR.
> 
> Since commit c5bd8af6 obsoletes commit a93fc34 revert the changes from
> commit a93fc34 to solve the issue.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/e2fsprogs/e2fsprogs.mk | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index 5ba9278..7aa0285 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -155,14 +155,5 @@ ifeq ($(BR2_PACKAGE_E2FSPROGS_TUNE2FS),y)
>  E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_TUNE2FS_SYMLINK
>  endif
>  
> -# systemd really wants to have fsck in /sbin
> -define E2FSPROGS_TARGET_FSCK_SYMLINK
> -	ln -sf ../usr/sbin/fsck $(TARGET_DIR)/sbin/fsck
> -endef
> -
> -ifeq ($(BR2_PACKAGE_E2FSPROGS_FSCK),y)
> -E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_FSCK_SYMLINK
> -endif
> -
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.7.4
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
