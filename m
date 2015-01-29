From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Jan 2015 22:46:22 +0100
Subject: [Buildroot] [PATCH try 5] wine: New package
In-Reply-To: <54C2C70E.3020700@dawncrow.de>
References: <54C2C70E.3020700@dawncrow.de>
Message-ID: <20150129214622.GA4213@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andre, All,

On 2015-01-23 23:11 +0100, Andr? Hentschel spake thusly:
> Adds new package: wine
> 
>   Wine is a compatibility layer capable of running Windows applications on Linux.
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
> I hope i addressed all the comments in the correct manner
> try 2: Fix issue spotted by baruch
> try 3: Added comments, added hash file, fixed X11 check, depend on internal toolchain, added bison and flex to host dependencies
> try 4: instead of depending on internal toolchains add the expected tuple via --host
> try 5: Added 64-bit check for host-wine and restricted wine build to x86 for now. Also added more comments
> 
>  package/Config.in      |   1 +
>  package/wine/Config.in |  23 ++++
>  package/wine/wine.hash |   2 +
>  package/wine/wine.mk   | 278 +++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 304 insertions(+)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 5f6ebc2..db2c75a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1015,6 +1015,7 @@ menu "Miscellaneous"
>  	source "package/snowball-init/Config.in"
>  	source "package/sound-theme-borealis/Config.in"
>  	source "package/sound-theme-freedesktop/Config.in"
> +	source "package/wine/Config.in"

This is a minor comment, but I would have expected to see Wine in either
of those sub-menus, instead of "Miscellanous":
  - Audio and video applications
  - Graphic libraries and applications

I think it would fit nicely alongside X.org.

But this is really, really minor! ;-)

>  endmenu
> 
>  menu "Networking applications"
> diff --git a/package/wine/Config.in b/package/wine/Config.in
> new file mode 100644
> index 0000000..38036d4
> --- /dev/null
> +++ b/package/wine/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_WINE
> +	bool "wine"
> +	depends on BR2_INET_IPV6
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	# Wine only builds on certain architectures
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	# Wine has much CPU specific code and mostly makes sense on x86
> +	depends on BR2_i386

Well, x86_64 is not the same as i386 in Buildroot. So this makes Wine
really available only on i386 (the 32-bit variant).

Is that what you really wanted to do?

Otherwise, maybe change to:
    depends on BR2_i386 || BR2_x86_64

> +	help
> +	  Wine is a compatibility layer capable of running
> +	  Windows applications on Linux. Instead of simulating internal
> +	  Windows logic like a virtual machine or emulator,
> +	  Wine translates Windows API calls into POSIX calls on-the-fly,
> +	  eliminating the performance and memory penalties of other methods.

Formatting is a bit off. Try to get lines all about the same width.

> +	  http://www.winehq.org
> +
> +comment "wine needs a (e)glibc toolchain w/ IPv6, threads"
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on BR2_i386
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
> index 0000000..983c886
> --- /dev/null
> +++ b/package/wine/wine.mk
> @@ -0,0 +1,278 @@
> +################################################################################
> +#
> +# wine
> +#
> +################################################################################
> +
> +WINE_VERSION = 1.6.2
> +WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
> +WINE_SITE = http://source.winehq.org/git/wine.git/snapshot/

It looks like the official URL is on sourceforge, rather than using a
git snapshot, as seen on: https://www.winehq.org/download

    Location                Description
    sourceforge.net         Our official source release site.
    source.winehq.org/git   For the latest development version. 

So:

    WINE_SITE = http://downloads.sourceforge.net/project/wine/Source

> +WINE_LICENSE = LGPLv2.1+
> +WINE_LICENSE_FILES = COPYING.LIB

Adding the file LICENSE would be good, too. LICENSE.OLD is not
necessary, though.

> +WINE_INSTALL_TARGET = YES

Unneeded, that's the default.

> +WINE_DEPENDENCIES = host-wine
> +HOST_WINE_DEPENDENCIES = host-bison host-flex

