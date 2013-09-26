From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Sep 2013 15:48:44 +0200
Subject: [Buildroot] [PATCH v2] xscreensaver: new package
In-Reply-To: <1379923332-14027-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 23 Sep 2013 09:02:12 +0100")
References: <1379923332-14027-1-git-send-email-spdawson@gmail.com>
Message-ID: <87zjqz7kxv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>

 spdawson> +++ b/package/xscreensaver/xscreensaver.mk
 spdawson> @@ -0,0 +1,21 @@
 spdawson> +################################################################################
 spdawson> +#
 spdawson> +# xscreensaver
 spdawson> +#
 spdawson> +################################################################################
 spdawson> +
 spdawson> +XSCREENSAVER_VERSION = 5.22
 spdawson> +XSCREENSAVER_SITE = http://www.jwz.org/xscreensaver
 spdawson> +
 spdawson> +# N.B. GPLv2+ code (in the hacks/glx subdirectory) is not currently built.
 spdawson> +XSCREENSAVER_LICENSE = MIT-like GPLv2+
 spdawson> +XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h

You could argue that we shouldn't add the glx / GPLv2+ stuff here if we
aren't using them - But ok, like this we won't forget to add them if we
ever enable the glx support.


 spdawson> +
 spdawson> +XSCREENSAVER_DEPENDENCIES = jpeg libglade libgtk2 xlib_libX11 xlib_libXt \
 spdawson> +	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 spdawson> +
 spdawson> +XSCREENSAVER_CONF_OPT += LIBS=-lintl

We should only add -lintl if gettext is enabled, otherwise we'll end up
with linker errors, and we normally pass LIBS= in the configure
environment, not as an option.

Here I had to explicitly point --includedir / --libdir to staging,
otherwise it would end up adding -I/usr/include and -L/usr/lib causing
all kinds of issues.

Committed with these changes, thanks.

-- 
Bye, Peter Korsgaard
