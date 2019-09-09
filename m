From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 9 Sep 2019 20:15:02 +1200
Subject: [Buildroot] [PATCH] package/syslog-ng: bump version to 3.22.1
In-Reply-To: <CAJ4jsadsPPfO0+jBVaEpMQ_LSQqpQxNd_tyFV580tWLUixkNpw@mail.gmail.com>
References: <20190815085055.21868-1-judge.packham@gmail.com>
 <5d7453359a9f8_12263fea5818a4d447932@ultri5.mail>
 <CAJ4jsadsPPfO0+jBVaEpMQ_LSQqpQxNd_tyFV580tWLUixkNpw@mail.gmail.com>
Message-ID: <CAFOYHZDTFZTzRW60W+k-4ovP92E_WVn0xNdeC19kSzcpvND2Ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 9, 2019 at 10:57 AM Carlos Santos <unixmania@gmail.com> wrote:
>
>  On Sat, Sep 7, 2019 at 10:02 PM Ricardo Martincoski
> <ricardo.martincoski@gmail.com> wrote:
> >
> > Hello,
> >
> > + Thomas P
> > + Carlos, because of the init script
> >
> > This bump made the syslog-ng runtime test to start to fail, see the run before
> > [1] and after [2] this patch.
> >
> > [1] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/290060873
> > [2] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/290060905
> >
> > It fails for 2 reasons, see below. Can you investigate/fix them?
> >
> > On Thu, Aug 15, 2019 at 05:50 AM, Chris Packham wrote:
> >
> > [snip]
> > > +++ b/package/syslog-ng/syslog-ng.mk
> > > @@ -6,7 +6,7 @@
> > >
> > >  # When updating the version, please check at runtime if the version in
> > >  # syslog-ng.conf header needs to be updated
> > > -SYSLOG_NG_VERSION = 3.19.1
> > > +SYSLOG_NG_VERSION = 3.22.1
> >
> > REASON 1. You forgot to update the version number in syslog-ng.conf
> > This makes syslog-ng to generate a warning message every time the target is
> > started (I wrapped the message below):
> >  WARNING: log-fifo-size() works differently starting with syslog-ng 3.22 to
> >  avoid dropping flow-controlled messages when log-fifo-size() is misconfigured.
> >  From now on, log-fifo-size() only affects messages that are not
> >  flow-controlled. (Flow-controlled log paths have the flags(flow-control) option
> >  set.) To enable the new behaviour, update the @version string in your
> >  configuration and consider lowering the value of log-fifo-size().;
> > At first look it seems harmless to the minimal config we use by default and all
> > that needs to be done is to update the version in the .conf file.

I'll fix that up.

> >
> > REASON 2. It seems there is either a bug in upstream or the upstream changed
> > behavior and we need to add a dependency or change our default init script.
> > I saw in another thread you mentioned there is a new upstream version and you
> > are already planning to send another bump. Maybe the new bump fix this second
> > issue. Anyway I will describe below the tests I did.
> > I downloaded the artifacts from the gitlab-ci run and started the image using
> > the qemu command displayed in the first line of the -run.log file.
> >
> > The daemon seems to not reload correctly:
> > 3.19.1:
> > |# syslog-ng-ctl reload
> > |OK Config reload initiated
> > |#
> > 3.22.1:
> > |# syslog-ng-ctl reload
> > |EOF occurred while reading control socket
> > |#
> >
> > The daemon never stops:
> > 3.19.1:
> > |# ps aux | grep syslog
> > |   44 root     {syslog-ng} supervising syslog-ng
> > |   45 root     /usr/sbin/syslog-ng
> > |   72 root     grep syslog
> > |# /etc/init.d/S01syslog-ng stop
> > |Stopping syslog-ng: OK
> > |# ps aux | grep syslog
> > |   77 root     grep syslog
> > |#
> > 3.22.1:
> > |# ps aux | grep syslog
> > |   44 root     {syslog-ng} supervising syslog-ng
> > |   70 root     /usr/sbin/syslog-ng
> > |   75 root     grep syslog
> > |# /etc/init.d/S01syslog-ng stop
> > |Stopping syslog-ng: OK
> > |# ps aux | grep syslog
> > |   44 root     {syslog-ng} supervising syslog-ng
> > |   79 root     /usr/sbin/syslog-ng
> > |   83 root     grep syslog
> > |#
> > So I tried to change the command used by the init script, 'KILL' works:
> > 3.22.1:
> > |# ps aux | grep syslog
> > |   44 root     {syslog-ng} supervising syslog-ng
> > |   98 root     /usr/sbin/syslog-ng
> > |  124 root     grep syslog
> > |# start-stop-daemon -K -p /var/run/syslog-ng.pid
> > |stopped process in pidfile '/var/run/syslog-ng.pid' (pid 98)
> > |# ps aux | grep syslog
> > |   44 root     {syslog-ng} supervising syslog-ng
> > |  127 root     /usr/sbin/syslog-ng
> > |  131 root     grep syslog
> > |# start-stop-daemon -K -s KILL -p /var/run/syslog-ng.pid
> > |stopped process in pidfile '/var/run/syslog-ng.pid' (pid 127)
> > |# ps aux | grep syslog
> > |  134 root     grep syslog
> > |#
> >
> > When the daemon receives a message it seems to fail and another PID is created:
> > 3.22.1:
> > |# ps aux | grep syslog
> > |   44 root     {syslog-ng} supervising syslog-ng
> > |   74 root     /usr/sbin/syslog-ng
> > |   78 root     grep syslog
> > |# logger my-message
> > |# ps aux | grep syslog
> > |   44 root     {syslog-ng} supervising syslog-ng
> > |   82 root     /usr/sbin/syslog-ng
> > |   84 root     grep syslog
> > |# grep my-message /var/log/messages
> > |#
> > If I keep trying sending messages using logger, some are received, some are not.
> >
> > Regards,
> > Ricardo
>
> Hi Ricardo,
>
> I ran a test on a QEMU build with udev and noticed that syslog-g hangs
> on start-up. Using strace I found that it blocks on a getrandom()
> call, which seems to be make sense since the start-up order is
>
>     /etc/init.d/S01syslog-ng
>     /etc/init.d/S10udev
>     /etc/init.d/S20urandom

I didn't have any particular reason for S01 other than that's what
rsyslog does. Moving it after urandom would be fine.

>
> So when syslog-ng starts the random number generator is not working
> properly because virtio-rng is not loaded yet.
>
> It does not hang if I revert the order to start syslog-ng after udev
> or modifi the init script to load virtio-rng by before starting
> syslog-ng.
>
> I observed the same behaviour with versions 3.19.1 and 3.22.1.
>
> I tested with an ARM qemu based on qemu_arm_versatile_defconfig (no
> udev, no virtio support in the kernel). It shows the same behavior
> except that loading the rng-coremodule suffices.
>
> --
> Carlos Santos <unixmania@gmail.com>
