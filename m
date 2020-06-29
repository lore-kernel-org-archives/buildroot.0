From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 29 Jun 2020 11:55:26 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/haveged: Change service file
 to run early
In-Reply-To: <20200629093044.eurgl7qjx4xkd3vv@falbala.internal.home.lespocky.de>
References: <20200609224116.13607-1-nolange79@gmail.com>
 <20200609224116.13607-2-nolange79@gmail.com>
 <CADYdroMM5zNtnQ8J7soZo+Vnv6eSuZFVj6Bq+GyZ4UyB4xkEgg@mail.gmail.com>
 <CAFvCimVKi8eTQHnO6t0ZhcT86X74hqyM4JzQTJ_XWyxNVSFAWA@mail.gmail.com>
 <CADYdroNxW-em_kbTZ8iYOuc=6WOkoOWoDOvdCohVbfCU4T74oA@mail.gmail.com>
 <20200629093044.eurgl7qjx4xkd3vv@falbala.internal.home.lespocky.de>
Message-ID: <CADYdroNwfd6XJT+TRUV+_uR6qhYDwxGRpNSTFdd-e5xNi6gEFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 29. Juni 2020 um 11:30 Uhr schrieb Alexander Dahl <post@lespocky.de>:
>
> Hei hei,
>
> On Mon, Jun 29, 2020 at 10:29:38AM +0200, Norbert Lange wrote:
> > Haveged is not entropy, it's a substitute. I dont know how many times I
> > need to point that out.
>
> As far as I understood the source for the entropy haveged collects is
> random timing jitter from the CPU. Could you explain, why that is not
> real entropy, although it passes the FIPS tests? Or point to an
> explanation to learn from?

This is already round 2 of the argumentation, see
http://lists.busybox.net/pipermail/buildroot/2020-June/284465.html

But yes. haveged is still not tapping any entropy the kernel has not available,
it just blows up the low entropy available with a random number generator.
I am not up to speed with FIPS tests, but from a really really long way back
it wasn't a big issue to pass most tests with the Mersenne Twister and a few
bits of true entropy.

Basically it feeds PRNG back to kernel and lets it account as entropy source.

> > The less dependencies, the faster the system can startup (and lesser
> > chances of some stoopid deadlocks).
>
> This might be true in general, but it is not necessarily on embedded
> systems waiting for the kernel's crng to be initialized. If that
> initialization is a requirement and the system has very few entropy
> sources only (think of an embedded device with no network initialized,
> no HID, no sensors, ?) the boot can actually hours or days, seriously.

Yes, don't need to tell me that. But the requested change would make
things worse not better
in times of startup and potentially "quality" entropy.
With systemd, a "before" means just that the process is spawned,
doesn't mean that a single bit
of random was fed back to the kernel.
-   The haveged will spawn at the same time
-   random seed will be delayed (and there might be real entropy from
a long running system now not accounted).

In short:

Want better/faster entropy, use rng-tools, or choose to "trust" the
CPU vendor if instructions are available.
Want to boot faster, substituting real entropy by blowing it up with a
PRNG, pick haveged.

A good PRNG is still not entropy.

Norbert
