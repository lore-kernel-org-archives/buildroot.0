From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 29 Oct 2015 10:09:24 +0000
Subject: [Buildroot] [PATCH v3 1/2] zbar: new package
In-Reply-To: <1446100633-23719-1-git-send-email-sv99@inbox.ru>
References: <1446100633-23719-1-git-send-email-sv99@inbox.ru>
Message-ID: <5631F054.7040905@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Viacheslav Volkov,

thanks for another contribution. There are older versions of your
patches in Patchwork. Would you mind to mark them as superseded, please?

Below are some comments, please scroll down.

On 10/29/2015 06:37 AM, Viacheslav Volkov wrote:
> Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes v2 -> v3:
>   - intendation in the Config.in (suggested by Yegor Yefremov)
>   - add license info
> 
> Changes v1 -> v2:
>   - many changes
> ---
>  package/Config.in                     |  1 +
>  package/zbar/0001-zbar-autoconf.patch | 16 ++++++++++++++++
>  package/zbar/0002-zbar-jpeg.patch     | 13 +++++++++++++
>  package/zbar/Config.in                | 16 ++++++++++++++++
>  package/zbar/zbar.mk                  | 22 ++++++++++++++++++++++

Please add a hash file. We have started adding hashes for GitHub
packages as well. See zxing-cpp package as an example.

[snip]

> diff --git a/package/zbar/0001-zbar-autoconf.patch b/package/zbar/0001-zbar-autoconf.patch
> new file mode 100644
> index 0000000..159f75e
> --- /dev/null
> +++ b/package/zbar/0001-zbar-autoconf.patch
> @@ -0,0 +1,16 @@

You are adding a patch to the Buildroot project. It would be good if you
add a description about what the patch does and why is needed. And also
don't forget to add your SoB.

I'm curious, why is this patch needed? Have you write it yourself? Have
you sent it upstream?

> +diff --git a/configure.ac b/configure.ac
> +index 256aedb..5aa5689 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -3,10 +3,11 @@ AC_PREREQ([2.61])
> + AC_INIT([zbar], [0.10], [spadix at users.sourceforge.net])
> + AC_CONFIG_AUX_DIR(config)
> + AC_CONFIG_MACRO_DIR(config)
> +-AM_INIT_AUTOMAKE([1.10 -Wall -Werror foreign subdir-objects std-options dist-bzip2])
> ++AM_INIT_AUTOMAKE([1.10 -Wall -Werror -Wno-portability foreign subdir-objects std-options dist-bzip2])
> + AC_CONFIG_HEADERS([include/config.h])
> + AC_CONFIG_SRCDIR(zbar/scanner.c)
> + LT_PREREQ([2.2])
> ++m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
> + LT_INIT([dlopen win32-dll])
> + LT_LANG([Windows Resource])
> diff --git a/package/zbar/0002-zbar-jpeg.patch b/package/zbar/0002-zbar-jpeg.patch
> new file mode 100644
> index 0000000..1d93a94
> --- /dev/null
> +++ b/package/zbar/0002-zbar-jpeg.patch
> @@ -0,0 +1,13 @@

Same comments as above.

> +diff --git a/zbar/jpeg.c b/zbar/jpeg.c
> +index 972bfea..fdd1619 100644
> +--- a/zbar/jpeg.c
> ++++ b/zbar/jpeg.c
> +@@ -68,7 +68,7 @@ void init_source (j_decompress_ptr cinfo)
> +     cinfo->src->bytes_in_buffer = img->datalen;
> + }
> + 
> +-int fill_input_buffer (j_decompress_ptr cinfo)
> ++boolean fill_input_buffer (j_decompress_ptr cinfo)
> + {
> +     /* buffer underrun error case */
> +     cinfo->src->next_input_byte = fake_eoi;
> diff --git a/package/zbar/Config.in b/package/zbar/Config.in
> new file mode 100644
> index 0000000..ced6c95
> --- /dev/null
> +++ b/package/zbar/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_ZBAR
> +	bool "zbar"
> +	# dependencies from lib4l
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # fork()
> +	depends on !BR2_STATIC_LIBS # dlopen()
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # media headers
> +	# wait for libv4l 1.7+ for musl compatibility
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC

All these dependencies come from libv4l. We normally do it in this way:

	depends on BR2_TOOLCHAIN_HAS_THREADS # libv4l
	depends on BR2_USE_MMU # libv4l
	depends on !BR2_STATIC_LIBS # libv4l
	depends on BR2_INSTALL_LIBSTDCPP # libv4l
	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libv4l
	depends on BR2_TOOLCHAIN_USES_GLIBC || \
		BR2_TOOLCHAIN_USES_UCLIBC # libv4l

> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBV4L
> +	help
> +	  QR and barcode scanner
> +
> +	  http://zbar.sourceforge.net/

And since you are propagating the libv4l dependencies, you also need to
propagate the comment:

comment "zbar needs an uClibc or (e)glibc toolchain w/ threads, dynamic
library, C++ and headers >= 3.0"
	depends on BR2_USE_MMU
	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
		!BR2_INSTALL_LIBSTDCPP || \
		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || \
		!(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)

> diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
> new file mode 100644
> index 0000000..e25a952
> --- /dev/null
> +++ b/package/zbar/zbar.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# zbar
> +#
> +################################################################################
> +
> +ZBAR_VERSION = 854a5d97059e395807091ac4d80c53f7968abb8f
> +ZBAR_SITE = $(call github,ZBar,Zbar,$(ZBAR_VERSION))
> +ZBAR_LICENSE = GPLv2.1
> +ZBAR_LICENSE_FILES = LICENSE
> +ZBAR_INSTALL_STAGING = YES
> +ZBAR_AUTORECONF = YES
> +ZBAR_DEPENDENCIES = libv4l libjpeg
> +ZBAR_CONF_OPTS = --without-imagemagick --without-qt --without-gtk
> +ZBAR_CONF_OPTS += --without-python --without-x --enable-shared=yes

Better do it this way:

ZBAR_CONF_OPTS = \
	--without-imagemagick \
	--without-qt \
	--without-gtk \
	--without-python \
	--without-x \
	--enable-shared=yes

> +
> +define ZBAR_INSTALL_FIXUP
> +	touch $(@D)/doc/man/zbarcam.1
> +endef
> +
> +ZBAR_POST_BUILD_HOOKS += ZBAR_INSTALL_FIXUP

It would be good to have a comment explaining why do you need that fixup.


> +$(eval $(autotools-package))

I'm wondering if you send your patches using "git send-email". Something
weird happened here. If you look at your patch in Patchwork, the "eval"
line is missing:

http://patchwork.ozlabs.org/patch/537682/

Actually, it has been misplaced. It's just before the patch begins. I
don't know how can that happened.

Regards,

Vincent.
