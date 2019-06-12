From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Jun 2019 18:37:10 +0200
Subject: [Buildroot] [PATCH v6 1/2] meson: add per package optional
 compiler/linker flags
In-Reply-To: <20190423205302.14382-1-ps.report@gmx.net>
References: <20190423205302.14382-1-ps.report@gmx.net>
Message-ID: <20190612163710.GE2647@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-04-23 22:53 +0200, Peter Seiderer spake thusly:
> Add LIBFOO_MESON_CFLAGS, LIBFOO_MESON_LDFLAGS and LIBFOO_MESON_CXXFLAGS
> variables to allow per package additional compiler/linker flags.

So, this patch (or a variation based on it) is starting to get very much
needed to fix the build of libglib2:
    http://autobuild.buildroot.org/?reason=libglib2-2.60.3

I did not know about this patch, so I sent that one instead:
    https://patchwork.ozlabs.org/patch/1114211/

Of course, it looks like yours is better and I successfully used it to
fix the above issues. Wee! \o/

However, I have a few comments about it, see below...

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
[--SNIP--]
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index 49e27f5527..70128f6bad 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -60,6 +60,9 @@ define HOST_MESON_INSTALL_CROSS_CONF
>  	    -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)%g" \
>  	    -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)%g" \
>  	    -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)%g" \
> +	    -e "s%@PKG_TARGET_CFLAGS@%%g" \
> +	    -e "s%@PKG_TARGET_LDFLAGS@%%g" \
> +	    -e "s%@PKG_TARGET_CXXFLAGS@%%g" \

Actually, if someone wants to use that file outside of Buildroot, and
also happend to need to pass special C/LD/CXXFLAGS for their package,
how are they expected to do so? Can't we just install it as a template
too?

(But given that I don't like meson, I am OK that we don't want to offer
this to external users and just decide to leave them out in the cold,
where they belong. OK, I'm out in the box for the next 5 minutes! ;-] 

>  	    -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
>  	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
>  	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 886fcf7205..9974b1e513 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -57,6 +57,10 @@ $(2)_NINJA_ENV		?=
>  ifndef $(2)_CONFIGURE_CMDS
>  ifeq ($(4),target)
> 
> +$(2)_MESON_SED_CFLAGS = $(if $($(2)_MESON_CFLAGS),`printf '"%s"$(comma) ' $($(2)_MESON_CFLAGS)`)
> +$(2)_MESON_SED_LDFLAGS = $(if $($(2)_MESON_LDFLAGS),`printf '"%s"$(comma) ' $($(2)_MESON_LDFLAGS)`)
> +$(2)_MESON_SED_CXXFLAGS = $(if $($(2)_MESON_CXXFLAGS),`printf '"%s"$(comma) ' $$($$(2)_MESON_CXXFLAGS)`)

There are two things I am not too fond about those variables:

1. for the other package infras, when a package wants to pass extra such
flags, the package is responsible for carrying the original TARGET_CFLAGS
(LD, CXX), and this is not automatic. With your path, this would make it
automatic for meson, thus diverging from the usual practice.

It also precludes packages from actualyl overriding the default flags,
like we currently have to do to override -ON for some packages under
mucroblaze for example.

2. The naming is not nice to me: why do we need to have "MESON" in the
variable name at all? Surely, fir the other infras, we just write things
like:
    FOO_CFLAGS = $(TARGET_CFLAGS) -DMY_STUFF
not:
    FOO_AUTOTOOLS_CFLAGS = $(TARGET_CFLAGS) -DMY_STUFF
    FOO_CMAKE_CFLAGS = $(TARGET_CFLAGS) -DMY_STUFF
    etc...

Regards,
Yann E. MORIN.

>  # Configure package for target
>  #
>  #
> @@ -70,6 +74,9 @@ define $(2)_CONFIGURE_CMDS
>  	    -e "s%@TARGET_CFLAGS@%$$(HOST_MESON_SED_CFLAGS)%g" \
>  	    -e "s%@TARGET_LDFLAGS@%$$(HOST_MESON_SED_LDFLAGS)%g" \
>  	    -e "s%@TARGET_CXXFLAGS@%$$(HOST_MESON_SED_CXXFLAGS)%g" \
> +	    -e "s%@PKG_TARGET_CFLAGS@%$$($$(PKG)_MESON_SED_CFLAGS)%g" \
> +	    -e "s%@PKG_TARGET_LDFLAGS@%$$($$(PKG)_MESON_SED_LDFLAGS)%g" \
> +	    -e "s%@PKG_TARGET_CXXFLAGS@%$$($$(PKG)_MESON_SED_CXXFLAGS)%g" \
>  	    -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
>  	    package/meson/cross-compilation.conf.in \
>  	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
> --
> 2.21.0
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
