From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 20:26:32 +0200
Subject: [Buildroot] [PATCH 2/2] new package: grpc
In-Reply-To: <20170417172225.20472-2-mrugiero@gmail.com>
References: <20170417172225.20472-1-mrugiero@gmail.com>
 <20170417172225.20472-2-mrugiero@gmail.com>
Message-ID: <25250a31-61c1-5876-ed73-5d6e1a0b28b3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Mario,

On 17-04-17 19:22, mrugiero at gmail.com wrote:
> From: "Mario J. Rugiero" <mrugiero@gmail.com>
> 
> gRPC is Google's take on RPC. It attempts to be simple and language
> agnostic by using protocol buffers to define the payloads.
> It depends on protobuf.
> 
> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
> ---
>  package/Config.in      |  1 +
>  package/grpc/Config.in | 17 ++++++++++++
>  package/grpc/grpc.hash |  2 ++
>  package/grpc/grpc.mk   | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 92 insertions(+)
>  create mode 100644 package/grpc/Config.in
>  create mode 100644 package/grpc/grpc.hash
>  create mode 100644 package/grpc/grpc.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 4eaa95b1d..54133ee0d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1353,6 +1353,7 @@ menu "Other"
>  	source "package/glibmm/Config.in"
>  	source "package/glm/Config.in"
>  	source "package/gmp/Config.in"
> +	source "package/grpc/Config.in"

 I think it would fit better under Networking - an RPC library is really about
networking, no?

>  	source "package/gsl/Config.in"
>  	source "package/gtest/Config.in"
>  	source "package/jemalloc/Config.in"
> diff --git a/package/grpc/Config.in b/package/grpc/Config.in
> new file mode 100644
> index 000000000..a26b2c44a
> --- /dev/null
> +++ b/package/grpc/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_GRPC
> +	bool "grpc"
> +	depends on BR2_PACKAGE_GFLAGS
> +	depends on BR2_PACKAGE_OPENSSL
> +	depends on BR2_PACKAGE_PROTOBUF
> +	depends on BR2_PACKAGE_ZLIB

 A package should generally not depend on other packages, but select them. You
then have to propagate the dependencies of those packages. So:

	depends on BR2_INSTALL_LIBSTDCPP
	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
	depends on !BR2_STATIC_LIBS # protobuf
	select BR2_PACKAGE_GFLAGS
	select BR2_PACKAGE_OPENSSL
	select BR2_PACKAGE_PROTOBUF
	select BR2_PACKAGE_ZLIB

> +	help
> +	  gRPC is Google's protocol buffers\' based implementation of a
                                           ^ Is this needed? We don't have it in
any other help text.

> +	  remote procedure call protocol.
> +
> +	  http://www.grpc.io
> +
> +comment "grpc needs protocol buffers, google flags, openssl and zlib"
> +	depends on !BR2_PACKAGE_GFLAGS || !BR2_PACKAGE_OPENSSL || \
> +		!BR2_PACKAGE_PROTOBUF || !BR2_PACKAGE_ZLIB

 This comment should be like in protobuf/Config.in:

comment "grpc needs a toolchain w/ C++, threads, dynamic library"
        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
                || BR2_STATIC_LIBS
        depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS

> +		
> +

 No empty lines at the end of the file, please.

> diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
> new file mode 100644
> index 000000000..e45e49bca
> --- /dev/null
> +++ b/package/grpc/grpc.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 b4f41c0f223ade0b5a4b95de018c28e781e06a76c35629a42279a02b26efb8c8 grpc-v1.2.4.tar.gz
> diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
> new file mode 100644
> index 000000000..0326080b3
> --- /dev/null
> +++ b/package/grpc/grpc.mk
> @@ -0,0 +1,72 @@
> +################################################################################
> +#
> +# grpc
> +#
> +################################################################################
> +
> +GRPC_VERSION = v1.2.4
> +GRPC_SITE = $(call github,grpc,grpc,$(GRPC_VERSION))
> +GRPC_LICENSE = BSD-3-Clause
> +GRPC_LICENSE_FILES = LICENSE
> +
> +# N.B. Need to use host protoc during cross compilation.

 This comment isn't really needed. It would be useful to explain why host-grpc
is needed, however.

> +GRPC_DEPENDENCIES = gflags openssl host-grpc host-protobuf protobuf zlib

 Is gflags really needed? AFAICS, it is only used for building tests.

 It seems to heavily use pkg-config, so add host-pkgconf.

 Also the Makefile tells me that it uses c-ares. It will use the bundled one if
