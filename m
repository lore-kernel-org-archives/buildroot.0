From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Aug 2018 00:15:44 +0200
Subject: [Buildroot] [PATCH next 3/4] btrfs-progs: drop dependency on
 e2fsprogs by not building btrfs-convert
In-Reply-To: <20180821215954.11971-4-thomas.petazzoni@bootlin.com>
References: <20180821215954.11971-1-thomas.petazzoni@bootlin.com>
 <20180821215954.11971-4-thomas.petazzoni@bootlin.com>
Message-ID: <20180821221544.GV15347@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-08-21 23:59 +0200, Thomas Petazzoni spake thusly:
> The btrfs-convert tool is used to convert an existing ext2 or reiserfs
> filesystem into a btrfs filesystem. On the host, this is not really
> useful, so let's disable building this tool, which allows to drop the
> host-e2fsprogs dependency.
> 
> The host-util-linux dependency becomes necessary: it was previously
> brought as a second-order dependency of host-e2fsprogs, but since we
> no longer depend on host-e2fsprogs, we now need to explicitly depend
> on host-util-linux.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/btrfs-progs/btrfs-progs.mk | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
> index 3129ecc714..2f9f4127b6 100644
> --- a/package/btrfs-progs/btrfs-progs.mk
> +++ b/package/btrfs-progs/btrfs-progs.mk
> @@ -21,8 +21,12 @@ BTRFS_PROGS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-static
>  BTRFS_PROGS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-static
>  endif
>  
> -HOST_BTRFS_PROGS_DEPENDENCIES = host-e2fsprogs host-lzo host-zlib
> -HOST_BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-zstd --disable-python
> +HOST_BTRFS_PROGS_DEPENDENCIES = host-util-linux host-lzo host-zlib
> +HOST_BTRFS_PROGS_CONF_OPTS = \
> +	--disable-backtrace \
> +	--disable-zstd \
> +	--disable-python \
> +	--disable-convert
>  
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.14.4
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
