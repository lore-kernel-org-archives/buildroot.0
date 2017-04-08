From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 16:05:52 +0200
Subject: [Buildroot] [PATCH v3] autofs: allow to use libtirpc instead of
 internal C implementation
In-Reply-To: <20170323071058.GA29887@waldemar-brodkorb.de>
References: <20170323071058.GA29887@waldemar-brodkorb.de>
Message-ID: <20170408160552.131d42a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Mar 2017 08:10:58 +0100, Waldemar Brodkorb wrote:
> uClibc-ng plans to remove internal RPC implementation as it
> is ipv4 only and can not be used for most important RPC software
> rpcbind and nfs-utils.
> musl does not implement RPC and GNU C library deprecated the
> internal implementation a while ago.
> It is still possible to use the C library implementation.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

This is almost good, but there are still a few issues. I had fixed most
of them locally, but one needs a bit more work.

> diff --git a/package/autofs/0004-libtirpc-via-pkgconfig.patch b/package/autofs/0004-libtirpc-via-pkgconfig.patch
> new file mode 100644
> index 0000000..784b4c6
> --- /dev/null
> +++ b/package/autofs/0004-libtirpc-via-pkgconfig.patch
> @@ -0,0 +1,83 @@
> +Use pkg-config to find libtirpc headers
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Please format your patch with Git. The Git repo is available at
https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/, create
a branch based on the release_5_1_2 tag, and import the three existing
patches.

> ++AC_PATH_PROGS(PKG_CONFIG, pkg-config, no)
> ++
> + # save current flags
> + af_check_libtirpc_save_cflags="$CFLAGS"
> + af_check_libtirpc_save_ldflags="$LDFLAGS"
> +-CFLAGS="$CFLAGS -I/usr/include/tirpc"
> +-LDFLAGS="$LDFLAGS -ltirpc"
> ++
> ++TIRPC_LIBS=`$PKG_CONFIG --libs libtirpc`
> ++TIRPC_FLAGS=`$PKG_CONFIG --cflags libtirpc`

Please PKG_CHECK_MODULES() instead.

> diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
> index 23e6836..580b04a 100644
> --- a/package/autofs/autofs.mk
> +++ b/package/autofs/autofs.mk
> @@ -32,6 +32,11 @@ AUTOFS_CONF_OPTS = \
>  	--with-path="$(BR_PATH)" \
>  	--with-hesiod=no
>  
> +ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
> +AUTOFS_DEPENDENCIES += libtirpc host-pkgconf

Once PKG_CHECK_MODULES is used, host-pkgconf should be an unconditional
dependency, because it will be needed for autoreconf to work.

Please also add this new patch to the list of patches that justify the
AUTORECONF = YES.

> +AUTOFS_CONF_OPTS += --with-libtirpc

Please add:

else
AUTOFS_CONF_OPTS += --without-libtirpc

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
