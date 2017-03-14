From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 21:41:34 +0100
Subject: [Buildroot] [PATCH 2/3] tesseract-ocr: new package
In-Reply-To: <1489517067-3155-3-git-send-email-gilles.talis@gmail.com>
References: <1489517067-3155-1-git-send-email-gilles.talis@gmail.com>
 <1489517067-3155-3-git-send-email-gilles.talis@gmail.com>
Message-ID: <20170314214134.1e4f2fc1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 19:44:26 +0100, Gilles Talis wrote:
> diff --git a/package/tesseract-ocr-data/Config.in b/package/tesseract-ocr-data/Config.in
> new file mode 100644
> index 0000000..6fba5bf
> --- /dev/null
> +++ b/package/tesseract-ocr-data/Config.in
> @@ -0,0 +1,15 @@
> +menuconfig BR2_PACKAGE_TESSERACT_OCR_DATA
> +	bool "tesseract-ocr languages training data"
> +	depends on BR2_PACKAGE_TESSERACT_OCR
> +	help
> +	  This will install the language training data files for tesseract-ocr
> +
> +if BR2_PACKAGE_TESSERACT_OCR_DATA
> +source "package/tesseract-ocr-data/tesseract-ocr-data-eng/Config.in"
> +source "package/tesseract-ocr-data/tesseract-ocr-data-fra/Config.in"
> +source "package/tesseract-ocr-data/tesseract-ocr-data-ger/Config.in"
> +source "package/tesseract-ocr-data/tesseract-ocr-data-spa/Config.in"
> +source "package/tesseract-ocr-data/tesseract-ocr-data-chi-sim/Config.in"
> +source "package/tesseract-ocr-data/tesseract-ocr-data-chi-tra/Config.in"
> +endif

I am not sure we want one package per language here, I'll propose a
different solution below.


> diff --git a/package/tesseract-ocr/Config.in b/package/tesseract-ocr/Config.in
> new file mode 100644
> index 0000000..7aa4ca6
> --- /dev/null
> +++ b/package/tesseract-ocr/Config.in
> @@ -0,0 +1,35 @@
> +comment "tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 4.8 (C++11)"

Remove the (C++11) comment, and put it like this:

# gcc 4.8 needed for C++11

> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> +        !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +
> +menuconfig BR2_PACKAGE_TESSERACT_OCR
> +	bool "tesseract-ocr"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> +	select BR2_PACKAGE_LEPTONICA
> +	select BR2_PACKAGE_TESSERACT_OCR_DATA
> +	help
> +	  Tesseract is an OCR (Optical Character Recognition) engine,
> +	  It can be used directly, or (for programmers) using an API.
> +	  It supports a wide variety of languages.
> +
> +	  https://github.com/tesseract-ocr/tesseract
> +
> +if BR2_PACKAGE_TESSERACT_OCR
> +
> +config BR2_PACKAGE_TESSERACT_OCR_JPEG
> +    bool "JPEG support"
> +    select BR2_PACKAGE_JPEG
> +    default y

Indentation of config properties should use one tab, not spaces (fix
this throughout the file).

> +
> +config BR2_PACKAGE_TESSERACT_OCR_PNG
> +    bool "PNG support"
> +    select BR2_PACKAGE_LIBPNG
> +    default y
> +
> +config BR2_PACKAGE_TESSERACT_OCR_TIFF
> +    bool "TIFF support"
> +    select BR2_PACKAGE_TIFF

Does it really make sense to have sub-options for these, instead of
just enabling jpeg, libpng, tiff support when the necessary packages
are available?

> diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
> new file mode 100644
> index 0000000..84c5ad9
> --- /dev/null
> +++ b/package/tesseract-ocr/tesseract-ocr.hash
> @@ -0,0 +1,3 @@
> +# locally computed
> +sha256  3fe83e06d0f73b39f6e92ed9fc7ccba3ef734877b76aa5ddaaa778fac095d996  tesseract-ocr-3.05.00.tar.gz
> +

Useless empty line.

> diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
> new file mode 100644
> index 0000000..37ac72f
> --- /dev/null
> +++ b/package/tesseract-ocr/tesseract-ocr.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# tesseract-ocr
> +#
> +################################################################################
> +
> +TESSERACT_OCR_VERSION = 3.05.00
> +TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))

Here is what you could do for the data files:

ifeq ($(BR2_PACKAGE_TESSERACT_OCR_DATA_FRENCH),y)
TESSERACT_OCR_DATA_FILES += fra.traineddata
endif

ifeq ($(BR2_PACKAGE_TESSERACT_OCR_DATA_SPANISH),y)
TESSERACT_OCR_DATA_FILES += spa.traineddata
endif

...

TESSERACT_OCR_EXTRA_DOWNLOADS = \
	$(addprefix https://github.com/tesseract-ocr/tessdata/raw/$(TESSERACT_OCR_DATA_VERSION),\
		$(TESSERACT_OCR_DATA_FILES))

and then use $(DL_DIR)/fra.traineddata the way you want to.

> +TESSERACT_OCR_LICENSE = Apache-2.0
> +TESSERACT_OCR_LICENSE_FILES = COPYING
> +
> +TESSERACT_OCR_AUTORECONF = YES

A comment that says "Source from github, no configure script provided"
would be nice.

> +
> +TESSERACT_OCR_DEPENDENCIES += leptonica \
> +	$(if $(BR2_PACKAGE_TESSERACT_OCR_JPEG),jpeg) \
> +	$(if $(BR2_PACKAGE_TESSERACT_OCR_PNG),libpng) \
> +	$(if $(BR2_PACKAGE_TESSERACT_OCR_TIFF),tiff)

Are libpng/jpeg really optional dependencies? I don't see them being
mentioned in configure.ac (but I only had a quick look).

> +TESSERACT_OCR_INSTALL_STAGING = YES

It installs some libraries?

> +
> +TESSERACT_OCR_CONF_ENV += \
> +    LIBLEPT_HEADERSDIR=$(STAGING_DIR)/usr/include/leptonica
> +
> +define TESSERACT_OCR_PRECONFIGURE
> +    # Autoreconf step fails due to missing m4 directory
> +    mkdir -p $(@D)/m4
> +endef
> +
> +TESSERACT_OCR_PRE_CONFIGURE_HOOKS += TESSERACT_OCR_PRECONFIGURE
> +
> +$(eval $(autotools-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
