From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Feb 2020 21:35:56 +0100
Subject: [Buildroot] [PATCH 2/2] package/eudev: support openrc init
In-Reply-To: <20200227145123.5654-3-unixmania@gmail.com>
References: <20200227145123.5654-1-unixmania@gmail.com>
 <20200227145123.5654-3-unixmania@gmail.com>
Message-ID: <20200227203556.GD8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2020-02-27 11:51 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> Select udev-gentoo-scripts and avoid installing the sysv init script.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/eudev/Config.in | 1 +
>  package/eudev/eudev.mk  | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/eudev/Config.in b/package/eudev/Config.in
> index b1d2f37a72..b0ce76171a 100644
> --- a/package/eudev/Config.in
> +++ b/package/eudev/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_EUDEV
>  	depends on BR2_USE_WCHAR # needs C99 compiler
>  	depends on !BR2_STATIC_LIBS # kmod
>  	select BR2_PACKAGE_HAS_UDEV
> +	select BR2_PACKAGE_UDEV_GENTOO_SCRIPTS if BR2_INIT_OPENRC
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>  	select BR2_PACKAGE_KMOD
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index 99b5befd09..abcabb343c 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -44,9 +44,13 @@ else
>  EUDEV_CONF_OPTS += --disable-selinux
>  endif
>  
> +# Avoid installing S10udev with openrc, as the service is started by a unit
> +# from the udev-gentoo-scripts package.
> +ifeq ($(BR2_INIT_OPENRC),)
>  define EUDEV_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
>  endef
> +endif

There is indeed no sane solution but a hack in this situation. However,
I prefer the previous version that defined a fake hook, so I reused that
instead (with a little tweak of yours from another comment! ;-) ).

Applied to next with that fixed. Thanks!

Regards,
Yann E. MORIN.

>  # Required by default rules for input devices
>  define EUDEV_USERS
> -- 
> 2.18.2
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
