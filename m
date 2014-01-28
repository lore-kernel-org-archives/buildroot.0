From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jan 2014 22:43:19 +0100
Subject: [Buildroot] [PATCH v4 4/5] libass: new package
In-Reply-To: <1390772341-6790-5-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sun, 26 Jan 2014 22:39:00 +0100")
References: <1390772341-6790-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1390772341-6790-5-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87ob2v2360.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > libass is a portable subtitle renderer for the
 > ASS/SSA (Advanced Substation Alpha/Substation Alpha) subtitle format.
 > This package was originally found at : https://github.com/huceke/buildroot-rbp
 > By gimli <ebsi4711@gmail.com>

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: gimli <ebsi4711@gmail.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > Changes v3 -> v4:
 >   - None
 > Changes v2 -> v3
 >   - Add missing libfribidi dependency
 >   - Fix header
 > Changes v1 -> v2
 >   - Bump version to 0.10.2 (Bernd Kuhls)

 > +++ b/package/libass/Config.in
 > @@ -0,0 +1,11 @@
 > +config BR2_PACKAGE_LIBASS
 > +	bool "libass"
 > +	select BR2_PACKAGE_FREETYPE
 > +	select BR2_PACKAGE_FONTCONFIG
 > +	select BR2_PACKAGE_LIBENCA
 > +	select BR2_PACKAGE_LIBFRIBIDI

fontconfig and libenca are optional, so we shouldn't select them here.

 > +	help
 > +	  libass is a portable subtitle renderer for the ASS/SSA
 > +	  (Advanced Substation Alpha/Substation Alpha) subtitle format
 > +
 > +	  http://code.google.com/p/libass/
 > diff --git a/package/libass/libass.mk b/package/libass/libass.mk
 > new file mode 100644
 > index 0000000..5c2a1b3
 > --- /dev/null
 > +++ b/package/libass/libass.mk
 > @@ -0,0 +1,14 @@
 > +################################################################################
 > +#
 > +# libass
 > +#
 > +################################################################################
 > +
 > +LIBASS_VERSION = 0.10.2
 > +LIBASS_SITE = http://libass.googlecode.com/files
 > +LIBASS_INSTALL_STAGING = YES
 > +LIBASS_DEPENDENCIES = freetype fontconfig libenca libfribidi

It uses pkg-config to find the libraries, so we also need
host-pkgconf. It also looks for libiconv if available, so we need to add
it. As mentioned fontconfig and libenca are optional. There's also
optional support for harfbuzz so I added that as well.

 > +LIBASS_LICENSE = BSD-3c
 > +LIBASS_LICENSE_FILES = COPYING

I know the website states that, but COPYING and the file headers are
ISC, so I changed it to that.

Committed with those fixes, thanks.

-- 
Bye, Peter Korsgaard
