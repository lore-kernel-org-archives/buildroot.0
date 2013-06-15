From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Jun 2013 22:10:24 +0200
Subject: [Buildroot] [PATCH 1/1] New package: libqrencode
In-Reply-To: <1371199666-17156-1-git-send-email-phil@zankapfel.net> (Phil
 Eichinger's message of "Fri, 14 Jun 2013 10:47:46 +0200")
References: <1371199666-17156-1-git-send-email-phil@zankapfel.net>
Message-ID: <87fvwjyw27.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Phil" == Phil Eichinger <phil@zankapfel.net> writes:

 Phil> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
 Phil> ---
 Phil>  package/Config.in                  |    1 +
 Phil>  package/libqrencode/Config.in      |   20 ++++++++++++++++++++
 Phil>  package/libqrencode/libqrencode.mk |   20 ++++++++++++++++++++
 Phil>  3 files changed, 41 insertions(+)
 Phil>  create mode 100644 package/libqrencode/Config.in
 Phil>  create mode 100644 package/libqrencode/libqrencode.mk

 Phil> diff --git a/package/Config.in b/package/Config.in
 Phil> index ce82e99..3f4cbca 100644
 Phil> --- a/package/Config.in
 Phil> +++ b/package/Config.in
 Phil> @@ -138,6 +138,7 @@ source "package/sdl_sound/Config.in"
 Phil>  source "package/sdl_net/Config.in"
 Phil>  source "package/sdl_ttf/Config.in"
 Phil>  source "package/sdl_gfx/Config.in"
 Phil> +source "package/libqrencode/Config.in"

This is a library, so it belongs in libraries->graphics, just under
libpng.

 
 Phil>  comment "other GUIs"
 Phil>  source "package/efl/Config.in"
 Phil> diff --git a/package/libqrencode/Config.in b/package/libqrencode/Config.in
 Phil> new file mode 100644
 Phil> index 0000000..285dba0
 Phil> --- /dev/null
 Phil> +++ b/package/libqrencode/Config.in
 Phil> @@ -0,0 +1,20 @@
 Phil> +config BR2_PACKAGE_LIBQRENCODE
 Phil> +        bool "libqrencode"
 Phil> +        select BR2_PACKAGE_LIBPNG
 Phil> +        help

Config.in files should be indented with <tab> and not spaces.


 Phil> +          libqrencode is a C library for encoding data in a QR Code 
 Phil> +          symbol, a kind of 2D symbology that can be scanned by handy 
 Phil> +          terminals such as a mobile phone with CCD. The capacity of 
 Phil> +          QR Code is up to 7000 digits or 4000 characters, and is 
 Phil> +          highly robust.

Your help text as a trailing space on each line.

 Phil> +
 Phil> +          http://fukuchi.org/works/qrencode/index.html
 Phil> +
 Phil> +if BR2_PACKAGE_LIBQRENCODE
 Phil> +
 Phil> +config BR2_PACKAGE_LIBQRENCODE_TOOLS
 Phil> +        bool "Command-line tools"
 Phil> +        help
 Phil> +          Build command-line tools
 Phil> +
 Phil> +endif #BR2_PACKAGE_LIBQRENCODE
 Phil> diff --git a/package/libqrencode/libqrencode.mk b/package/libqrencode/libqrencode.mk
 Phil> new file mode 100644
 Phil> index 0000000..d47f866
 Phil> --- /dev/null
 Phil> +++ b/package/libqrencode/libqrencode.mk
 Phil> @@ -0,0 +1,20 @@
 Phil> +#############################################################
 Phil> +#
 Phil> +# libqrencode
 Phil> +#
 Phil> +#############################################################
 Phil> +
 Phil> +LIBQRENCODE_VERSION = 3.4.2
 Phil> +LIBQRENCODE_SOURCE = qrencode-$(LIBQRENCODE_VERSION).tar.gz
 Phil> +LIBQRENCODE_SITE = http://fukuchi.org/works/qrencode
 Phil> +LIBQRENCODE_DEPENDENCIES = libpng
 Phil> +LIBQRENCODE_LICENSE = LGPLv2.1+
 Phil> +LIBQRENCODE_LICENSE_FILES = COPYING

Libraries should be installed into $(STAGING_DIR) as well, so other
packages can find them, so there should be a

LIBQRENCODE_INSTALL_STAGING = YES

Committed with these things fixed up, thanks.

-- 
Bye, Peter Korsgaard
