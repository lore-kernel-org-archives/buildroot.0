From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Apr 2014 22:16:10 +0200
Subject: [Buildroot] [RFC] pkg-autotools: check if host-pkgconf should
 be part of the dependencies
In-Reply-To: <1398105498-7055-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1398105498-7055-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140421201610.GJ3359@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-04-21 20:38 +0200, Thomas Petazzoni spake thusly:
> There is a good number of autotools-based packages that use the
> PKG_CHECK_MODULES() in their configure.{ac,in} file, and the presence
> of this macro indicates that the package should depend on
> host-pkgconf. However, we very often fail at adding this dependency,
> and discover later that it is necessary.
> 
> In order to prevent that from happening, this commit proposes to add a
> post-patch hook that looks if PKG_CHECK_MODULES is used in the
> configure.{ac,in} file, and if it is, it verifies that host-pkgconf is
> part of the current package dependencies. If not, it aborts the build
> with an error message.
> 
> Note that adding this dependency cannot be done automatically, because
> by the time the makefiles are parsed, the source code for the packages
> are not extracted, so we can't look at configure.{in,ac} to
> automatically add the host-pkgconf dependency. The only thing we can
> do is what this patch does: a check during the build itself.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> This is purely an RFC patch, I just tested it on one package (the
> recently added 'smack' package), which was lacking this host-pkgconf
> dependency.

Well, I rather like it, except for a little nit, see below.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-autotools.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index a646612..842a7c3 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -230,6 +230,17 @@ $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
>  $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
>  endif
>  
> +define CHECK_PKG_CONFIG_HOOK
> +	$(Q)if grep -q PKG_CHECK_MODULES $$($$(PKG)_SRCDIR)/configure.{ac,in}; then \

I know we do not support building on anything but a GNU userland.
However, 'grep -q' is not portable. Can we just use the more poprtable
constrcut 'grep ... >/dev/null 2>&1' instead?

Regards,
Yann E. MORIN.

> +		if test -z "$$(filter host-pkgconf,$$($$(PKG)_DEPENDENCIES))" ; then \
> +			echo "ERROR: package $$(PKG) uses PKG_CHECK_MODULES but does not depend on host-pkgconf" ; \
> +			exit 1 ; \
> +		fi ; \
> +	fi
> +endef
> +
> +$(2)_POST_PATCH_HOOKS += CHECK_PKG_CONFIG_HOOK
> +
>  #
>  # Build step. Only define it if not already defined by the package .mk
>  # file.
> -- 
> 1.9.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
