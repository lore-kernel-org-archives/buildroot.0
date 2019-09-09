From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 9 Sep 2019 23:46:47 +1200
Subject: [Buildroot] [PATCH] package/syslog-ng: bump version to 3.22.1
In-Reply-To: <CAJ4jsaewtEJ139aB30rhPB1RXLMfFjbD7wVLvukZQ4bBVk2kqw@mail.gmail.com>
References: <20190815085055.21868-1-judge.packham@gmail.com>
 <5d7453359a9f8_12263fea5818a4d447932@ultri5.mail>
 <CAJ4jsadsPPfO0+jBVaEpMQ_LSQqpQxNd_tyFV580tWLUixkNpw@mail.gmail.com>
 <CAFOYHZDTFZTzRW60W+k-4ovP92E_WVn0xNdeC19kSzcpvND2Ww@mail.gmail.com>
 <CAJ4jsaewtEJ139aB30rhPB1RXLMfFjbD7wVLvukZQ4bBVk2kqw@mail.gmail.com>
Message-ID: <CAFOYHZDSBeKYnRf=5zT6yCGGF0hiq6MH2AoqDrJo9jsNKQ5hEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 9 Sep 2019 23:40 Carlos Santos, <unixmania@gmail.com> wrote:

> > > Hi Ricardo,
> > >
> > > I ran a test on a QEMU build with udev and noticed that syslog-g hangs
> > > on start-up. Using strace I found that it blocks on a getrandom()
> > > call, which seems to be make sense since the start-up order is
> > >
> > >     /etc/init.d/S01syslog-ng
> > >     /etc/init.d/S10udev
> > >     /etc/init.d/S20urandom
> >
> > I didn't have any particular reason for S01 other than that's what
> > rsyslog does. Moving it after urandom would be fine.
>
> S01 is the right place, since udevd uses syslog and starting syslog-ng
> later would prevent error messages from being saved in
> /var/logmessages.
>
> The correct solution is to configure the kernel with the random
> hardware support embedded, not as a module (e.g. HW_RANDOM=y ,
> CONFIG_VIRTIO_PCI=y  and HW_RANDOM_VIRTIO=y in
> board/qemu/arm-versatile/linux.config).
>

Still seems odd that this dependency exhists. Maybe there is an option to
disable it.


> > >
> > > So when syslog-ng starts the random number generator is not working
> > > properly because virtio-rng is not loaded yet.
> > >
> > > It does not hang if I revert the order to start syslog-ng after udev
> > > or modifi the init script to load virtio-rng by before starting
> > > syslog-ng.
> > >
> > > I observed the same behaviour with versions 3.19.1 and 3.22.1.
> > >
> > > I tested with an ARM qemu based on qemu_arm_versatile_defconfig (no
> > > udev, no virtio support in the kernel). It shows the same behavior
> > > except that loading the rng-coremodule suffices.
> > >
> > > --
> > > Carlos Santos <unixmania@gmail.com>
>
> --
> Carlos Santos <unixmania@gmail.com>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190909/e11003ea/attachment.html>
