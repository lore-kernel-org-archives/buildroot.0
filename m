From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 10:22:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/vsomeip: add vsomeip to bildroot
In-Reply-To: <DBXPR03MB493D98B7C74731F638479FFA0F40@DBXPR03MB493.eurprd03.prod.outlook.com>
References: <DBXPR03MB493D98B7C74731F638479FFA0F40@DBXPR03MB493.eurprd03.prod.outlook.com>
Message-ID: <20181103102233.56d87c05@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maik,

Thanks for your contribution! Since it's your first contribution, I
obviously have a few comments, but it's nice to see contributions from
Continental! See below for my comments.

On Mon, 22 Oct 2018 10:33:43 +0000, Brenke, Maik wrote:

> attached I want to commit a patch to add the vsomeip library to the buildroot system.

First of all, please don't "attach" patches, instead use the "git
send-email" tool to send your patches. This will ensure they are sent
the proper way, and can be applied.

> From 21a47c26a09c1fd2c81f60269f0a07ff71d7baa4 Mon Sep 17 00:00:00 2001
> 
> From: Maik Brenke <maik.brenke@continental-corporation.com>
> Date: Thu, 18 Oct 2018 12:16:47 +0200
> Subject: [PATCH] add-vsomeip-library-(automotive-ethernet-protocol)

The commit title should be:

	package/vsomeip: new package

> 
> Signed-off-by: Maik Brenke <maik.brenke@continental-corporation.com>
> ---
>  package/Config.in          |  1 +
>  package/vsomeip/Config.in  | 25 +++++++++++++++++++++++++
>  package/vsomeip/vsomeip.mk | 13 +++++++++++++
>  3 files changed, 39 insertions(+)

Please add an entry in the DEVELOPERS file for this new package. This
allows us to know who is taking care of which package. This also allows
you to get notified when there are build issues with this package, or
get CC'ed when other people contribute patches touching this package.

Also, your package lacks a vsomeip.hash, which should contain the hash
of the tarball being downloaded, as well as the hash of the license
file (see other packages for examples).

> diff --git a/package/vsomeip/Config.in b/package/vsomeip/Config.in
> new file mode 100644
> index 0000000..9c04162
> --- /dev/null
> +++ b/package/vsomeip/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_PACKAGE_VSOMEIP
> +    bool "vsomeip"
> +    depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +    depends on BR2_INSTALL_LIBSTDCPP
> +    depends on BR2_TOOLCHAIN_HAS_THREADS # boost
> +    depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
> +    select BR2_PACKAGE_BOOST
> +    select BR2_PACKAGE_BOOST_SYSTEM
> +    select BR2_PACKAGE_BOOST_THREAD
> +    select BR2_PACKAGE_BOOST_LOG
> +    help
> +      The vsomeip stack implements the Scalable service-Oriented
> +      MiddlewarE over IP (SOME/IP)) protocol (http://some-ip.com/).
> +      The stack consists out of:
> +
> +       * a shared library for SOME/IP (`libvsomeip.so`)
> +       * a second shared library for SOME/IP's service discovery
> +         (`libvsomeip-sd.so`) which is loaded during runtime if
> +         the service discovery is enabled.
> +
> +      https://github.com/GENIVI/vsomeip
> +
> +comment "vsomeip needs toolchain w/ C++, threads; gcc >= 4.8; Boost system, thread, log"

No need to indicate Boost system, thread, log in the comment: these are
selected.

> +    depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
> +    depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8

You forgot || !BR2_TOOLCHAIN_HAS_THREADS

Also, BR2_PACKAGE_BOOST has a dependency on BR2_USE_WCHAR, so it should
be replicated as well to your package.

> diff --git a/package/vsomeip/vsomeip.mk b/package/vsomeip/vsomeip.mk
> new file mode 100644
> index 0000000..81b25de
> --- /dev/null
> +++ b/package/vsomeip/vsomeip.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# vsomeip
> +#
> +################################################################################
> +
> +VSOMEIP_VERSION = 2.10.21
> +VSOMEIP_SITE = $(call github,GENIVI,vsomeip,$(VSOMEIP_VERSION))
> +VSOMEIP_LICENSE = MPL

According to https://spdx.org/licenses/, MPL is not a valid SPDX
license tag, it needs to have the license version. Looking at
https://github.com/GENIVI/vsomeip/blob/master/LICENSE, it's version
2.0, so:

VSOMEIP_LICENSE = MPL-2.0

> +VSOMEIP_LICENSE_FILES = LICENSE
> +VSOMEIP_DEPENDENCIES = boost
> +
> +$(eval $(cmake-package))

Could you adjust your patch according to those comments, and send an
updated version ?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
