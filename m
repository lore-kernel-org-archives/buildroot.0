From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jun 2019 21:21:02 +0200
Subject: [Buildroot] [PATCHv2] meson: add per package optional
 compiler/linker flags
In-Reply-To: <20190622202046.21817-1-yann.morin.1998@free.fr>
References: <20190622202046.21817-1-yann.morin.1998@free.fr>
Message-ID: <20190623192102.GK13664@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2019-06-22 22:20 +0200, Yann E. MORIN spake thusly:
> From: Peter Seiderer <ps.report@gmx.net>
> Add LIBFOO_CFLAGS, LIBFOO_LDFLAGS and LIBFOO_CXXFLAGS variables to allow
> packages to provide their own flags, possibly overriding the generic
> ones entirely, like we allow for other infras.
[--SNIP--]
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 886fcf7205..807b578219 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -57,6 +57,14 @@ $(2)_NINJA_ENV		?=
>  ifndef $(2)_CONFIGURE_CMDS
>  ifeq ($(4),target)
>  
> +$(2)_CFLAGS ?= $$(TARGET_CFLAGS)
> +$(2)_LDFLAGS ?= $$(TARGET_LDFLAGS)
> +$(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
> +
> +$(2)_MESON_SED_CFLAGS = $(if $($(2)_CFLAGS),`printf '"%s"$$(comma) ' $($(2)_CFLAGS)`)
> +$(2)_MESON_SED_LDFLAGS = $(if $($(2)_LDFLAGS),`printf '"%s"$$(comma) ' $($(2)_LDFLAGS)`)
> +$(2)_MESON_SED_CXXFLAGS = $(if $($(2)_CXXFLAGS),`printf '"%s"$$(comma) ' $$($$(2)_CXXFLAGS)`)

Gah... During my experimenting, I dropped the double-dollar in some
places, above. Damn...

I'll son respin, taking Thomas' comments into account.

Sorry for the noise...


Regards,
Yann E. MORIN.

> +
>  # Configure package for target
>  #
>  #
> @@ -67,9 +75,9 @@ define $(2)_CONFIGURE_CMDS
>  	    -e "s%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
>  	    -e "s%@TARGET_CPU@%$$(GCC_TARGET_CPU)%g" \
>  	    -e "s%@TARGET_ENDIAN@%$$(call LOWERCASE,$$(BR2_ENDIAN))%g" \
> -	    -e "s%@TARGET_CFLAGS@%$$(HOST_MESON_SED_CFLAGS)%g" \
> -	    -e "s%@TARGET_LDFLAGS@%$$(HOST_MESON_SED_LDFLAGS)%g" \
> -	    -e "s%@TARGET_CXXFLAGS@%$$(HOST_MESON_SED_CXXFLAGS)%g" \
> +	    -e "s%@TARGET_CFLAGS@%$$($(2)_MESON_SED_CFLAGS)%g" \
> +	    -e "s%@TARGET_LDFLAGS@%$$($(2)_MESON_SED_LDFLAGS)%g" \
> +	    -e "s%@TARGET_CXXFLAGS@%$$($(2)_MESON_SED_CXXFLAGS)%g" \
>  	    -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
>  	    package/meson/cross-compilation.conf.in \
>  	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
