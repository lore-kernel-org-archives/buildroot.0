From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 22 Jan 2015 00:07:46 +0100
Subject: [Buildroot] [PATCH try 4] wine: New package
In-Reply-To: <54BED214.6080601@dawncrow.de>
References: <54BED214.6080601@dawncrow.de>
Message-ID: <54C03142.4010105@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andr?,

Le 20/01/2015 23:09, Andr? Hentschel a ?crit :
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
> 
>  package/Config.in      |   1 +
>  package/wine/Config.in |  21 ++++
>  package/wine/wine.hash |   2 +
>  package/wine/wine.mk   | 270 +++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 294 insertions(+)
> 

[...]

> +
> +# To support freetype in wine we also need freetype in host-wine for the cross compiling tools
> +ifeq ($(BR2_PACKAGE_FREETYPE),y)
> +	WINE_CONF_OPTS += --with-freetype
> +	HOST_WINE_CONF_OPTS += --with-freetype
> +	WINE_DEPENDENCIES += freetype
> +	HOST_WINE_DEPENDENCIES += host-freetype
> +else
> +	WINE_CONF_OPTS += --without-freetype
> +	HOST_WINE_CONF_OPTS += --without-freetype
> +endif

I'm building your wine package on my 64bits host and the build fail
because freetype library in HOST_DIR is build for it, but wine is
build for 32bits host.

see my config.log output:
configure:10886: checking for -lfreetype
configure:10911: /usr/bin/gcc -m32 -o conftest -O2 -I/home/naourr/git/buildroot/test/wine/host/usr/include -I/home/naourr/git/buildroot/test/wine/host/usr/include -I/home/naourr/git/buildroot/test/wine/host/usr/include/freetype2   -L/home/naourr/git/buildroot/test/wine/host/lib -L/home/naourr/git/buildroot/test/wine/host/usr/lib -Wl,-rpath,/home/naourr/git/buildroot/test/wine/host/usr/lib conftest.c -lfreetype -L/home/naourr/git/buildroot/test/wine/host/usr/lib -lfreetype    >&5
/usr/bin/ld: skipping incompatible /home/naourr/git/buildroot/test/wine/host/usr/lib/libfreetype.so when searching for -lfreetype
/usr/bin/ld: skipping incompatible /home/naourr/git/buildroot/test/wine/host/usr/lib/libfreetype.so when searching for -lfreetype
/usr/bin/ld: skipping incompatible /usr/lib64/libfreetype.so when searching for -lfreetype
/usr/bin/ld: cannot find -lfreetype
/usr/bin/ld: skipping incompatible /home/naourr/git/buildroot/test/wine/host/usr/lib/libfreetype.so when searching for -lfreetype
/usr/bin/ld: skipping incompatible /home/naourr/git/buildroot/test/wine/host/usr/lib/libfreetype.so when searching for -lfreetype
/usr/bin/ld: skipping incompatible /usr/lib64/libfreetype.so when searching for -lfreetype
/usr/bin/ld: cannot find -lfreetype
collect2: error: ld returned 1 exit status

It seems that --enable-win64 must be added to HOST_WINE_CONF_OPTS
for 64bits host.

Best regards,
Romain Naour

[...]
