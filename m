From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Jun 2016 00:20:58 +0200
Subject: [Buildroot] [PATCH] Makefile: Fix overlay overwriting everything
In-Reply-To: <1455119908-21976-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1455119908-21976-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160602222058.GC3714@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2016-02-10 16:58 +0100, Maxime Hadjinlian spake thusly:
> After bumping from a 2 years old Buildroot installation, I got the
> following messages from the kernel at boot:
> 
> Failed to execute /init (error -2)
> 
> It appears that the overlay mechanisms was causing my issues.
> 
> Description:
> The overlay mechanisms works by rsync'ing files from a folder specified
> by the user into target.
> Since c5bd8af65e50a51735eb112fed9cbe6337f14e06, /bin, /sbin and /lib are
> symlinked into /usr.
> 
> Problem:
> If you have an overlay that contains the directory /bin, /sbin or /lib, rsync
> will erase the symlink and create a directory in its place.
> The directory, say .../target/lib, would *only* contains the overlay's content.
> Obviously, this causes a lot of troubles, starting with the kernel
> failing to start init (because of missing shared libraries).
> 
> Solution:
> Telling rsync to treat symlinked dir on the receiver side as directory
> allow users to be blissfully ignorant of that problem.

It seems that this has already been fixed by a patch by Peter Seiderer:

    0db3452 Makefile: fix rootfs overlay with BR2_ROOTFS_MERGED_USR
            enabled

Can you confirm that this also fixes your issue? If so, care to mark
your patch as superseded in Patchwork, please?

If not, just chime in!

Thanks!

Regards,
Yann E. MORIN.

> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 71735b5..2f33ddf 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -655,7 +655,7 @@ endif
>  
>  	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
>  		$(call MESSAGE,"Copying overlay $(d)"); \
> -		rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
> +		rsync -a --keep-dirlinks --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
>  			--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
>  			$(d)/ $(TARGET_DIR)$(sep))
>  
> -- 
> 2.7.0
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
