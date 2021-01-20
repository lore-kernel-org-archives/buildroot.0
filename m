From: Andreas Hilse <andreas.hilse@googlemail.com>
Date: Wed, 20 Jan 2021 11:11:30 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/sysklogd: bump to version
 2.1.2
In-Reply-To: <20210119222636.42b6121a@windsurf.home>
References: <20200812160843.24064-1-andreas.hilse@googlemail.com>
 <20201229181125.704233-1-andreas.hilse@googlemail.com>
 <87turgy8vi.fsf@gmail.com> <20210119222636.42b6121a@windsurf.home>
Message-ID: <CANabuZdyTY9tOdXqAiW4bjvOK=RDYW2MZvzw5eMQ-iCiYpQZFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Hello Joachim,

> > > +SYSKLOGD_CONF_OPTS = --exec-prefix=/ --without-logger
> >
> > The logger tool that comes with sysklogd is quite advanced, allowing the
> > user to leverage the RFC5424 `syslogp()` API to its fullest.  However,
> > it collides with its namesake in BusyBox, but so does the logger tool in
> > util-linux.  I'd very much like to see it in Buildroot, but I can submit
> > a patch later to add menuconfig support :)
>
> Patch welcome indeed!
>
> Regarding the collision with Busybox, we do have a mechanism in place
> to handle that, so it should be fine. Busybox already has the sysklogd
> package in its dependencies, which means that sysklogd if enabled will
> always be built before Busybox. And the Busybox installation is careful
> to not overwrite any file. So if /bin/foobar has been installed by
> sysklogd, even if Busybox has support for /bin/foobar, it will not
> overwrite /bin/foobar with its own symlink.
>

The issue I had with the logger tool is that the base dir for sysklogd
(exec-prefix) is /, thus it is placed in /bin. The busybox logger is
placed in /usr/bin so I ended up with both in my rootfs.

To make this work sysklogd exec-prefix should be /usr - which implies
additional changes in the package files.
Would this be ok?

Best regards
Andreas
