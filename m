From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Nov 2017 10:53:05 +0100
Subject: [Buildroot] [PATCH v2 1/1] turbovnc: new package
In-Reply-To: <20171101060657.tzjnt4ceb25irb3o@sapphire.tkos.co.il>
References: <1509367204-12966-1-git-send-email-stefan.froberg@petroprogram.com>
 <20171101060657.tzjnt4ceb25irb3o@sapphire.tkos.co.il>
Message-ID: <20171101105305.1cd82e60@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Nov 2017 08:06:57 +0200, Baruch Siach wrote:

> > +config BR2_PACKAGE_TURBOVNC
> > +	bool "turbovnc"
> > +	select BR2_PACKAGE_JPEG_TURBO  
> 
> You also need to select BR2_PACKAGE_JPEG because BR2_PACKAGE_JPEG_TURBO 
> depends on BR2_PACKAGE_JPEG.

No, you cannot do that, because BR2_PACKAGE_JPEG_TURBO is part of a
choice, and you cannot select options in a choice.

I don't see why TurboVNC would need jpeg-turbo specifically, as it's
API compatible with libjpeg. Therefore, please select BR2_PACKAGE_JPEG
here, and let the user decide whether jpeg-turbo or libjpeg should be
used.

> > +	select BR2_PACKAGE_OPENSSL
> > +	select BR2_PACKAGE_XLIB_LIBICE
> > +	select BR2_PACKAGE_XLIB_LIBSM
> > +	select BR2_PACKAGE_XLIB_LIBX11
> > +	select BR2_PACKAGE_XLIB_LIBXEXT
> > +	select BR2_PACKAGE_XLIB_LIBXAU
> > +	select BR2_PACKAGE_XLIB_LIBXDMCP  

If you select those libraries, you need to add a:

	depends on BR2_PACKAGE_XORG7


> Since the license files hashes are locally calculated, having only sha256 for 
> each file should be enough.

Agreed.

> > +TURBOVNC_VERSION = 2.1.2
> > +TURBOVNC_SOURCE = turbovnc-$(TURBOVNC_VERSION).tar.gz
> > +TURBOVNC_SITE = https://downloads.sourceforge.net/project/turbovnc/$(TURBOVNC_VERSION)
> > +TURBOVNC_DEPENDENCIES = jpeg-turbo openssl xlib_libICE xlib_libSM xlib_libX11 \
> > +			xlib_libXext xlib_libXau xlib_libXdmcp 
> > +TURBOVNC_LICENSE = GPL-2.0, MIT (putty), Dual FTL/GPL-2.0+ (freetype) \

Missing comma at the end of this line.

Why does it bundle freetype? Can it use an external Freetype instead?

> > +		   bzip2 license (bzip2), Zlib (zlib)

The SPDX license code for bzip2 license is bzip2-1.0.5 or bzip2-1.0.6,
see https://spdx.org/licenses/.

Also, why does it bundle Zlib ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
