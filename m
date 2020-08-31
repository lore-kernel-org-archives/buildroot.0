From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2020 16:01:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/avahi: fix building against
 gobject-introspection
In-Reply-To: <20200814231115.71cf2a73@windsurf.home> (Thomas Petazzoni's
 message of "Fri, 14 Aug 2020 23:11:15 +0200")
References: <20200813232351.1552307-1-aduskett@gmail.com>
 <20200814231115.71cf2a73@windsurf.home>
Message-ID: <877dtedidi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 >> +AVAHI_DEPENDENCIES += gobject-introspection
 >> +AVAHI_CONF_OPTS += --enable-gobject

 > This is wrong. The gobject option is not about gobject-introspection.
 > From the configure.ac:

 > AC_ARG_ENABLE(gobject,
 >         AS_HELP_STRING([--disable-gobject],[Disable use of GLib GObject]),
 >         [case "${enableval}" in
 >                 yes) HAVE_GOBJECT=yes ;;
 >                 no)  HAVE_GOBJECT=no ;;
 >                 *) AC_MSG_ERROR(bad value ${enableval} for --enable-gobject) ;;
 >         esac],
 >         [HAVE_GOBJECT=yes])

 > if test "x$HAVE_GOBJECT" = "xyes" ; then
 >         PKG_CHECK_MODULES(GOBJECT, [ glib-2.0 >= 2.4.0 gobject-2.0 ])
 >         AC_SUBST(GOBJECT_CFLAGS)
 >         AC_SUBST(GOBJECT_LIBS)
 > fi
 > AM_CONDITIONAL(HAVE_GOBJECT, test "x$HAVE_GOBJECT" = "xyes")

 > The proper option is --enable-introspection / --disable-introspection.

 >> +AVAHI_MAKE_ENV += \
 >> +	GIR_EXTRA_LIBS_PATH="$(@D)/avahi-gobject/.libs:$(@D)/avahi-common/.libs:$(@D)/avahi-client/.libs:$(@D)/avahi-glib/.libs"

 > I see OpenEmbedded is doing the same thing:
 > http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-connectivity/avahi/avahi.inc?h=rocko#n73

 > Still, I find that atrocious :-/

Agreed. I haven't seen any updates on this, but we need to fix the build
issues for 2020.08, so I've sent a patch to simply disable introspection
support:

https://patchwork.ozlabs.org/project/buildroot/patch/20200831140035.5880-1-peter at korsgaard.com/

We can then refine it later to add introspection support once the issues
have been fixed for next.

-- 
Bye, Peter Korsgaard
