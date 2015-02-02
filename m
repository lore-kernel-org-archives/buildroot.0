From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Feb 2015 21:53:39 +0100
Subject: [Buildroot] [PATCH  V2] mjpegtools: new package
In-Reply-To: <54BBE13C.7000600@ou.edu>
References: <54BBE13C.7000600@ou.edu>
Message-ID: <20150202205339.GA4270@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, All,

On 2015-01-18 10:37 -0600, Steve Kenton spake thusly:
> The mjpegtools programs are a set of tools
> that can do recording of videos and playback,
> simple cut-and-paste editing and the MPEG
> compression of audio and video under Linux.
> 
> http://mjpeg.sourceforge.net
> 
> Signed-off-by Stephen M. Kenton <skenton@ou.edu>
[--SNIP--]
> diff -pruN buildroot.ori/package/mjpegtools/Config.in buildroot/package/mjpegtools/Config.in
> --- buildroot.ori/package/mjpegtools/Config.in	1969-12-31 18:00:00.000000000 -0600
> +++ buildroot/package/mjpegtools/Config.in	2015-01-16 11:05:54.949872151 -0600
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_MJPEGTOOLS
> +	bool "mjpegtools"
> +	select BR2_PACKAGE_JPEG
> +	depends on BR2_INSTALL_LIBSTDCPP

I tried with this defconfig:
    http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config

and just enabled mjpegtools above that, and it failed with:

    In file included from picture.hh:27:0,
                     from motionest.cc:61:
    synchrolib.h:32:21: fatal error: pthread.h: No such file or directory
     #include <pthread.h>
                         ^
    compilation terminated.

So, it needs thread support.

> +	help
> +	  The mjpegtools programs are a set of tools
> +	  that can do recording of videos and playback,
> +	  simple cut-and-paste editing and the MPEG
> +	  compression of audio and video under Linux.
> +
> +	  http://mjpeg.sourceforge.net
> +
> +comment "mjpegtools needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> diff -pruN buildroot.ori/package/mjpegtools/mjpegtools.hash buildroot/package/mjpegtools/mjpegtools.hash
> --- buildroot.ori/package/mjpegtools/mjpegtools.hash	1969-12-31 18:00:00.000000000 -0600
> +++ buildroot/package/mjpegtools/mjpegtools.hash	2015-01-18 10:27:16.696749792 -0600
> @@ -0,0 +1,3 @@
> +# From http://sourceforge.net/projects/mjpeg/files/mjpegtools/2.1.0/
> +md5	57bf5dd78976ca9bac972a6511b236f3	mjpegtools-2.1.0.tar.gz
> +sha1	b9effa86280e23d67369e842e5cb645948583097	mjpegtools-2.1.0.tar.gz
> diff -pruN buildroot.ori/package/mjpegtools/mjpegtools.mk buildroot/package/mjpegtools/mjpegtools.mk
> --- buildroot.ori/package/mjpegtools/mjpegtools.mk	1969-12-31 18:00:00.000000000 -0600
> +++ buildroot/package/mjpegtools/mjpegtools.mk	2015-01-16 11:05:03.121871157 -0600
> @@ -0,0 +1,13 @@
> +###############################################################################
> +#
> +# mjpegtools
> +#
> +###############################################################################
> +
> +MJPEGTOOLS_VERSION = 2.1.0
> +MJPEGTOOLS_SITE = http://sourceforge.net/projects/mjpeg/files/mjpegtools/$(MJPEGTOOLS_VERSION)
> +MJPEGTOOLS_DEPENDENCIES = jpeg

configure.ac uses PKG_CHECK_MODULE, so this should depend on
host-pkgconf.

Care to fix and resend?

Thank you! ;-)

Regards,
Yann E. MORIN.

> +MJPEGTOOLS_LICENSE = GPLv2
> +MJPEGTOOLS_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))
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
