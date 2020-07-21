From: William Tambe <tambewilliam@gmail.com>
Date: Tue, 21 Jul 2020 15:18:19 -0400
Subject: [Buildroot] start-stop-daemon failing due to option -q
In-Reply-To: <CAF8i9mMZ1Je-SUDHkDX97ijv8FT68D0Mz9-6D6-tw51U3ZkPnw@mail.gmail.com>
References: <CAF8i9mOOn0pU=1u79T_=hgNmxBbi_en_QZ=puossyLFgzrExSw@mail.gmail.com>
 <20200712213126.59c57981@windsurf.home>
 <CAF8i9mMZ1Je-SUDHkDX97ijv8FT68D0Mz9-6D6-tw51U3ZkPnw@mail.gmail.com>
Message-ID: <CAF8i9mMxkOdD0bcjcrSHbOVxs5fJsz9X__dKC5EzDUG9O_L21Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 12, 2020 at 9:35 PM William Tambe <tambewilliam@gmail.com> wrote:
>
> On Sun, Jul 12, 2020 at 3:31 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > On Sun, 12 Jul 2020 09:16:00 -0400
> > William Tambe <tambewilliam@gmail.com> wrote:
> >
> > > I am seeing the following failure when start-stop-daemon is used
> > > during services starting; the failure goes away when I remove from
> > > start-stop-daemon the use of the option -q in the service scripts
> > > under /etc/init.d/ .
> > > Is this a known issue ?
> > >
> > > Starting syslogd: start-stop-daemon: option requires an argument -- 'x'
> >
> > This has something to do with -q. -q is always supported in
> > start-stop-daemon, it's even listed in the help text of
> > start-stop-daemon you provide:
> >
> > >         -q              Quiet
> >
> > The S01syslogd script looks like this:
> >
> >         start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
> >                 -- -n $SYSLOGD_ARGS
> >
> > So I don't see how the -x argument can be empty.
> >
> > Did you customize the SYSLOGD_ARGS in /etc/default/syslogd perhaps ?
>
> No, I did not customize SYSLOD_ARGS in in /etc/default/syslogd.
> to find that -q was causing problem, I manually ran start-stop-daemon
> at the shell as follow:
>
> DAEMON="syslogd"
> PIDFILE="/var/run/$DAEMON.pid"
> SYSLOGD_ARGS=""
>
> # This fails:
> start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" -- -n
> $SYSLOGD_ARGS
>
> # While this without -q is successful:
> start-stop-daemon -b -m -S -p "$PIDFILE" -x "/sbin/$DAEMON" -- -n $SYSLOGD_ARGS
>
> Are you able to run start-stop-daemon with the -q option ?

Is anyone else seeing the issue of start-stop-daemon failing when the
option -q is used ?

>
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
