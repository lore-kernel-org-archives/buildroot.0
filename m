From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Jul 2014 15:03:26 +0200
Subject: [Buildroot] [PATCH 20/20 v3] package/xserver_xorg-server: needs
 libudev, not a udev daemon
In-Reply-To: <XnsA3778AD689B30berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <cover.1405777634.git.yann.morin.1998@free.fr>
 <7964be0c75358121baa69301d23eb93d72a64db9.1405777634.git.yann.morin.1998@free.fr>
 <XnsA3777C2F4BB23berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <XnsA3778AD689B30berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20140727130326.GB3895@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-07-27 13:38 +0200, Bernd Kuhls spake thusly:
> Bernd Kuhls <bernd.kuhls@t-online.de> wrote in 
> news:XnsA3777C2F4BB23berndkuhlsPkbjNfxxIA at bernd-kuhls.de:
> 
> > Luckily enough xserver_xorg-server does not depend on udev/hal, configure 
> > just prints:
> > 
> > configure: WARNING:
> >              ***********************************************
> >              Neither HAL nor udev backend will be enabled.
> >              Input device hotplugging will not be available!
> >              ***********************************************
> > 
> > which is fine for me, everything works good without udev/hal ;)
> 
> Hi,
> 
> a small, but important addition: To avoid xserver_xorg-server picking up 
> libudev when the udev daemon is disabled this patch is needed for 
> xserver_xorg-server.mk:
> 
> @@ -134,6 +134,7 @@
>  XSERVER_XORG_SERVER_CONF_OPT += --disable-config-udev-kms
>  endif
>  else
> +XSERVER_XORG_SERVER_CONF_OPT += --disable-config-udev
>  ifeq ($(BR2_PACKAGE_DBUS),y)
>  XSERVER_XORG_SERVER_DEPENDENCIES += dbus
>  XSERVER_XORG_SERVER_CONF_OPT += --enable-config-dbus

So, we can make this package work in the three cases:
  - _HAS_UDEV (implies _HAS_LIBUDEV)
  - _HAS_LIBUDEV && !_HAS_UDEV
  - !_HAS_LIBUDEV

Correct?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
