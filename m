From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Aug 2020 23:11:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/avahi: fix building against
 gobject-introspection
In-Reply-To: <20200813232351.1552307-1-aduskett@gmail.com>
References: <20200813232351.1552307-1-aduskett@gmail.com>
Message-ID: <20200814231115.71cf2a73@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Aug 2020 16:23:51 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Currently, if gobject-introspection is built before avahi, avahi will fail
> to build with several undefined reference errors due to several .libs
> directories not being in the PATH when linking the .gir file.
> 
> To resolve this issue, do the following if gobject-introspection is selected:
>   - Add gobject-introspection to AVAHI_DEPENDENCIES
>   - Add --enable-gobject to AVAHI_CONF_OPTS
>   - Add the appropriate directories to GIR_EXTRA_LIBS_PATH.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b9bf7cea8be9231552a10e8ea828bf24394402ba
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/avahi/avahi.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
> index 73db37545f..3e858083af 100644
> --- a/package/avahi/avahi.mk
> +++ b/package/avahi/avahi.mk
> @@ -94,6 +94,13 @@ else
>  AVAHI_CONF_OPTS += --disable-glib --disable-gobject
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +AVAHI_DEPENDENCIES += gobject-introspection
> +AVAHI_CONF_OPTS += --enable-gobject

This is wrong. The gobject option is not about gobject-introspection.
From the configure.ac:

AC_ARG_ENABLE(gobject,
        AS_HELP_STRING([--disable-gobject],[Disable use of GLib GObject]),
        [case "${enableval}" in
                yes) HAVE_GOBJECT=yes ;;
                no)  HAVE_GOBJECT=no ;;
                *) AC_MSG_ERROR(bad value ${enableval} for --enable-gobject) ;;
        esac],
        [HAVE_GOBJECT=yes])

if test "x$HAVE_GOBJECT" = "xyes" ; then
        PKG_CHECK_MODULES(GOBJECT, [ glib-2.0 >= 2.4.0 gobject-2.0 ])
        AC_SUBST(GOBJECT_CFLAGS)
        AC_SUBST(GOBJECT_LIBS)
fi
AM_CONDITIONAL(HAVE_GOBJECT, test "x$HAVE_GOBJECT" = "xyes")

The proper option is --enable-introspection / --disable-introspection.

> +AVAHI_MAKE_ENV += \
> +	GIR_EXTRA_LIBS_PATH="$(@D)/avahi-gobject/.libs:$(@D)/avahi-common/.libs:$(@D)/avahi-client/.libs:$(@D)/avahi-glib/.libs"

I see OpenEmbedded is doing the same thing:
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-connectivity/avahi/avahi.inc?h=rocko#n73

Still, I find that atrocious :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
