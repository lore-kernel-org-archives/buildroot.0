From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 22:44:04 +0100
Subject: [Buildroot] [PATCH/next 12/13] package/x11r7/xlib_libXfont2:
 new package
In-Reply-To: <20161127110616.3451-12-bernd.kuhls@t-online.de>
References: <20161127110616.3451-1-bernd.kuhls@t-online.de>
 <20161127110616.3451-12-bernd.kuhls@t-online.de>
Message-ID: <20161127224404.49d5b738@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Nov 2016 12:06:15 +0100, Bernd Kuhls wrote:

> diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
> new file mode 100644
> index 0000000..233ec40
> --- /dev/null
> +++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# xlib_libXfont2
> +#
> +################################################################################
> +
> +XLIB_LIBXFONT2_VERSION = 2.0.1
> +XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.bz2
> +XLIB_LIBXFONT2_SITE = http://xorg.freedesktop.org/releases/individual/lib
> +XLIB_LIBXFONT2_AUTORECONF = YES

Why is autoreconf needed? The tarball has the configure script
generated, and there are no patches for this package. If there's a good
reason, it should be specified by a comment above this line.

> +XLIB_LIBXFONT2_LICENSE = MIT
> +XLIB_LIBXFONT2_LICENSE_FILES = COPYING
> +XLIB_LIBXFONT2_INSTALL_STAGING = YES
> +
> +XLIB_LIBXFONT2_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontsproto xproto_xproto xfont_encodings

Breaking this line that is a bit too long would be good.

> +HOST_XLIB_LIBXFONT2_DEPENDENCIES = \
> +	host-freetype host-xlib_libfontenc host-xlib_xtrans \
> +	host-xproto_fontsproto host-xproto_xproto host-xfont_encodings
> +
> +XLIB_LIBXFONT2_CONF_OPTS = --disable-devel-docs
> +HOST_XLIB_LIBXFONT2_CONF_OPTS = --disable-devel-docs
> +
> +ifeq ($(BR2_microblaze),y)
> +# The microblaze toolchains don't define the __ELF__ preprocessor
> +# symbol even though they do use the elf format. LibXfont checks for
> +# this symbol to know if weak symbols are supported, and otherwise
> +# falls back to emulation code using dlopen - Causing linker issues
> +# for stuff using libXfont.
> +# Work around it by defining the symbol here as well.
> +XLIB_LIBXFONT2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D__ELF__"
> +endif

Are you sure this is needed? The src/stubs/stubs.h code in libXfont
doesn't exist in libXfont2.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
