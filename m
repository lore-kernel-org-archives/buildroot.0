From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Jan 2015 00:35:49 +0100
Subject: [Buildroot] [PATCH try 4] wine: New package
In-Reply-To: <54BED214.6080601@dawncrow.de>
References: <54BED214.6080601@dawncrow.de>
Message-ID: <20150121233549.GN4375@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr?, All,

On 2015-01-20 23:09 +0100, Andr? Hentschel spake thusly:
> Adds new package: wine

Sorry for jumoing late in the wagon, but here are some minor comments...

[--SNIP--]
> diff --git a/package/wine/Config.in b/package/wine/Config.in
> new file mode 100644
> index 0000000..e8e2091
> --- /dev/null
> +++ b/package/wine/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_WINE
> +	bool "wine"
> +	depends on BR2_INET_IPV6
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
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
> +comment "wine needs a (e)glibc toolchain w/ IPv6, threads"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_TOOLCHAIN_BUILDROOT

Did you forget to remove that dependency for the comment?

> +	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
> diff --git a/package/wine/wine.hash b/package/wine/wine.hash
> new file mode 100644
> index 0000000..7ffc45e
> --- /dev/null
> +++ b/package/wine/wine.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 0f46dd29b278a3352206b49680f0ac3bfa107e65cb40cb4af51c137f0ebeb271 wine-1.6.2.tar.bz2
> diff --git a/package/wine/wine.mk b/package/wine/wine.mk
> new file mode 100644
> index 0000000..96afcb6
> --- /dev/null
> +++ b/package/wine/wine.mk
> @@ -0,0 +1,270 @@
> +################################################################################
> +#
> +# wine
> +#
> +################################################################################
> +
> +WINE_VERSION = 1.6.2
> +WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
> +WINE_SITE = http://source.winehq.org/git/wine.git/snapshot/
> +WINE_LICENSE = LGPLv2.1+
> +WINE_LICENSE_FILES = COPYING.LIB
> +WINE_INSTALL_TARGET = YES
> +WINE_DEPENDENCIES = host-wine
> +HOST_WINE_DEPENDENCIES = host-bison host-flex
> +
> +# Wine needs its own directory structure and tools for cross compiling
> +WINE_CONF_OPTS = \
> +	--with-wine-tools=../host-wine-$(WINE_VERSION) \
> +	--disable-tests \
> +	--without-opengl \
> +	$(if $(BR2_ARCH_IS_64),--enable-win64)
> +
> +# Wine needs the host tupel of the external toolchain for cross compiling
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT),)
> +	WINE_CONF_OPTS += --host=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
> +endif

I know this has already been discussed at length on the list, but it
really warrants a bit more explanations here.

> +ifeq ($(BR2_PACKAGE_CUPS),y)
> +	WINE_CONF_OPTS += --with-cups
> +	WINE_DEPENDENCIES += cups
> +else
> +	WINE_CONF_OPTS += --without-cups
> +endif

I do appreciate that you did all that work to enable/disable optional
features. That's a great work! :-)

However, for very complex packages, my opinion is that it is much
simpler to review and test (and write!) a new complex package with
everything disabled. It makes for smaller patches to review, and faster
builds to test. Then, new features can be added one by one in subsequent
patches, once the core has been upstreamed.

Note that I do not ask you to remove that, jsut keep it. Just suggesting
that in case you're fool^Wbold enough to try packaging some other big
stuff  in the future! Hehe! ;-)

[--SNIP--]
> +HOST_WINE_CONF_OPTS += \
> +	--disable-tests \
> +	--disable-win16 \
[--SNIP--]
> +	--without-xxf86vm \
> +	--without-zlib

Like you disabled everthing here.

> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))

I haven't much more to say, I'll try to have some time this WE to have a
further look.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
