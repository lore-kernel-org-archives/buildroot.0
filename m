From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Sep 2015 20:35:16 +0200
Subject: [Buildroot] [PATCH v3 4/4] package/rpm: add host variant
In-Reply-To: <1441293831-3524-4-git-send-email-james.knight@rockwellcollins.com>
References: <1441293831-3524-1-git-send-email-james.knight@rockwellcollins.com>
 <1441293831-3524-4-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20150903183516.GF3607@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

Just a quick review about things I spotted with a superficial review...

On 2015-09-03 11:23 -0400, James Knight spake thusly:
> The following adds support for a host variant of the rpm package. This
> support will allow a host system to setup/manipulate a target system's
> initial RPM database during the post-build phase.
[--SNIP--]
> diff --git a/package/rpm/Config.in.host b/package/rpm/Config.in.host
> new file mode 100644
> index 0000000..3c15bd4
> --- /dev/null
> +++ b/package/rpm/Config.in.host
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HOST_RPM
> +	bool "host rpm"
> +	select BR2_PACKAGE_HOST_BEECRYPT
> +	select BR2_PACKAGE_HOST_BERKELEYDB

There are no BR2_PACKAGE_HOST_BEECRYPT or BR2_PACKAGE_HOST_BERKELEYDB
symbols.

Host packages only have symbols when they are user-selectable, which is
not the case for bdb or beecrypt.

Simply depending on them in the .mk is sufficient, and is the way to go
for a dependency on a host library (like bdb and beecrypt are).

> +	help
> +	  The RPM Package Manager (RPM).
> +
> +	  http://www.rpm.org/
> diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
> index adf408e..6de3e63 100644
> --- a/package/rpm/rpm.mk
> +++ b/package/rpm/rpm.mk
> @@ -9,10 +9,11 @@ RPM_VERSION = $(RPM_VERSION_MAJOR).0.1
>  RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
>  RPM_SITE = http://rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
>  RPM_DEPENDENCIES = host-pkgconf berkeleydb file popt zlib
> +HOST_RPM_DEPENDENCIES = host-pkgconf host-beecrypt host-berkeleydb host-popt
>  RPM_LICENSE = GPLv2
>  RPM_LICENSE_FILES = COPYING
>  
> -RPM_CONF_OPTS += \
> +RPM_CONFIGURE_ARGS = \

Same comment as for beecrypt: you do not need an intermediate variable,
just re-use the target variable when defining the host variable; also
there is no need for '+=' since that the first (and only)) asignment to
that variable:

    RPM_CONF_OPTS = \
        --disable-largefile \
        --disable-rpath \
        [...]

    HOST_RPM_CONF_OPTS = \
        $(RPM_CONF_OPTS) \
        --with-beecrypt \
        --without-archive \
        [...]

Regards,
Yann E. MORIN.

>  	--disable-largefile \
>  	--disable-rpath \
>  	--enable-python=no \
> @@ -20,6 +21,18 @@ RPM_CONF_OPTS += \
>  	--with-gnu-ld \
>  	--without-hackingdocs
>  
> +RPM_CONF_OPTS += \
> +	$(RPM_CONFIGURE_ARGS)
> +
> +HOST_RPM_CONF_OPTS += \
> +	$(RPM_CONFIGURE_ARGS) \
> +	--with-beecrypt \
> +	--without-archive \
> +	--without-cap \
> +	--without-libintl-prefix \
> +	--without-lua \
> +	--without-selinux
> +
>  ifeq ($(BR2_PACKAGE_ACL),y)
>  RPM_DEPENDENCIES += acl
>  RPM_CONF_OPTS += --with-acl
> @@ -75,5 +88,8 @@ endif
>  
>  RPM_CONF_ENV += \
>  	CFLAGS="$(TARGET_CFLAGS) $(RPM_CONFIGURATION)"
> +HOST_RPM_CONF_ENV += \
> +	CFLAGS="$(HOST_CFLAGS) -I$(HOST_DIR)/usr/include/beecrypt"
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> -- 
> 1.9.5.msysgit.1
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
