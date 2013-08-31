From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 13:46:54 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bumped to version 206
In-Reply-To: <221109548.81879318.1377880694250.JavaMail.root@zimbra32-e6.priv.proxad.net>
References: <20130830163635.39ccd4cd@skate>
 <221109548.81879318.1377880694250.JavaMail.root@zimbra32-e6.priv.proxad.net>
Message-ID: <20130831134654.661a11a6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric,

On Fri, 30 Aug 2013 18:38:14 +0200 (CEST), eric.le.bihan.dev at free.fr
wrote:
> > However, now that udev is part of systemd, some of this needs to
> > change. What is your plan regarding that?
> 
> Oops! I missed this part! I've just found out I had two copies of 
> libudev.so on my target (/lib/libudev.so.0.13.1
> and /usr/lib/libudev.so.1.3.7).

Right. You have the old standalone udev, and the udev built in with
systemd.

> > May I suggest you to go through the thread at
> > http://lists.busybox.net/pipermail/buildroot/2013-March/068130.html,
> > which contains a large discussion about systemd/udev that started
> > the last time a contributor posted an updated to the systemd
> > package.
> 
> Thanks for pointing it out to me. Yocto project gets around this
> problem thanks to its packaging system (the 'udev' feature is
> provided by either udev-182 or systemd-206 recipe). Enabling udev
> only if systemd is the selected init system seems to be the easiest
> solution, but would it not restrict the user?
> 
> I'll see if I can make the udev package depends on systemd and only
> grab the interesting pieces.

I believe we have several options:

 (1) No longer allow the usage of 'udev' without systemd. This is I
     believe what would match the best the upstream decision of making
     udev and systemd more and more integrated together. This would
     mean remove the separate 'udev' package, and turn the 'udev' /dev
     management method into a 'udev+systemd' management method, which
     would force the "init method" to be systemd. This is probably the
     easiest solution, but I guess some users might be disappointed:
     they might be using udev for some reason, but still may not want
     all the systemd/dbus stuff. That said, using udev without systemd
     seems to go against the choices of the upstream systemd project.

 (2) Continue to use an old standalone udev, but ensure that the choice
     of udev and systemd are mutually exclusive. This is not very
     satisfying since the old udev we have is no longer maintained, so
     it does not look like a solution that is very future-proof.

 (3) Package one of more recent 'udev' versions that have been
     extracted from systemd sources, as a separate 'udev' package that
     would be mutually exclusive with systemd. It's a bit like (2) but
     with a more recent udev version. However, it's unclear how those
     forked versions of udev will be maintained over time.

 (4) See if it's possible to make the systemd package only provide
     udev. I think it is possible to install only udev, but as far as I
     remember, D-Bus was still required at build time, unless you did
     some tricks.

To be honest, as I'm not really using udev myself, choice (1) seems to
have my preference. If udev users are not happy with the fact that they
must now use systemd, then they should work that out with upstream (and
I wish them good luck!).

What do you think about this?

> BTW, a great feature of Buildroot is to provide means to build images
> for a wide range of embedded devices: from small ones with limited
> resources (where Busybox init + mdev is a perfect combination) to
> beefy ones (which could handle systemd + udev).

Right.

> I initially updated Systemd because I wanted to see if it could be
> usable on embedded devices. I am looking for an init system with
> supervision capabilities and successfully used Buildroot with runit
> an s6. Both are more suitable (system-journald consumes too much
> memory for my purpose).

runit ? s6 ? What are these ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
