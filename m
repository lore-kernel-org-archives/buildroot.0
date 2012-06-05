From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Jun 2012 00:37:44 +0200
Subject: [Buildroot] [PATCH v2] freerdp: new package
In-Reply-To: <1338931193-3764-1-git-send-email-git@jlunz.de> (Julian Lunz's
 message of "Tue, 5 Jun 2012 23:19:53 +0200")
References: <1338931193-3764-1-git-send-email-git@jlunz.de>
Message-ID: <871ultpepz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julian" == Julian Lunz <git@jlunz.de> writes:

 Julian>  Signed-off-by: Julian Lunz <git@jlunz.de>

Thanks, committed with minor fixes (see below).

 Julian> ---
 Julian>  package/Config.in          |    1 +
 Julian>  package/freerdp/Config.in  |   13 +++++++++++++
 Julian>  package/freerdp/freerdp.mk |   41 +++++++++++++++++++++++++++++++++++++++++
 Julian>  3 files changed, 55 insertions(+), 0 deletions(-)
 Julian>  create mode 100644 package/freerdp/Config.in
 Julian>  create mode 100644 package/freerdp/freerdp.mk

 Julian> diff --git a/package/Config.in b/package/Config.in
 Julian> index dde5800..2b69c57 100644
 Julian> --- a/package/Config.in
 Julian> +++ b/package/Config.in
 Julian> @@ -145,6 +145,7 @@ comment "X applications"
 Julian>  source "package/alsamixergui/Config.in"
 Julian>  source "package/docker/Config.in"
 Julian>  source "package/feh/Config.in"
 Julian> +source "package/freerdp/Config.in"
 Julian>  source "package/gqview/Config.in"
 Julian>  source "package/gmpc/Config.in"
 Julian>  source "package/gob2/Config.in"
 Julian> diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
 Julian> new file mode 100644
 Julian> index 0000000..2039c4a
 Julian> --- /dev/null
 Julian> +++ b/package/freerdp/Config.in
 Julian> @@ -0,0 +1,13 @@
 Julian> +config BR2_PACKAGE_FREERDP
 Julian> +	bool "freerdp"
 Julian> +	select BR2_PACKAGE_OPENSSL
 Julian> +	select BR2_PACKAGE_XLIB_LIBX11
 Julian> +	select BR2_PACKAGE_XLIB_LIBXT
 Julian> +	select BR2_PACKAGE_ZLIB
 Julian> +	depends on BR2_PACKAGE_XORG7
 Julian> +	help
 Julian> +	  FreeRDPFreeRDP is a free implementation of the 
 Julian> +	  Remote Desktop Protocol (RDP), released under the Apache license
 Julian> +
 Julian> +	  http://www.freerdp.com/
 Julian> +	  

This help text is a bit screwed up and with trailing spaces.

From testing freerdp here, it seems libXext and libXcursor are also
required dependencies, so I've added them here.


 Julian> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
 Julian> new file mode 100644
 Julian> index 0000000..97501a1
 Julian> --- /dev/null
 Julian> +++ b/package/freerdp/freerdp.mk
 Julian> @@ -0,0 +1,41 @@
 Julian> +#############################################################
 Julian> +#
 Julian> +# FreeRDP
 Julian> +#
 Julian> +#############################################################
 Julian> +
 Julian> +FREERDP_VERSION = 1.0.1
 Julian> +FREERDP_SOURCE = freerdp-$(FREERDP_VERSION).tar.gz

This is the default value of _SOURCE, so this line can be skipped.

 Julian> +FREERDP_SITE = https://github.com/downloads/FreeRDP/FreeRDP
 Julian> +
 Julian> +ifeq ($(BR2_PACKAGE_CUPS),y)
 Julian> +FREERDP_CONF_OPT += -DWITH_CUPS=ON
 Julian> +FREERDP_DEPENDENCIES += cups
 Julian> +else
 Julian> +FREERDP_CONF_OPT += -DWITH_CUPS=OFF
 Julian> +endif
 Julian> +
 Julian> +ifeq ($(BR2_PACKAGE_FFMPEG),y)
 Julian> +FREERDP_CONF_OPT += -DWITH_FFMPEG=ON
 Julian> +FREERDP_DEPENDENCIES += ffmpeg
 Julian> +else
 Julian> +FREERDP_CONF_OPT += -DWITH_FFMPEG=OFF
 Julian> +endif
 Julian> +
 Julian> +ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 Julian> +FREERDP_CONF_OPT += -DWITH_ALSA=ON
 Julian> +FREERDP_DEPENDENCIES += alsa-lib
 Julian> +else
 Julian> +FREERDP_CONF_OPT += -DWITH_ALSA=OFF
 Julian> +endif
 Julian> +

From the cmake output I see there's also optional pulseaudio support, so
I've added a similar snippet for it.

 Julian> +ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
 Julian> +FREERDP_CONF_OPT += -DWITH_XINERAMA=ON
 Julian> +FREERDP_DEPENDENCIES += xlib_libXinerama
 Julian> +else
 Julian> +FREERDP_CONF_OPT += -DWITH_XINERAMA=OFF
 Julian> +endif

Likewise for libXkbfile and libXv.

 Julian> +
 Julian> +FREERDP_DEPENDENCIES += openssl xlib_libX11 xlib_libXt zlib

We normally have the fixed dependencies at the top before the optional
ones.

 Julian> +
 Julian> +$(eval $(call CMAKETARGETS))

-- 
Bye, Peter Korsgaard
