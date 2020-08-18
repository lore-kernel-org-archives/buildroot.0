From: Olivier Dautricourt <olivier.dautricourt@orolia.com>
Date: Tue, 18 Aug 2020 23:13:01 +0200
Subject: [Buildroot] [PATCH 1/2] package/gpsd: bump version to 3.21
In-Reply-To: <20200818223041.485653f7@windsurf.home>
References: <20200817132336.1110072-1-olivier.dautricourt@orolia.com>
 <20200818164919.498452cc@windsurf.home>
 <20200818172119.GA48223@orolia.com>
 <20200818223041.485653f7@windsurf.home>
Message-ID: <20200818211301.GA51654@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

The 08/18/2020 22:30, Thomas Petazzoni wrote:
> 
> Hello Olivier,
> 
> On Tue, 18 Aug 2020 19:21:19 +0200
> Olivier Dautricourt <olivier.dautricourt@orolia.com> wrote:
> 
> > > > - removed unnecessary patch
> > > > - removed obsolete gpsd options:
> > > >       GPSD_CONTROLSEND
> > Option was just removed upstream (e720403069dd6ca)
> > Reason given was: "It overlapped RECONFIGURE_ENABLE in strange ways".
> > This was preventing gpsctl to configure receivers, but i guess this
> > option is not relevant anymore.
> >
> > > >       GPSD_RECONFIGURE
> > Replaced with -p (--passive) runtime option.
> > This is to prevent gpsd to auto-configure receivers.
> >
> > > >       GPSD_FIXED_PORT_SPEED
> > This option was already removed in 3.20.
> > It is replaced with -s <speed> runtime option.
> > FIXED_STOP_BITS was also replaced with -f <framing> opt but this was never
> > included in the buildroot configuration anyway.
> 
> Then I think we need Config.in.legacy handling for the removal of those
> 3 options.

So i would add something like that to Config.in.legacy:

config BR2_PACKAGE_GPSD_FIXED_PORT_SPEED
	bool "compile-time fixed port speed removed"
	select BR2_LEGACY
	help
	  The option was replaced by runtime option -f <speed>

But do i have to take action on the package side such as
patching the default gpsd.service file when the above option is selected:

ExecStart=/usr/local/sbin/gpsd -f ${BR2_PACKAGE_GPSD_FIXED_PORT_SPEED_VALUE}

knowing that the service file could be overwritten by local overlays in the build process.


Thanks !

-- 
Olivier Dautricourt
