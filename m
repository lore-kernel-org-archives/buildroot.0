From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2020 19:41:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/pistache: new package
In-Reply-To: <20200426135842.2125143-2-thomas@ruschival.de>
References: <20200426135842.2125143-1-thomas@ruschival.de>
 <20200426135842.2125143-2-thomas@ruschival.de>
Message-ID: <20200426174132.GC28666@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Thanks for your patch. Please see my review below...

On 2020-04-26 15:58 +0200, Thomas Ruschival spake thusly:
> Add a new package for pistache https://pistache.io/
> Pistache is a C++ REST client/server library.

Note: all you wrote in your cover letter should have been in the commit
log.

> Signed-off-by: Thomas Ruschival <thomas@ruschival.de>
> ---
>  package/Config.in              |  1 +
>  package/pistache/Config.in     | 22 ++++++++++++++++++++++
>  package/pistache/pistache.hash |  5 +++++
>  package/pistache/pistache.mk   | 23 +++++++++++++++++++++++
>  4 files changed, 51 insertions(+)
>  create mode 100644 package/pistache/Config.in
>  create mode 100644 package/pistache/pistache.hash
>  create mode 100644 package/pistache/pistache.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 6c55c5bc42..631aec69a1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1753,6 +1753,7 @@ menu "Networking"
>  	source "package/ortp/Config.in"
>  	source "package/paho-mqtt-c/Config.in"
>  	source "package/paho-mqtt-cpp/Config.in"
> +	source "package/pistache/Config.in"
>  	source "package/qdecoder/Config.in"
>  	source "package/qpid-proton/Config.in"
>  	source "package/rabbitmq-c/Config.in"
> diff --git a/package/pistache/Config.in b/package/pistache/Config.in
> new file mode 100644
> index 0000000000..5b81c9c1b7
> --- /dev/null
> +++ b/package/pistache/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_PISTACHE
> +	bool "pistache"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

Since it is C++, it also needs:

    depends on BR2_INSTALL_LIBSTDCPP

> +	help
> +	  Pistache is a C++ REST framework written by Mathieu Stefani
> +	  at Datacratic. It is written in pure C++14 with no external
> +	  dependency and provides a low-level HTTP abstraction. It
> +	  provides both an HTTP client and server that can be used
> +	  to create and query complex web and REST APIs.
> +
> +	  https://pistache.io/

https://pistache.io/ uses an invalid certificate, while http://pistache.io/
works. However, I'd prefer we directly point to the github repository,
since this seems to be kept more up-to-date than the website (as you
noticed, at least about C++11 vs C++14).

Also, the description, although the one from the webasite, is a bit too
verbose, especially since Datacratic (http://datacratic.com/) does not
exist anymore it seems.

I'd rather we just use the shorter description from the github repo:

    Pistache is a modern and elegant HTTP and REST framework for C++. It
    is entirely written in pure-C++14 and provides a clear and pleasant
    API.

    https://github.com/oktal/pistache

> +
> +

Single empty line, as noticed by 'make check-package'.

> +config BR2_PACKAGE_PISTACHE_ENABLE_SSL
> +	bool "pistache SSL support"
> +	depends on BR2_PACKAGE_PISTACHE
> +	depends on BR2_PACKAGE_OPENSSL
> +	help
> +	  Configure pistache with -DPISTACHE_USE_SSL=On to support HTTPS

I don't think an option is needed. Usually, such optional dependencies
are treated directly in the .mk, see below...

> +
> diff --git a/package/pistache/pistache.hash b/package/pistache/pistache.hash
> new file mode 100644
> index 0000000000..fb4ada8b24
> --- /dev/null
> +++ b/package/pistache/pistache.hash
> @@ -0,0 +1,5 @@
> +# Nov 22
> +sha256 6b02ee423047992c5298d9c81a81231f71d62a549242a63913a050836b863e64  pistache-394b17c01f928bb.tar.gz
> +
> +# Apr 13
> +sha256 bcc7640eb4ae4b178e504f18ebf29dd0a6f8189710cdc0fa4703fa27728145e4  73f248acd6db4c53.tar.gz

Please only provide just the one hash that is needed. The dates are
meaningless, too. Instead, comment the hash with 'locally computed'
(as it comes from a github -generated tarball).

> diff --git a/package/pistache/pistache.mk b/package/pistache/pistache.mk
> new file mode 100644
> index 0000000000..da9e61b10e
> --- /dev/null
> +++ b/package/pistache/pistache.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# Pistache
> +#
> +################################################################################
> +
> +PISTACHE_VERSION = 73f248acd6db4c53
> +PISTACHE_SOURCE = $(PISTACHE_VERSION).tar.gz
> +PISTACHE_SITE = https://github.com/oktal/pistache/archive
> +PISTACHE_SITE_METHOD = wget

Use the full-length hash, ie. 73f248acd6db4c53e6604577b7e13fd5e756f96f
Don't override the _SOURCE, use the github helper for _SITE, and don't
force the _SITE_METHOD:

    PISTACHE_VERSION = 73f248acd6db4c53
    PISTACHE_SITE = $(call github,oktal,pistache,$(PISTACHE_VERSION))

> +
> +PISTACHE_INSTALL_STAGING = YES
> +PISTACHE_INSTALL_TARGET = YES

_INSTALL_TARGET is the default, no need to specify it.

> +PISTACHE_LICENSE = Apache-2.0
> +PISTACHE_LICENSE_FILE = LICENSE

Put the licensing info before INSTALL_STAGING, but after the download
info.

> +PISTACHE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

Not needed, this is set by the cmake-package infra.

Also, you should probably set additionaly options:

    PISTACHE_CONF_OPTS = \
       -DPISTACHE_BUILD_EXAMPLES=OFF \
       -DPISTACHE_BUILD_TESTS=OFF \
       -DPISTACHE_BUILD_DOCS=OFF

> +ifeq (y, $(BR2_PACKAGE_PISTACHE_ENABLE_SSL))
> +	PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=On
> +endif

That's were we would handle the optional dependency to openssl:

    ifeq ($(BR2_PACKAGE_OPENSSL),y)
    PISTACHE_DEPENDENCIES += openssl
    PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=ON
    else
    PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=OFF
    endif

I was about to do all those changes locally, but there are too many
build failures anyway:

    $ echo 'BR2_PACKAGE_PISTACHE=y' >pistache.cfg
    $ ./utils/test-pkg -d $(pwd)/br-test -c pistache.cfg
                             br-arm-full [1/6]: FAILED
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: FAILED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: FAILED
                            sourcery-arm [6/6]: SKIPPED
    6 builds, 1 skipped, 3 build failed, 0 legal-info failed

The build logs will be located in br-test/*/logfile

Care to address these issues, and look into the build failures?

Regards,
Yann E. MORIN.

> +$(eval $(cmake-package))
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
