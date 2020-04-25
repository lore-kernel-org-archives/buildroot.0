From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 25 Apr 2020 17:26:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/syrepo: fix SysV init script
In-Reply-To: <20200425162221.5105443c@windsurf.home>
References: <20200420095738.16104-1-heiko.thiery@gmail.com>
 <20200425162221.5105443c@windsurf.home>
Message-ID: <CAEyMn7arhktDMYurpWu-8E=vqFYFvez17sqdAm+m+vC7BkgptA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas and all,

Am Sa., 25. Apr. 2020 um 16:22 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Heiko,
>
> Minor nit: typo in commit title: syrepo -> sysrepo. More questions below.
>
> On Mon, 20 Apr 2020 11:57:38 +0200
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > The sysrepo-plugind does not support to be controlled via the PID by the
> > start-stop-daemon. This is because sysrepo-plugind does a fork.
> > Thus the daemon is running with another PID known by start-stop-daemon.
>
> "known" by start-stop-daemon, or "not known" ?

Ok, I was unclear. The PID used by the daemon is another one that the
start-stop-daemon knows.

>
> Also, it is not very clear. Indeed, in the "start" step, you're not
> asking start-stop-daemon to create a PID file using the -m option. So
> you're relying on the daemon to create one. Is this PID file incorrect
> ? Normally, when it is created by the daemon itself, even if the daemon
> forks, it should be fine.

I recognized that and tried to do it that way (with the -m option).
But in doing so I figured out that the "stop" step does not work. The
daemon is running by a PID that is +1 compared to the one the
start-stop-daemon knows from the PIDFILE.

>
> Otherwise, can you ask the daemon not to fork, and let
> start-stop-daemon take care of this ?

When I ask the daemon not to fork the output does not go any longer to
the syslog. Instead it goes to stderr [1]. I dont think this is the
way it should

[1] https://github.com/sysrepo/sysrepo/blob/master/src/executables/sysrepo-plugind.c#L78


>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Thank you for the review.

-- 
Heiko
