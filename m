From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 17:46:38 +0100
Subject: [Buildroot] [PATCH v5 31/36] package/efl/libedbus: remove
	package
In-Reply-To: <1445720476-21517-32-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-32-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025164638.GC11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:01 +0200, Romain Naour spake thusly:
> Libedbus is now available in efl package.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Guess what? ;-)

Regards,
Yann E. MORIN.

> ---
> v5: remove libedbus directory
> v3: update legacy option for 2015.11
>     update help text
> ---
>  Config.in.legacy                 |  7 +++++++
>  package/efl/Config.in            |  1 -
>  package/efl/libedbus/Config.in   | 44 ----------------------------------------
>  package/efl/libedbus/libedbus.mk | 37 ---------------------------------
>  4 files changed, 7 insertions(+), 82 deletions(-)
>  delete mode 100644 package/efl/libedbus/Config.in
>  delete mode 100644 package/efl/libedbus/libedbus.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index e8b6579..bba5086 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -107,6 +107,13 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2015.11"
>  
> +config BR2_PACKAGE_LIBEDBUS
> +	bool "libedbus package has been removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_EFL
> +	help
> +	  The libedbus package has been removed with the efl bump to 1.15.
> +
>  config BR2_PACKAGE_LIBEFREET
>  	bool "libefreet package has been removed"
>  	select BR2_LEGACY
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index ba71705..3092c8f 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -20,7 +20,6 @@ source "package/efl/libeet/Config.in"
>  source "package/efl/libefl/Config.in"
>  source "package/efl/libevas/Config.in"
>  source "package/efl/libelementary/Config.in"
> -source "package/efl/libedbus/Config.in"
>  
>  endif # BR2_PACKAGE_EFL
>  
> diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
> deleted file mode 100644
> index 7e862d3..0000000
> --- a/package/efl/libedbus/Config.in
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -config BR2_PACKAGE_LIBEDBUS
> -	bool "libedbus"
> -	select BR2_PACKAGE_LIBEINA
> -	select BR2_PACKAGE_LIBECORE
> -	select BR2_PACKAGE_DBUS
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
> -	depends on BR2_USE_MMU # dbus
> -	help
> -	  E_Dbus is a set of wrappers around D-Bus APIs so they can be
> -	  easily used by EFL applications, automatically providing
> -	  Ecore/main loop integration, as well as Eina data types.
> -
> -	  http://trac.enlightenment.org/e/wiki/E_Dbus
> -
> -if BR2_PACKAGE_LIBEDBUS
> -
> -config BR2_PACKAGE_LIBEDBUS_BLUEZ
> -	bool "bluez support"
> -	depends on !BR2_STATIC_LIBS # bluez_utils
> -	depends on BR2_USE_WCHAR # bluez_utils -> glib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> glib2
> -	select BR2_PACKAGE_BLUEZ_UTILS
> -	help
> -	  Bluetooth support.
> -
> -comment "bluez support needs a toolchain w/ wchar, threads, dynamic library"
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> -
> -config BR2_PACKAGE_LIBEDBUS_CONNMAN
> -	bool "connman support"
> -	depends on BR2_PACKAGE_CONNMAN
> -	help
> -	  Connection manager support.
> -
> -config BR2_PACKAGE_LIBEDBUS_NOTIFY
> -	bool "notify support"
> -	help
> -	  Notify support.
> -
> -endif
> -
> -comment "libedbus needs a toolchain w/ threads"
> -	depends on BR2_USE_MMU
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
> deleted file mode 100644
> index 634ceaf..0000000
> --- a/package/efl/libedbus/libedbus.mk
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -################################################################################
> -#
> -# libedbus
> -#
> -################################################################################
> -
> -LIBEDBUS_VERSION = 1.7.10
> -LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
> -LIBEDBUS_SITE = http://download.enlightenment.org/releases
> -LIBEDBUS_LICENSE = BSD-2c
> -LIBEDBUS_LICENSE_FILES = COPYING
> -
> -LIBEDBUS_INSTALL_STAGING = YES
> -
> -LIBEDBUS_DEPENDENCIES = host-pkgconf dbus libeina libecore
> -
> -ifeq ($(BR2_PACKAGE_LIBEDBUS_BLUEZ),y)
> -LIBEDBUS_CONF_OPTS += --enable-ebluez
> -LIBEDBUS_DEPENDENCIES += bluez_utils
> -else
> -LIBEDBUS_CONF_OPTS += --disable-ebluez
> -endif
> -
> -ifeq ($(BR2_PACKAGE_LIBEDBUS_CONNMAN),y)
> -LIBEDBUS_CONF_OPTS += --enable-econnman0_7x
> -LIBEDBUS_DEPENDENCIES += connman
> -else
> -LIBEDBUS_CONF_OPTS += --disable-econnman0_7x
> -endif
> -
> -ifeq ($(BR2_PACKAGE_LIBEDBUS_NOTIFY),y)
> -LIBEDBUS_CONF_OPTS += --enable-enotify --disable-edbus-notify-test
> -else
> -LIBEDBUS_CONF_OPTS += --disable-enotify
> -endif
> -
> -$(eval $(autotools-package))
> -- 
> 2.4.3
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
