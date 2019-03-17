From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Mar 2019 09:57:32 +0100
Subject: [Buildroot] [PATCH v10 5/6] package/pkg-autotools.mk: Add
 PKG_GIR_EXTRA_LIBS_PATH variable
In-Reply-To: <20190206091531.104591-5-aduskett@gmail.com>
References: <20190206091531.104591-1-aduskett@gmail.com>
 <20190206091531.104591-5-aduskett@gmail.com>
Message-ID: <20190317085732.GA4361@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2019-02-06 04:15 -0500, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Some packages require passing an extra libs path to gobject-introspection
> in order to compile their respective typelib files. This allows users to
> specify a PKG_GIR_EXTRA_LIBS_PATH variable in the respective packages mk file
> that will then be passed on to the g-ir-scanner, allowing those directory paths
> to be indexed.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v10:
>   - Add this patch to the series.
> 
>  package/pkg-autotools.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 45de99356f..06021f95c1 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -162,6 +162,7 @@ endif
>  
>  $(2)_CONF_ENV			?=
>  $(2)_CONF_OPTS			?=
> +$(2)_GIR_EXTRA_LIBS_PATH	?=
>  $(2)_MAKE_ENV			?=
>  $(2)_MAKE_OPTS			?=
>  $(2)_INSTALL_OPTS                ?= install
> @@ -239,6 +240,8 @@ endef
>  endif
>  endif
>  
> +export GIR_EXTRA_LIBS_PATH=$$($$(PKG)_GIR_EXTRA_LIBS_PATH)

How can this even work?

The value of GIR_EXTRA_LIBS_PATH will be that of the last package
parsed, and this is robably not what you really intended.

If a package needs to pass extra environment variables, there is already
this (at least for most of our package infras, I believe):

    FOO_CONF_ENV
    FOO_MAKE_ENV

... which packages can set to add environment variables.

Regards,
Yann E. MORIN.

>  $(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
>  
>  ifeq ($$($(2)_AUTORECONF),YES)
> -- 
> 2.20.1
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
