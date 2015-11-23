From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 22:09:39 +0100
Subject: [Buildroot] [PATCH 0/51] legal-info: unassorted improvements
 and fixes (branch yem/legal)
In-Reply-To: <20151123212252.5ec59f4e@free-electrons.com>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <20151123212252.5ec59f4e@free-electrons.com>
Message-ID: <20151123210939.GJ3857@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-23 21:22 +0100, Thomas Petazzoni spake thusly:
> On Mon, 23 Nov 2015 15:48:16 +0100, Yann E. MORIN wrote:
> > The series is not completely 'logically' organised, but rather tells a
> > story, that of how I got side-tracked from just wanting to save the
> > patches alongside the sources, up to when I eventually cleaned up the
> > handling of the Xtensa overlay, after reogarnising the gcc packages and
> > defining their licensing terms. It was prompted by a discussion we had
> > with Luca during the last DevDays in Dublin, when we talked about the
> > need to save the patches as well as the source archives.
> 
> Can you summarize what is the motivation for saving the patches as well
> as the source archives ?

I think I've explained that below, and in the commit log that actually
saves the patches. Maybe I should have improved those explanations...

> > Patches 10-17 actually implement saving the patches alongside the
> > sources. Even though we suggest users to provide their Buildroot tree to
> > be compliant, this is by far incpomplete, because not all patches may be
> > there (patches can be downloaded or can be in a global patch dir):
> 
> I would have assumed patches in a global patch dir should be taken care
> of by users. But indeed, if patches expressed via <pkg>_PATCH are not
> copied, this is wrong.
> 
> However, files mentioned in <pkg>_EXTRA_DOWNLOADS should also be copied
> to the legal-info output.

I don;t think we should also save the _EXTRA_DOWNLOADS, because it is
also used by the blackfin external toolchains to download parts of the
sysroot (as far as I understand it).

> There is possibly one reason why distributing the entire Buildroot may
> be problematic. If you distribute the entire Buildroot, it means you
> are distributing code (in the form of patches) for a large number of
> packages, many of which you are most likely not using in your actual
> product. However, the simple fact of distributing patches to (L)GPLv3
> code has some implication in terms of patents licensing, which
> companies may not like.

Hmm.. That's a tricky question, indeed.

I would have assumed that what a distributor is bound to, is the
licenses of the actual packages present in the firmware, and that extra
code that is published would not have any impact.

However, you may be right on one point: the mere fact of distributing
code under licenses that have so-called "IP" protection (like patent
stuff provisions like the GPLv3 has) could be seen as being problematic
for a distributor, indeed.

> Therefore, distributing Buildroot completely
> may not necessarily be acceptable for certain companies. Do we have a
> way around that ?

That would be awfully complex. We'd have to provide a way to strip-down
Buildroot to just the recipes of what is actually in the firmware,
stripping away a whole lot of packages, possibly severing the dependency
chains...

I would prefer we do not go that route if at all possible...

> > Patches 18-27 re-organise the gcc packages. The ultimate goal is to be
> > able to save the legal-info for both the host and target variants. For
> > that, we want to introduce a target gcc variant (which would not install
> > a native compiler) to define the licensing terms. That has not been done
> > in this series, for two reasons: first, the series is already very long;
> > second, that target package needs some mor ere-organising in the gcc
> > infra. Otherwise:
> >   - the gcc common definitions ar emoved to gcc-common,
> >   - gcc-initial remains as-is,
> >   - gcc-final is renamed to just 'gcc',
> >   - licensing information is added to gcc (the final one),
> >   - the custom patch command is dropped, to use the generic patch infra,
> >     so symlinks to patch directories are added to gcc-initial and
> >     gcc (-final).
> 
> I am wondering why this is part of the same series really. It should be
> a completely separated matter IMO.

As I said in the begining of the cover letter, I got side-tracked.

Basically, what happenend is that I did a few patches to save the
patches with the sources. Then realised that we were missing the legal
info for gcc; then I noticed that we should save the Xtensa overlay. And
so I looked at packages that were using EXTRA_DOWNLOADS and stumbled on 
perl for which we should also save perl-cross. Back to the Xtensa stuff, 
it became obvious we were not handking it in the best way we could. And
so on...

And so, as the subject of the cover letter says, this is a set of
"unassorted improvements nad fixes" on the legal-info infra.

But yes, I agree that the series could be split. However, the different
parts could only be subnmitted only after the previous parts are
applied, because changes added in each "part" of the series are re-used
later on. So it is not easy to just split it without causing conflicts
later on; conflicts either on the maintianers side to merge changes
touching the same areas, or or my side rebasing the series again and
again. At least, the series is self-contained, and "temporaly" correct,
even if it touches many different areas: it all relates to being better
at saving th elegal info (even the Xtensa overlay improvements rely on
earlier patches).

> > Starting from there, the series diverges from its original intent, but
> > is a logical/historical followup because I noticed the Xtensa overlay
> > handling was really a mess.
> 
> Ditto, why isn't that a separate patch series?

Ditto. ;-)

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
