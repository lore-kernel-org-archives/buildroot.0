From: Bradford Barr <bradford@density.io>
Date: Mon, 18 Sep 2017 17:03:14 -0400
Subject: [Buildroot] [PATCH 1/1] msgpack: new option install libs
In-Reply-To: <20170918205604.26827-1-bradford@density.io>
References: <20170918205604.26827-1-bradford@density.io>
Message-ID: <CAPpUvYi-a_rTFfFFschJiYgkryyYBiDnkhvuvmmOC9VsvktZrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This depends on the version bump to msgpack. Probably should have
waited to submit it. Sorry.

B

On Mon, Sep 18, 2017 at 4:56 PM, Bradford Barr <bradford@density.io> wrote:
> From: bradford barr <bradford@density.io>
>
> New option to install libs. MessagePack is implemented both as a C++ header and
> a C runtime library. If all applications linking to msgpack use the C++ header
> library there's no need to install the C library. This option allows a user to
> prevent installing unused libraries.
>
> Signed-off-by: bradford barr <bradford@density.io>
> ---
>  package/msgpack/Config.in  | 14 ++++++++++++++
>  package/msgpack/msgpack.mk |  4 ++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/package/msgpack/Config.in b/package/msgpack/Config.in
> index b8e8213..f32af9e 100644
> --- a/package/msgpack/Config.in
> +++ b/package/msgpack/Config.in
> @@ -13,3 +13,17 @@ config BR2_PACKAGE_MSGPACK
>  comment "msgpack needs a toolchain w/ C++"
>         depends on !BR2_INSTALL_LIBSTDCPP
>         depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +
> +if BR2_PACKAGE_MSGPACK
> +
> +config BR2_PACKAGE_MSGPACK_INSTALL_LIB
> +       bool "install lib"
> +       default y
> +       help
> +         MessagePack ships both a C library and a C++ header library.
> +         Selecting this option will install the C library in the target
> +         directory.
> +
> +         https://github.com/msgpack/msgpack-c#c-header-only-library
> +
> +endif
> diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
> index 66dbc8d..4133e0b 100644
> --- a/package/msgpack/msgpack.mk
> +++ b/package/msgpack/msgpack.mk
> @@ -10,6 +10,10 @@ MSGPACK_LICENSE = BSL-1.0
>  MSGPACK_LICENSE_FILES = COPYING
>  MSGPACK_INSTALL_STAGING = YES
>
> +ifneq ($(BR2_PACKAGE_MSGPACK_INSTALL_LIB),y)
> +MSGPACK_INSTALL_TARGET = NO
> +endif
> +
>  define MSGPACK_INSTALL_TARGET_CMDS
>         cp -a $(@D)/libmsgpackc.so* $(TARGET_DIR)/usr/lib
>  endef
> --
> 2.9.3
>
