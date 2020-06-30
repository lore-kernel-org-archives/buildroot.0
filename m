From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 30 Jun 2020 09:54:39 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/haveged: Change service file
 to run early
In-Reply-To: <CADYdroO=qn7v5_VdQup-0Fja++NY0Qa1b040oP_kH5XhrkyMkA@mail.gmail.com>
References: <20200609224116.13607-1-nolange79@gmail.com>
 <20200609224116.13607-2-nolange79@gmail.com>
 <CADYdroMM5zNtnQ8J7soZo+Vnv6eSuZFVj6Bq+GyZ4UyB4xkEgg@mail.gmail.com>
 <CAFvCimVKi8eTQHnO6t0ZhcT86X74hqyM4JzQTJ_XWyxNVSFAWA@mail.gmail.com>
 <CADYdroNxW-em_kbTZ8iYOuc=6WOkoOWoDOvdCohVbfCU4T74oA@mail.gmail.com>
 <20200629093044.eurgl7qjx4xkd3vv@falbala.internal.home.lespocky.de>
 <CADYdroNwfd6XJT+TRUV+_uR6qhYDwxGRpNSTFdd-e5xNi6gEFQ@mail.gmail.com>
 <20200629124147.v2uthqmkms5tthk5@falbala.internal.home.lespocky.de>
 <CADYdroOmtQ8q7vKXAAxxoDQwD_OViWGk_SkJRmJtF+4yyBML4g@mail.gmail.com>
 <20200629213755.hodf6swoeo6z5thb@falbala.internal.home.lespocky.de>
 <CADYdroO=qn7v5_VdQup-0Fja++NY0Qa1b040oP_kH5XhrkyMkA@mail.gmail.com>
Message-ID: <CADYdroOxd6_bLu8BNE2=KN_KYBawLk2-ZeXgCmvCwAyxMXs79A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >
> > > > > I am not up to speed with FIPS tests, but from a really really long way back
> > > > > it wasn't a big issue to pass most tests with the Mersenne Twister and a few
> > > > > bits of true entropy.
> > > > >
> > > > > Basically it feeds PRNG back to kernel and lets it account as entropy source.
> > > >
> > > > I could not find any backup for that claim.  If I understood
> > > > correctly, haveged does not read from the kernel PRNG.
> > >
> > > The kernel has an entropy pool, it taps alot sources (inkl jitter, see
> > > https://lwn.net/Articles/642166/).
> >
> > Yes, but according to Stephan M?ller, the author of the
> > jitterentropy-rng, the kernel uses the CPU timing jitter internally
> > only in the crypto subsystem, that's not fed to the pool /dev/random
> > uses [1].  There's a patch series for a redesigned random number
> > subsystem by him, which would make that possible, but that never got
> > merged.

Forgot adding the kernel uses "timings of events such as hardware
interrupts as inputs",
that's basically the same entropy source that causes your "jitters".
"CPU effects" like cache evictions, pipeline flushes are just an
effect of that and could
be deterministically recreated if the IRQs happen in the same fashion again.

Norbert
