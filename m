From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Sep 2017 16:53:53 +0200
Subject: [Buildroot] [git commit] bind: fix compilation when lmdb.h is
 present on host
In-Reply-To: <20170909201815.9BA4F80298@busybox.osuosl.org>
References: <20170909201815.9BA4F80298@busybox.osuosl.org>
Message-ID: <20170910165353.19203dab@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 9 Sep 2017 22:25:02 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> commit: https://git.buildroot.net/buildroot/commit/?id=7c0ecd4d7526dedce85a49172b031f45cde19a4b
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Bind autoconf scripts look for lmdb.h in /usr/include (even when
> cross-compiling). When liblmdb-dev is installed, this causes the
> following error:
> 
>     ...
>     checking for lmdb library... yes
>     checking for library containing mdb_env_create... no
>     configure: error: found lmdb include but not library.
> 
> Fix this by disabling explicitly lmdb support.
> 
> Signed-off-by: Robin Jarry <robin.jarry@6wind.com>
> Signed-off-by: Julien Floret <julien.floret@6wind.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/bind/bind.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index c65568e..c3d4872 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -30,6 +30,7 @@ BIND_CONF_OPTS = \
>  	--enable-epoll \
>  	--with-libtool \
>  	--with-gssapi=no \
> +	--with-lmdb=no \
>  	--enable-filter-aaaa
>  
>  ifeq ($(BR2_PACKAGE_ZLIB),y)

Double fix of the same problem, earlier fix/commit bb95fef1e0bec4ebc0584001f337438b17c4744d
using '--without-lmdb', now the complete CONF_OPTS are:

BIND_CONF_OPTS = \
        --without-lmdb \
        --with-libjson=no \
        --with-randomdev=/dev/urandom \
        --enable-epoll \
        --with-libtool \
        --with-gssapi=no \
        --with-lmdb=no \
        --enable-filter-aaaa

Regards,
Peter

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
