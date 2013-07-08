From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Jul 2013 22:21:20 +0200
Subject: [Buildroot] [PATCH] ocrad: new package
In-Reply-To: <1372990680-16147-1-git-send-email-gilles.talis@gmail.com>
 (Gilles Talis's message of "Thu, 4 Jul 2013 19:18:00 -0700")
References: <1372990680-16147-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <87sizoiz0f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> GNU Ocrad is an OCR (Optical Character Recognition) program
 Gilles> based on a feature extraction method.
 Gilles> It reads images in pbm (bitmap), pgm (greyscale) or ppm (color) formats
 Gilles> and produces text in byte (8-bit) or UTF-8 formats.

Committed with some fixes (see below).

 Gilles> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
 Gilles> ---
 Gilles>  package/Config.in       |    1 +
 Gilles>  package/ocrad/Config.in |   16 ++++++++++++++++
 Gilles>  package/ocrad/ocrad.mk  |   26 ++++++++++++++++++++++++++
 Gilles>  3 files changed, 43 insertions(+)
 Gilles>  create mode 100644 package/ocrad/Config.in
 Gilles>  create mode 100644 package/ocrad/ocrad.mk

 Gilles> diff --git a/package/Config.in b/package/Config.in
 Gilles> index 7c24dab..62fbba0 100644
 Gilles> --- a/package/Config.in
 Gilles> +++ b/package/Config.in
 Gilles> @@ -131,6 +131,7 @@ source "package/fb-test-app/Config.in"
 Gilles>  source "package/imagemagick/Config.in"
 Gilles>  source "package/linux-fusion/Config.in"
 Gilles>  source "package/lite/Config.in"
 Gilles> +source "package/ocrad/Config.in"
 Gilles>  source "package/sawman/Config.in"
 Gilles>  source "package/sdl/Config.in"
 Gilles>  source "package/sdl_image/Config.in"
 Gilles> diff --git a/package/ocrad/Config.in b/package/ocrad/Config.in
 Gilles> new file mode 100644
 Gilles> index 0000000..1065f01
 Gilles> --- /dev/null
 Gilles> +++ b/package/ocrad/Config.in
 Gilles> @@ -0,0 +1,16 @@
 Gilles> +config BR2_PACKAGE_OCRAD
 Gilles> +	bool "ocrad"
 Gilles> +	depends on BR2_INSTALL_LIBSTDCPP
 Gilles> +	help
 Gilles> +	  GNU Ocrad is an OCR (Optical Character Recognition) program
 Gilles> +	  based on a feature extraction method. 
 Gilles> +	  It reads images in pbm (bitmap), pgm (greyscale) or 
 Gilles> +	  ppm (color) formats and produces text in byte (8-bit) or 
 Gilles> +	  UTF-8 formats.
 Gilles> +
 Gilles> +	  http://www.gnu.org/software/ocrad/
 Gilles> +
 Gilles> +comment "ocrad needs a toolchain with C++ support"
 Gilles> +	depends on !BR2_INSTALL_LIBSTDCPP
 Gilles> +
 Gilles> +

There's a number of trailing spaces and empty lines here.

 Gilles> diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
 Gilles> new file mode 100644
 Gilles> index 0000000..4f4b793
 Gilles> --- /dev/null
 Gilles> +++ b/package/ocrad/ocrad.mk
 Gilles> @@ -0,0 +1,26 @@
 Gilles> +################################################################################
 Gilles> +#
 Gilles> +# ocrad
 Gilles> +#
 Gilles> +################################################################################
 Gilles> +
 Gilles> +OCRAD_VERSION = 0.21
 Gilles> +OCRAD_SITE = http://ftp.gnu.org/gnu/ocrad

We have BR2_GNU_MIRROR for the gnu packages.

 Gilles> +OCRAD_LICENSE = GPLv3+
 Gilles> +OCRAD_LICENSE_FILES = COPYING

Looking at the sources it contains both a library and an application, so
it makes sense to install the library/header to STAGING_DIR as well.

 Gilles> +
 Gilles> +# This is not a true autotools package.
 Gilles> +define OCRAD_CONFIGURE_CMDS
 Gilles> +	(cd $(@D); \
 Gilles> +	./configure $(TARGET_CONFIGURE_OPTS) )

The () subshell isn't needed. The configure script accept --prefix and
--sysconfdir options like autotools packages. If you set those, then you
can use make install.

 Gilles> +endef
 Gilles> +
 Gilles> +define OCRAD_BUILD_CMDS
 Gilles> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 Gilles> +endef
 Gilles> +
 Gilles> +define OCRAD_INSTALL_TARGET_CMDS
 Gilles> +	$(INSTALL) -D -m 755 $(@D)/ocrad $(TARGET_DIR)/usr/bin/ocrad
 Gilles> +endef

With those set, this just becomes:

$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install

(and same for STAGING_DIR)

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
