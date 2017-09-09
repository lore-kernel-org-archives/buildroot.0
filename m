From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 23:09:21 +0200
Subject: [Buildroot] [PATCH 1/1] msgpack: bump to version 2.1.5
In-Reply-To: <20170907155108.3449-1-bradford@density.io>
References: <20170907155108.3449-1-bradford@density.io>
Message-ID: <20170909230921.0c270d7a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Sep 2017 11:51:08 -0400, Bradford Barr wrote:
> From: bradford barr <bradford@density.io>
> 
> Signed-off-by: bradford barr <bradford@density.io>

This needs a bigger commit log, because it's doing a lot more than a
version bump: the license is changing, and you introduce this "header
only" option.

> diff --git a/package/msgpack/Config.in b/package/msgpack/Config.in
> index b8e8213..e0626b2 100644
> --- a/package/msgpack/Config.in
> +++ b/package/msgpack/Config.in
> @@ -13,3 +13,15 @@ config BR2_PACKAGE_MSGPACK
>  comment "msgpack needs a toolchain w/ C++"
>  	depends on !BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +
> +if BR2_PACKAGE_MSGPACK
> +
> +config BR2_PACKAGE_MSGPACK_HEADER_ONLY

Could you give a rational for adding this ?

> +	bool "header only"
> +	depends on BR2_INSTALL_LIBSTDCPP

Not needed, the main option already depends on this.

> +	help
> +	  MessagePack can be installed as a header only library.

And why would you do it ?

> -$(eval $(autotools-package))
> +MSGPACK_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_MSGPACK_HEADER_ONLY),y)
> +MSGPACK_INSTALL_TARGET = NO
> +else
> +MSGPACK_INSTALL_TARGET = YES
> +endif

Passing MSGPACK_INSTALL_TARGET = NO is sufficient, since "YES" is the
default value.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
