From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Jul 2019 16:21:14 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/sdbusplus: new package
In-Reply-To: <20190702204247.12804-2-jfaith@impinj.com>
References: <20190702204247.12804-1-jfaith@impinj.com>
 <20190702204247.12804-2-jfaith@impinj.com>
Message-ID: <710b4b46-81d6-e5e6-4820-f8e1fb435750@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi John,

 Still a few problems :-(

On 02/07/2019 22:43, John Faith wrote:
> From: Trent Piepho <tpiepho@impinj.com>
> 
> A C++ library for interacting with sd-bus and a C++ bindings generator.
> 
> The host build produces a code generation tool, sdbus++ while the
> target build gives libsdbusplus.
> 
> Add a patch to disable the example program that requires the sdbus++
> tool if that tool has been disabled (for the target build).
> 
> The code generator requires host-python-pyyaml, host-python-inflection,
> and host-python-mako.  Since these aren't built for the target, the
> target build does not require them.

 I was going to apply (before I discovered the problem described below) and I
reformulated these two paratraphs as follows:

    The code generator requires host-python-pyyaml, host-python-inflection,
    and host-python-mako.  Since it isn't built for the target, the target
    build does not require them.

    The host package includes a code and documentation generation program,
    which is useful for including in a buildroot SDK, even if no target
    package needs it, so make it a user-selectable host package.

> 
> The host package includes a code and documentation generation program,
> which is useful for including in a buildroot SDK, even if no target
> user-selectable packages built need it, so make it a selected host
> package.
> 
> host-autoconf-archive is added as a dependency since configure.ac
> uses the AX_PKG_CHECK_MODULES macro.
> 
> Signed-off-by: John Faith <jfaith@impinj.com>
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>

[snip]
> diff --git a/package/sdbusplus/0001-build-Fix-example-build-with-disable-sdbuspp.patch b/package/sdbusplus/0001-build-Fix-example-build-with-disable-sdbuspp.patch
> new file mode 100644
> index 0000000000..e1364796fb
> --- /dev/null
> +++ b/package/sdbusplus/0001-build-Fix-example-build-with-disable-sdbuspp.patch
> @@ -0,0 +1,42 @@
> +From c5d5a94f8e554f160e3f120b826e97b2961e2706 Mon Sep 17 00:00:00 2001
> +From: Trent Piepho <tpiepho@impinj.com>
> +Date: Mon, 14 May 2018 16:17:38 -0700
> +Subject: [PATCH] build: Fix example build with --disable-sdbuspp
> +
> +The calculator server example uses the sdbus++ python program to build.
> +If this has been disabled, then trying to use it to build the example
> +could fail.  For instance, if python and all necessary python packages
> +are not available.  This might be the case when cross-building only
> +the library component for a target system.
> +
> +Don't build the calculator example when sdbus++ has been disabled.

 what's the upstream status of this patch? Please mention it in the patch itself.

> +
> +Signed-off-by: Trent Piepho <tpiepho@impinj.com>

 John, since you're delivering this patch, your Sob is required as well.
[snip]
> +config BR2_PACKAGE_SDBUSPLUS
> +	bool "sdbusplus"
> +	depends on BR2_INSTALL_LIBSTDCPP

 Since there is a .mk dependency on systemd, you need to select-or-depend it
here is well. Since systemd can't be selected (it depends on BR2_INIT_SYSTEMD),
you need to depend on it.

> +	help
> +	  A C++ library for sd-bus with a bindings and doc generator.
> +
> +	  This will build the target library.  See the host package for
> +	  the bindings and documentation generation program.
> +
> +	  https://github.com/openbmc/sdbusplus

 You need to add a comment in case the dependencies are not met:

comment "sdbusplus needs systemd and a toolchain w/ C++"


> diff --git a/package/sdbusplus/Config.in.host b/package/sdbusplus/Config.in.host
> new file mode 100644
> index 0000000000..03f55c4c4f
> --- /dev/null
> +++ b/package/sdbusplus/Config.in.host
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_HOST_SDBUSPLUS
> +	bool "host-sdbusplus"
> +	select BR2_PACKAGE_HOST_PKGCONF
> +	help
> +	  A C++ library for sd-bus with a bindings and doc generator.
> +
> +	  This will be the host side generation tool for bindings and
> +	  documentation.

 I think it's worth mentioning that this is a Python tool.

> +
> +	  https://github.com/openbmc/sdbusplus
> diff --git a/package/sdbusplus/sdbusplus.hash b/package/sdbusplus/sdbusplus.hash
> new file mode 100644
> index 0000000000..24849ee591
> --- /dev/null
> +++ b/package/sdbusplus/sdbusplus.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated
> +sha256  9136215c5fc849c33555db4210f17d844864c1b0790fe35026d594af965aa09d  sdbusplus-28dc36d509ba8f77ffb5726cc7d5f0184f8054b1.tar.gz
> +# License file, locally calculated
> +sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
> diff --git a/package/sdbusplus/sdbusplus.mk b/package/sdbusplus/sdbusplus.mk
> new file mode 100644
> index 0000000000..ab50568b5a
> --- /dev/null
> +++ b/package/sdbusplus/sdbusplus.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# sdbusplus
> +#
> +################################################################################
> +
> +SDBUSPLUS_VERSION = 28dc36d509ba8f77ffb5726cc7d5f0184f8054b1
> +SDBUSPLUS_SITE = $(call github,openbmc,sdbusplus,$(SDBUSPLUS_VERSION))
> +SDBUSPLUS_DEPENDENCIES = host-autoconf-archive host-pkgconf systemd
> +HOST_SDBUSPLUS_DEPENDENCIES = host-autoconf-archive host-pkgconf \
> +	$(PKG_PYTHON_HOST_PYTHON) host-python-inflection host-python-mako host-python-pyyaml

 If the dependencies get a little bit complicated like this, we prefer to have
one per line:

HOST_SDBUSPLUS_DEPENENCIES = \
	host-autoconf-archive \
	...


 Regards,
 Arnout

> +SDBUSPLUS_CONF_OPTS = --disable-sdbuspp
> +HOST_SDBUSPLUS_CONF_OPTS = --disable-libsdbusplus
> +SDBUSPLUS_AUTORECONF = YES
> +SDBUSPLUS_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
> +SDBUSPLUS_INSTALL_STAGING = YES
> +SDBUSPLUS_LICENSE = Apache-2.0
> +SDBUSPLUS_LICENSE_FILES = LICENSE
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> 
