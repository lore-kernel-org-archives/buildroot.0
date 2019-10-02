From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 11:34:19 +0200
Subject: [Buildroot] [PATCH 6/9] package/sysrepo: add package
In-Reply-To: <20191001143023.698-6-heiko.thiery@gmail.com>
References: <20191001143023.698-1-heiko.thiery@gmail.com>
 <20191001143023.698-6-heiko.thiery@gmail.com>
Message-ID: <20191002113419.59b3b3db@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

On Tue,  1 Oct 2019 16:30:19 +0200
heiko.thiery at gmail.com wrote:

> diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
> new file mode 100644
> index 0000000000..78b8097e14
> --- /dev/null
> +++ b/package/sysrepo/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_SYSREPO
> +	bool "sysrepo - YANG based data store"

Just:

	bool "sysrepo"

> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_USES_MUSL

Could you add a comment that explains why it doesn't build on musl ?

Also, you're missing the BR2_USE_MMU dependency that is inherited from
libnetconf2.

You need to replicate the dependencies of protobuf-c (C++, x86 ||
x86-64 host architecture, host gcc >= 4.8)

> +	select BR2_PACKAGE_LIBEV
> +	select BR2_PACKAGE_LIBNETCONF2
> +	select BR2_PACKAGE_LIBREDBLACK
> +	select BR2_PACKAGE_LIBYANG
> +	select BR2_PACKAGE_PROTOBUF_C
> +	select BR2_PACKAGE_PCRE
> +	help
> +	  Sysrepo is an YANG-based configuration and operational state
> +	  data store for Unix/Linux applications.
> +
> +comment "needs a toolchain w/ threads, dynamic libraray"
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS

You're missing the musl dependency, and of course BR2_USE_MMU and the
other dependencies that come from protobuf-c.

> diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
> new file mode 100644
> index 0000000000..39ec70a2f6
> --- /dev/null
> +++ b/package/sysrepo/sysrepo.hash
> @@ -0,0 +1,2 @@
> +sha256 d3066c1776a6727b96bbb3517eb646d0bb6037e8e1addcbe873cae590493843e  sysrepo-v0.7.8.tar.gz
> +sha256 28a773bfffa828ec38c030fc8ace5f3aeb90926ec1309bbd135441c4387ce3cd  LICENSE
> diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
> new file mode 100644
> index 0000000000..423d3a7b03
> --- /dev/null
> +++ b/package/sysrepo/sysrepo.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# sysrepo
> +#
> +################################################################################
> +
> +SYSREPO_VERSION = v0.7.8
> +SYSREPO_SITE = $(call github,sysrepo,sysrepo,$(SYSREPO_VERSION))
> +SYSREPO_INSTALL_STAGING = YES
> +SYSREPO_LICENSE = Apache-2.0
> +SYSREPO_LICENSE_FILES = LICENSE
> +SYSREPO_DEPENDENCIES += libev libnetconf2 libredblack libyang pcre protobuf-c
> +HOST_SYSREPO_DEPENDENCIES += host-libev host-libnetconf2 host-libredblack host-libyang host-pcre host-protobuf-c

Use = instead of +=

Also, split those lines, like this:

FOO_DEPENDENCIES = \
	bar \
	baz \
	foobar

> +SYSREPO_CONF_OPTS += \
> +	-DGEN_PYTHON2_TESTS=OFF \
> +	-DENABLE_TESTS=OFF \
> +	-DCALL_TARGET_BINS_DIRECTLY=OFF
> +
> +HOST_SYSREPO_CONF_OPTS += \
> +	-DGEN_PYTHON2_TESTS=OFF \
> +	-DENABLE_TESTS=OFF \
> +	-DCALL_TARGET_BINS_DIRECTLY=OFF

Use = as well for those unconditional assignments.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
