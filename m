From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 11 Feb 2019 22:40:00 +0100
Subject: [Buildroot] [RFC 0/3] init: Add s6 as init system
In-Reply-To: <20190208122023.GA16579@lwo1-lhp-f71841>
References: <20190116215135.32142-1-vadim4j@gmail.com>
 <20190120153151.GA22618@itchy>
 <20190208122023.GA16579@lwo1-lhp-f71841>
Message-ID: <20190211214000.GA5977@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-02-08 14:20, Vadym Kochan wrote:
> Hi Eric,
>
> On Sun, Jan 20, 2019 at 04:31:51PM +0100, Eric Le Bihan wrote:
> > Hi!
> > On 2019-01-16 23:51, Vadim Kochan wrote:
> > > Add new system init support (BR2_INIT_S6) based on s6 suite. This is very-very
> > > basic support which does not have any setup automation logic (but only getty)
> > > but it allows to install custom s6-rc services in a bit easier way by the
> > > board. All s6-rc services which were copied by rootfs-overlay or post-build
> > > will be compiled as s6-rc db into /etc/s6-rc/compiled-initial, which also has
> > > /etc/s6-rc/compiled link to easy replace it in runtime.
> > >
> > > In case if such kind of change will be merged, then may be it would be good to
> > > think about of some packages integration into s6-rc system.
> > >
> > > Vadim Kochan (3):
> > >   package/s6-linux-init: Build also for the host
> > >   package/s6-linux-init: Allow to install as init system
> > >   package/s6-rc: Allow to integrate s6-rc services
> > >
> > >  package/s6-linux-init/s6-linux-init.mk | 69 +++++++++++++++++++++++++++++++++-
> > >  package/s6-rc/rc.init                  |  4 ++
> > >  package/s6-rc/rc.shutdown              |  3 ++
> > >  package/s6-rc/s6-rc.mk                 | 32 ++++++++++++++++
> > >  system/Config.in                       |  9 ++++-
> > >  5 files changed, 114 insertions(+), 3 deletions(-)
> > >  create mode 100644 package/s6-rc/rc.init
> > >  create mode 100644 package/s6-rc/rc.shutdown
> > >
> > > --
> > > 2.14.1
> > >
> >
> > I worked on a s6-based init system eons ago [1], but without using a
> > host variant of s6-linux-init.
> >
> > I'll test your patches.
> >
> > [1] https://github.com/elebihan/br2-ext-skarnet
> >
> > Regards,
> >
> > --
> > ELB
>
> Do you have any conceptual comments regarding this ? Also I think may be
> it's better to have /etc/s6-rc into /etc/s6/rc.

I tested your series and it works fine. As you are using the file system
pre and post command hooks to compile the database services, this is
cleaner than using a post-build script as done in my external
customization.

I had not used s6-linux-init-maker at that time, but favored a
hand-written init. Now this tool does the job, so it is OK to use it.

If this series is applied and a s6-based init option is available to the
user, I think that providing kerneld/syslogd via s6-log may be useful.
The same may apply to network configuration. The selling point of a
s6-based init system is the service supervision and having the basic
services available and supervised contribute to it.

But adding support for s6-compliant services is tricky, as unlike
systemd, services are not available as files but as directories. So
providing some for the basic services in Buildroot may clutter the
source tree. My approach was to provide them via dedicated projects
(s6-br2-init{skeleton,services}), but there may be a cleaner one. The
nosh init system [1] provides a tool to convert systemd services, so may
be such a tool for s6 may do the trick.

As for /etc/s6-rc vs. /etc/s6/rc, the later may indeed be better, as
there is already /etc/s6/init.

[1] https://jdebp.eu/Softwares/nosh/

Regards,

--
ELB
