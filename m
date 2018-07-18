From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 15:36:07 +0200
Subject: [Buildroot] [PATCH 1/2] libnghttp2: new package
In-Reply-To: <20180718081748.13364-1-michael.burtin@netgem.com>
References: <20180718081748.13364-1-michael.burtin@netgem.com>
Message-ID: <20180718153607.3e4ac9e0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution. A few comments/questions below.

On Wed, 18 Jul 2018 10:17:47 +0200, Micha?l Burtin wrote:
> nghttp2 is an implementation of HTTP/2 and its header
> compression algorithm HPACK in C.
> 
> Signed-off-by: Anisse Astier <anisse.astier.ext@netgem.com>
> Signed-off-by: Micha?l Burtin <michael.burtin@netgem.com>
> ---
>  package/Config.in                  |  1 +
>  package/libnghttp2/Config.in       |  7 +++++++
>  package/libnghttp2/libnghttp2.hash |  2 ++
>  package/libnghttp2/libnghttp2.mk   | 22 ++++++++++++++++++++++

Could you add an entry in the DEVELOPERS file for this package ?

> diff --git a/package/libnghttp2/Config.in b/package/libnghttp2/Config.in
> new file mode 100644
> index 0000000000..b7f4170d6d
> --- /dev/null
> +++ b/package/libnghttp2/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBNGHTTP2
> +	bool "libnghttp2"

I am not sure about the name and categorization of the package. Indeed
the upstream name really is nghttp2, not libnghttp2, and my
understanding is that it provides more than a library, it also has a
HTTP/2 client, server and proxy.

Buildroot doesn't have a concept of binary packages, only source
packages, which can install one or several libraries, one or several
programs. So the package name should probably not reflect the fact that
it installs a library, but instead simply mimic the upstream name, i.e
nghttp2.

The next question is whether it should appear in Libraries->Networking
or in Networking applications. I think the former is OK, as we do have
a number of other network libraries that also install programs.

So, in other words, I would suggest to name the package nghttp2, but
keep it in Libraries->Networking in the menuconfig organization.

Could you adjust the package accordingly ?

> +	help
> +		nghttp2 is an implementation of HTTP/2 and its header
> +		compression algorithm HPACK in C.
> +
> +		https://nghttp2.org/

Indentation for the help text is one tab + 2 spaces. This is verified
by ./utils/check-package, so this hints that you have not checked your
package with check-package :-)

> diff --git a/package/libnghttp2/libnghttp2.hash b/package/libnghttp2/libnghttp2.hash
> new file mode 100644
> index 0000000000..067e58cfbc
> --- /dev/null
> +++ b/package/libnghttp2/libnghttp2.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 f75e8f228217f23aa5eabfbab140e061cda00b7c21e34c891ecfb248d663303f  nghttp2-1.32.0.tar.gz

We now like to have the hash of the license files here.

> diff --git a/package/libnghttp2/libnghttp2.mk b/package/libnghttp2/libnghttp2.mk
> new file mode 100644
> index 0000000000..b8502dbe42
> --- /dev/null
> +++ b/package/libnghttp2/libnghttp2.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# nghttp2
> +#
> +################################################################################
> +
> +LIBNGHTTP2_VERSION = 1.32.0
> +LIBNGHTTP2_SOURCE = nghttp2-$(LIBNGHTTP2_VERSION).tar.gz
> +LIBNGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(LIBNGHTTP2_VERSION)
> +LIBNGHTTP2_LICENSE = MIT
> +LIBNGHTTP2_LICENSE_FILES = COPYING LICENSE

There is no file named "LICENSE" in the tarball, so I guess you didn't
test "make legal-info" with this package enabled.

> +LIBNGHTTP2_INSTALL_STAGING = YES
> +LIBNGHTTP2_DEPENDENCIES = host-pkgconf
> +LIBNGHTTP2_CONF_OPTS = --enable-lib-only
> +
> +define LIBNGHTTP2_INSTALL_CLEAN_HOOK
> +       $(Q)rm -rf $(TARGET_DIR)/usr/share/nghttp2
> +endef

Use $(RM) instead of using rm -rf. And also add a small comment
indicating that this only removes a Python script that isn't useful for
the nghttp2 library.

Could you fix those details and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
