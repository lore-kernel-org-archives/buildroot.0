From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 16:07:10 +0200
Subject: [Buildroot] [PATCH] [Patch v4] dcmtk: new package
In-Reply-To: <1403055183-3910-1-git-send-email-tsmrnd0@gmail.com>
References: <1403055183-3910-1-git-send-email-tsmrnd0@gmail.com>
Message-ID: <20140629160710.0fd91b1a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear William Frost,

Thanks for this patch. Unfortunately, it still contain a number of
issues, some minor, other more important.

First, the title of your patch. Apparently, you did some change to add
[Patch v4] in the title, which is completely unnecessary. You should
instead simply use:

	git format-patch --subject-prefix="PATCH v4" HEAD^

to generate the patch to be sent to the mailing list. This will take
care of generating the proper [...] part of the patch title.

On Wed, 18 Jun 2014 10:33:03 +0900, William Frost wrote:
> [PATCH] Changes v3 -> v4:  (suggested by Gustavo Zacarias):
>  - removed trailing whitespaces in the help text
>  - added a comment indicating that dcmtk depends on BR2_INSTALL_LIBSTDCPP

As I've already said, this should *not* be part of the commit log. It
should instead be...

> 
> Signed-off-by: William Frost <tsmrnd0@gmail.com>
> ---

here, or part of a separate cover letter. Please read
http://buildroot.org/downloads/manual/manual.html#submitting-patches
carefully to know how to submit patches.

>  package/Config.in       |  1 +
>  package/dcmtk/Config.in | 15 +++++++++++++++
>  package/dcmtk/dcmtk.mk  | 23 +++++++++++++++++++++++
>  3 files changed, 39 insertions(+)
>  create mode 100644 package/dcmtk/Config.in
>  create mode 100644 package/dcmtk/dcmtk.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 07fd166..b88c0b0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -568,6 +568,7 @@ endmenu
>  menu "Graphics"
>  source "package/atk/Config.in"
>  source "package/cairo/Config.in"
> +source "package/dcmtk/Config.in"
>  source "package/fltk/Config.in"
>  source "package/fontconfig/Config.in"
>  source "package/freetype/Config.in"
> diff --git a/package/dcmtk/Config.in b/package/dcmtk/Config.in
> new file mode 100644
> index 0000000..d11bc12
> --- /dev/null
> +++ b/package/dcmtk/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_DCMTK
> +	bool "dcmtk"

Your package needs C++, so you lack a:

	depends on BR2_INSTALL_LIBSTDCPP

here.

> +	help
> +	  DCMTK is a collection of libraries and applications implementing
> +	  large parts the DICOM standard. It includes software for examining,
> +	  constructing and converting DICOM image files, handling offline
> +	  media, sending and receiving images over a network connection, as
> +	  well as demonstrative image storage and worklist servers. DCMTK is
> +	  is written in a mixture of ANSI C and C++. It comes in complete
> +	  source code and is made available as "open source" software.

Please wrap the help text to a shorter length (72 characters).

> +	  http://dicom.offis.de/dcmtk.php.en
> +
> +comment "dcmtk needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> \ No newline at end of file

There should be a new line at the end of the file.

> diff --git a/package/dcmtk/dcmtk.mk b/package/dcmtk/dcmtk.mk
> new file mode 100644
> index 0000000..ae2c265
> --- /dev/null
> +++ b/package/dcmtk/dcmtk.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# dcmtk
> +#
> +################################################################################
> +
> +DCMTK_VERSION = $(call qstrip,"3.6.0")

Just do:

DCMTK_VERSION = 3.6.0

there's absolutely no point in declaring a variable with quotes to
remove them right after by calling the 'qstrip' function. It's like
doing 2 + 0 + 0 + 0 + 0 + 0 instead of just using 2.

> +DCMTK_SITE = http://dicom.offis.de/download/dcmtk/dcmtk360
> +
> +DCMTK_LICENSE = BSD

