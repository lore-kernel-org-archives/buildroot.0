From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 20 Jun 2020 22:42:10 +0200
Subject: [Buildroot] [PATCH v2 2/7] package/cups-filters: bump to
 version 1.27.5
In-Reply-To: <20200620223326.5d5523cc@windsurf.home>
References: <20200619145719.2352019-1-angelo@amarulasolutions.com>
 <20200619145719.2352019-3-angelo@amarulasolutions.com>
 <20200620223326.5d5523cc@windsurf.home>
Message-ID: <CAOf5uwku+i2D4kOZ3_sz+7rxjFqvmnY27=2BvH6sJXLo1D4htQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

On Sat, Jun 20, 2020 at 10:33 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri, 19 Jun 2020 16:57:14 +0200
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > This patch bumps cups-filters to version 1.27.5.
> > While bumping, fixing also the missing installation for the service files
> > for cups-browsed.
> >
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>
> If Michael is the first SoB, then he is the author of the patch, and we
> should have his From: line, like it appears for PATCH 1/7. Otherwise,
> if you (Angelo) are the author, your SoB should appear first.

Angelo has kept some patches I made on some industrial product I'm working on.
I ask him to make them properly, because I don't have time to clean up them.

Michael

>
> The next comment is: are you sure the service files / init script are
> related to the version bump ? They seem to be unrelated to the version
> bump. Could you clarify that ? Keep in mind that we want one logical
> change per commit.
>
> > diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
> > index 9e4e37ca6b..26e8d4aa06 100644
> > --- a/package/cups-filters/Config.in
> > +++ b/package/cups-filters/Config.in
> > @@ -8,6 +8,9 @@ config BR2_PACKAGE_CUPS_FILTERS
> >       depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> >       depends on BR2_PACKAGE_CUPS
> >       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> > +     select BR2_PACKAGE_DEJAVU
> > +     select BR2_PACKAGE_DEJAVU_SANS
> > +     select BR2_PACKAGE_DEJAVU_SERIF
>
> Why DejaVu specifically, and not any other font ?
>
>
> > +case "$1" in
> > +     start)
> > +             printf "Starting cups-browsed: "
> > +             start-stop-daemon -S -q -m -p /var/run/cups-browsed.pid \
> > +                     -b -x cups-browsed -- -c /etc/cups/cups-browsed.conf
> > +             [ $? = 0 ] && echo "OK" || echo "FAIL"
> > +             ;;
> > +     stop)
> > +             printf "Stopping cups-browsed: "
> > +             start-stop-daemon -K -q -p /var/run/cups-browsed.pid
> > +             [ $? = 0 ] && echo "OK" || echo "FAIL"
> > +             ;;
>
> Please use package/busybox/S01syslodg as a template for new init
> script. We try to increase the consistency between init scripts.
>
>
> > -CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
> > +CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg dejavu
> >
> >  CUPS_FILTERS_CONF_OPTS = \
> >       --disable-mutool \
> > @@ -19,7 +19,10 @@ CUPS_FILTERS_CONF_OPTS = \
> >       --with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
> >       --with-sysroot=$(STAGING_DIR) \
> >       --with-pdftops=pdftops \
> > -     --with-jpeg
> > +     --with-jpeg \
> > +     --with-rcdir=no \
>
>         --without-rcdir \
>
> > +     --with-fontdir=$(STAGING_DIR)/usr/share/fonts/ \
>
> How is this path used ? Only at build time ? Or also on the target (in
> which case it would be wrong).
>
> > +     --with-test-font-path=$(STAGING_DIR)/usr/share/fonts/dejavu/DejaVuSans.ttf
>
> So, what is this used for exactly ?
>
> >
> >  ifeq ($(BR2_PACKAGE_LIBPNG),y)
> >  CUPS_FILTERS_CONF_OPTS += --with-png
> > @@ -71,4 +74,15 @@ else
> >  CUPS_FILTERS_CONF_OPTS += --disable-poppler
> >  endif
> >
> > +define CUPS_FILTERS_INSTALL_INIT_SYSV
> > +     @$(RM) $(TARGET_DIR)/etc/init.d/cups-browsed
>
> Shouldn't this be removed unconditionally, i.e even in the systemd case?
>
> Also, drop the @ at the beginning of the line.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
