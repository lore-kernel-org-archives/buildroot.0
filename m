From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Jul 2020 22:42:51 +0200
Subject: [Buildroot] [PATCH] initscripts: Make installation of
 S20urandom optional.
In-Reply-To: <b4563955-d358-cfd3-8ae6-6e358e551595@theobroma-systems.com>
References: <20200718224444.2748609-1-christoph.muellner@theobroma-systems.com>
 <20200719100514.618894ca@windsurf.home>
 <20200719114950.GT18825@scaer> <20200719140921.5bc74639@gmx.net>
 <20200719122457.GV18825@scaer>
 <b4563955-d358-cfd3-8ae6-6e358e551595@theobroma-systems.com>
Message-ID: <20200720204251.GC2296@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christoph, All,

On 2020-07-20 14:26 +0200, Christoph M?llner spake thusly:
> On 7/19/20 2:24 PM, Yann E. MORIN wrote:
> > On 2020-07-19 14:09 +0200, Peter Seiderer spake thusly:
> >> On Sun, 19 Jul 2020 13:49:50 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > [--SNIP--]
> >>> I would however believe this script is not interesting at all. In fact,
> >>> an ambedded device seldom reboots nicely; instead, it is most often a
> >>> hard-reboot (with a power cycle). In that case, the script would have no
> >>> chance whatsoever to save the current seed before shutdown, thus on next
> That's not fully correct.
> save_random_seed() is also called during start.

Right. But if the entropy pool is so poor at boot that you need to
save-restore the seed at each boot, the probability that the new seed you
save back at startup is very predicatble as it is saved right just after
loading the old one, and since you don't have much entropy to start with,
that defeat the very purpose of saving and restoring the seed.

[--SNIP--]
> I agree mostly to your argumentation.
> 
> However, I know that a S20urandom-like mechanism is exactly
> what I need in systems where I need to start an SSH server
> in an development image for a system without proper entropy source.
> I.e. where poor quality of random number does not matter, but
> a bootup delay of a minute until the kernel RNG is seeded hurts.

Then you do not need to save-n-restore the seed; instead, you need a
better source of entropy availabe early at boot. And that is exactly
what rng-tools and jitterentropy-library, or haveged or others, are
supposed to provide: a strong source of entopy even in the abscence
of HW-TRNG. See:

    package/haveged/
    package/jitterentropy-library/
    https://lwn.net/Articles/802360/  (in kernel-land)

> So I am in favor of being able to remove S20urandom (thus my patch),
> but I see that users need that and would like to continue to support
> people that need it out-of-the-box.

I don't think people need to "save and restore the seed". Really, what
people really need is "strong entropy in early boot".

Saving and restoring the seed is only one technique to do so, and a poor
one at that, because it is fraught with corner cases that break that
assumption.

Instead, solutions exists that are more robust: using rng-tools with
jitternetropy, or haveged. Or a recent kernel (5.3+) that already uses
(some kind of) jitterentropy to seed /dev/random.

> What about moving S20urandom into a package urandom-scripts
> (similar to ifupdown-scripts)?

That would be the least of all evils about this! ;-) I'm going to have a
look at your patch now. Thanks for your persistence! (pun intended! ;-] )

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
