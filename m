From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 23:01:36 +0200
Subject: [Buildroot] [PATCH v2] new package: ratpoison
In-Reply-To: <20170601143349.5406-1-mrugiero@gmail.com>
References: <20170512220246.18575-1-mrugiero@gmail.com>
 <20170601143349.5406-1-mrugiero@gmail.com>
Message-ID: <20170606230136.7240eb7a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've applied, after doing a number of fixes.

First, the commit title should have been "ratpoison: new package".

On Thu,  1 Jun 2017 11:33:49 -0300, Mario J. Rugiero wrote:
> diff --git a/package/ratpoison/ratpoison.mk b/package/ratpoison/ratpoison.mk
> new file mode 100644
> index 000000000..18222c217
> --- /dev/null
> +++ b/package/ratpoison/ratpoison.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# ratpoison
> +#
> +################################################################################
> +
> +RATPOISON_VERSION = 1.4.9
> +RATPOISON_SOURCE = ratpoison-$(RATPOISON_VERSION).tar.xz
> +RATPOISON_SITE = http://download.savannah.nongnu.org/releases/ratpoison
> +RATPOISON_LICENSE = GPL-2.0

The license really was GPL-2.0+, not GPL-2.0.

> +RATPOISON_LICENSE_FILES = COPYING
> +
> +RATPOISON_CONF_OPTS = --x-includes=$(STAGING_DIR)/usr/include/X11 \
> +		      --x-libraries=$(STAGING_DIR)/usr/lib

Indentation on the second line should be done with just one tab. And
also, explicitly disabling options not handled is a good practice. So
in the end, this looked like this:

+RATPOISON_CONF_OPTS = \
+       --x-includes=$(STAGING_DIR)/usr/include/X11 \
+       --x-libraries=$(STAGING_DIR)/usr/lib \
+       --without-xkb \
+       --without-xft

If you want to send another patch to optionally enable XKB and XFT
support, that would be welcome.

> +ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
> +	RATPOISON_DEPENDENCIES += xlib_libXrandr
> +	RATPOISON_CONF_OPTS += --with-xrandr

Do not indent such variable definitions.

Applied with those fixes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
