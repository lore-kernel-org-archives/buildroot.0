From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Feb 2014 16:07:05 +0100
Subject: [Buildroot] [PATCH] madplay: fixes build when toolchain has
	locale support
In-Reply-To: <1392027468-319-1-git-send-email-julien.boibessot@free.fr>
 (julien boibessot's message of "Mon, 10 Feb 2014 11:17:48 +0100")
References: <1392027468-319-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <87ppmvypk6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "julien" == julien boibessot <julien.boibessot@free.fr> writes:

 > From: Julien Boibessot <julien.boibessot@armadeus.com>
 > Otherwise build fails in intl/relocatable.c with:
 > ./relocatable.c: In function 'libintl_relocate':
 > ./relocatable.c:402:40: error: 'INSTALLPREFIX' undeclared (first use in this function)
 > ./relocatable.c:402:40: note: each undeclared identifier is reported only once for each function it appears in

 > Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
 > ---
 >  package/madplay/Config.in  |    1 +
 >  package/madplay/madplay.mk |    6 ++++++
 >  2 files changed, 7 insertions(+), 0 deletions(-)

 > diff --git a/package/madplay/Config.in b/package/madplay/Config.in
 > index 3baeaa0..d83fac6 100644
 > --- a/package/madplay/Config.in
 > +++ b/package/madplay/Config.in
 > @@ -2,6 +2,7 @@ config BR2_PACKAGE_MADPLAY
 >  	bool "madplay"
 >  	select BR2_PACKAGE_LIBMAD
 >  	select BR2_PACKAGE_LIBID3TAG
 > +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 >  	help
 >  	  Command-line front-end to libmad, a high-quality MPEG audio decoder.
 >  	  It currently supports MPEG-1 and the MPEG-2 extension to lower
 > diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
 > index 35aa651..79d57de 100644
 > --- a/package/madplay/madplay.mk
 > +++ b/package/madplay/madplay.mk
 > @@ -11,6 +11,12 @@ MADPLAY_LICENSE_FILES = COPYING COPYRIGHT
 >  MADPLAY_LIBTOOL_PATCH = NO
 >  MADPLAY_DEPENDENCIES = libmad libid3tag
 
 > +ifeq ($(BR2_PACKAGE_GETTEXT),y)
 > +MADPLAY_DEPENDENCIES += gettext
 > +else
 > +MADPLAY_CONF_OPT += --disable-nls
 > +endif

The 'else' part is not needed as we already pass --disable-nls in the
!locale case, and toolchains with locale support but not defining
BR2_NEEDS_GETTEXT_IF_LOCALE (E.G. glibc) support the gettext
functionality.

Committed with that fixed, thanks.

 > +
 >  # Check if ALSA is built, then we should configure after alsa-lib so
 >  # ./configure can find alsa-lib.
 >  ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
 > -- 
 > 1.7.5.4

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
