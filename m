From: Alexander Dahl <post@lespocky.de>
Date: Mon, 29 Jun 2020 14:41:47 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/haveged: Change service file
 to run early
In-Reply-To: <CADYdroNwfd6XJT+TRUV+_uR6qhYDwxGRpNSTFdd-e5xNi6gEFQ@mail.gmail.com>
References: <20200609224116.13607-1-nolange79@gmail.com>
 <20200609224116.13607-2-nolange79@gmail.com>
 <CADYdroMM5zNtnQ8J7soZo+Vnv6eSuZFVj6Bq+GyZ4UyB4xkEgg@mail.gmail.com>
 <CAFvCimVKi8eTQHnO6t0ZhcT86X74hqyM4JzQTJ_XWyxNVSFAWA@mail.gmail.com>
 <CADYdroNxW-em_kbTZ8iYOuc=6WOkoOWoDOvdCohVbfCU4T74oA@mail.gmail.com>
 <20200629093044.eurgl7qjx4xkd3vv@falbala.internal.home.lespocky.de>
 <CADYdroNwfd6XJT+TRUV+_uR6qhYDwxGRpNSTFdd-e5xNi6gEFQ@mail.gmail.com>
Message-ID: <20200629124147.v2uthqmkms5tthk5@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Norbert,

On Mon, Jun 29, 2020 at 11:55:26AM +0200, Norbert Lange wrote:
> Am Mo., 29. Juni 2020 um 11:30 Uhr schrieb Alexander Dahl <post@lespocky.de>:
> > On Mon, Jun 29, 2020 at 10:29:38AM +0200, Norbert Lange wrote:
> > > Haveged is not entropy, it's a substitute. I dont know how many times I
> > > need to point that out.
> >
> > As far as I understood the source for the entropy haveged collects is
> > random timing jitter from the CPU. Could you explain, why that is not
> > real entropy, although it passes the FIPS tests? Or point to an
> > explanation to learn from?
> 
> This is already round 2 of the argumentation, see
> http://lists.busybox.net/pipermail/buildroot/2020-June/284465.html
> 
> But yes. haveged is still not tapping any entropy the kernel has not available,
> it just blows up the low entropy available with a random number generator.

So, I read http://www.issihosts.com/haveged/history.html (again) and
as far as I understand it is a not a pseudo random number generator.
According to its own documentation
https://www.chronox.de/jent/doc/CPU-Jitter-NPTRNG.html#toc-Subsection-1.1
it is a random generator based on CPU timing jitter, measured by high
precision timers.  That randomness is fed to the kernel pools the same
way one would fed randomness from a true hwrng.  Right?

> I am not up to speed with FIPS tests, but from a really really long way back
> it wasn't a big issue to pass most tests with the Mersenne Twister and a few
> bits of true entropy.
> 
> Basically it feeds PRNG back to kernel and lets it account as entropy source.

I could not find any backup for that claim.  If I understood
correctly, haveged does not read from the kernel PRNG.

> In short:
> 
> Want better/faster entropy, use rng-tools, or choose to "trust" the
> CPU vendor if instructions are available.

rng-tools is useless without a hwrng or jitterentropy-rngd, which does
the same thing as haveged.  So for a system without a hwrng, how
should that recommendation help an user?

> A good PRNG is still not entropy.

I think we can agree on that one.

Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200629/a38198d0/attachment.asc>
