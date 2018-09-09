From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Sep 2018 15:27:30 +0200
Subject: [Buildroot] [PATCH v5 0/3] Add tainting support to buildroot
In-Reply-To: <20180909141037.69b16e95@windsurf.home>
References: <1536186133-9933-1-git-send-email-angelo.compagnucci@gmail.com>
 <20180909073616.GC2841@scaer>
 <20180909141037.69b16e95@windsurf.home>
Message-ID: <20180909132730.GI2841@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Angelo, All,

On 2018-09-09 14:10 +0200, Thomas Petazzoni spake thusly:
> On Sun, 9 Sep 2018 09:36:16 +0200, Yann E. MORIN wrote:
> > So, I am not in favour of having support for such package managers in
> > Buildroot, to begin with.
> 
> We already had this discussion in the first iteration of this patch
> series, and even before. I think everybody agrees that such package
> managers (npm and al.) are really not nice in the context of Linux
> distributions or build systems.
> 
> However, from a practical point of view, some people want those
> features, and are ready to trade the reproducibility against "ease of
> use". In addition, specifically for nodejs/npm, the number of packages
> is so enormous that I am not sure it is really realistic to create one
> Buildroot package for each nodejs module, and keep things sane.

Well, we already have ~269 python packages, and that is already a lot.
There are 151,504 (as displayed today on pypi.org) python packages. Yet,
we have an infrastructure for them.

> Especially if only a few people are interested in nodejs modules.
> 
> > As you say, the reproducibility of a build, as offered by Buildroot, is
> > really a very important point. In my opinion, reproducibility is even
> > paramount. Whatever gets in the way should be banned.
> 
> I disagree on the "should be banned", and that's the whole point of
> this series: allow it, while making sure that the user is well aware of
> the fact that he has given up on the "reproducibility" by using one of
> those package managers.

The taint status is not something that we can correctly come up with: we
have no way to know whether a specific set of external data, packages,
dependencies, stuff, whatever,  will or won't taint the build, as
outlined by the examples I provided in the nodejs/npm case.

So, because we can not come up with a conclusive status of whether a
build is or is not tainted, we should not have infra for reporting it.

> > Now, what would be the purpose for this "tainted" flag? I understand
> > clearly what it provides, indeed, technically, but what would it serve
> > to the user?
> 
> See above: it makes it absolutely clear to the user that he is using
> some feature that kills one key advantage of build system:
> reproducibility.

And what I am saying is that we can't provide that status, because we
don't know whether a build is tainted or is not.

And if we report a build is tainted when it is not, then it becomes
useless, as a real taint that is later introduced will go unnoticed.

[--SNIP--]
> > Instead, I am more in favour of packaging such external stuff as
> > Buildroot packages, like we've been doing for erlang, lua, perl, and
> > python, even if we have to add new infrastructures for thos (npm, I'm
> > looking at you!)
> 
> Yes, that is the ideal situation. But that is not necessarily realistic
> for npm modules (due to their number), and having this option of using
> the provided package manager is reasonable, as long as the user is
> aware of the drawbacks.
> 
> > Besides, you're missing a big piece of potential non-reproducibility
> > source: br2-external trees. If we ever were to have such a tainting
> > mechanism, we should mark the build as tainted as soon as there is a
> > br2-external tree.
> 
> I disagree, a BR2_EXTERNAL does not make the build non-reproducible.

I said "potential non-reproducibility source". Because it is in a
br2-external, the user is free to do so many hacks that we can't assess
whether the build is reproducible or not.

And again, the important piece of information is that: we _can_ _not_
assess the tainted status, either way.

So, I am arguing that we should not have a way to report the tainted
status to the userm because we don't know how to decide whther a build
is tainted or not.

> As
> long as you have the same BR2_EXTERNAL + Buildroot, you can rebuild the
> same system.

Yeah, I know it very well, thank you! ;-)

But how do you know that the combination is reproducible or is not?

> > Ditto as soon as we have a FOO_OVERRIDE_SRCDIR set, which should mark
> > the build as tainted. Except we already use FOO_OVERRIDE_SRCDIR when
> > FOO_SITE = local...
> 
> FOO_OVERRIDE_SRCDIR is indeed a better example of thing that makes the
> build non-reproducible, we could potentially include this in the
> tainted mechanism.

But remember that the OVERRIDE_SRCDIR variable is also used when we use
_SITE = local too, so if a package has its sources bundled besides the
.mk (for example, al ot of packagers do that for very trivial packages),
you would set that the build is tainted when it is not.

> Though to me, this is somewhat less important: only advanced users are
> likely to use <pkg>_OVERRIDE_SRCDIR, and if they do, they will
> definitely realize the impact on reproducibility.

I've seen people shipping into production, builds that were made locally
with locally modified sources, and/or in uncomitted and/or un-pushed VCS
trees. So, even "advanced users" do not always "realize" what they are
doing. ;-)

> While the newcomer
> toying around with nodejs/npm may not realize the impact of using a
> third-party package manager on reproducibility.
> 
> So, yes, perhaps <pkg>_OVERRIDE_SRCDIR should ultimately taint the
> build, but I don't see handling that as a requirement to start
> introducing this "taint" flag.
> 
> > Instead, why not provide a helper script (or enhance the existing ones
> > if need be), than generated buildroot packages for those external packge
> > managers?
> 
> We really don't want thousands of npm packages I believe :-/

Yet we're ready to have thousands of python packages...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
