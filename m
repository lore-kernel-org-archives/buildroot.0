From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 23:51:40 +0200
Subject: [Buildroot] [PATCH v2,1/2] libmediaart: new package
In-Reply-To: <1490387931-113759-1-git-send-email-fontaine.fabrice@gmail.com>
References: <1490387931-113759-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <20170329235140.61c718d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Mar 2017 21:38:50 +0100, Fabrice Fontaine wrote:
> Library tasked with managing, extracting and handling media art caches
> 
> https://github.com/GNOME/libmediaart
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I've applied the patch, but after doing a few changes.

First of all, you forgot to add yourself to the DEVELOPERS file for
this package, so I've added that. It's really important to do it, as it
ensures that you will be notified when there is a build failure for
this package.

> diff --git a/package/libmediaart/Config.in b/package/libmediaart/Config.in
> new file mode 100644
> index 0000000..5b6b6a7
> --- /dev/null
> +++ b/package/libmediaart/Config.in
> @@ -0,0 +1,44 @@
> +config BR2_PACKAGE_LIBMEDIAART
> +	bool "libmediaart"
> +	depends on BR2_USE_MMU # glib2
> +	depends on BR2_USE_WCHAR # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  Library tasked with managing, extracting and handling media
> +	  art caches
> +
> +	  https://github.com/GNOME/libmediaart
> +
> +comment "libmediaart needs a toolchain w/ wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

Having the comment here (between the definition of the main option and
the sub-options) breaks the indentation of the sub-options. So it
should either go at the top of the Config.in file, or at the very end.
I've opted for the former.

> +LIBMEDIAART_VERSION_MAJOR = 1.9
> +LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).1
> +LIBMEDIAART_SOURCE = libmediaart-$(LIBMEDIAART_VERSION).tar.xz
> +LIBMEDIAART_SITE = \
> +	http://ftp.gnome.org/pub/gnome/sources/libmediaart/$(LIBMEDIAART_VERSION_MAJOR)
> +LIBMEDIAART_LICENSE = LGPLv2.1+
> +LIBMEDIAART_LICENSE_FILES = COPYING

This was not correct: COPYING is the text of GPLv2, not LGPLv2.1. I've
changed it to COPYING.LESSER, which really contains the text of
LGPLv2.1.

The only thing under GPLv2 seems to be the tests, which you disable, so
I've left this outside of the license information in the package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