So, you do not need host-bison or host-flex to build the target variant?
After looking at configure.ac, yes you do. So:

    WINE_DEPENDENCIES = host-bison host-flex host-wine

should be enough, no need to specify HOST_WINE_DEPENDENCIES, they are
derived from the target dependencies, so will end up with the correct
value.

> +# Wine needs to enable 64-bit build tools on 64-bit host
> +ifeq ($(HOSTARCH),x86_64)
> +	HOST_WINE_CONF_OPTS += --enable-win64
> +endif
> +
> +# Wine needs its own directory structure and tools for cross compiling
> +WINE_CONF_OPTS = \
> +	--with-wine-tools=../host-wine-$(WINE_VERSION) \
> +	--disable-tests \
> +	--disable-win64 \

So, I've had a look at what --{en,dis}able-win64 means. From what I
understand, if you --enable-win64, you get a 64-bit-only build,
incapable of running win32 binaries. Conversely, if you --disable-win64,
you get a 32-bit-only build, incapable of running win64 binaries.

Right?

That's a bit unfortunate, since on a 64-bit target, it might well be
legit for a user to want to run win32 *and* win64 binaries. But it is
not possible to ahve Wine build both at the same time. Pity... :-(

> +	--without-opengl
> +
> +# Wine needs the host tuple of the external toolchain for cross compiling,
> +# otherwise it calls e.g. non-existing i586-buildroot-linux-gnu-gcc while
> +# actually it should look for e.g. i686-pc-linux-gnu-gcc
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT),)

We prefer positive logic:
    ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)

> +	WINE_CONF_OPTS += --host=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
> +endif

Sorry, I still do not understand what happens here...

I commented those lines, and I observed this:

    [...]
    checking for i586-buildroot-linux-gnu-gcc... /home/ymorin/dev/buildroot/O/host/usr/bin/i686-pc-linux-gnu-gcc
    [...]
    checking for i586-buildroot-linux-gnu-ar... /home/ymorin/dev/buildroot/O/host/usr/bin/i686-pc-linux-gnu-ar
    checking for i586-buildroot-linux-gnu-ranlib... /home/ymorin/dev/buildroot/O/host/usr/bin/i686-pc-linux-gnu-ranlib
    [...]
    checking how to run the C preprocessor... /home/ymorin/dev/buildroot/O/host/usr/bin/i686-pc-linux-gnu-cpp
    [...]
    checking for i586-buildroot-linux-gnu-readelf... /home/ymorin/dev/buildroot/O/host/usr/bin/i686-pc-linux-gnu-readelf
    [...]

... which seems pretty much what we would expect.

Oh... Then it fails at build time, because of that fscking wrapper to
gcc. Damn.

Ok, so here it goes:

  - wine uses a wrapper around gcc
  - at configure time, it uses the value from --host and passes it as-is
    to the gcc wrapper
  - the gcc wrapper uses that variable to generate the gcc name

and we end up with errors like:
    ../../../host-wine-1.6.2/tools/winegcc/winegcc -b i586-buildroot-linux-gnu [...]
    winebuild: cannot find suitable name lister

Bummer... :-(

But I found an alternative that I like a bit more:

    # Wine uses a wrapper around gcc, and uses the value of --host to
    # construct the filename of the gcc to call.
    # But for external toolchains, we may have a discrepancy between the
    # tuple, GNU_TARGET_NAME, that we construct from our internal
    # variables, and the gcc prefix for the external toolchain.
    # So, we have to iverride whatever the gcc wrapper believes what the
    # reall gcc is named, and force the tuple of the external toolchain,
    # not the one we compute in GNU_TARGET_NAME.
    ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
        WINE_CONF_OPTS += TARGETFLAGS="-b $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))"
    endif

This allows us to keep our stndard --host value, and just overrides the
-b option passed to the gcc wrapper.

Care to test that on your side, please?

[--SNIP--]

Ok, tested with ths defconfig, and the few tweaks I mentioned above.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