BSD-3c

> +DCMTK_LICENSE_FILES = COPYRIGHT
> +DCMTK_INSTALL_STAGING = YES
> +
> +DCMTK_CFLAGS = $(TARGET_CFLAGS) -O -Wall
> +DCMTK_CXXFLAGS = $(TARGET_CXXFLAGS) -O  -Wall

These two variables are useless. They do not exist in the package
infrastructure, and since they are not used below, they do not serve
any purpose.

> +DCMTK_CONF_OPT = \
> +	--disable-rpath --with-zlib \
> +	ac_cv_my_c_rightshift_unsigned=no
> +
> +DCMTK_CONF_ENV = ARFLAGS=cru

This is all mixed up, and makes confusion between configure options and
configure variables. Please change to:

DCMTK_CONF_OPT = \
	--disable-rpath \
	--with-zlib

# We define ac_cv_my_c_rightshift_unsigned, because the configure
# script has an AC_TRY_RUN test that is unsuitable for
# cross-compilation. All sane architectures have signed right-shifting,
# so we make the assumption that all architectures supported by
# Buildroot have this behavior.
#
# The configure script only checks if AR is "ar" to decide to pass the
# cru ARFLAGS. In cross-compilation mode AR is "<prefix>-ar", so the
# configure script test doesn't work. Work around this by explicitly
# passing the appropriate ARFLAGS.

DCMTK_CONF_ENV = \
	ac_cv_my_c_rightshift_unsigned=no \
	ARFLAGS=cru

> +DCMTK_MAKE_OPT	= DESTDIR=$(STAGING_DIR) install-lib

This really shouldn't be used. If something special is needed at
install time, use INSTALL_TARGET_OPT or INSTALL_STAGING_OPT. But
clearly, using DESTDIR=$(STAGING_DIR) for all steps including the
target installation step doesn't make sense.

Also, there are more serious problems with the package:

 * It does not build with uClibc, due to issues around isnan() and
   finite(). I tried a bit to fix them, but what the DCMTK code is
   doing with math functions is quite scary and I didn't had the time
   to dive into all the details. Errors are:

ofstd.cc: In function ?int my_isinf(double)?:
ofstd.cc:218:21: error: ?finite? was not declared in this scope
ofstd.cc:218:37: error: ?isnan? was not declared in this scope

   Note that uClibc support is not mandatory, so if you're not
   interested in building this package with uClibc, you can add a glibc
   dependency to your package.

 * It also does not build with glibc, with the following output:

../../ofstd/include/dcmtk/ofstd/ofoset.h:149:34: error: 'Resize' was
not declared in this scope, and no declarations were found by
argument-dependent lookup at the point of instantiation [-fpermissive]
Resize( this->size * 2 );

 * The configure script mistakenly detects some host libraries, such as
   libxml2 in my case, and therefore uses incorrect header path:

cc1plus: warning: include location "/usr/include/libxml2" is unsafe for cross-compilation [-Wpoison-system-directories]

   To avoid that, you should have a look at *all* the configure script
   options related to optional libraries that DCMTK can use, and either
   disable their usage, or support their usage in your dcmtk.mk file.
   So either:

DCMTK_CONF_OPT = \
	--without-openssl \
	--without-zlib \
	--without-libtiff \
	--without-libpng \
	--without-libxml \
	--without-libwrap \
	--without-libsndfile

   Or, if you want to support the libraries, for each library,
   something like:

ifeq ($(BR2_PACKAGE_<library>),y)
DCMTK_CONF_OPT += --with-<library> --with-<library>inc=$(STAGING_DIR)
DCMTK_DEPENDENCIES += <library>
else
DCMTK_CONF_OPT += --without-<library>
endif

   These solutions will ensure that the DCMTK configure script will not
   mistakenly thing a certain library is installed due to it being
   available on the build machine.

Could you fix those issues and resend?

Thanks,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
