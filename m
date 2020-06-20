From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sat, 20 Jun 2020 22:48:55 +0200
Subject: [Buildroot] [PATCH v2 3/7] package/cups: bump to version 2.3.3
In-Reply-To: <20200620223540.3ccb6371@windsurf.home>
References: <20200619145719.2352019-1-angelo@amarulasolutions.com>
 <20200619145719.2352019-4-angelo@amarulasolutions.com>
 <20200620223540.3ccb6371@windsurf.home>
Message-ID: <CA+_SqVa8bHa4+FZ_NjE4Gw-V1SAGNrSE_AX=fzX=eH07R=wxnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 20, 2020 at 10:35 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Angelo,
>
> On Fri, 19 Jun 2020 16:57:15 +0200
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > This patch bumps cups to version 2.3.3.
> > While bumping, fixing also the wrong installation of service files:
> > the rcdir was left to the default value, that means installing the
> > service files into the /etc/rcX.d directory.
> > Adding also a simplified systemv service file for loading cupsd.
>
> Again, this seems to be mixing up different changes together in the
> same commit. If I understand correctly what you're saying, you should
> have at least three different commits:
>
>  - Fix the rcdir value, due to which the systemd service file was not
>    installed at the right place.
>
>  - Provide and install an init script
>
>  - Bump the version.
>

It's really that important to split it? No problem to do that, but this
package installs a service and the way it is doing in the new version is
the one proposed in the patch. The old version could have been different,
I've not checked btw.
Anyway, having this is required to have the service correctly installed, so
I don't think the patch should be splitted because the bump really requires
it.
Probably the commit message could be better explaining this.


> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>
> Same issue as PATCH 2/7 about author/SoB.
>
>
> > diff --git a/package/cups/S81cupsd b/package/cups/S81cupsd
> > new file mode 100644
> > index 0000000000..f527d55f1e
> > --- /dev/null
> > +++ b/package/cups/S81cupsd
>
> Please take inspiration from package/busybox/S01syslogd.
>

Will do.


> > -CUPS_VERSION = 2.3.1
> > +CUPS_VERSION = 2.3.3
> >  CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
> >  CUPS_SITE =
> https://github.com/apple/cups/releases/download/v$(CUPS_VERSION)
> >  CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
> > @@ -21,7 +21,8 @@ CUPS_CONF_OPTS = \
> >       --with-docdir=/usr/share/cups/doc-root \
> >       --disable-gssapi \
> >       --disable-pam \
> > -     --libdir=/usr/lib
> > +     --libdir=/usr/lib \
> > +     --with-rcdir=no
>
>         --without-rcdir
>
> > +define CUPS_INSTALL_INIT_SYSV
> > +     @$(RM) $(TARGET_DIR)/etc/init.d/cups
>
> This should also be done in the systemd case I believe, and should not
> have the @.
>

Not for systemd, cause the package installs the .service file and not the
systemv related ones.


>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200620/e867f725/attachment.html>
