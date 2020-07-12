From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 21:31:26 +0200
Subject: [Buildroot] start-stop-daemon failing due to option -q
In-Reply-To: <CAF8i9mOOn0pU=1u79T_=hgNmxBbi_en_QZ=puossyLFgzrExSw@mail.gmail.com>
References: <CAF8i9mOOn0pU=1u79T_=hgNmxBbi_en_QZ=puossyLFgzrExSw@mail.gmail.com>
Message-ID: <20200712213126.59c57981@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Jul 2020 09:16:00 -0400
William Tambe <tambewilliam@gmail.com> wrote:

> I am seeing the following failure when start-stop-daemon is used
> during services starting; the failure goes away when I remove from
> start-stop-daemon the use of the option -q in the service scripts
> under /etc/init.d/ .
> Is this a known issue ?
> 
> Starting syslogd: start-stop-daemon: option requires an argument -- 'x'

This has something to do with -q. -q is always supported in
start-stop-daemon, it's even listed in the help text of
start-stop-daemon you provide:

>         -q              Quiet

The S01syslogd script looks like this:

        start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
                -- -n $SYSLOGD_ARGS

So I don't see how the -x argument can be empty.

Did you customize the SYSLOGD_ARGS in /etc/default/syslogd perhaps ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
