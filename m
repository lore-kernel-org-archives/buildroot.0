From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Oct 2019 14:30:07 +0200
Subject: [Buildroot] [PATCH v2 9/9] package/netopeer2-cli: add package
In-Reply-To: <20191009112656.21232-10-heiko.thiery@gmail.com>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
 <20191009112656.21232-10-heiko.thiery@gmail.com>
Message-ID: <20191009143007.0431472c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  9 Oct 2019 13:26:56 +0200
heiko.thiery at gmail.com wrote:

> diff --git a/package/Config.in b/package/Config.in
> index a38569e12c..21aa793276 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1647,6 +1647,7 @@ menu "Networking"
>  	source "package/mongoose/Config.in"
>  	source "package/nanomsg/Config.in"
>  	source "package/neon/Config.in"
> +	source "package/netopeer2-cli/Config.in"
>  	source "package/netopeer2-keystored/Config.in"
>  	source "package/netopeer2-server/Config.in"
>  	source "package/nghttp2/Config.in"
> diff --git a/package/netopeer2-cli/Config.in b/package/netopeer2-cli/Config.in
> new file mode 100644
> index 0000000000..eb771390be
> --- /dev/null
> +++ b/package/netopeer2-cli/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_NETOPEER2_CLI
> +	bool "netopeer2cli"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS

This list is not sufficient: you need to replicate all the "depends on"
of the options you are "select"-ing.

> +	select BR2_PACKAGE_LIBYANG
> +	select BR2_PACKAGE_LIBNETCONF2

You select this here, but it's not in the <pkg>_DEPENDENCIES of the
package.

> diff --git a/package/netopeer2-cli/netopeer2-cli.mk b/package/netopeer2-cli/netopeer2-cli.mk
> new file mode 100644
> index 0000000000..75192cc935
> --- /dev/null
> +++ b/package/netopeer2-cli/netopeer2-cli.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# netopeer2-cli
> +#
> +################################################################################
> +
> +NETOPEER2_CLI_VERSION = v0.7-r2
> +NETOPEER2_CLI_SITE = $(call github,CESNET,Netopeer2,$(NETOPEER2_CLI_VERSION))
> +NETOPEER2_CLI_LICENSE = BSD-3-Clause
> +NETOPEER2_CLI_LICENSE_FILES = LICENSE
> +NETOPEER2_CLI_SUBDIR = cli
> +NETOPEER2_CLI_INSTALL_STAGING = YES
> +NETOPEER2_CLI_DEPENDENCIES += libyang
> +NETOPEER2_CLI_DEPENDENCIES += sysrepo

Missing libnetconf2 in the dependencies. Also, format it like this:

NETOPEER2_CLI_DEPENDENCIES = libnetconf2 libyang sysrepo

But of course, take into account the fact that we most likely want a
single package for netopeer2.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
