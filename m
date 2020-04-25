From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 25 Apr 2020 21:58:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/syrepo: fix SysV init script
In-Reply-To: <20200425213717.46a38cbf@windsurf.home>
References: <20200420095738.16104-1-heiko.thiery@gmail.com>
 <20200425162221.5105443c@windsurf.home>
 <CAEyMn7arhktDMYurpWu-8E=vqFYFvez17sqdAm+m+vC7BkgptA@mail.gmail.com>
 <20200425213717.46a38cbf@windsurf.home>
Message-ID: <CAEyMn7atSwtJ6XHD3utVG+LWp7kprdKdufD5e6-qP_61_qHZMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sa., 25. Apr. 2020 um 21:37 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Sat, 25 Apr 2020 17:26:49 +0200
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > > > The sysrepo-plugind does not support to be controlled via the PID by the
> > > > start-stop-daemon. This is because sysrepo-plugind does a fork.
> > > > Thus the daemon is running with another PID known by start-stop-daemon.
> > >
> > > "known" by start-stop-daemon, or "not known" ?
> >
> > Ok, I was unclear. The PID used by the daemon is another one that the
> > start-stop-daemon knows.
> >
> > >
> > > Also, it is not very clear. Indeed, in the "start" step, you're not
> > > asking start-stop-daemon to create a PID file using the -m option. So
> > > you're relying on the daemon to create one. Is this PID file incorrect
> > > ? Normally, when it is created by the daemon itself, even if the daemon
> > > forks, it should be fine.
> >
> > I recognized that and tried to do it that way (with the -m option).
> > But in doing so I figured out that the "stop" step does not work. The
> > daemon is running by a PID that is +1 compared to the one the
> > start-stop-daemon knows from the PIDFILE.
>
> But is sysrepo-plugind creating its own pidfile ?

No it doesn't. The confusion is due to my bad commit message ;-/ I try
to explain it better.

The current script is not able to stop the daemon.

Options to fix the problem:

A) By adding the "-m -p $PIDFILE" option the pid file will be created
but it will not contain the correct PID used by the daemon. This is
obviously because the daemon forks.
B) By not starting the daemon in background (sysrepo-plugind -d) and
let do it by start-stop-daemon with "-b" option the log messages of
the daemon will not longer ends in the syslog but to stderr.
C) start the daemon without a pidfile and stop the daemon with the "-x" option.

I think the best option is C. This is what the patch does.

-- 
Heiko
