From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2015 18:28:39 +0200
Subject: [Buildroot] [PATCH v4 1/1] Added linux drivers backports project
In-Reply-To: <5533D5CF.5000305@mind.be>
References: <1429311670-7831-1-git-send-email-petr.vorel@gmail.com>
 <20150419110326.31c34542@free-electrons.com>
 <5533D5CF.5000305@mind.be>
Message-ID: <20150419162839.GI4313@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-19 18:20 +0200, Arnout Vandecappelle spake thusly:
> On 19/04/15 11:03, Thomas Petazzoni wrote:
> > Dear Petr Vorel,
> > 
> > On Sat, 18 Apr 2015 01:01:10 +0200, Petr Vorel wrote:
> >> https://backports.wiki.kernel.org
> >>
> >> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > 
> > I wanted to apply your patch, and did a couple of updates to it (see
> > below). However, there's a more fundamental problem to this package: it
> > expects the linux package to be extracted/configured *before* the
> > configuration of linux-backports. Unfortunately, this is not the case:
> > 'linux' is only in LINUX_BACKPORTS_DEPENDENCIES, so it's only
> > guaranteed to be here when linux-backports gets configured, not before.
> 
> 
>  Perhaps that's a problem in the kconfig infrastructure. The configure step
> depends on the DEPENDENCIES, and I'd consider the *config targets conceptually
> part of the configure step. Currently, *config only depends on the patch step
> (through $(2)_KCONFIG_FILE), perhaps we should add the depends step to that.

Well, I would not be very happy with that, since that would make the
following use-case a real pain:

    $ make foo_defconfig
    $ make linux-menuconfig

Currently, all it needs is the linux kernel to be extracted and patched,
and none of its depedencies to be built. Otherwise, it would require the
toolchain to be built, plus a sh.tload of other stuff (lzo, for one, and
all its own dependencies).

That's what we had before the kconfig-package infra, and  that was such
a pain...

However, I understand we have a hole for now, nad that we need to plug
it. If that requires foo-*condif to be moved as part of the configure
step, then so be it, but that would be really, really painfull.

At the very worse, we could manually add the proper dependencies... But
that would be ugly as well.

Maybe we should have a clean way of doing it with a proper dependency
handling (well, I'd rather avoid introducing yet another _DEPENDENCIES
variable if at all possible, either).

Not an easy problem... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
