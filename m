From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 14:10:37 +0200
Subject: [Buildroot] [PATCH v5 0/3] Add tainting support to buildroot
In-Reply-To: <20180909073616.GC2841@scaer>
References: <1536186133-9933-1-git-send-email-angelo.compagnucci@gmail.com>
 <20180909073616.GC2841@scaer>
Message-ID: <20180909141037.69b16e95@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sun, 9 Sep 2018 09:36:16 +0200, Yann E. MORIN wrote:

> So, I am not in favour of having support for such package managers in
> Buildroot, to begin with.

We already had this discussion in the first iteration of this patch
series, and even before. I think everybody agrees that such package
managers (npm and al.) are really not nice in the context of Linux
distributions or build systems.

However, from a practical point of view, some people want those
features, and are ready to trade the reproducibility against "ease of
use". In addition, specifically for nodejs/npm, the number of packages
is so enormous that I am not sure it is really realistic to create one
Buildroot package for each nodejs module, and keep things sane.
Especially if only a few people are interested in nodejs modules.

> As you say, the reproducibility of a build, as offered by Buildroot, is
> really a very important point. In my opinion, reproducibility is even
> paramount. Whatever gets in the way should be banned.

I disagree on the "should be banned", and that's the whole point of
this series: allow it, while making sure that the user is well aware of
the fact that he has given up on the "reproducibility" by using one of
those package managers.

> > This patch adds a tainting mechanism in the form of a
> > variable FOO_TAINTS that can be used to signal that
> > a package harms the reproducibility or licensing under
> > certain conditions.  
> 
> When I read that, it comes that the tainting mechanism serves two
> purposes: first, mark (non-)reproducibility, and second, mark incorrect
> and/or incomplete licensing information.
> 
> This does not sound nice to me.
> 
> For the licensing information, I would just rely on the existing
> licensing infra, and be done with it, i.e. add :
> 
>     ifneq ($(FOO_NON_REPRODUCIBLE_EXTERNAL_DATA),)
>     FOO_LICENSE += Unknown (non reproducible external data)
>     endif

That's true.

> Now, what would be the purpose for this "tainted" flag? I understand
> clearly what it provides, indeed, technically, but what would it serve
> to the user?

See above: it makes it absolutely clear to the user that he is using
some feature that kills one key advantage of build system:
reproducibility. Hiding this information in the manual or in a
Config.in help text is IMO not enough: we really want the user to have
a prominent warning at the end of the build.

> If I were to use a non-reproduible set of data ffor;, say, nodejs, then
> I know that this is not handled by Buildroot, and thus it is not
> reproducible. I don't need to be told it, escept maybe as a note in the
> manual: "If you use external data from npm/pypi, cpan, whatnot, then
> your build is not reproducible; that will be hurting kittens."

I disagree, newcomers are unlikely to realize this and read our manual
end to end.

> Instead, I am more in favour of packaging such external stuff as
> Buildroot packages, like we've been doing for erlang, lua, perl, and
> python, even if we have to add new infrastructures for thos (npm, I'm
> looking at you!)

Yes, that is the ideal situation. But that is not necessarily realistic
for npm modules (due to their number), and having this option of using
the provided package manager is reasonable, as long as the user is
aware of the drawbacks.

> Besides, you're missing a big piece of potential non-reproducibility
> source: br2-external trees. If we ever were to have such a tainting
> mechanism, we should mark the build as tainted as soon as there is a
> br2-external tree.

I disagree, a BR2_EXTERNAL does not make the build non-reproducible. As
long as you have the same BR2_EXTERNAL + Buildroot, you can rebuild the
same system.

> Ditto as soon as we have a FOO_OVERRIDE_SRCDIR set, which should mark
> the build as tainted. Except we already use FOO_OVERRIDE_SRCDIR when
> FOO_SITE = local...

FOO_OVERRIDE_SRCDIR is indeed a better example of thing that makes the
build non-reproducible, we could potentially include this in the
tainted mechanism.

Though to me, this is somewhat less important: only advanced users are
likely to use <pkg>_OVERRIDE_SRCDIR, and if they do, they will
definitely realize the impact on reproducibility. While the newcomer
toying around with nodejs/npm may not realize the impact of using a
third-party package manager on reproducibility.

So, yes, perhaps <pkg>_OVERRIDE_SRCDIR should ultimately taint the
build, but I don't see handling that as a requirement to start
introducing this "taint" flag.

> Instead, why not provide a helper script (or enhance the existing ones
> if need be), than generated buildroot packages for those external packge
> managers?

We really don't want thousands of npm packages I believe :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
