From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Sep 2013 09:44:16 +0200
Subject: [Buildroot] [PATCH] xapp_xscreensaver: new package
In-Reply-To: <1379872398-25558-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Sun, 22 Sep 2013 18:53:18 +0100")
References: <1379872398-25558-1-git-send-email-spdawson@gmail.com>
Message-ID: <87ioxs9e3z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 spdawson> ---
 spdawson>  package/x11r7/Config.in                            |   1 +
 spdawson>  package/x11r7/xapp_xscreensaver/Config.in          |  22 ++++
 spdawson>  ...ver-0001-fix-cross-compile-ansi-c-bailout.patch |  29 +++++
 spdawson>  ...creensaver-0002-fix-minixpm-build-problem.patch | 134 +++++++++++++++++++++
 spdawson>  .../x11r7/xapp_xscreensaver/xapp_xscreensaver.mk   |  24 ++++
 spdawson>  5 files changed, 210 insertions(+)
 spdawson>  create mode 100644 package/x11r7/xapp_xscreensaver/Config.in
 spdawson>  create mode 100644 package/x11r7/xapp_xscreensaver/xapp_xscreensaver-0001-fix-cross-compile-ansi-c-bailout.patch
 spdawson>  create mode 100644 package/x11r7/xapp_xscreensaver/xapp_xscreensaver-0002-fix-minixpm-build-problem.patch
 spdawson>  create mode 100644 package/x11r7/xapp_xscreensaver/xapp_xscreensaver.mk

 spdawson> diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
 spdawson> index 205079c..19c46a5 100644
 spdawson> --- a/package/x11r7/Config.in
 spdawson> +++ b/package/x11r7/Config.in
 spdawson> @@ -127,6 +127,7 @@ if BR2_PACKAGE_XORG7
 spdawson>  		source package/x11r7/xapp_xrandr/Config.in
 spdawson>  		source package/x11r7/xapp_xrdb/Config.in
 spdawson>  		source package/x11r7/xapp_xrefresh/Config.in
 spdawson> +		source package/x11r7/xapp_xscreensaver/Config.in

Like Thomas commented on the recently posted lesstif package, this
shouldn't go under x11r7 as it isn't part of x.org (and should just be
called xscreensaver).

 spdawson> +++ b/package/x11r7/xapp_xscreensaver/xapp_xscreensaver.mk
 spdawson> @@ -0,0 +1,24 @@
 spdawson> +################################################################################
 spdawson> +#
 spdawson> +# xapp_xscreensaver
 spdawson> +#
 spdawson> +################################################################################
 spdawson> +
 spdawson> +XAPP_XSCREENSAVER_VERSION = 5.22
 spdawson> +XAPP_XSCREENSAVER_SITE = http://www.jwz.org/xscreensaver
 spdawson> +XAPP_XSCREENSAVER_SOURCE = xscreensaver-$(XAPP_XSCREENSAVER_VERSION).tar.gz
 spdawson> +
 spdawson> +XAPP_XSCREENSAVER_LICENSE = MIT-like
 spdawson> +XAPP_XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h

According to the Debian package, it also contains GPLv2+ parts
(hacks/glx/chessmodels.{c,man}), but perhaps we don't build that file?

A comment explaining it might be good.

 spdawson> +
 spdawson> +XAPP_XSCREENSAVER_DEPENDENCIES = jpeg libglade libgtk2 xlib_libX11 xlib_libXt \
 spdawson> +	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 spdawson> +
 spdawson> +XAPP_XSCREENSAVER_CONF_OPT += \
 spdawson> +	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 spdawson> +	LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib" \

The compiler should already be looking under STAGING_DIR, why is this
needed?

-- 
Bye, Peter Korsgaard
