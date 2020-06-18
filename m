From: Michael Walle <michael@walle.cc>
Date: Thu, 18 Jun 2020 23:20:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: remove hardcoded
 interface from config to args
In-Reply-To: <CA+h21ho5ie-sGZ=-SsV=WTSS1VgGKFnQfg+3es+ykJf-ziDacg@mail.gmail.com>
References: <20200520051647.18530-1-heiko.thiery@gmail.com>
 <20200521153619.5466d4e6@windsurf.home>
 <244d4bb9817b608fa5f994a05c8c70c5@walle.cc>
 <CAEyMn7bo79XgZ9UkM8_BKMqDovs=eiDUa8c+A4StYnt2+zq92w@mail.gmail.com>
 <CAEyMn7b+6qyGd9xtJz3qp8HKB0Pv_83R9GQzCyg4g8kRv2gcKA@mail.gmail.com>
 <CA+h21hoGiGWg6O+yO93AcPhJ=zcpR62a6MntA5WRVGeX1yEpUQ@mail.gmail.com>
 <194bafdcc96278a159a155a55104e25e@walle.cc>
 <CA+h21ho5ie-sGZ=-SsV=WTSS1VgGKFnQfg+3es+ykJf-ziDacg@mail.gmail.com>
Message-ID: <89e579fc7a07bf8d78b8c70568e08ffa@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vladimir,

Am 2020-06-18 19:00, schrieb Vladimir Oltean:
> On Thu, 18 Jun 2020 at 19:09, Michael Walle <michael@walle.cc> wrote:
>> 
>> Am 2020-06-16 21:07, schrieb Vladimir Oltean:
[..]
>> > I've thought many times about changing the default ptp4l config file
>> > shipped by buildroot (due to that inconvenient eth0), but at the end
>> > of the day, buildroot is meant to be customized for each and every
>> > embedded target (which makes the comparison to debian not so
>> > relevant). So providing a default config doesn't make a lot of sense
>> > in the first place, except for those users who have never used it
>> > before, and have no idea where to start.
>> 
>> _BUT_ a customized config file which fits one board doesn't make
>> sense either.
> 
> For that board, sure it makes sense. For the rest, not so much.

Then this config should go into the board specific fs overlay.

>> So buildroot should really stick to the default ones
>> provided by the upstream. Like every other distro does. Esp if it
>> "just works".
>> 
> 
> And it does. To my knowledge, linuxptp.cfg from buildroot is
> default.cfg from upstream, just with this extra [eth0] at the end.

It is not even close:
https://github.com/buildroot/buildroot/blob/master/package/linuxptp/linuxptp.cfg
https://github.com/openil/linuxptp/blob/master/configs/default.cfg

>> > But apart from that, as you
>> > said, interface names are going to differ, and let me add another one:
>> > PTP profiles are going to differ (automotive, AVB, telecom, etc):
>> > https://github.com/richardcochran/linuxptp/tree/master/configs
>> > So what do you do, ship them all? That's a little bit _not_ in the
>> > spirit of buildroot where you are only supposed to install what the
>> > end appliance will use.
>> > So I guess I'm back to Thomas's question: what do you win if you move
>> > "eth0" from /etc/linuxptp.cfg to /etc/defaults/ptp4l?
>> 
>> Having an empty [<interface>] section in linuxptp.cfg is strange.
> 
> Why is it strange to have no interfaces defined in linuxptp.cfg?
> That's how upstream configurations are shipped.

I mean an empty [eth0] section, which is the equivalent of having
the "-i" command line option.

>> Why
>> are there the "-i" options for the binary? Because you can then have
>> one config which can be used for multiple instances on different
>> interfaces.
>> 
> 
> Yes.
> 
>> > The default
>> > configuration will remain just as useless for somebody who needs to
>> > customize ptp4l for a particular set of ports and PTP profile.
>> 
>> Right, but as a starting point it is sufficient.
>> 
> 
> And what do you gain if you move that "eth0" to just some other file?

the default.cfg contains all variables which can changed by the user, so
you won't need to look at the manual page to figure out the different
options. the buildroot one, doesn't; I don't know who and why choose
these options.

> Isn't the current starting point just as sufficient?

No, its a board specific configuration, ie. slave-only enabled etc.

I give you another example: lets say I want to provide sensible defaults
to my board supported in buildroot. As you already pointed out, it is
intended behavior to change the configuration for a final board config.
But the board in buildroot should also contain a good template. So right
now, I'd have to make an own copy of the and put it into the overlay.
Which means duplicating the configuration, even worse, I'd have to
track upstream default config. Instead, a package could copy the default
config from the tarball/git repository. This doesn't only apply to
linuxptp, but IMHO for all packages which provide a sane upstream
default config.

If I would put port 2222 into dropbear config installed by buildroot,
I doubt anyone would argue in favor of that.

To go a bit further, I'd like to see that the manual suggests that
any package should install the upstream default config (if there
is a _sensible_ one). Even if that is just because there will never
be an agreement on what the config installed by buildroot should look
like.

-michael

>> > The furthest I got was to have some advanced Kconfig-based system
>> > where you could specify in the defconfig which profile you want, and
>> > on which ports, and the build system would automatically make things
>> > happen. Sadly it was so complicated that I just tossed it away. Note
>> > that some hardware also needs hardware-specific settings (such as
>> > increasing the tx_timestamp_timeout), which makes Thomas's suggestion
>> > of providing rootfs overlays the only viable path in the general case.
>> >
>> > What do you think?
>> >
>> > -Vladimir
> 
> Thanks,
> -Vladimir
