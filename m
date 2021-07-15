From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Jul 2021 23:08:27 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/nfs-utils: enable
 nfsv4/nfsv4.1 support
In-Reply-To: <20210715031316.3325515-1-james.hilliard1@gmail.com>
References: <20210715031316.3325515-1-james.hilliard1@gmail.com>
Message-ID: <20210715210827.GF12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

James, All,

On 2021-07-14 21:13 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

This patch, rebased on-top of UUID support, applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nfs-utils/Config.in    | 10 ++++++++++
>  package/nfs-utils/nfs-utils.mk |  9 +++++++--
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
> index da563db0f1..b736f6c973 100644
> --- a/package/nfs-utils/Config.in
> +++ b/package/nfs-utils/Config.in
> @@ -14,6 +14,16 @@ config BR2_PACKAGE_NFS_UTILS
>  
>  if BR2_PACKAGE_NFS_UTILS
>  
> +config BR2_PACKAGE_NFS_UTILS_NFSV4
> +	bool "NFSv4/NFSv4.1"
> +	depends on !BR2_STATIC_LIBS # keyutils, lvm2
> +	select BR2_PACKAGE_KEYUTILS
> +	select BR2_PACKAGE_LIBEVENT
> +	select BR2_PACKAGE_LVM2
> +	select BR2_PACKAGE_SQLITE
> +	help
> +	  Enable NFSv4/NFSv4.1 support
> +
>  config BR2_PACKAGE_NFS_UTILS_RPCDEBUG
>  	bool "rpcdebug"
>  	help
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index c384e939d8..2598f0908b 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -16,8 +16,6 @@ NFS_UTILS_AUTORECONF = YES
>  NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
>  
>  NFS_UTILS_CONF_OPTS = \
> -	--disable-nfsv4 \
> -	--disable-nfsv41 \
>  	--disable-gss \
>  	--disable-uuid \
>  	--enable-tirpc \
> @@ -46,6 +44,13 @@ NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD) += usr/sbin/rpc.rquotad
>  NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_NFSD) += usr/sbin/exportfs \
>  	usr/sbin/rpc.mountd usr/sbin/rpc.nfsd usr/lib/systemd/system/nfs-server.service
>  
> +ifeq ($(BR2_PACKAGE_NFS_UTILS_NFSV4),y)
> +NFS_UTILS_CONF_OPTS += --enable-nfsv4 --enable-nfsv41
> +NFS_UTILS_DEPENDENCIES += keyutils libevent lvm2 sqlite
> +else
> +NFS_UTILS_CONF_OPTS += --disable-nfsv4 --disable-nfsv41
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBCAP),y)
>  NFS_UTILS_CONF_OPTS += --enable-caps
>  NFS_UTILS_DEPENDENCIES += libcap
> -- 
> 2.25.1
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
