From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Jun 2014 05:52:31 +0200
Subject: [Buildroot] libcec needs to be patched to provide a correct
	libcec.pc
References: <20140613212754.GB16169@free.fr>
Message-ID: <XnsA34C3BC43515berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:20140613212754.GB16169 at free.fr:

> Can you elaborate a bit on why and how we should patch libcec.pc,
> please?

when libcec finds libudev during configure 
output/staging/usr/lib/pkgconfig/libcec.pc will contain

Requires:  udev

When xbmc configure searches for libcec it finds this requirement and tries 
to find udev.pc, which fails when only libudev is present:

checking for UDEV... yes
configure: == libusb disabled. ==
checking for CEC... no
configure: error: == libcec disabled. CEC adapter support will not be 
available. ==

xbmc/config.log shows:

configure:29084: $PKG_CONFIG --exists --print-errors "libcec >= 2.1.0"
Package udev was not found in the pkg-config search path.
Perhaps you should add the directory containing `udev.pc'
to the PKG_CONFIG_PATH environment variable
No package 'udev' found

So we need to patch libcec/configure.ac in line 237 from 

REQUIRES="$REQUIRES udev"

to

REQUIRES="$REQUIRES libudev"

to make xbmc happy.

Regards, Bernd
