From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 23:47:27 +0200
Subject: [Buildroot] [PATCH v2 4/5] grpc: new package
In-Reply-To: <20180521175310.18563-5-charles.hardin@storagecraft.com>
References: <20180521175310.18563-1-charles.hardin@storagecraft.com>
 <20180521175310.18563-5-charles.hardin@storagecraft.com>
Message-ID: <20180628234727.0dc0c3c9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 May 2018 10:53:09 -0700, charles.hardin at storagecraft.com
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
> NOTE: This doesn't add the python or any other bindings
> 
> Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
> ---
>  package/Config.in                                  |   1 +
>  ...onmental-overrides-of-protoc-dtrace-and-l.patch |  72 +++++++++++++++
>  package/grpc/Config.in                             |  19 ++++
>  package/grpc/grpc.hash                             |   2 +
>  package/grpc/grpc.mk                               | 101 +++++++++++++++++++++
>  5 files changed, 195 insertions(+)
>  create mode 100644 package/grpc/0001-Allow-environmental-overrides-of-protoc-dtrace-and-l.patch
>  create mode 100644 package/grpc/Config.in
>  create mode 100644 package/grpc/grpc.hash
>  create mode 100644 package/grpc/grpc.mk

Please add an entry to the DEVELOPERS file when adding a new package.

> diff --git a/package/grpc/0001-Allow-environmental-overrides-of-protoc-dtrace-and-l.patch b/package/grpc/0001-Allow-environmental-overrides-of-protoc-dtrace-and-l.patch
> new file mode 100644
> index 0000000000..79a16786fd
> --- /dev/null
> +++ b/package/grpc/0001-Allow-environmental-overrides-of-protoc-dtrace-and-l.patch
> @@ -0,0 +1,72 @@
> +From dedb8e2ba6d1ea4ea5745d2d991bc333353478ba Mon Sep 17 00:00:00 2001
> +From: Charles Hardin <charles.hardin@storagecraft.com>
> +Date: Mon, 21 May 2018 09:39:31 -0700
> +Subject: [PATCH 1/1] Allow environmental overrides of protoc, dtrace, and
> + ldconfg

Please generate patches with "git format-patch -N" to not have "PATCH
1/1" but just "PATCH".

> +Some build systems (ie. buildroot) provide host tools as part
> +of the build and those paths are local to build.
>
> To address this
> +just do a "which" against the passed in PROTOC=my/path/protoc
> +and that can be used for the check version command.
> +
> +In addition, allow an ldconfig override on the install shared
> +library builds since this might be cross compiling or being
> +dumped into a chroot environment for something else.
> +
> +Signed-off-by: Charles Hardin <ckhardin@gmail.com>

I think this should be split in two patches:

 - One making sure the PROTOC and DTRACE variables get used everywhere
   applicable.

 - One introducing LDCONFIG

Also, it would be good to submit those patches upstream.


> diff --git a/package/grpc/Config.in b/package/grpc/Config.in
> new file mode 100644
> index 0000000000..d7096d0853
> --- /dev/null
> +++ b/package/grpc/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_GRPC
> +	bool "grpc"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

	depends on BR2_USE_MMU
	depends on BR2_USE_WCHAR

(because you select gtest)

        depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
        depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
        depends on !BR2_STATIC_LIBS

(because you select protobuf)

> +	select BR2_PACKAGE_C_ARES
> +	select BR2_PACKAGE_GFLAGS
> +	select BR2_PACKAGE_GTEST
> +	select BR2_PACKAGE_GTEST_GMOCK
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_PROTOBUF
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  gRPC is Google's protocol buffer based implementation of a
> +	  remote procedure call protocol.
> +
> +	  http://www.grpc.io
> +
> +comment "grpc needs a toolchain w/ C++, threads"
> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)

Please update this comment according to the additional dependencies
above.

> +GRPC_VERSION = v1.11.1
> +GRPC_SITE = $(call github,grpc,grpc,$(GRPC_VERSION))
> +GRPC_LICENSE = BSD-3-Clause

The LICENSE file contains the Apache-2.0 license text. Are you sure
about BSD-3-Clause here ?

> +GRPC_LICENSE_FILES = LICENSE
> +
> +# Need a host protoc grpc plugin during the compilation
> +GRPC_DEPENDENCIES = host-grpc gflags gtest c-ares openssl protobuf zlib
> +HOST_GRPC_DEPENDENCIES = host-c-ares host-protobuf host-openssl
> +
> +GRPC_INSTALL_STAGING = YES
> +
> +GRPC_CROSS_MAKE_OPTS_BASE = \
> +	GRPC_CROSS_COMPILE="true" \
> +	LDCONFIG=/bin/true \
> +	HOST_CC="$(HOSTCC)" \
> +	HOST_CXX="$(HOSTCXX)" \
> +	HOST_LD="$(HOSTCC)" \
> +	HOST_LDXX="$(HOSTCXX)" \
> +	HOST_CPPFLAGS="$(HOST_CPPFLAGS)" \
> +	HOST_CFLAGS="$(HOST_CFLAGS)" \
> +	HOST_LDFLAGS="$(HOST_LDFLAGS)" \
> +	CC="$(TARGET_CC)" \
> +	CXX="$(TARGET_CXX)" \
> +	LD="$(TARGET_CC)" \
> +	LDXX="$(TARGET_CXX)" \
> +	CFLAGS="$(TARGET_CFLAGS)" \
> +	LDFLAGS="$(TARGET_LDFLAGS)" \
> +	STRIP=/bin/true

As explained in my other e-mail, pass this in the environment so that
the Makefile can do CFLAGS += something.

> +ifeq ($(BR2_SHARED_LIBS),y)
> +GRPC_BUILD_TARGETS = shared plugins
> +GRPC_STAGING_TARGETS = install-headers install-shared_c install-shared_cxx
> +GRPC_INSTALL_TARGETS = install-shared_c install-shared_cxx
> +else ifeq ($(BR2_STATIC_LIBS),y)
> +GRPC_BUILD_TARGETS = static plugins
> +GRPC_STAGING_TARGETS = install-headers install-static_c install-static_cxx
> +GRPC_INSTALL_TARGETS = install-static_c install-static_cxx
> +else
> +GRPC_BUILD_TARGETS = static shared plugins
> +GRPC_STAGING_TARGETS = install
> +GRPC_INSTALL_TARGETS = install-shared_c install-shared_cxx
> +endif

Perhaps this could be:

GRPC_BUILD_TARGETS = plugins
GRPC_STAGING_INSTALL_TARGETS = install-headers

ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
GRPC_BUILD_TARGETS += shared
GRPC_STAGING_INSTALL_TARGETS += install-shared_c install-shared_cxx
GRPC_TARGET_INSTALL_TARGETS += install-shared_c install-shared_cxx
endif

ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
GRPC_BUILD_TARGETS += static
GRPC_STAGING_INSTALL_TARGETS += install-static_c install-static_cxx
GRPC_TARGET_INSTALL_TARGETS += install-static_c install-static_cxx
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
