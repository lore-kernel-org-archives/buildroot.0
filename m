From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Sep 2012 12:17:56 +0200
Subject: [Buildroot] [PATCH 10/11] toolchain/common: introduce blind
	options BR2_NEEDS_GETTEXT{, _IF_LOCALE}
In-Reply-To: <1346709781-18158-11-git-send-email-yann.morin.1998@free.fr>
References: <1346709781-18158-1-git-send-email-yann.morin.1998@free.fr>
 <1346709781-18158-11-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAHXCMM+mmUiE-6JiVzgCjixSM2gUotQQDKuUUGX+UhZqvzHuDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

Comments inlined.

2012/9/4 Yann E. MORIN <yann.morin.1998@free.fr>:
> Introduce two new blind config options:
>   - BR2_NEEDS_GETTEXT
>         selects the gettext package if the toolchain does not provide it
>   - BR2_NEEDS_GETTEXT_IF_LOCALE
>         ditto, but only if locales are enabled
>
> Packages can then select either if they require gettext (resp. if locales
> are enabled).
>
> This will simplify the packages Config.in by no longer requiring that the
> 'select' be conditional, thus hiding the gory details out of packages,
> which don't really need to know about those details.
>
> Also, introduce four new Makefile variables:
>   - $(gettext)
>         contains the needed dependencies for pacakges that need gettext
>         functioanlity: 'gettext' if the gettext pacakge is needed, empty
>         otherwise
>   - $(gettext-if-locale)
>         ditto, but only if locales are enabled
>   - $(gettext-LDFLAGS)
>         contains the required LDFLAGS ("-lintl") if gettext is provided by
>         the gettext package, empty otherwise

If the toolchain has not locale/i18n support, then the '--disable-nls'
option is passed to gettext, so libinlt is not built (nor installed).
In such case, if $(gettext-LDFLAGS) provides '-lintl', this would
certainly lead to some link (or configure) error.

>   - $(gettext-LDFLAGS-if-locale)
>         ditto, but only if locales are enabled

IMO, '-lintl' should only be added to the LDFLAGS in this case
(gettext and locale/i18n support enabled).

>
> Packages can then add either variable to their own LDFLAGS.
>
> Note: those new options and variables are going to be used in the next
> patch, for now they are a no-op.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> CC: Samuel Martin <s.martin49@gmail.com>
> ---
>  Makefile                                |    1 +
>  docs/manual/adding-packages-gettext.txt |   55 +++++++++++++++++++++++-------
>  toolchain/toolchain-common.in           |   10 +++++-
>  toolchain/toolchain-common.mk           |   35 +++++++++++++++++++
>  4 files changed, 87 insertions(+), 14 deletions(-)
>  create mode 100644 toolchain/toolchain-common.mk
>

[...]
> diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.txt
> index 71da62a..ad5b7af 100644
> --- a/docs/manual/adding-packages-gettext.txt
> +++ b/docs/manual/adding-packages-gettext.txt
> @@ -18,23 +18,52 @@ is enabled.
>
>  Therefore, Buildroot defines two configuration options:
>
> -* +BR2_NEEDS_EXTERNAL_GETTEXT+, which is true as soon as the toolchain doesn't
> -  provide its own gettext implementation
> +* +BR2_NEEDS_GETTEXT+, which a package **must** +select+ in its +Config.in+,
> +  to indicate it requires gettext functionality
>
> -* +BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE+, which is true if the toolchain
> -  doesn't provide its own gettext implementation and if locale support
> -  is enabled
> +* +BR2_NEEDS_GETTEXT_IF_LOCALE+, which a package **must** +select+ in its
> +  +Config.in+, to indicate it requires gettext functionality if locales
> +  are enabled
>
> -Therefore, packages that unconditionally need gettext should:
> +Buildroot also defines four +Makefile+ variables:
>
> -* Use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT+
> +* +$(gettext)+, that a package **must** add to its dependency list if it
> +  requires gettext functionality
>
> -* Use +$(if $(BR2_NEEDS_EXTERNAL_GETTEXT),gettext)+ in the package
> -  +DEPENDENCIES+ variable
> +* +$(gettext-if-locale)+, that a package **must** add to its dependency
> +  list if it requires gettext functionality if locales are enabled
>
> -Packages that need gettext only when locale support is enabled should:
> +* +$(gettext-LDFLAGS)+, that a package ___can___ add to its +LDFLAGS+ if it
> +  requires gettext functionality
>
> -* Use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE+
> +* +$(gettext-LDFLAGS-if-locale)+, that a package ___can___ add to its
> +  +LDFLAGS+ if it requires gettext functionality if locales are enabled
>
> -* Use +$(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)+ in the package
> -  +DEPENDENCIES+ variable
> +Example +Config.in+ excerpts for two packages:
> +
> +----
> +config BR2_PACKAGE_FOO
> +       bool "foo"
> +       select BR2_NEEDS_GETTEXT
> +----
> +----
> +config BR2_PACKAGE_BAR
> +       bool "bar"
> +       select BR2_NEEDS_GETTEXT_IF_LOCALE
> +----
> +
> +And the corresponding excerpts from their +.mk+ files:
> +
> +----
> +FOO_DEPENDENCIES += $(gettext)
> +FOO_LDFLAGS += $(gettext-LDFLAGS)
> +----
> +----
> +BAR_DEPENDENCIES += $(gettext-if-locale)
> +BAR_CONF_ENV += LIBS="$(gettext-LDFLAGS-if-locale)"
> +----
> +
> +___**Note:**___ The two Makefile variable +$(gettext-LDFLAGS)+ and
> ++$(gettext-LDFLAGS-if-locale)+ should be used **only** if the package's
> +build-system does not automatically detects that linking with +-lint+ is
> +needed.

If a package unconditionally needs locale support, then we should
certainly document the dependency to BR2_ENABLE_LOCALE.
What do you think about this?


-- 
Sam
