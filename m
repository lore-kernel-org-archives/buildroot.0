From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 12 Aug 2019 18:14:50 +0200
Subject: [Buildroot] [PATCH] package/nfs-utils: enable IPv6 if libtirpc
 is selected
In-Reply-To: <20190812030954.4880-1-unixmania@gmail.com>
References: <20190812030954.4880-1-unixmania@gmail.com>
Message-ID: <20190812181450.70b8c901@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Mon, 12 Aug 2019 00:09:54 -0300, unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
>
> IPv6 support depends on libtirpc, so no not disable it if libtirpc is

s/no not/do not/

> selected. In practice this always enables IPv6, since nfs-utils needs
> rpcbind, which in its turn always selects libtirpc.

Why not simple select it directly?

Regards,
Peter

>
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=10806
>
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> CC: nathan.renniewaldock at gmail.com
> ---
>  package/nfs-utils/nfs-utils.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index dc20942f71..974f2a5710 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -19,7 +19,6 @@ NFS_UTILS_CONF_OPTS = \
>  	--disable-nfsv41 \
>  	--disable-gss \
>  	--disable-uuid \
> -	--disable-ipv6 \
>  	--without-tcp-wrappers \
>  	--with-statedir=/run/nfs \
>  	--with-rpcgen=internal
> @@ -55,7 +54,7 @@ ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
>  NFS_UTILS_CONF_OPTS += --enable-tirpc
>  NFS_UTILS_DEPENDENCIES += libtirpc
>  else
> -NFS_UTILS_CONF_OPTS += --disable-tirpc
> +NFS_UTILS_CONF_OPTS += --disable-ipv6 --disable-tirpc
>  endif
>
>  define NFS_UTILS_INSTALL_FIXUP
