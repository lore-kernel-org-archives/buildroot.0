From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Nov 2018 10:14:07 +0100
Subject: [Buildroot] [PATCH v2] package/fail2ban: new package
In-Reply-To: <CAGm1_kuZLJTyjaKFs4Zc2MeT1z+UwFecEwJBuJSwVai8R4CMiQ@mail.gmail.com>
References: <1534945312-25275-1-git-send-email-angelo@amarulasolutions.com>
 <20180911000522.1f1efdc3@windsurf>
 <CA+TH9Vm9BcTyCN3BWYcno-G9XjJ6PsT=Cr3vw=PyKpgsEZz08g@mail.gmail.com>
 <CAGm1_kuZLJTyjaKFs4Zc2MeT1z+UwFecEwJBuJSwVai8R4CMiQ@mail.gmail.com>
Message-ID: <CA+TH9V=TOf=APhyJdH+0ng+kC8KisvHiSw9HV05ddK0yM7y8zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor,
Il giorno ven 30 nov 2018 alle ore 09:54 Yegor Yefremov
<yegorslists@googlemail.com> ha scritto:
>
> Hi Angelo,
>
> On Sun, Nov 25, 2018 at 12:28 AM Angelo Compagnucci
> <angelo.compagnucci@gmail.com> wrote:
> >
> > Hi Thomas,
> > Il giorno mar 11 set 2018 alle ore 00:05 Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> ha scritto:
> > >
> > > Hello,
> > >
> > > +Yegor in Cc. Yegor: read all the way to the end, there is a question
> > > about the python-package infrastructure.
> > >
> > > On Wed, 22 Aug 2018 15:41:52 +0200, Angelo Compagnucci wrote:
> > > > Fail2ban scans log files (e.g. /var/log/apache/error_log)
> > > > and bans IPs that show malicious behaviours.
> > > >
> > > > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> > >
> > > I was about to apply this patch (I even made a few minor fixes), but
> > > there is one thing that made me change my mind, see below. I will also
> > > list the minor issues.
> > >
> > > >  package/Config.in              |  1 +
> > > >  package/fail2ban/Config.in     | 14 ++++++++++++++
> > > >  package/fail2ban/S60fail2ban   | 23 +++++++++++++++++++++++
> > > >  package/fail2ban/fail2ban.hash |  3 +++
> > > >  package/fail2ban/fail2ban.mk   | 28 ++++++++++++++++++++++++++++
> > >
> > > Entry in DEVELOPERS file missing.
> > >
> > > > diff --git a/package/fail2ban/Config.in b/package/fail2ban/Config.in
> > > > new file mode 100644
> > > > index 0000000..cf82526
> > > > --- /dev/null
> > > > +++ b/package/fail2ban/Config.in
> > > > @@ -0,0 +1,14 @@
> > > > +config BR2_PACKAGE_FAIL2BAN
> > > > +     bool "fail2ban"
> > > > +     depends on BR2_PACKAGE_PYTHON
> > >
> > > Are you sure it doesn't work with Python 3.x ? The fail2ban
> > > github page says it does.
> >
> > Probably it say so, but simply trying to run the software with python3:
> >
> >   File "/home/angelo/DEV/BUILDROOT/br_qemu_arm/build/fail2ban-0.10.4/fail2ban/__init__.py",
> > line 85, in _init
> >     for i in xrange(50):
> > NameError: name 'xrange' is not defined
>
> This was fixed in [1], but it seems like if you'll have wait till the
> next release.

Yes I know and meanwhile I submitted a PR to disable installation of
tests files hoping that the next release contains both fixes, but as
far as I can tell the project has a load of backlog!

Thanks!

>
> [1] https://github.com/fail2ban/fail2ban/commit/657b147c0d7830f3600f3dc7feaa4815a7e19fde#diff-ac23116c0e156f1acc787e57fe98391c
>
> Yegor
>
> > >
> > > > +     help
> > > > +       Fail2ban scans log files (e.g. /var/log/apache/error_log) and bans IPs
> > > > +       that show the malicious signs -- too many password failures, seeking
> > > > +       for exploits, etc. Out of the box Fail2Ban comes with filters for
> > > > +       various services (apache, courier, ssh, etc).
> > > > +
> > > > +       Fail2Ban is able to reduce the rate of incorrect authentications
> > > > +       attempts however it cannot eliminate the risk that weak authentication
> > > > +       presents.
> > >
> > > Aren't some of those lines too long? Could you verify with check-package
> > >
> > > > +
> > > > +       https://www.fail2ban.org
> > >
> > > Please add a Config.in comment about the Python dependency.
> > >
> > > > diff --git a/package/fail2ban/S60fail2ban b/package/fail2ban/S60fail2ban
> > > > new file mode 100644
> > > > index 0000000..92559e9
> > > > --- /dev/null
> > > > +++ b/package/fail2ban/S60fail2ban
> > > > @@ -0,0 +1,23 @@
> > > > +#!/bin/sh
> > > > +
> > > > +case "$1" in
> > > > +     start)
> > > > +             printf "Starting fail2ban: "
> > > > +             start-stop-daemon -S -q -m -p /run/fail2ban.pid \
> > >
> > > Put the PID file in /var/run, to be consistent with most of our other
> > > init scripts.
> > >
> > > > +                     -b -x fail2ban-server -- -xf start
> > > > +             [ $? = 0 ] && echo "OK" || echo "FAIL"
> > > > +             ;;
> > > > +     stop)
> > > > +             printf "Stopping fail2ban: "
> > > > +             start-stop-daemon -K -q -p /run/fail2ban.pid
> > >
> > > Ditto.
> > >
> > >
> > > > +FAIL2BAN_VERSION = 0.10.3.1
> > > > +FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
> > > > +FAIL2BAN_LICENSE = GPL-2.0+
> > > > +FAIL2BAN_LICENSE_FILES = COPYING
> > > > +FAIL2BAN_SETUP_TYPE = setuptools
> > > > +FAIL2BAN_INSTALL_TARGET_OPTS = --root=$(TARGET_DIR) --prefix=/usr
> > >
> > > So here is the one thing that made me change my mind. I was wondering:
> > > why do we need to pass those options in the fail2ban package? Why
> > > aren't they passed by the python-package infrastructure?
> > >
> > > Turns out that the Python package infrastructure is doing this:
> > >
> > > PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
> > >         --prefix=$(TARGET_DIR)/usr \
> > >         --executable=/usr/bin/python \
> > >         --single-version-externally-managed \
> > >         --root=/
> > >
> > > PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
> > >         --prefix=$(STAGING_DIR)/usr \
> > >         --executable=/usr/bin/python \
> > >         --single-version-externally-managed \
> > >         --root=/
> > >
> > > This looks pretty wrong, and it seems like we should be using:
> > >
> > >         --prefix=/usr \
> > >         --root=$(TARGET_DIR)
> > >
> > > and ditto for the staging installation, of course. Yegor, do you see
> > > any drawback with doing this change in pkg-python.mk ? To me, it seems
> > > like the right thing to do, and would avoid the need to have a special
> > > case in fail2ban.mk.
> > >
> > > Thanks!
> > >
> > > Thomas
> > > --
> > > Thomas Petazzoni, CTO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> >
> >
> > --
> > Profile: http://it.linkedin.com/in/compagnucciangelo
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
