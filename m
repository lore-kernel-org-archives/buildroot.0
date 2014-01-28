From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue, 28 Jan 2014 14:20:58 +0100
Subject: [Buildroot] [PATCH 1/1] skeleton: add systemd network.service
 unit
In-Reply-To: <CAGduivw+HOQRDN18=xrM_AwqT3YtoM7BwmcaNRDb0VFVaQM9eQ@mail.gmail.com>
References: <1388713112-4686-1-git-send-email-vsergeev@kumunetworks.com>
 <20140103201333.7f4edd47@skate>
 <CAPyrzo0q7Y3Tf1LOaCe4LK78a7sZrVdToLfnzp4Tc4kow=-nKA@mail.gmail.com>
 <52E7589F.7060301@mind.be>
 <CAGduivw+HOQRDN18=xrM_AwqT3YtoM7BwmcaNRDb0VFVaQM9eQ@mail.gmail.com>
Message-ID: <20140128132058.GD3867@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 28, 2014 at 09:25:20AM +0100, Maxime Hadjinlian wrote:
> I would even like to go even further, as I have noticed that a lot of
> the defined LIBFOO_INSTALL_INIT_SYSTEMD and LIBFOO_INSTALL_INIT_SYSV
> almost always do the exact same stuff.
> I would like for the infrastructure to take care of this, if no
> function is defined, and a .service or S\d{0,2}*, then we should take
> it and install it.
> 
> In that case, any particular requirements, the package define a
> function, other than that, it's taken care of and we avoid duplicate
> code in all the packages.

Actually, there's two main issues that prevents this in the systemd
case, and are why we did it that way:
  - the multi-user-wants thing is actually comparable to the sysvinit
    runlevels. Some packages might want to set their units to other
    targets than multi-user (for example, graphical applications are
    likely to go in the graphical target, not the multi-user one)
  - Some units also takes "variables" from the created link names. For
    example, when you want to run getty, you just have a single getty
    unit, and the device to run getty on is set in the link name to
    that unit (so you'd end up with a link in multi-user.target.wants
    that will be getty.ttyS0.service, linking to
    /etc/systemd/system/getty.service).

At the time, we thought that in the systemd case, the easiest would be
to simply write down the 2-3 commands we need to setup the unit,
instead of having to give a whole bunch of variables. And we did the
same for sysvinit scripts, for consistency.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140128/bad2adac/attachment.asc>
