From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 22:59:38 +0100
Subject: [Buildroot] [PATCH v2] package/alsa-utils: Add util alsaloop
In-Reply-To: <1453151639-28753-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Mon, 18 Jan 2016 22:13:59 +0100")
References: <1453151639-28753-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87io2q4khh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Add libsamplerate as optional dependency, see
 > alsa-utils-1.1.0/alsaloop/Makefile.am

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: libsamplerate is not a mandatory, but an optional dependency (Thomas)

 >  package/alsa-utils/Config.in     |  3 +++
 >  package/alsa-utils/alsa-utils.mk | 10 ++++++++++
 >  2 files changed, 13 insertions(+)

 > diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
 > index 82f3ad6..9b8e8c0 100644
 > --- a/package/alsa-utils/Config.in
 > +++ b/package/alsa-utils/Config.in
 > @@ -29,6 +29,9 @@ config BR2_PACKAGE_ALSA_UTILS_ALSACTL
 >  	bool "alsactl"
 >  	default y
 
 > +config BR2_PACKAGE_ALSA_UTILS_ALSALOOP
 > +	bool "alsaloop"
 > +
 >  config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
 >  	bool "alsamixer"
 >  	select BR2_PACKAGE_NCURSES
 > diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
 > index 32822bb..4b3df19 100644
 > --- a/package/alsa-utils/alsa-utils.mk
 > +++ b/package/alsa-utils/alsa-utils.mk
 > @@ -29,6 +29,15 @@ ALSA_UTILS_DEPENDENCIES += gettext
 >  ALSA_UTILS_CONF_ENV += LIBS=-lintl
 >  endif
 
 > +ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSALOOP),y)
 > +ALSA_UTILS_CONF_OPTS += --enable-alsaloop
 > +ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
 > +ALSA_UTILS_DEPENDENCIES += libsamplerate
 > +endif
 > +else
 > +ALSA_UTILS_CONF_OPTS += --disable-alsaloop
 > +endif

While libsamplerate is today only (optionally) used by alsaloop, this
might change in the future, so I prefer to move this check outside the
_UTILS_ALSALOOP conditional.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
