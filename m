From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Feb 2015 23:09:54 +0100
Subject: [Buildroot] [PATCH v6] wine: New package
In-Reply-To: <54E5058A.8080906@dawncrow.de>
References: <54E5058A.8080906@dawncrow.de>
Message-ID: <20150218220954.GA19555@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andre, All,

On 2015-02-18 22:35 +0100, Andr? Hentschel spake thusly:
> Adds new package: wine
[--SNIP--]
> diff --git a/package/wine/wine.mk b/package/wine/wine.mk
> new file mode 100644
> index 0000000..387ee5d
> --- /dev/null
> +++ b/package/wine/wine.mk
> @@ -0,0 +1,292 @@
> +################################################################################
> +#
> +# wine
> +#
> +################################################################################
> +
> +WINE_VERSION = 1.6.2
> +WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
> +WINE_SITE = http://downloads.sourceforge.net/project/wine/Source/
> +WINE_LICENSE = LGPLv2.1+
> +WINE_LICENSE_FILES = COPYING.LIB LICENSE
> +WINE_DEPENDENCIES = host-bison host-flex host-wine
> +
> +# Wine needs to enable 64-bit build tools on 64-bit host
> +ifeq ($(HOSTARCH),x86_64)
> +	HOST_WINE_CONF_OPTS += --enable-win64
> +endif

Please, keep all host-related stuff together. In this patch, you have
some configure options here and at the end, and build+install commands
here. Just move evrything host-related together (preferrably at the
bottom of the file).

> +# Wine only needs the host tools to be built, so cut-down the
> +# build time by building just what we need.
> +HOST_WINE_BUILD_CMDS = \
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +	tools \
> +	tools/widl \
> +	tools/winebuild \
> +	tools/winegcc \
> +	tools/wmc \
> +	tools/wrc

We use macros to define build commands:

    define HOST_WINE_BUILD_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
            tools \
            tools/widl \
            tools/winebuild \
            tools/winegcc \
            tools/wmc \
            tools/wrc
    endef

Why TARGET_MAKE_ENV? You should use HOST_MAKE_ENV, since you're building
a host package at that point.

Otherwise, looks good. I'm queueing that for further inspection + tests
this WE.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
