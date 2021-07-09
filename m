From: Herve Codina <herve.codina@bootlin.com>
Date: Fri, 9 Jul 2021 08:48:20 +0200
Subject: [Buildroot] [PATCH v2 08/18] package/pkg-generic.mk: move
 python fixup to generic package infrastructure
In-Reply-To: <20210708202623.GC410642@scaer>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
 <20210706142501.951345-9-herve.codina@bootlin.com>
 <20210706195048.GO2521@scaer> <20210707134828.7feafbd2@bootlin.com>
 <f809847a-151a-18d2-ff5d-302b60677e45@mind.be>
 <20210707144915.2db26f79@bootlin.com>
 <20210707201257.GB410642@scaer>
 <20210708173834.04a84dbc@bootlin.com>
 <20210708202623.GC410642@scaer>
Message-ID: <20210709084820.37830e5f@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 8 Jul 2021 22:26:23 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Herv?, All,
> 
> On 2021-07-08 17:38 +0200, Herve Codina spake thusly:
> > On Wed, 7 Jul 2021 22:12:57 +0200
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:  
> [--SNIP--]
> > > Note: optimisation: we should be able to use a single find call to do
> > > both, though:
> > > 
> > >     $(foreach dir, $(wildcard $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*), \
> > >         $(Q)find $(dir) \( -name "_sysconfigdata*.pyc" -delete \) \
> > >             -o \( -name "_sysconfigdata*.py" -print0 \) \
> > >         |xargs -0 --no-run-if-empty \
> > >             $(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
> > >     )  
> [--SNIP--]
> > I tried this kind of things and I ran into trouble with $(wildcard ...)
> > Indeed, $(wildcard ...) does not see my directories.
> > A simple 'ls $(HOST_DIR)/lib/python*' just before $(foreach dir, $(wildcard ...), ...)
> > lists the directory.
[...]
> It is not caching. The issue is when variables (or calls to functions)
> are evaluated.
> 
> In makefile, the evaluation is done for a full recipe at once, not for
> each line to be executed.
> 
> HOOKS, pre or post, are part of the same recipe and the corresponding
> CMDS, so all three (pre hooks, cmds, and post hooks) are evaluated at
> the same time, even before any single line of the recipe if executed.
> 
> So given this trivial Makefile:
> 
>     $ cat Makefile
>     all:
>         @touch toto
>         @echo '"toto is $(wildcard toto)"'
> 
>     $ make
>     "toto is "
>     $ make
>     "toto is toto"
> 

Thanks for this explanation.

> So, in the end, with all these back-n-forth, and combining all the
> explanations, we sould be able to complete the macro with:
> 
>     # Can't use $(foreach d, $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*, ...)
>     # because those directories may be created in the same recipe this
>     # macro wil be expanded in.
>     # Additionally, either or both may be missing, which would make find
>     # whine and fail.
>     # So we just use HOST_DIR as a starting point, and filter on the two
>     # directories of interest.
>     define FIXUP_PYTHON_SYSCONFIGDATA
>         $(Q)find $(HOST_DIR) \
>             \( -path '$(HOST_DIR)/lib/python*' -o -path '$(STAGING_DIR)/usr/lib/python*' \) \
>             \(    \( -name "_sysconfigdata*.pyc" -delete \) \
>                -o \( -name "_sysconfigdata*.py" -print0 \) \) \
>         |xargs -0 --no-run-if-empty \
>             $(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
>     endef
> 
> And then, in inner-genenric-package:
> 
>     $(2)_POST_PREPARE_HOOKS += FIXUP_PYTHON_SYSCONFIGDATA
> 
> And then the commit log will need to have all the details why we use
> this trick, and probably also a small comment above the macro defintion,
> to explain it too.
> 
> Not that STAGING_DIR is not a starting point for find, because it is
> below HOST_DIR, so we will eventually search STAGING_DIR.

Right, I will try this one.

> 
> Oh, and a final note: the existing hook is already sliently broken!
> Indeed, if either $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*
> is mising, find whines and fails. However, the breakage is ignored,
> because find is on the left-hand side of a pipe, so its exit status is
> ignored.
> 
> But of course, this is no longer the case with the new find that was
> added by the previous commit, which really is the commit that introduces
> the issues of find failing when a directory was missing, not this commit
> specifically. I suppose you did not notice, because the prvious commit
> was not tested on its own (and I can understand that, for I do that very
> often too). But now autobuilders have caught it (and user have started
> to notice too)...

You right, I tested my first version of the patch (with the pipe) and missed
the issue introduced by removing the pipe in v2.
Indeed, I tested the whole series not each patches.

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
