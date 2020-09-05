From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 5 Sep 2020 22:10:51 +0200
Subject: [Buildroot] More maintainers
In-Reply-To: <20200905211650.0a229191@windsurf.home>
References: <CAFSsvmpLGd-2pequ_skL+8d_txyhxt5q5tgo0SDAfifVLJY6cg@mail.gmail.com>
 <20200827223956.7cb87050@windsurf.home> <20200829095023.GC14354@scaer>
 <CAFSsvmrUXjQBJ5XDu2NZayp5AWttbf_DomgVOB0iaKcHuzbCBw@mail.gmail.com>
 <638a9bc4-197f-931e-0795-2605ff734291@mind.be>
 <CAFSsvmqGG-KvDnquq5dmGDJkhwqdKaJe8ndpYpLK=dPfuSREYA@mail.gmail.com>
 <CA+h8R2qe_DvM2c2EvUraAWgP_84LaXN98TPi_cJjG6+wOHytQQ@mail.gmail.com>
 <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
 <20200903182409.6b337059@windsurf.home>
 <CA+TH9V=Czc80jT1jExNC+XUrqHz5mz+oFNvORcfjotCVXrO0KQ@mail.gmail.com>
 <87o8mlmoga.fsf@dell.be.48ers.dk>
 <CA+TH9VkA2ETrCvQF+mhb=PeKm8P=o2Jnesmooh4KCKSbzUcANQ@mail.gmail.com>
 <87blilmeo2.fsf@dell.be.48ers.dk>
 <CA+h8R2qYVjSwFZR0DcOpAdSY8nZKURLwW+a8tanxpEvDh__fSg@mail.gmail.com>
 <877dt8n2o7.fsf@dell.be.48ers.dk>
 <CAFSsvmqdBURoCVmbFRBUoYwd3VErpOp1GcG=xzxJETpbpAVrTg@mail.gmail.com>
 <20200905211650.0a229191@windsurf.home>
Message-ID: <CA+TH9Vn8cdHTKmoT1LLY7F=ywtuH_bSLFxZX1aQZgH6yFT26TA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il giorno sab 5 set 2020 alle ore 21:16 Thomas Petazzoni
<thomas.petazzoni@bootlin.com> ha scritto:
>
> Hello Adam,
>
> Thanks for your participation in this discussion.
>
> On Sat, 5 Sep 2020 09:20:30 -0700
> Adam Duskett <aduskett@gmail.com> wrote:
>
> > >  >> So yes, lets please discuss concrete improvements to the automation
> > >  >> checks we already have or ways to get more people to help review rather
> > >  >> than yet another discussion about the merits of pull requests versus
> > >  >> emails.
> > >
> >
> > Commit 9faba29108e74eb4acab21f5919dfab0288b23ac broke systemd with
> > busybox in the stock Buildroot configuration.
> >
> > An incredibly simple test:
> > Download the tarball
> > select systemd
> > make
> >
> > Not only was this incredibly embarrassing yesterday when I was showing a
> > client how to update Buildroot, but it could have been prevented with a basic
> > CI/CD test.
>
> It is indeed embarrassing, but your statement that it "would have been
> prevented with basic CI/CD test" is not completely correct.
>
> Indeed:
>
>  (1) We are already doing CI/CD: all runtime tests and all defconfigs
>      are built/executed regularly on Gitlab CI. We currently do that
>      once a week, and it also happens whenever a tag is pushed. For
>      example, the 2020.05.2 tag was tested by Gitlab CI, and we have a
>      number of failures:
>
>      https://gitlab.com/buildroot.org/buildroot/-/pipelines/183457594/failures
>
>      So: CI is *already* happening.
>
>  (2) Unfortunately, the CPU effort needed to build all our defconfigs
>      and run all our runtime tests is very significant, and therefore,
>      it is not possible to run all this CI testing on each and every
>      commit, and even less so on each and every patch series/pull
>      request that is being submitted.
>
> Several of you are calling for more CI, and that's obviously very good.
> But what would be even better is to define more precisely which
> additional CI you're talking about that: (a) we're not already doing
> and (b) is reasonably possible to do.

Honestly, I can't see a CI here or we have a big misunderstanding: CI
runs on review requests, not on the committed code.

> Could you describe that ?

Simple:

* A Developer opens a review request: the author only is notified, the
CI starts running.
* Commit has style problems, the author only is notified, red flag
* Commit message has grammar/syntax errors, the author only is
notified, red flag
* Commit doesn't have a minimal defconfig to build on all
architectures where it is supported: the author only is notified, red
flag
* Commit compiles on some architectures and not on others: the author
only is notified, red flag
* Commit doesn't have a runtime test attached: the author only is
notified, red flag
* Commit has testing but testing fails, the author only is notified, red flag
* Commit pass al the requirements: ML is notified, the commit is now
ready for a review, green flag.

Imho, this is how a CI should work.

That way, the autobuild could be even superfluous because each commit
was already tested by CI. Yes, autobuild could catch some more
intricate problems, but it can run less frequently.

>
> > I don't have to mention how much guff I would have received from
> > the maintainers if I had submitted a patch like that without a simple
> > test.
>
> I agree that you've received some pretty strong feedback on some of
> your patches. But I don't think we should confuse two different
> situations.
>
> Commit 9faba29108e74eb4acab21f5919dfab0288b23ac in the 2020.02.x branch
> is a backport of c2caf816e9296c4812f83f0a5d16e0e33a264b72 in master.
> The commit in master works fine, and what was missed is that when
> backporting, the KCONFIG_ENABLE_OPT calls should have been adjusted.
> That is indeed a mistake. However, Peter is the only person backporting
> *all* patches to stable/LTS branches, so he is obviously doing that as
> best as he can, and relies on autobuilder testing.
>
> To me, this is a bit different than a new package being submitted,
> which in its basic configuration, doesn't even build with our default C
> library. There is an obvious expectation from us as maintainers, that
> experienced contributors will submit new packages that have been tested
> with our default C library.
>
> Your recent libblockdev submission had this issue, for example. And
> even though it was not great, I hope you noticed that I fixed the
> issues myself, in order to make progress with the series and not
> require another iteration.
>
> > I have had several small patches in the past sit for months if not
> > almost years before being applied. Including an OpenJDK bump that
> > took over 3 months.
>
> If there are obviously simple patch that are ready to be applied,
> please let us know. I've very often applied patches within minutes
> after someone points me on IRC or by e-mail to a particular patch.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
