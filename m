From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 1 Apr 2018 00:36:02 +0200
Subject: [Buildroot] [PATCH 1/1] msgpack: new option install libs
In-Reply-To: <20170918205604.26827-1-bradford@density.io>
References: <20170918205604.26827-1-bradford@density.io>
Message-ID: <e28538a2-5c13-b514-442b-ac4fd9da72b6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Bradford,

On 18-09-17 22:56, Bradford Barr wrote:
> From: bradford barr <bradford@density.io>
> 
> New option to install libs. MessagePack is implemented both as a C++ header and
> a C runtime library. If all applications linking to msgpack use the C++ header
> library there's no need to install the C library. This option allows a user to
> prevent installing unused libraries.

 The version bump was applied long ago so this patch can be applied now.
However, in the meantime the build system has been changed into CMake. This will
now always install the shared library to staging, if I understand correctly. So
the solution of simply saying MSGPACK_INSTALL_TARGET = NO is no longer
sufficient: with the shared library and the C headers in staging, another
package may pick up these headers/library and try to link with it, which will
lead to a runtime failure.

 Could you find a fix for that and resubmit?

 Thanks,

 Regards,
 Arnout

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
>  	depends on !BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +
> +if BR2_PACKAGE_MSGPACK
> +
> +config BR2_PACKAGE_MSGPACK_INSTALL_LIB
> +	bool "install lib"
> +	default y
> +	help
> +	  MessagePack ships both a C library and a C++ header library.
> +	  Selecting this option will install the C library in the target
> +	  directory.
> +
> +	  https://github.com/msgpack/msgpack-c#c-header-only-library
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
>  	cp -a $(@D)/libmsgpackc.so* $(TARGET_DIR)/usr/lib
>  endef
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
