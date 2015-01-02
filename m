From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 20:29:21 +0100
Subject: [Buildroot] [RFC] Wine package
In-Reply-To: <54A6E9C0.7060109@dawncrow.de>
References: <54A6CF2D.1090706@dawncrow.de>
 <20150102191347.229139f2@free-electrons.com>
 <54A6E9C0.7060109@dawncrow.de>
Message-ID: <20150102202921.32005f37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Fri, 02 Jan 2015 19:56:00 +0100, Andr? Hentschel wrote:

> ok, here it is, modified the version and added the uclibc dependency

Thanks. See comments below.

> diff --git a/package/wine/Config.in b/package/wine/Config.in
> new file mode 100644
> index 0000000..ad0c8f2
> --- /dev/null
> +++ b/package/wine/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_WINE
> +	bool "Wine"

Lowercase: "wine".

> +	depends on BR2_INET_IPV6
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +    depends on !BR2_TOOLCHAIN_USES_UCLIBC

Indentation is not correct for this line. Also, just for curiosity,
could you give some details on the issues you've seen when building
wine against uclibc?

Does it work with the musl C library? In other words, do you need:

	depends on !BR2_TOOLCHAIN_USES_UCLIBC

or:

	depends on BR2_TOOLCHAIN_USES_GLIBC

 ?

> +	# Wine has much CPU specific code
> +	depends on BR2_i386 || BR2_x86_64
> +	help
> +	  Wine is a compatibility layer capable of running
> +	  Windows applications on Linux. Instead of simulating internal
> +	  Windows logic like a virtual machine or emulator,
> +	  Wine translates Windows API calls into POSIX calls on-the-fly,
> +	  eliminating the performance and memory penalties of other methods.
> +
> +	  http://www.winehq.org
> +
> +comment "Wine needs a toolchain w/ IPv6, threads"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS

You need to take into account the uClibc issue here, by adding
something like:

	wine needs an (e)glibc toolchain w/ IPv6, threads

Of course assuming what you need is glibc only.

Also, lowercase "wine".

> diff --git a/package/wine/wine.mk b/package/wine/wine.mk
> new file mode 100644
> index 0000000..ce91587
> --- /dev/null
> +++ b/package/wine/wine.mk
> @@ -0,0 +1,203 @@
> +################################################################################
> +#
> +# wine
> +#
> +################################################################################
> +
> +WINE_VERSION = 1.6.2
> +WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
> +WINE_SITE = http://source.winehq.org/git/wine.git/snapshot/
> +WINE_LICENSE = LGPLv2.1

Can you double check whether it's LGPLv2.1 or LGPLv2.1+ ?

> +WINE_LICENSE_FILES = COPYING.LIB
> +WINE_INSTALL_TARGET = YES
> +WINE_DEPENDENCIES = host-wine
> +WINE_CONF_OPTS += --disable-tests --with-wine-tools=../host-wine-$(WINE_VERSION)

Having the target wine poke directly inside the source directory of
host-wine isn't that great. Ideally, we should be able to remove the
source directory of a package immediately after it has been built. The
host wine package gets installed to $(HOST_DIR). Aren't the tools you
need also installed there? If not, then please add a comment above this
line that explains what is going on.

> +
> +ifeq ($(or $(BR2_aarch64),$(BR2_x86_64)),y)
> +WINE_CONF_OPTS += --enable-win64
> +endif

Your Config.in file only allows the wine package to be built on i386
and x86-64, so the aarch64 part seems superfluous here. So maybe just:

WINE_CONF_OPTS += $(if $(BR2_ARCH_IS_64),--enable-win64)

> +ifeq ($(BR2_PACKAGE_XORG7),y)
> +	WINE_CONF_OPTS += --with-x
> +	WINE_DEPENDENCIES += x11r7
> +else
> +	WINE_CONF_OPTS += --without-x
> +endif

There is no package named 'x11r7' in Buildroot, so clearly this hasn't
been tested.

Did you test all those optional dependencies? If not, then please
simply disable the ones you haven't tested (i.e force --without-<foo>
in WINE_CONF_OPTS). Developers interested in enabling more optional
dependencies can do so later on.

Other than that, looks good. Do you have a pointer to a simple
command-line only Windows program that we could potentially use to test
this wine package?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
