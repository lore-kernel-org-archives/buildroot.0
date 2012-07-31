From: Avishay Orpaz <avishorp@gmail.com>
Date: Tue, 31 Jul 2012 09:47:30 +0300
Subject: [Buildroot] [PATCH 2/2] config: support overlay
In-Reply-To: <CAEvN+1gRp2wnwMfQf+toNSxr6pGwCJrB1czB-MLhWXodh6Snow@mail.gmail.com>
References: <1343577590-14362-1-git-send-email-roylee17@gmail.com>
 <1343577590-14362-2-git-send-email-roylee17@gmail.com>
 <CAEvN+1gRp2wnwMfQf+toNSxr6pGwCJrB1czB-MLhWXodh6Snow@mail.gmail.com>
Message-ID: <CAMkyJgCgJTSwDrircNN1FYMQ0tXj3a+RjYhfwBV2RuKZfZ8egg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I would try a different approach. Currently, kconfig fails if an included
file does not exist. Implementing something that behaves like "-include" in
make would make it possible to include local configuration files, that
would simply not appear if they don't exist.

Avishay

2012/7/29 Tzu-Jung Lee <roylee17@gmail.com>

> On Sun, Jul 29, 2012 at 11:59 PM, Tzu-Jung Lee <roylee17@gmail.com> wrote:
> > Change-Id: I2c2b03ed1dde44bfb3ae6c1aaa8c548bbb3d1e9d
> > Signed-off-by: Tzu-Jung Lee <roylee17@gmail.com>
> > ---
> >  Makefile |   13 +++++++++++++
> >  1 files changed, 13 insertions(+), 0 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 98e1a51..665251a 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -37,7 +37,11 @@ endif
> >
> >  # absolute path
> >  TOPDIR:=$(shell pwd)
> > +ifneq ($(OVERLAY_DIR),)
> > +CONFIG_CONFIG_IN=$(OVERLAY_DIR)/Config.in
> > +else
> >  CONFIG_CONFIG_IN=Config.in
> > +endif
> >  CONFIG=support/kconfig
> >  DATE:=$(shell date +%Y%m%d)
> >
> > @@ -60,8 +64,13 @@ empty:=
> >  space:=$(empty) $(empty)
> >
> >  ifneq ("$(origin O)", "command line")
> > +ifneq ($(OVERLAY_DIR),)
> >  O:=output
> > +CONFIG_DIR:=$(OVERLAY_DIR)
> > +else
> > +O:=$(TOPDIR)/../output
> >  CONFIG_DIR:=$(TOPDIR)
> > +endif
> >  NEED_WRAPPER=
> >  else
> >  # other packages might also support Linux-style out of tree builds
> > @@ -576,6 +585,10 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf
> outputmakefile
> >         @mkdir -p $(BUILD_DIR)/buildroot-config
> >         @$(COMMON_CONFIG_ENV) $< --defconfig$(if
> $(BR2_DEFCONFIG),=$(BR2_DEFCONFIG)) $(CONFIG_CONFIG_IN)
> >
> > +%_defconfig: $(BUILD_DIR)/buildroot-config/conf
> $(OVERLAY_DIR)/configs/%_defconfig outputmakefile
> > +       @mkdir -p $(BUILD_DIR)/buildroot-config
> > +       @$(COMMON_CONFIG_ENV) $< --defconfig=$(OVERLAY_DIR)/configs/$@
> $(CONFIG_CONFIG_IN)
> > +
> >  %_defconfig: $(BUILD_DIR)/buildroot-config/conf
> $(TOPDIR)/configs/%_defconfig outputmakefile
> >         @mkdir -p $(BUILD_DIR)/buildroot-config
> >         @$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@
> $(CONFIG_CONFIG_IN)
> > --
> > 1.7.8.6
> >
>
> The patch aims to do the same thing as the previous thread "Added
> local package support", but is more ambitious.
> It enables users, usually BSP providers such as chip vendors to create
> an buildroot overlay.
>
> The goal is to give users a "staging area" holding those bits that are
> not yet going back to upstream or never will be (ex. proprietary
> packages).
> Once those bits has been merged into upstream, the overlay can be
> shrunken after the in-used buildroot upgrade to newer releases.
> Since most of the job can be done outside the buildroot, the upgrade
> will be more trivial.
> Internal changes can also be confined in a smaller part of codebase,
> instead of the whole buildroot tree.
>
> Let me post the link of a reference overlay first, since the patches
> may look obscure without it.
>
>    https://github.com/roylee17/overlay.git
>
> Usage:
>    1.  put this overlay next to the patched buildroot (2012.05)
>    2.  cd overlay
>    3.  make product_a_defconfig
>
> Regards,
> Roy
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120731/034b8fd8/attachment.html>
