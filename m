From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 May 2016 16:13:13 +0200
Subject: [Buildroot] [PATCH v1] Makefile: fix rootfs overlay with
 BR2_ROOTFS_MERGED_USR enabled
In-Reply-To: <1461439109-28101-1-git-send-email-ps.report@gmx.net>
References: <1461439109-28101-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160508141313.GD24011@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

Nit-picking: when you send the 'v1' of a patch, you need not add 'v1' to
it. Only 'v2' and above need a version /tag/.

On 2016-04-23 21:18 +0200, Peter Seiderer spake thusly:
> Use rsync with '--keep-dirlinks' option to prevent rootfs overlay to
> overwrite /usr, /bin, /sbin and /lib links in case BR2_ROOTFS_MERGED_USR
> option is enabled.
> 
> Steps to reproduce failure:
> 
> - enable BR2_ROOTFS_MERGED_USR
> - mkdir some_path/rootfs-overlay/lib/firmware/some_file.txt
> - enable BR2_ROOTFS_OVERLAY="some_path/rootfs-overlay"
> - run 'make'
> - 'target/lib' contains only the files from 'some_path/rootfs-overlay/lib' instead
>   of the original symlink 'lib -> usr/lib'.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 0e4beb2..243823c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -657,7 +657,7 @@ endif
>  
>  	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
>  		$(call MESSAGE,"Copying overlay $(d)"); \
> -		rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
> +		rsync -a --ignore-times --keep-dirlinks $(RSYNC_VCS_EXCLUSIONS) \
>  			--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
>  			$(d)/ $(TARGET_DIR)$(sep))
>  
> -- 
> 2.8.1
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