you don't specify anything AFAIU, but we don't want to use the bundled one.

> +
> +GRPC_INSTALL_STAGING = YES
> +
> +GRPC_CROSS_MAKE_OPTS_BASE = \
> +	CC="$(TARGET_CC)" \
> +	CXX="$(TARGET_CXX)" \
> +	LD="$(TARGET_CC)" \
> +	LDXX="$(TARGET_CXX)" \
> +	CFLAGS="$(TARGET_CFLAGS)" \
> +	LDFLAGS="$(TARGET_LDFLAGS)" \
> +	STRIP="$(TARGET_STRIP)"

 This is basically TARGET_CONFIGURE_OPTS, so use that.

> +
> +GRPC_MAKE_OPTS = \
> +	$(GRPC_CROSS_MAKE_OPTS_BASE) \
> +	LD_LIBRARY_PATH="$(STAGING_DIR)/usr/lib" \

 That is bad... LD_LIBRARY_PATH, when exported, will be used by any program
called during the build, and we don't want any program to use the libraries in
STAGING_DIR! However, LD_LIBRARY_PATH doesn't seem to be exported, and is not
used by Makefile, so why do you pass this?

> +	PROTOC="$(HOST_DIR)/usr/bin/protoc" \

 This shouldn't be needed if you use TARGET_MAKE_ENV, because then
HOST_DIR/usr/bin is included in PATH and ti will find protoc.

> +	PROTOC_PLUGINS_DIR="$(HOST_DIR)/usr/bin/" \

 Same here.

> +	prefix="$(TARGET_DIR)/usr"

 This is wrong, it will set INSTALL_PREFIX to TARGET_DIR/usr and thereby leak
the build directory into the binary. Unfortunately, the Makefile is also wrong,
so you'll need to set prefix differently for the build and for the install step...


> +GRPC_INSTALL_TARGET_OPTS = \
> +	$(GRPC_CROSS_MAKE_OPTS_BASE) \
> +	prefix="$(TARGET_DIR)/usr"
> +
> +GRPC_INSTALL_STAGING_OPTS = \
> +	$(GRPC_CROSS_MAKE_OPTS_BASE) \
> +	prefix="$(STAGING_DIR)/usr"
> +
> +HOST_GRPC_MAKE_OPTS = \
> +	CFLAGS="$(HOST_CFLAGS)" \
> +	LDFLAGS="$(HOST_LDFLAGS)" \
> +	LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib" \
> +	PROTOC="$(HOST_DIR)/usr/bin/protoc" \
> +	PROTOC_PLUGINS_DIR="$(HOST_DIR)/usr/bin/" \
> +	prefix="$(HOST_DIR)/usr"
> +
> +define GRPC_BUILD_CMDS
> +	$(MAKE) $(GRPC_MAKE_OPTS) -C $(@D) static shared

 So this should be called as

	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
		$(GRPC_MAKE_OPTS) static shared

and GRPC_MAKE_OPTS should IMO just be

GRPC_MAKE_OPTS = prefix=/usr


> +endef
> +
> +define GRPC_INSTALL_TARGET_CMDS
> +  # Could be install-static and install-shared, but grpc is currently missing
> +  # the install-shared target.

 Put this outside the define.

> +	$(MAKE) $(GRPC_MAKE_OPTS) -C $(@D) install-static install-shared_c install-shared_cxx
> +endef
> +
> +define GRPC_INSTALL_STAGING_CMDS
> +	$(MAKE) $(GRPC_INSTALL_STAGING_OPTS) -C $(@D) install_c install_cxx
> +endef
> +
> +define HOST_GRPC_BUILD_CMDS
> +	$(MAKE) $(HOST_GRPC_MAKE_OPTS) -C $(@D) plugins
> +endef
> +
> +define HOST_GRPC_INSTALL_CMDS
> +	$(MAKE) $(HOST_GRPC_MAKE_OPTS) -C $(@D) install-plugins
> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))

 The package also has a CMakeLists.txt. Have you tried that? It should allow you
to remove almost everything. Though you will have to do

GRPC_CONF_OPTS = \
	-DgRPC_ZLIB_PROVIDER=package
	-DgRPC_SSL_PROVIDER=package

etc.

 But the cmake build system is apparently mainly targeted at Windows builds, so
perhaps it doesn't work very well. If this is the case, please mention it in the
commit message, as well as any problem you encountered with it.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
