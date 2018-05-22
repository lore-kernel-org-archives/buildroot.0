From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 May 2018 23:07:58 +0200
Subject: [Buildroot] [PATCH v2 2/6] nfs-utils: add host package
In-Reply-To: <134051d83451aeb788e09c3e4e540806a198fe48.1526985017.git.baruch@tkos.co.il>
References: <176e048d628384df6d3b2d82f2b9c7e4cf58892e.1526985017.git.baruch@tkos.co.il>
 <134051d83451aeb788e09c3e4e540806a198fe48.1526985017.git.baruch@tkos.co.il>
Message-ID: <20180522230758.6a2b0f96@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 May 2018 13:30:13 +0300, Baruch Siach wrote:
> We only need the host package for the rpcgen utility. glibc deprecated
> this utility in version 2.26. Fedora has recently removed rpcgen from
> its glibc package. So we need to build the rpcgen from the nfs-utils
> package.
> 
> The removal of Sun RPC from glibc also removed RPC headers from glibc.
> rpcgen needs two of these headers. Add host-libtirpc to provide the RPC
> headers.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: add host-libtirpc dependency (Thomas P)
> ---
>  package/nfs-utils/nfs-utils.mk | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index 26112d69f230..c9e79866e42c 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -24,6 +24,20 @@ NFS_UTILS_CONF_OPTS = \
>  	--with-statedir=/run/nfs \
>  	--with-rpcgen=internal
>  
> +HOST_NFS_UTILS_CONF_OPTS = \
> +	--disable-nfsv4 \
> +	--disable-nfsv41 \
> +	--disable-gss \
> +	--disable-uuid \
> +	--disable-ipv6 \
> +	--without-tcp-wrappers \
> +	--with-statedir=/run/nfs \
> +	--disable-caps \
> +	--disable-tirpc \
> +	--without-systemd \
> +	--with-rpcgen=internal
> +HOST_NFS_UTILS_DEPENDENCIES = host-libtirpc

This variable lacks host-pkgconf. Without this, the autoreconf fails.

With this fixed:

Tested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I've tested in a Fedora 28 docker container, host-nfs-utils now builds
rpcgen properly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
