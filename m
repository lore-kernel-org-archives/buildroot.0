From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 May 2020 07:15:08 +0200
Subject: [Buildroot] [PATCH] package/openvpn: add option to use mbed TLS
 instead of OpenSSL
In-Reply-To: <CACm0Nn2ZFPuHKQoCh5pdakeHh80q-4nzt1umH0A5Rbon_ktgZw@mail.gmail.com>
References: <20200511223108.4184-1-edo.rus@gmail.com>
 <20200515221042.011b8d33@windsurf.home>
 <CACm0Nn2ZFPuHKQoCh5pdakeHh80q-4nzt1umH0A5Rbon_ktgZw@mail.gmail.com>
Message-ID: <20200518071508.5c8f134c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ed,

On Mon, 18 May 2020 04:45:35 +0300
Ed Spiridonov <edo.rus@gmail.com> wrote:

> In the case proposed by you, OpenSSL is selected automagically without
> ability to unselect (until mbed?TLS is selected manually).
> How can the user find out that mbed?TLS could be used instead of OpenSSL?
> Press help on OpenVPN item? Kconfig shows dependencies here, but not a
> condition (if !BR2_PACKAGE_MBEDTLS).
> Look into package/openvpn/Config.in?
> Of course, detailed explanation could be added into OpenVPN help. But
> nobody reads help for *all* selected items.

All what you're saying here is valid for a huge number of packages
where Buildroot automatically makes use of optional dependencies if
they are available.

For example:

ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
LIBGTK3_CONF_OPTS += --enable-xrandr
LIBGTK3_DEPENDENCIES += xlib_libXrandr
else
LIBGTK3_CONF_OPTS += --disable-xrandr
endif

libgtk3 will automatically have xrandr support when
BR2_PACKAGE_XLIB_LIBXRANDR is enabled. The user has no way to "know"
about it, except by reading libgtk3.mk.

But this allows to limit the number of Config.in options we have. We
already have thousands of them, and if we were to add such options for
each optional dependency of all packages, we would have tens of
thousands of Config.in options.

There are however some packages where we add explicit sub-options, for
various reasons, but that is not the general case.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
