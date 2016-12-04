From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Dec 2016 22:24:34 +0100
Subject: [Buildroot] [PATCH 2/3] core: waf-package infra: add missing
 additional variables for each build step
In-Reply-To: <1480885126-517-2-git-send-email-romain.naour@gmail.com>
References: <1480885126-517-1-git-send-email-romain.naour@gmail.com>
 <1480885126-517-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20161204212433.GC3433@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-12-04 21:58 +0100, Romain Naour spake thusly:
> Some waf packages may want to pass additional variables to waf script
> in each build step. Add the possibility to do so by defining the
> following variables:
>   <pkg>_MAKE_OPTS for the build step
>   <pkg>_INSTALL_STAGING_OPTS for the install to staging directory
>   <pkg>_INSTALL_TARGET_OPTS for the install to target directory
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/pkg-waf.mk | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
> index 908ac03..97e2e6a 100644
> --- a/package/pkg-waf.mk
> +++ b/package/pkg-waf.mk
> @@ -72,7 +72,8 @@ endif
>  ifndef $(2)_BUILD_CMDS
>  define $(2)_BUILD_CMDS
>       cd $$(@D) && \
> -     $$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) build -j $$(PARALLEL_JOBS)
> +     $$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
> +             build -j $$(PARALLEL_JOBS) $$($(2)_MAKE_OPTS)

I'm not against having variables named the same across packages, but
here I think $(2)_BUILD_OPTS would be more appropriate.

>  endef
>  endif
>
> @@ -84,7 +85,8 @@ ifndef $(2)_INSTALL_STAGING_CMDS
>  define $(2)_INSTALL_STAGING_CMDS
>       cd $$(@D) && \
>       $$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
> -             install --destdir=$$(STAGING_DIR)
> +             install --destdir=$$(STAGING_DIR) \
> +             $$($(2)_INSTALL_STAGING_OPTS)

Usually, those options entirely override the default ones. For example,
if you provide FOO_INSTALL_STAGING_OPTS for an autotools package, then
the default (just 'install') is lost:

    package/pkg-autotools.mk:
    159 $(2)_INSTALL_STAGING_OPTS?  ?= DESTDIR=$$(STAGING_DIR) install

OTOH, I find this to be counter-intuitive for a user, and I would prefer
the options to add rather than replace.

But consistency trumps it all, so we should do the same for waf
packages:

    $(2)_INSTALL_STAGING_OPTS ?= install --destdir=$$(STAGING_DIR)

>  endef
>  endif
>
> @@ -96,7 +98,8 @@ ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
>       cd $$(@D) && \
>       $$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
> -             install --destdir=$$(TARGET_DIR)
> +             install --destdir=$$(TARGET_DIR) \
> +             $$($(2)_INSTALL_TARGET_OPTS)

Ditto.

Regards,
Yann E. MORIN.

>  endef
>  endif
>
> --
> 2.5.5
>

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
