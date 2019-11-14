From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Nov 2019 22:55:50 +0100
Subject: [Buildroot] [PATCH 2/2] package/neardal: unconditionally use
 libedit
In-Reply-To: <20191114212013.29398-2-peter@korsgaard.com>
References: <20191114212013.29398-1-peter@korsgaard.com>
 <20191114212013.29398-2-peter@korsgaard.com>
Message-ID: <20191114215550.GG26360@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-11-14 22:20 +0100, Peter Korsgaard spake thusly:
> neardal is licensed under LGPL-2.0, which is (most likely) not license
> compatible with readline (GPL-3.0+), so always use the libedit backend.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Both applied to master, thanks.

As discussed on IRC, I've expanded this commit log to explain how libedit
gets used and not readline.

Regards,
Yann E. MORIN.

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
> index b56ce3b3a3..28e2850e30 100644
> --- a/package/neardal/neardal.mk
> +++ b/package/neardal/neardal.mk
> @@ -10,17 +10,9 @@ NEARDAL_INSTALL_STAGING = YES
>  NEARDAL_LICENSE = LGPL-2.0
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
