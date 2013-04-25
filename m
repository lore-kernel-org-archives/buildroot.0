From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Apr 2013 15:57:00 +0200
Subject: [Buildroot] [PATCH 2/2] wvdial: new package
In-Reply-To: <1366881542-15350-3-git-send-email-spdawson@gmail.com>
References: <1366881542-15350-1-git-send-email-spdawson@gmail.com>
 <1366881542-15350-3-git-send-email-spdawson@gmail.com>
Message-ID: <20130425155700.3e0d867f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon, Pascal,

On Thu, 25 Apr 2013 10:19:02 +0100, spdawson at gmail.com wrote:

> diff --git a/package/wvdial/wvdial-0001-ppp-install-prefix.patch b/package/wvdial/wvdial-0001-ppp-install-prefix.patch
> new file mode 100644
> index 0000000..5db9648
> --- /dev/null
> +++ b/package/wvdial/wvdial-0001-ppp-install-prefix.patch
> @@ -0,0 +1,16 @@
> +Fix install prefix for PPP configuration files.
> +
> +Signed-off-by: Simon Dawson <spdawson@gmail.com>
> +
> +diff -Nurp a/Makefile b/Makefile
> +--- a/Makefile	2011-08-04 20:30:52.000000000 +0100
> ++++ b/Makefile	2013-04-25 09:11:36.916376367 +0100
> +@@ -23,7 +23,7 @@ LIBS+=$(PC_LIBS)
> + 
> + BINDIR=${prefix}/bin
> + MANDIR=${prefix}/share/man
> +-PPPDIR=/etc/ppp/peers
> ++PPPDIR=${prefix}/etc/ppp/peers

This one looks suspicious: /etc is usually not in the prefix, other it
would be in /usr/etc/ppp/peers. Could you explain what's going on here?

> +WVDIAL_VERSION = 1.61
> +WVDIAL_SITE = http://wvdial.googlecode.com/files
> +WVDIAL_SOURCE = wvdial-$(WVDIAL_VERSION).tar.bz2
> +WVDIAL_DEPENDENCIES = wvstreams
> +
> +WVDIAL_LICENSE = LGPLv2

I haven't checked the code, is it really LGPLv2, and not LGPLv2.1 ? No
"+" ?

> +WVDIAL_LICENSE_FILES = COPYING.LIB
> +
> +# N.B. parallel make fails
> +WVDIAL_MAKE = $(MAKE1)
> +
> +WVDIAL_MAKE_ENV += \
> +	CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" WVSTREAMS="$(WVSTREAMS_DIR)"

Use $(TARGET_CONFIGURE_OPTS) instead of CC/CXX. I don't really like to
see the wvdial build process poke into the wvstreams build directory.
Each component should normally build even if the build directories of
its dependencies have been removed. Is it possible to point it to the
headers+libraries installed in $(STAGING_DIR) instead?

> +WVDIAL_INSTALL_TARGET_OPT += prefix="$(TARGET_DIR)/usr" install
> +WVDIAL_UNINSTALL_TARGET_OPT += prefix="$(TARGET_DIR)/usr" uninstall

Those are used only once, so I would rather put them directly into the
install/uninstall commands below.

Other than that, looks good.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
