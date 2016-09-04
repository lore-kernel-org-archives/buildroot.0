From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Sep 2016 00:04:55 +0200
Subject: [Buildroot] [PATCH 2/2] cpprestsdk: new package
In-Reply-To: <20160902134256.4515-2-pieter.degendt@gmail.com>
References: <20160902134256.4515-1-pieter.degendt@gmail.com>
 <20160902134256.4515-2-pieter.degendt@gmail.com>
Message-ID: <20160904220455.GD6522@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pieter, All,

Besides comments by Romain, here are mines:

On 2016-09-02 15:42 +0200, Pieter De Gendt spake thusly:
> Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
[--SNIP--]
> diff --git a/package/cpprestsdk/Config.in b/package/cpprestsdk/Config.in
> new file mode 100644
> index 0000000..7b95d31
> --- /dev/null
> +++ b/package/cpprestsdk/Config.in
> @@ -0,0 +1,27 @@
> +config BR2_PACKAGE_CPPRESTSDK
> +        bool "cpprestsdk"
> +        depends on BR2_INSTALL_LIBSTDCPP
> +        depends on BR2_USE_WCHAR
> +        depends on BR2_TOOLCHAIN_HAS_THREADS

Are those three dependencies needed for cpprestsdk itself, or are they
inherited from the boost dependencies?

Is the latter, then you need to say so:

    depends on BR2_INSTALL_LIBSTDCPP # boost
    depends on BR2_USE_WCHAR # boost
    depends on BR2_TOOLCHAIN_HAS_THREADS # boost

If not, then that's OK the way you did.

> +        select BR2_PACKAGE_BOOST
> +        select BR2_PACKAGE_BOOST_CHRONO
> +        select BR2_PACKAGE_BOOST_FILESYSTEM
> +        select BR2_PACKAGE_BOOST_RANDOM
> +        select BR2_PACKAGE_BOOST_REGEX
> +        select BR2_PACKAGE_BOOST_SYSTEM
> +        select BR2_PACKAGE_BOOST_THREAD
> +        select BR2_PACKAGE_OPENSSL
> +        select BR2_PACKAGE_PKGCONF

Do you mean that pkgconf is needed on the target at runtime?

I doubt it is. What is needed is only the host variant, no?

> +        select BR2_PACKAGE_ZLIB
> +        help
> +          The C++ REST SDK is a Microsoft project for 
> +          cloud-based client-server communication in 
> +          native code using a modern asynchronous C++ API 
> +          design. This project aims to help C++ developers 
> +          connect to and interact with services.
> +          
> +          https://github.com/Microsoft/cpprestsdk

Incorrect indentation: it should one leading TAB for all keywords (bool,
depends on, select, help) and a TAB plus two spaces for the help text
itself.

> +comment "clogics needs a toolchain w/ C++, wchar, threads"
> +        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR

Ditto, indentation.

> diff --git a/package/cpprestsdk/cpprestsdk.hash b/package/cpprestsdk/cpprestsdk.hash
> new file mode 100644
> index 0000000..200f05a
> --- /dev/null
> +++ b/package/cpprestsdk/cpprestsdk.hash
> @@ -0,0 +1 @@
> +sha256  3d1c38aa7ef34b3d3e9a6e84d3866554fe48c3d9d9977896d18a7cfb80d5a4ea    cpprestsdk-v2.8.0.tar.gz
> diff --git a/package/cpprestsdk/cpprestsdk.mk b/package/cpprestsdk/cpprestsdk.mk
> new file mode 100644
> index 0000000..d7509f8
> --- /dev/null
> +++ b/package/cpprestsdk/cpprestsdk.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +## cpprestsdk
> +#
> +#################################################################################
> +
> +CPPRESTSDK_VERSION = v2.8.0
> +CPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,$(CPPRESTSDK_VERSION))
> +CPPRESTSDK_INSTALL_STAGING = YES

License and licen files? Again, it does not look like it is easy:

    CPPRESTSDK_LICENSE = Apache 2.0, OpenSSL License, BSD-3c, Boost Software License 1.0
    CPPRESTSDK_LICENSE_FILES = license.txt ThirdPartyNotices.txt

> +CPPRESTSDK_DEPENDENCIES = boost openssl zlib

You also need to depend on host-pkgconf, since it is used to find
websocketpp.

> +ifeq ($(BR2_PACKAGE_WEBSOCKETPP),y)
> +	CPPRESTSDK_DEPENDENCIES += websocketpp
> +else
> +	CPPRESTSDK_CONF_OPTS = -DCPPREST_EXCLUDE_WEBSOCKETS=ON
> +endif

> +CPPRESTSDK_SUBDIR = Release
> +
> +CPPRESTSDK_CONF_OPTS += -DBUILD_SAMPLES=OFF

Usually, we try to have the non-conditional options go first, then the
conditional ones:

    CPPRESTSDK_CONF_OPTS = -DBUILD_SAMPLES=OFF

    ifeq ($(BR2_PACKAGE_WEBSOCKETPP),y) 
    CPPRESTSDK_DEPENDENCIES += websocketpp
    else
    CPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_WEBSOCKETS=ON
    endif

Regards,
Yann E. MORIN.

> +$(eval $(cmake-package))
> +
> -- 
> 2.9.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
