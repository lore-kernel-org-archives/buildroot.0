From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Feb 2020 19:34:52 +0100
Subject: [Buildroot] [PATCH] package/skeleton-init-openrc: fix root
 filesystem ro/rw remount
In-Reply-To: <20200224114134.25887-1-unixmania@gmail.com>
References: <20200224114134.25887-1-unixmania@gmail.com>
Message-ID: <20200224183452.GX8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2020-02-24 08:41 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> The regular expressions used in the sed commands assumes that there is a
> space after '/dev/root' but the skeleton file contains a tab. Use a more
> flexible '[[:blank:]]', instead.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/skeleton-init-openrc/skeleton-init-openrc.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/skeleton-init-openrc/skeleton-init-openrc.mk b/package/skeleton-init-openrc/skeleton-init-openrc.mk
> index 656fc531d7..b0538ad03f 100644
> --- a/package/skeleton-init-openrc/skeleton-init-openrc.mk
> +++ b/package/skeleton-init-openrc/skeleton-init-openrc.mk
> @@ -19,13 +19,13 @@ ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
>  # Comment /dev/root entry in fstab. When openrc does not find fstab entry for
>  # "/", it will try to remount "/" as "rw".
>  define SKELETON_INIT_OPENRC_ROOT_RO_OR_RW
> -	$(SED) '\:^/dev/root :s/^/# /' $(TARGET_DIR)/etc/fstab
> +	$(SED) '\:^/dev/root[[:blank:]]:s/^/# /' $(TARGET_DIR)/etc/fstab
>  endef
>  else
>  # Uncomment /dev/root entry in fstab which has "ro" option so openrc notices
>  # it and doesn't remount root to rw.
>  define SKELETON_INIT_OPENRC_ROOT_RO_OR_RW
> -	$(SED) '\:^# /dev/root:s/^# //' $(TARGET_DIR)/etc/fstab
> +	$(SED) '\:^#[[:blank:]]*/dev/root[[:blank:]]:s/^# //' $(TARGET_DIR)/etc/fstab
>  endef
>  endif # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
>  
> -- 
> 2.18.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
