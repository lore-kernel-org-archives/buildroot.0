From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 14:54:55 +0100
Subject: [Buildroot] [PATCH v2 2/2] tesseract-ocr: new package
In-Reply-To: <1489910873-8450-3-git-send-email-gilles.talis@gmail.com>
References: <1489910873-8450-1-git-send-email-gilles.talis@gmail.com>
 <1489910873-8450-3-git-send-email-gilles.talis@gmail.com>
Message-ID: <20170319145455.27ceaa84@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Mar 2017 09:07:53 +0100, Gilles Talis wrote:
> diff --git a/package/tesseract-ocr/Config.in b/package/tesseract-ocr/Config.in
> new file mode 100644
> index 0000000..4fd0668
> --- /dev/null
> +++ b/package/tesseract-ocr/Config.in
> @@ -0,0 +1,44 @@
> +comment "tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 4.8 & dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> +        !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS

Indentation of this last line should have been two tabs.

> +menuconfig BR2_PACKAGE_TESSERACT_OCR
> +	bool "tesseract-ocr"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> +	depends on BR2_USE_MMU # fork()
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LEPTONICA
> +	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_TIFF

I don't see where jpeg, libpng and tiff are mandatory. In fact, I don't
see them being used by tesseract-ocr, so I've dropped those
dependencies for nwo.


> +TESSERACT_OCR_VERSION = 3.05.00
> +TESSERACT_OCR_DATA_VERSION = 3.04.00
> +TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
> +TESSERACT_OCR_LICENSE = Apache-2.0
> +TESSERACT_OCR_LICENSE_FILES = COPYING
> +
> +# Source from github, no configure script provided
> +TESSERACT_OCR_AUTORECONF = YES
> +
> +TESSERACT_OCR_DEPENDENCIES += leptonica jpeg libpng tiff

I've dropped jpeg, libpng and tiff. Instead, I've added host-pkgconf
which is really needed since configure.ac uses PKG_CHECK_MODULES().

I've also passed --disable-opencl since your package hasn't added
explicit support for OpenCL.

> +# Language data files download
> +ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_ENG),y)
> +TESSERACT_OCR_DATA_FILES += eng.traineddata
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_FRA),y)
> +TESSERACT_OCR_DATA_FILES += fra.traineddata
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_DEU),y)
> +TESSERACT_OCR_DATA_FILES += deu.traineddata
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_SPA),y)
> +TESSERACT_OCR_DATA_FILES += spa.traineddata
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_CHI_SIM),y)
> +TESSERACT_OCR_DATA_FILES += chi_sim.traineddata
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_CHI_TRA),y)
> +TESSERACT_OCR_DATA_FILES += chi_tra.traineddata
> +endif

Regarding the language files, I'm not entirely happy with the current
solution, but I couldn't come up with something better. I looked at the
two following options:

 * Creating a separate package for the tessdata repository
   https://github.com/tesseract-ocr/tessdata/, but this repository is
   3.4GB in size, which is admittedly a bit annoying to download when
   you just want a single language.

 * Since the list of languages is quite long, having an explicit option
   for each of them is a bit annoying. So I looked into turning your
   one-option-per-language idea into a single option with a space
   separated list of languages. Except that we anyway need to have the
   hash file for each language in tesseract-ocr.hash.

So in the end, I kept it as-is. We'll see if other folks have better
idea.

So in the mean time, I've applied with the fixes described above.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
