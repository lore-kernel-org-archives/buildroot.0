From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2010 20:20:29 +0100
Subject: [Buildroot] [PATCH 06/16] xapp_mkfontscale: enable compilation
 for the host
In-Reply-To: <87bpfhjmig.fsf@macbook.be.48ers.dk>
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<e87463aceffce66c0aa82dbdf66fe66cf0cc770c.1266691382.git.thomas.petazzoni@free-electrons.com>
	<87bpfhjmig.fsf@macbook.be.48ers.dk>
Message-ID: <20100222202029.2bb54c11@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Feb 2010 16:52:39 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
>  Thomas> index 05a3f81..e94312a 100644
>  Thomas> --- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
>  Thomas> +++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
>  Thomas> @@ -8,6 +8,8 @@ XAPP_MKFONTSCALE_VERSION = 1.0.5
>  Thomas>  XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.bz2
>  Thomas>  XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
>  Thomas>  XAPP_MKFONTSCALE_AUTORECONF = NO
>  Thomas> -XAPP_MKFONTSCALE_DEPENDENCIES = freetype xlib_libX11 xlib_libfontenc
>  Thomas> +XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libX11 xlib_libfontenc
>  Thomas> +HOST_XAPP_MKFONTSCALE_DEPENDENCIES = host-zlib host-freetype host-xlib_libfontenc
> 
> No host-xlib_libX11?

Here, host-xlib_libX11 hasn't been built, and xapp_mkfontscale has been
correctly built. This seems to be confirmed by the configure.ac file,
which only says:

AC_CHECK_LIB(z, gzopen, [], 
        [AC_MSG_ERROR([zlib is required, but was not found.])])
PKG_CHECK_MODULES(MKFONTSCALE, fontenc freetype2)
PKG_CHECK_MODULES(X11, xproto)

So, only zlib, freetype and xproto are needed. Maybe I should add a
dependency on host-xproto. But since host-xlib_libfontenc already
depends on it, there isn't a real problem.

I'll fix by adding the host-xproto dependency from the
HOST_XAPP_MKFONTSCALE_DEPENDENCIES line, and by removing the xlib_libX11
from the XAPP_MKFONTSCALE_DEPENDENCIES line.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
