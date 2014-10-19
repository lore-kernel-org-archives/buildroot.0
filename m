From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 15:22:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: Link against
 libintl if needed
In-Reply-To: <20141019131729.GN4299@sapphire.tkos.co.il>
References: <1413722799-15992-1-git-send-email-bernd.kuhls@t-online.de>
 <20141019131729.GN4299@sapphire.tkos.co.il>
Message-ID: <20141019132211.GW4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, Bernd, All,

On 2014-10-19 16:17 +0300, Baruch Siach spake thusly:
> On Sun, Oct 19, 2014 at 02:46:39PM +0200, Bernd Kuhls wrote:
> > Fixes
> > alsamixer-cli.o: In function `main':
> > cli.c:(.text.startup+0x4d): undefined reference to `libintl_textdomain'
> > cli.c:(.text.startup+0xc1): undefined reference to `libintl_gettext'
> > cli.c:(.text.startup+0xd5): undefined reference to `libintl_gettext'
> > cli.c:(.text.startup+0xe9): undefined reference to `libintl_gettext'
> > cli.c:(.text.startup+0x1fd): undefined reference to `libintl_gettext'
> > cli.c:(.text.startup+0x223): undefined reference to `libintl_gettext'
> > alsamixer-card_select.o:card_select.c:(.text+0xb8): more undefined references to `libintl_gettext' follow
> > collect2: Fehler: ld gab 1 als Ende-Status zur?ck
> > make[2]: *** [alsamixer] Fehler 1
> 
> I think English error messages would be more google friendly.

Indeed. :-)

> > diff --git a/package/alsa-utils/alsa-utils-0001-libintl.patch b/package/alsa-utils/alsa-utils-0001-libintl.patch
> > new file mode 100644
> > index 0000000..0562ce8
> > --- /dev/null
> > +++ b/package/alsa-utils/alsa-utils-0001-libintl.patch
> > @@ -0,0 +1,23 @@
> > +Link against libintl if needed
> > +
> > +When built against a C library that has locale support, but for which
> > +intl support is provided by an external libintl library, alsamixer
> > +forgets to link against this library, even though the configure script
> > +properly checks that.
> > +
> > +This patch therefore ensure that we link against libintl when needed,
> > +thanks to the @LIBINTL@ variable provided by the configure script.
> > +
> > +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > +
> > +
> > +diff -uNr alsa-utils-1.0.28.org/alsamixer/Makefile.am alsa-utils-1.0.28/alsamixer/Makefile.am
> > +--- alsa-utils-1.0.28.org/alsamixer/Makefile.am	2014-06-13 19:21:05.000000000 +0200
> > ++++ alsa-utils-1.0.28/alsamixer/Makefile.am	2014-10-19 13:13:09.333149017 +0200
> > +@@ -1,5 +1,5 @@
> > + AM_CFLAGS = @CURSES_CFLAGS@ -DCURSESINC="@CURSESINC@"
> > +-LDADD = @CURSESLIB@
> > ++LDADD = @CURSESLIB@ @LIBINTL@
> > + 
> > + bin_PROGRAMS = alsamixer
> > + alsamixer_SOURCES = card_select.c card_select.h \
> > diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
> > index 7079361..b69433f 100644
> > --- a/package/alsa-utils/alsa-utils.mk
> > +++ b/package/alsa-utils/alsa-utils.mk
> > @@ -9,6 +9,8 @@ ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
> >  ALSA_UTILS_SITE = http://alsa.cybermirror.org/utils
> >  ALSA_UTILS_LICENSE = GPLv2
> >  ALSA_UTILS_LICENSE_FILES = COPYING
> > +ALSA_UTILS_AUTORECONF = YES
> > +ALSA_UTILS_GETTEXTIZE = YES
> 
> Why is this needed?

AUTORECONF is needed because the patch touches a Makefile.am . However,
it would be nice to add a comment why.

Ditto for GETTEXTIZE.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
