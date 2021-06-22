From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Jun 2021 11:56:09 +0200
Subject: [Buildroot] [PATCH 04/15] package/pkg-generic.mk: Fix .la files
 overwrite detection
In-Reply-To: <20210622113124.7cf2dde1@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-5-herve.codina@bootlin.com>
 <20210621214223.GC44262@scaer>
 <20210622113124.7cf2dde1@bootlin.com>
Message-ID: <20210622095609.GD44262@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, All,

On 2021-06-22 11:31 +0200, Herve Codina spake thusly:
> On Mon, 21 Jun 2021 23:42:23 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2021-06-21 16:11 +0200, Herve Codina spake thusly:
> > > During per-package build, original .la files are modified by
> > > fixup-libtool-files calls.
> > > But since fixup-libtool-files modifies files using sed --in-place,
> > > these modification are done using a temporary file and a call to
> > > rename. Rename breaks the hardlink to the original file and leave the
> > > temporary file in per-package TARGET dir.
> > > As the original file is not modified, this is no longer considered as
> > > an overwrite.
> > > 
> > > To fix this detection, this patch simply considers the what is done
> > > by fixup-libtool-files is part of the original snapshot used to
> > > detect overwrites. And so, the original snapshot is taken after
> > > fixup-libtool-files call.  
> > Then this should be squashed together with the first patch, to avoid
> > introducing the issue just to fix it a few patches down the series.
> > 
> > You should however add a note about that in the commit log of the first
> > patch, of course, to explain why the overwrite ifnra is inserted after
> > the .la tweaks.
> > 
> > So, I agree with the explanations, which make sense, but I disagree that
> > it should be a separate patch...
> > 
> Well, I have seen this when I created the patches.
> I kept them separate because on the first patch, I introduced the tool
> to check the overwrites and i would like it to take its snapshot as soon
> as possible in the build sequence (ie right after collecting dependencies
> files and taking snapshots for current package statistics).
> Then I fixed the issue seen by the overwrites detection and I put at the
> same level fixing host-e2fsprogs, fixing .la files or a bit later fixing
> python with one patch per fix to detail (or try to detail) the issue and
> the way I fixed it.

But really, it *is* the first patch that introduces the issue, so it
should be fixed from the onset, rather than after-the-fact.

> Squashing the 2 patches leads to one patch that introduces the tool and
> fixes one of the issues detected by the tool.

Sorry, but this patch (4/15) is fixing an issue introduced by the first
patch, with:

        @$(call pkg_size_before,$(TARGET_DIR))
        @$(call pkg_size_before,$(STAGING_DIR),-staging)
        @$(call pkg_size_before,$(HOST_DIR),-host)
    +   @$(call pkg_detect_overwrite_before,$(TARGET_DIR))
    +   @$(call pkg_detect_overwrite_before,$(HOST_DIR),-host)
        $(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
        $(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
        $($(PKG)_CONFIGURE_CMDS)

... when it should directly be:

        @$(call pkg_size_before,$(STAGING_DIR),-staging)
        @$(call pkg_size_before,$(HOST_DIR),-host)
        $(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
    +   @$(call pkg_detect_overwrite_before,$(TARGET_DIR))
    +   @$(call pkg_detect_overwrite_before,$(HOST_DIR),-host)
        $(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
        $($(PKG)_CONFIGURE_CMDS)
        $(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))

And as I said, the commit log should explain why the 'overwrite' calls
are inserted after the .la fixup.

> What about the others issues
> detected ? Squash also together with the first patch ? I think it will
> produce a huge patch quite complicate to understand even with all individual
> commit message squashed.

Ideally, I would say a series should first fix the issues, then
introduce the tooling.

Otherwise, if only the first patch(es) are applied, the tree is broken:
indeed the tooling has been applied, and thus is used, but the issues
are still there.

Also, it is usually easier and less controversial to get fixes applied,
than new tooling.

> However, that being said, I can squash this patch (Fix .la files overwrite
> detection) with the 1st one (detect files overwritten in TARGET_DIR and
> HOST_DIR) if you still think it will be better.

Yes, I still think that it is better.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
