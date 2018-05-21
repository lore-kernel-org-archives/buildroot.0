From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 May 2018 09:58:07 +0200
Subject: [Buildroot] [PATCH 3/4] grpc: new package
In-Reply-To: <20180521050550.11898-3-charles.hardin@storagecraft.com>
References: <20180521050550.11898-1-charles.hardin@storagecraft.com>
 <20180521050550.11898-3-charles.hardin@storagecraft.com>
Message-ID: <20180521095807.4a7506fa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 May 2018 22:05:49 -0700, charles.hardin at storagecraft.com
wrote:
> From: Charles Hardin <charles.hardin@storagecraft.com>
> 
> add the gRPC package from Google's github repo. This is
> currently just installing the C and C++ libraries on the
> target installation for now. Some effort could be made
> to add the python bindings as a subsequent patch.
> 
> This also adds a patch to specify the protoc to use since
> that is provided by buildroot and not the host in addition
> to overriding the ldconfig command since that doesn't apply
> to the buildroot compile.
> 
> NOTE: Consider this a reference port for anyone that is
> looking to get grpc into buildroot.

I'm not sure what this paragraph means. Does it mean you don't consider
this patch to be appropriate for merging into Buildroot, and it's just
provided to help others who might have the same need ?

> diff --git a/package/grpc/0001-use-defined-env-in-makefile.patch b/package/grpc/0001-use-defined-env-in-makefile.patch
> new file mode 100644
> index 0000000000..9f5998404c
> --- /dev/null
> +++ b/package/grpc/0001-use-defined-env-in-makefile.patch

Please use "git format-patch" to generate this patch, and add a proper
description and Signed-off-by.

> diff --git a/package/grpc/Config.in b/package/grpc/Config.in
> new file mode 100644
> index 0000000000..feb7fb2de7
> --- /dev/null
> +++ b/package/grpc/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_GRPC
> +	bool "grpc"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_GFLAGS
> +	select BR2_PACKAGE_GTEST
> +	select BR2_PACKAGE_GTEST_GMOCK
> +	select BR2_PACKAGE_C_ARES
> +	select BR2_PACKAGE_PROTOBUF
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_ZLIB

Nit: alphabetic ordering of selects would be nice.

> diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
> new file mode 100644
> index 0000000000..9febf8ffa3
> --- /dev/null
> +++ b/package/grpc/grpc.mk
> @@ -0,0 +1,90 @@
> +################################################################################
> +#
> +# grpc
> +#
> +################################################################################
> +
> +GRPC_VERSION = v1.11.1
> +GRPC_SITE = $(call github,grpc,grpc,$(GRPC_VERSION))
> +GRPC_LICENSE = BSD-3-Clause
> +GRPC_LICENSE_FILES = LICENSE
> +
> +# Need a host c-ares for plugins and host-protobuf during
> +# the compilation
> +GRPC_DEPENDENCIES = host-grpc host-c-ares host-protobuf host-openssl

You need all of those host dependencies to build the target grpc ?

> +GRPC_DEPENDENCIES += gflags gtest c-ares openssl protobuf zlib

You can use a single assignment instead:

GPRC_DEPENDENCIES = host-grpc host-c-ares host-protobuf host-openssl \
	gflags gtest c-ares openssl protobuf zlib

> +GRPC_CROSS_MAKE_OPTS_BASE = \
> +	GRPC_CROSS_COMPILE="true" \
> +	LDCONFIG=/bin/true \
> +	HOST_CC="$(HOSTCC_NOCCACHE)" \
> +	HOST_CXX="$(HOSTCXX_NOCCACHE)" \

Why are you using the _NOCCACHE variant here ?

> +	HOST_LD="$(HOSTCC)" \
> +	HOST_LDXX="$(HOSTCXX)" \

And not here ?

> +define GRPC_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(GRPC_MAKE_OPTS) -C $(@D) \
> +		static shared plugins

You're unconditionally building some shared libraries it seems, this
most likely won't work in BR2_STATIC_LIBS configurations. Can you try
to make sure that your package builds fine with ./utils/test-pkg ?

> +HOST_GRPC_MAKE_OPTS = \
> +	CC="$(HOSTCC)" \
> +	CXX="$(HOSTCXX)" \
> +	LD="$(HOSTCC)" \
> +	LDXX="$(HOSTCXX)" \
> +	CPPLAGS="$(HOST_CPPFLAGS)" \
> +	CFLAGS="$(HOST_CFLAGS)" \
> +	CXXLAGS="$(HOST_CXXFLAGS)" \
> +	LDFLAGS="$(HOST_LDFLAGS)" \
> +	STRIP=/bin/true \
> +	PROTOC="$(HOST_DIR)/usr/bin/protoc" \
> +	prefix="$(HOST_DIR)/usr"

Prefix should be just $(HOST_DIR)

> +
> +

One too many empty line.

> +define HOST_GRPC_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_GRPC_MAKE_OPTS) -C $(@D) \
> +		static plugins

Why are you not installing the shared version here ? We generally
prefer to use the shared version of libraries for host packages.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
