From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 30 Jun 2020 09:46:12 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/haveged: Change service file
 to run early
In-Reply-To: <20200629213755.hodf6swoeo6z5thb@falbala.internal.home.lespocky.de>
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
Message-ID: <CADYdroO=qn7v5_VdQup-0Fja++NY0Qa1b040oP_kH5XhrkyMkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 29. Juni 2020 um 23:38 Uhr schrieb Alexander Dahl <post@lespocky.de>:
>
> Hello Norbert,
>
> On Mon, Jun 29, 2020 at 05:17:16PM +0200, Norbert Lange wrote:
> > Am Mo., 29. Juni 2020 um 14:41 Uhr schrieb Alexander Dahl <post@lespocky.de>:
> > > On Mon, Jun 29, 2020 at 11:55:26AM +0200, Norbert Lange wrote:
> > > > Am Mo., 29. Juni 2020 um 11:30 Uhr schrieb Alexander Dahl <post@lespocky.de>:
> > > > > On Mon, Jun 29, 2020 at 10:29:38AM +0200, Norbert Lange wrote:
> > > > > > Haveged is not entropy, it's a substitute. I dont know how many times I
> > > > > > need to point that out.
> > > > >
> > > > > As far as I understood the source for the entropy haveged collects is
> > > > > random timing jitter from the CPU. Could you explain, why that is not
> > > > > real entropy, although it passes the FIPS tests? Or point to an
> > > > > explanation to learn from?
> > > >
> > > > This is already round 2 of the argumentation, see
> > > > http://lists.busybox.net/pipermail/buildroot/2020-June/284465.html
> > > >
> > > > But yes. haveged is still not tapping any entropy the kernel has not available,
> > > > it just blows up the low entropy available with a random number generator.
> > >
> > > So, I read http://www.issihosts.com/haveged/history.html (again) and
> > > as far as I understand it is a not a pseudo random number generator.
> > > According to its own documentation
> > > https://www.chronox.de/jent/doc/CPU-Jitter-NPTRNG.html#toc-Subsection-1.1
> > > it is a random generator based on CPU timing jitter, measured by high
> > > precision timers.  That randomness is fed to the kernel pools the same
> > > way one would fed randomness from a true hwrng.  Right?
> >
> > random generator *based* on CPU timing jitter, just like you typically
> > seed a PRNG
> > system time.
>
> I just took some time and read the havege source.  It's not just
> seeding with one timestamp or something, the jitter is the noise
> source, and new jitter data is gathered by doing calculations, and
> measuring timings (and doing some calculations on top) on each read to
> the havege rng.

Point is its not entropy but a PRNG with (re)seeds, the only qualification
seems to be that it passes tests. To quote a kernel dev [1]:
"One of Peter's colleagues replaced the random input source employed
by HAVEGE with a constant stream of ones. All of the same tests
passed."

Means the PRNG is enough to pass the tests. There is no good argument that
the entropy it gathers is of good quality.

> > Its not just entropy, you dont have any measure on how much entropy
> > you get from jitter,
> > especially on embedded systems or VMs where you would haveged in the
> > first place.
>
> I'm no expert on RNG, not at all.  But how is an embedded system or a
> virtual machine CPU different from other systems here, if the noise
> source is the CPU itself only?

haveged depends on jitters in the kernel scheduler and cache/pipeline
characteristics.
Those aren't the source of noise (entropy in this context), those are
consequences of other noises
(skew between multiple clock sources, IRG/device/filesystem/net timings).
On isolated systems you have less of that noise (and on embedded
simpler, more predictable CPUs aswell).

The CPU is fully deterministic without those outside influences, even
if no one is practically able to do so.
(You might have heard of all the spectre issues where some smart
people figured some details out anyway).

>
> > > > I am not up to speed with FIPS tests, but from a really really long way back
> > > > it wasn't a big issue to pass most tests with the Mersenne Twister and a few
> > > > bits of true entropy.
> > > >
> > > > Basically it feeds PRNG back to kernel and lets it account as entropy source.
> > >
> > > I could not find any backup for that claim.  If I understood
> > > correctly, haveged does not read from the kernel PRNG.
> >
> > The kernel has an entropy pool, it taps alot sources (inkl jitter, see
> > https://lwn.net/Articles/642166/).
>
> Yes, but according to Stephan M?ller, the author of the
> jitterentropy-rng, the kernel uses the CPU timing jitter internally
> only in the crypto subsystem, that's not fed to the pool /dev/random
> uses [1].  There's a patch series for a redesigned random number
> subsystem by him, which would make that possible, but that never got
> merged.

Maybe because no one trusts self-generated jitter as source for
entropy for a reason (as a RNG its another matter)?
You need entropy from outside the CPU (not counting embedded entropy
hardware/instructions)
 everything else can be assumed a deterministic feedback loop.

> > what haveged does is overaccounting the very little true entropy it
> > fetches (by using a PRNG on top AFAIU).
>
> That may be, I did not read and understood the haveged source good
> enough to prove or disprove that.

See quote above, even if the entropy is removed, it will feed the
kernel just PRNG noise,
and there is no guarantee whatsoever that the "jitter" is not the same
for each reboot.

> > > > In short:
> > > >
> > > > Want better/faster entropy, use rng-tools, or choose to "trust" the
> > > > CPU vendor if instructions are available.
> > >
> > > rng-tools is useless without a hwrng or jitterentropy-rngd, which does
> > > the same thing as haveged.  So for a system without a hwrng, how
> > > should that recommendation help an user?
> >
> > Maybe you should understand that not everyone needs that kinda level
> > of entropy.
> > If you are that concerned, use a TPM Module + rng-tools.
> > haveged's primary concern is to speed up boot, *not* improve the random numbers,
> > it does not tap entropy that the kernel is not using already.
>
> I think this is wrong.  According to [1] the kernel does not feed CPU
> timing jitter based entropy to the entropy pool for the rng available
> to userspace, which haveged does.

Jitter noise would be easily available in kernel, but thats difficult to account
(how much is from outside sources, how much is deterministic).
You should feed the kernel good entropy, the kernel runs a PRNG over it,
if you feed the kernel stuff from a PRNG with no reasonable argumentation
that this is raw entropy the accounting will be off.

Dont get me wrong, it's fine for most usecases, but haveged does reduce
the quality of the entropy, and never should be your first option.

See the LWN article below [1], or Arch's page [2] on it.

Norbert

[1] - https://lwn.net/Articles/525459/
[2] - https://wiki.archlinux.org/index.php/Haveged

>
> Greets
> Alex
>
> [1] https://lore.kernel.org/linux-crypto/6708214.Ppv1U3N1OP at tauon.chronox.de/T/#t
>
> --
> /"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
> \ / CAMPAIGN     | speech censured, the first thought forbidden, the
>  X  AGAINST      | first freedom denied, chains us all irrevocably.?
> / \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
