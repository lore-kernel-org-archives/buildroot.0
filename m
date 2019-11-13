From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 21:58:40 +0100
Subject: [Buildroot] [PATCH 09/11] package/neardal: unconditionally use
 libedit
In-Reply-To: <20191113151724.12155-10-peter@korsgaard.com>
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-10-peter@korsgaard.com>
Message-ID: <20191113205840.GO3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-11-13 16:17 +0100, Peter Korsgaard spake thusly:
> neardal is licensed under GPL-2.0, which is not license compatible with

neardal is not GPL-2.0; it is LGPL-2.0:

    https://github.com/connectivity/neardal/blob/master/COPYING

LGPL-2.1 can be "promoted" to be GPLv3-compatible:

    https://en.wikipedia.org/wiki/License_compatibility#Compatibility_of_FOSS_licenses

But I could not find anything about LGPL-2.0...

Regards,
Yann E. MORIN.

> readline (GPL-3.0+), so always use the libedit backend.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/neardal/Config.in  |  2 +-
>  package/neardal/neardal.mk | 10 +---------
>  2 files changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/package/neardal/Config.in b/package/neardal/Config.in
> index c729283380..5f33ae4953 100644
> --- a/package/neardal/Config.in
> +++ b/package/neardal/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_NEARDAL
>  	depends on BR2_USE_MMU # dbus
>  	select BR2_PACKAGE_DBUS
>  	select BR2_PACKAGE_DBUS_GLIB
> -	select BR2_PACKAGE_READLINE if !BR2_PACKAGE_LIBEDIT
> +	select BR2_PACKAGE_LIBEDIT
>  	help
>  	  Provides a simple C API to exchange data with the neard NFC
>  	  manager daemon.
> diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
> index ea9643244e..cc82e7f20f 100644
> --- a/package/neardal/neardal.mk
> +++ b/package/neardal/neardal.mk
> @@ -10,17 +10,9 @@ NEARDAL_INSTALL_STAGING = YES
>  NEARDAL_LICENSE = GPL-2.0
>  NEARDAL_LICENSE_FILES = COPYING
>  
> -NEARDAL_DEPENDENCIES = host-pkgconf dbus dbus-glib
> +NEARDAL_DEPENDENCIES = host-pkgconf dbus dbus-glib libedit
>  NEARDAL_AUTORECONF = YES
>  
> -# Either readline or libedit are needed, and the Config.in file
> -# guarantees at least one of them is enabled
> -ifeq ($(BR2_PACKAGE_READLINE),y)
> -NEARDAL_DEPENDENCIES += readline
> -else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
> -NEARDAL_DEPENDENCIES += libedit
> -endif
> -
>  define NEARDAL_INSTALL_NCL
>  	$(INSTALL) -m 0755 -D $(@D)/ncl/ncl $(TARGET_DIR)/usr/bin/ncl
>  endef
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
