From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 8 Jul 2021 22:26:23 +0200
Subject: [Buildroot] [PATCH v2 08/18] package/pkg-generic.mk: move
 python fixup to generic package infrastructure
In-Reply-To: <20210708173834.04a84dbc@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
 <20210706142501.951345-9-herve.codina@bootlin.com>
 <20210706195048.GO2521@scaer> <20210707134828.7feafbd2@bootlin.com>
 <f809847a-151a-18d2-ff5d-302b60677e45@mind.be>
 <20210707144915.2db26f79@bootlin.com>
 <20210707201257.GB410642@scaer>
 <20210708173834.04a84dbc@bootlin.com>
Message-ID: <20210708202623.GC410642@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, All,

On 2021-07-08 17:38 +0200, Herve Codina spake thusly:
> On Wed, 7 Jul 2021 22:12:57 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > Note: optimisation: we should be able to use a single find call to do
> > both, though:
> > 
> >     $(foreach dir, $(wildcard $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*), \
> >         $(Q)find $(dir) \( -name "_sysconfigdata*.pyc" -delete \) \
> >             -o \( -name "_sysconfigdata*.py" -print0 \) \
> >         |xargs -0 --no-run-if-empty \
> >             $(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
> >     )
[--SNIP--]
> I tried this kind of things and I ran into trouble with $(wildcard ...)
> Indeed, $(wildcard ...) does not see my directories.
> A simple 'ls $(HOST_DIR)/lib/python*' just before $(foreach dir, $(wildcard ...), ...)
> lists the directory.
> 
> Suppose this stupid package:
> ---- 8< -----
> define TLP_PKGA_INSTALL_TARGET_CMDS
> 	echo "$$(date)" > $(TARGET_DIR)/pkga1
> 	echo "$$(date)" > $(TARGET_DIR)/pkga2
> 	mkdir -p $(TARGET_DIR)/foo/bla
> 	touch $(TARGET_DIR)/foo/bla/file1
> 	touch $(TARGET_DIR)/foo/bla/file2
> endef
> 
> define TLP_PKGA_LIST_CMD
> 	echo "ls:" && ls $(TARGET_DIR)/foo/* || true
> 	echo "wildcard: $(wildcard $(TARGET_DIR)/foo/*)"
> endef
> 
> TLP_PKGA_PRE_INSTALL_TARGET_HOOKS += TLP_PKGA_LIST_CMD
> TLP_PKGA_POST_INSTALL_TARGET_HOOKS += TLP_PKGA_LIST_CMD
> 
> 
> $(eval $(generic-package))
> ---- 8< -----
> 
> 'make pkg' leads to:
> 	>>> pkg  Installing to target
> 	echo "ls:" && ls /home/hcodina/project/nagra/buildroot/output/per-package/tlp_pkga/target/foo/* || true
> 	ls:
> 	ls: cannot access '/home/hcodina/project/nagra/buildroot/output/per-package/tlp_pkga/target/foo/*': No such file or directory
> 	echo "wildcard: "
> 	wildcard: 
> 	echo "$(date)" > /home/hcodina/project/nagra/buildroot/output/per-package/tlp_pkga/target/pkga1
> 	echo "$(date)" > /home/hcodina/project/nagra/buildroot/output/per-package/tlp_pkga/target/pkga2
> 	mkdir -p /home/hcodina/project/nagra/buildroot/output/per-package/tlp_pkga/target/foo/bla
> 	touch /home/hcodina/project/nagra/buildroot/output/per-package/tlp_pkga/target/foo/bla/file1
> 	touch /home/hcodina/project/nagra/buildroot/output/per-package/tlp_pkga/target/foo/bla/file2
> 	echo "ls:" && ls /home/hcodina/project/nagra/buildroot/output/per-package/tlp_pkga/target/foo/* || true
> 	ls:
> 	file1  file2
> 	echo "wildcard: "
> 	wildcard: 
> 
> $(wildcard ...) uses internal make caching.

It is not caching. The issue is when variables (or calls to functions)
are evaluated.

In makefile, the evaluation is done for a full recipe at once, not for
each line to be executed.

HOOKS, pre or post, are part of the same recipe and the corresponding
CMDS, so all three (pre hooks, cmds, and post hooks) are evaluated at
the same time, even before any single line of the recipe if executed.

So given this trivial Makefile:

    $ cat Makefile
    all:
        @touch toto
        @echo '"toto is $(wildcard toto)"'

    $ make
    "toto is "
    $ make
    "toto is toto"

So, in the end, with all these back-n-forth, and combining all the
explanations, we sould be able to complete the macro with:

    # Can't use $(foreach d, $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*, ...)
    # because those directories may be created in the same recipe this
    # macro wil be expanded in.
    # Additionally, either or both may be missing, which would make find
    # whine and fail.
    # So we just use HOST_DIR as a starting point, and filter on the two
    # directories of interest.
    define FIXUP_PYTHON_SYSCONFIGDATA
        $(Q)find $(HOST_DIR) \
            \( -path '$(HOST_DIR)/lib/python*' -o -path '$(STAGING_DIR)/usr/lib/python*' \) \
            \(    \( -name "_sysconfigdata*.pyc" -delete \) \
               -o \( -name "_sysconfigdata*.py" -print0 \) \) \
        |xargs -0 --no-run-if-empty \
            $(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
    endef

And then, in inner-genenric-package:

    $(2)_POST_PREPARE_HOOKS += FIXUP_PYTHON_SYSCONFIGDATA

And then the commit log will need to have all the details why we use
this trick, and probably also a small comment above the macro defintion,
to explain it too.

Not that STAGING_DIR is not a starting point for find, because it is
below HOST_DIR, so we will eventually search STAGING_DIR.

Oh, and a final note: the existing hook is already sliently broken!
Indeed, if either $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*
is mising, find whines and fails. However, the breakage is ignored,
because find is on the left-hand side of a pipe, so its exit status is
ignored.

But of course, this is no longer the case with the new find that was
added by the previous commit, which really is the commit that introduces
the issues of find failing when a directory was missing, not this commit
specifically. I suppose you did not notice, because the prvious commit
was not tested on its own (and I can understand that, for I do that very
often too). But now autobuilders have caught it (and user have started
to notice too)...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
