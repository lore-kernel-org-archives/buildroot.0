From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 29 Jan 2014 10:07:52 +0100
Subject: [Buildroot] [PATCH 1/1] skeleton: add systemd network.service
	unit
In-Reply-To: <20140129082612.GM3867@lukather>
References: <1388713112-4686-1-git-send-email-vsergeev@kumunetworks.com>
 <20140103201333.7f4edd47@skate>
 <CAPyrzo0q7Y3Tf1LOaCe4LK78a7sZrVdToLfnzp4Tc4kow=-nKA@mail.gmail.com>
 <52E7589F.7060301@mind.be>
 <CAGduivw+HOQRDN18=xrM_AwqT3YtoM7BwmcaNRDb0VFVaQM9eQ@mail.gmail.com>
 <20140128132058.GD3867@lukather> <52E7E6D4.1020501@mind.be>
 <20140129082612.GM3867@lukather>
Message-ID: <CAGduivyro21O5aH_EQRugBbt8Ocoxvi5Tygp5BkOQVHgn7ZCVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 29, 2014 at 9:26 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
>
>
> On Tue, Jan 28, 2014 at 06:20:20PM +0100, Arnout Vandecappelle wrote:
>> On 28/01/14 14:20, Maxime Ripard wrote:
>> >On Tue, Jan 28, 2014 at 09:25:20AM +0100, Maxime Hadjinlian wrote:
>> >>I would even like to go even further, as I have noticed that a lot of
>> >>the defined LIBFOO_INSTALL_INIT_SYSTEMD and LIBFOO_INSTALL_INIT_SYSV
>> >>almost always do the exact same stuff.
>> >>I would like for the infrastructure to take care of this, if no
>> >>function is defined, and a .service or S\d{0,2}*, then we should take
>> >>it and install it.
>> >>
>> >>In that case, any particular requirements, the package define a
>> >>function, other than that, it's taken care of and we avoid duplicate
>> >>code in all the packages.
>> >
>> >Actually, there's two main issues that prevents this in the systemd
>> >case, and are why we did it that way:
>> >   - the multi-user-wants thing is actually comparable to the sysvinit
>> >     runlevels. Some packages might want to set their units to other
>> >     targets than multi-user (for example, graphical applications are
>> >     likely to go in the graphical target, not the multi-user one)
>>
>>  I disagree with this one. Buildroot's defaults should support only
>> a single runlevel/target. That's how it's done for sysv init, and
>
> Hmm, afaik, it's not done at all in the sysvinit case, because the
> default sysvinit we use most of the time (busybox's) doesn't handle
> the runlevel at all. It's not really the same story there.
>
>> I'm very happy with it: it's dead easy to see which scripts will be
>> executed at startup, you don't have to find out the runlevel etc.
>> With systemd, things can become even more complex (because there can
>> be several "targets" active at the same time IIRC), and I'd prefer
>> to exclude this complexity by default.
>>
>>  If a user requires several runlevels/targets, than most likely any
>> default that buildroot provide will not fit anyway, so the user will
>> have to manipulate things in their rootfs overlay or post-build
>> script anyway. Therefore, I think it is better for the user if the
>> defaults are simple and predictable.
>>
>>
>> >   - Some units also takes "variables" from the created link names. For
>> >     example, when you want to run getty, you just have a single getty
>> >     unit, and the device to run getty on is set in the link name to
>> >     that unit (so you'd end up with a link in multi-user.target.wants
>> >     that will be getty.ttyS0.service, linking to
>> >     /etc/systemd/system/getty.service).
>>
>>  That is one of the special cases that would be handled in a
>> post-install hook. But specifically for the getty case, it's not
>> even necessary because we start only a single getty in the default
>> setup, so we can directly install it to getty at ttyS0.service .
>
> Which won't work if you don't have a different tty to export a shell
> on, but yes, I get your point.
>
>> >At the time, we thought that in the systemd case, the easiest would be
>> >to simply write down the 2-3 commands we need to setup the unit,
>> >instead of having to give a whole bunch of variables. And we did the
>> >same for sysvinit scripts, for consistency.
>>
>>  I think at the time, we mainly thought that we didn't know yet if
>> the installation could be generalized. Now that we have a few
>> packages that install unit files, it's more clear that they always
>> to the same.
>
> We have *three* packages with systemd units in current master. I
> hardly see how you can generalize something out of 3 (similar)
> samples.
Well to be fair, a *lot* of startup script (Whatever if it's SysV,
systemd, or another one), it is usually a single file starting a
binary with command line arguments. Nothing really fancy.
>
>>  Also, as far as I understand, the idea is not to add variables, but
>> rather to check for the existence of package/foo/*.service and
>> install that.
>
> This also doesn't cover the case anymore where a package would ship
> together with the source code a systemd unit file. I expect it to be
> more and more common, and it's something that we will want to use most
> of the time, and not duplicate the unit file in the buildroot package
> itself.
If a package ship with the unit file in its source code, there should
be a way to install it using the package configure/make or whatever is
provided for that. So you won't even copy the file, we won't need a
copy. Or if it's not possible, we would define the helper function,
and it will install it, which would avoid the copy again.
>
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
