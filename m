From: Vladimir Oltean <olteanv@gmail.com>
Date: Tue, 16 Jun 2020 22:07:36 +0300
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: remove hardcoded
 interface from config to args
In-Reply-To: <CAEyMn7b+6qyGd9xtJz3qp8HKB0Pv_83R9GQzCyg4g8kRv2gcKA@mail.gmail.com>
References: <20200520051647.18530-1-heiko.thiery@gmail.com>
 <20200521153619.5466d4e6@windsurf.home>
 <244d4bb9817b608fa5f994a05c8c70c5@walle.cc>
 <CAEyMn7bo79XgZ9UkM8_BKMqDovs=eiDUa8c+A4StYnt2+zq92w@mail.gmail.com>
 <CAEyMn7b+6qyGd9xtJz3qp8HKB0Pv_83R9GQzCyg4g8kRv2gcKA@mail.gmail.com>
Message-ID: <CA+h21hoGiGWg6O+yO93AcPhJ=zcpR62a6MntA5WRVGeX1yEpUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Heiko,

On Mon, 15 Jun 2020 at 14:36, Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> Hi Thomas, Hi Michael,
>
> Am Mi., 27. Mai 2020 um 08:51 Uhr schrieb Heiko Thiery <heiko.thiery@gmail.com>:
> >
> > Hi Petr,
> >
> >
> > Am Do., 21. Mai 2020 um 23:22 Uhr schrieb Michael Walle <michael@walle.cc>:
> > >
> > > Hi all,
> > >
> > > Am 2020-05-21 15:36, schrieb Thomas Petazzoni:
> > > > Hello Heiko,
> > > >
> > > > On Wed, 20 May 2020 07:16:48 +0200
> > > > Heiko Thiery <heiko.thiery@gmail.com> wrote:
> > > >
> > > >> Interface configuration is hard coded in the config file. This will
> > > >> throw an error when this interace (eth0) is not present.
> > > >>
> > > >> This patch removes the interface to be used from the config and
> > > >> appends it
> > > >> to the PTP4L_ARGS. With this the custom arguments can be set via
> > > >> /etc/defaults/ptp4l.
> > > >
> > > > Well, you can also just as well provide your custom linuxptp.cfg in a
> > > > rootfs overlay, no?
> > >
> > > You can, but then you'd have to copy the configuration on each and every
> > > board which has another interface name than "eth0". That being said, I'd
> > > also prefer it to have the normal default config, shipped with linuxptp.
> > > Like at least debian does too.
> >
> > What do you think? Can we change the default configuration to the one
> > coming from the package? As Michael mentioned this is also the case
> > e.g. for debian.
>
> Since no reply from the package maintainer about changing the default
> configuration what do you think? Should we change the used config to
> the one provided by the upstream linuxptp?
>
> --
> Heiko
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

I've thought many times about changing the default ptp4l config file
shipped by buildroot (due to that inconvenient eth0), but at the end
of the day, buildroot is meant to be customized for each and every
embedded target (which makes the comparison to debian not so
relevant). So providing a default config doesn't make a lot of sense
in the first place, except for those users who have never used it
before, and have no idea where to start. But apart from that, as you
said, interface names are going to differ, and let me add another one:
PTP profiles are going to differ (automotive, AVB, telecom, etc):
https://github.com/richardcochran/linuxptp/tree/master/configs
So what do you do, ship them all? That's a little bit _not_ in the
spirit of buildroot where you are only supposed to install what the
end appliance will use.
So I guess I'm back to Thomas's question: what do you win if you move
"eth0" from /etc/linuxptp.cfg to /etc/defaults/ptp4l? The default
configuration will remain just as useless for somebody who needs to
customize ptp4l for a particular set of ports and PTP profile.
The furthest I got was to have some advanced Kconfig-based system
where you could specify in the defconfig which profile you want, and
on which ports, and the build system would automatically make things
happen. Sadly it was so complicated that I just tossed it away. Note
that some hardware also needs hardware-specific settings (such as
increasing the tx_timestamp_timeout), which makes Thomas's suggestion
of providing rootfs overlays the only viable path in the general case.

What do you think?

-Vladimir
