From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Apr 2016 22:48:36 +0200
Subject: [Buildroot] [PATCH v5] valijson: new package
In-Reply-To: <1460626076-28824-1-git-send-email-santosh.multhalli@rockwellcollins.com>
References: <1460626076-28824-1-git-send-email-santosh.multhalli@rockwellcollins.com>
Message-ID: <20160414224836.7a44d118@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've applied the patch, but there are still quite a few things that were
not good.

On Thu, 14 Apr 2016 14:57:56 +0530, santosh.multhalli wrote:
> Valijson is a header-only JSON Schema Validation library for
> C++.Add a patch 0001-CMake-Add-option-to-Install-headers-build-examples-a.patch
> to install valijson headers ,provide optional compilation of unit tests and
> examples.

As Matt pointed out, this part of the commit log was no longer relevant.

> 
> Signed-off-by: santosh.multhalli <santosh.multhalli@rockwellcollins.com>

Your name here should match the From: of your e-mail, so it should have
been:

	Santosh Multhalli <santosh.multhalli@rockwellcollins.com>

> diff --git a/package/Config.in b/package/Config.in
> index 64822bf..1404653 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1044,6 +1044,7 @@ menu "JSON/XML"
>  	source "package/raptor/Config.in"
>  	source "package/tinyxml/Config.in"
>  	source "package/tinyxml2/Config.in"
> + 	source "package/valijson/Config.in"

This line was not good, it starts with a space followed by a tab, it
should just be a tab. You can spot these very easily by reviewing your
patch using "git log -p".

>  	source "package/yaml-cpp/Config.in"
> diff --git a/package/valijson/Config.in b/package/valijson/Config.in
> new file mode 100644
> index 0000000..a5e24c2
> --- /dev/null
> +++ b/package/valijson/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_VALIJSON
> +	bool "valijson"
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

You forgot to replicate the BR2_PACKAGE_BOOST_ARCH_SUPPORTS dependency
here. Basically when you "select BR2_PACKAGE_<foo>", you *must*
replicate all "depends on" that BR2_PACKAGE_<foo>" has to your package.

> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_REGEX
> +

This blank line is unneeded.

> +	help
> +	 Valijson is a header-only JSON Schema Validation library for
> +	 C++. Valijson provides a simple validation API that allows you
> +	 load JSON Schemas, and validate documents loaded by one of
> +	 several supported parser libraries like boost, jsoncpp,
> +	 rapidjson and picoJSON.It depends on BOOST Libraries

Missing space after dot, missing final dot in this sentence. But since
this last sentence was useless, I simply removed it.

> +VALIJSON_VERSION = 424b706f990a9eb96dfc19cc8e54f2cd6ce5e186
> +VALIJSON_SITE = $(call github,tristanpenman,valijson,$(VALIJSON_VERSION))
> +VALIJSON_LICENSE = BSD-3c

License is BSD-2c, not BSD-3c.

As I said, I fixed up those issues and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
