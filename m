From: Pieter Smith <pieter@boesman.nl>
Date: Wed, 2 Mar 2016 22:32:56 +0100
Subject: [Buildroot] [v3,
	1/4] barebox: prepare for secondary config build
In-Reply-To: <56D72D29.5050600@mind.be>
References: <1453329821-3167-1-git-send-email-pieter@boesman.nl>
 <1453329821-3167-2-git-send-email-pieter@boesman.nl>
 <56D0DCFB.8060601@mind.be> <20160228081204.GB4297@smipidev>
 <20160229074707.GA17808@smipidev> <56D620F2.3090605@mind.be>
 <20160302075049.GA10481@smipidev> <56D72D29.5050600@mind.be>
Message-ID: <20160302213256.GA11826@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 02, 2016 at 07:12:57PM +0100, Arnout Vandecappelle wrote:
>  [Adding other core devs in CC, see the beginning and the end]
> 
> On 03/02/16 08:50, Pieter Smith wrote:
[snip]
> >> BAREBOX_2_BUILD_CMDS = $(BAREBOX_BUILD_CMDS)
> > 
> > This will not work. Both the BAREBOX_BUILD_CMDS and BAREBOX_INSTALL_IMAGES_CMDS
> > need parameterization. I can solve this with with:
> > 1. A scaled down version of the above barebox-package function to generate the
> >    boilerplate, or
> > 2. Parameterizable functions and duplicated boilerplate.
> > 
> > IMHO reducing duplication always improves clarity and maintenance, so I would
> > go for option 1.
> > 
> > What has your preference?
> 
>  The BUILD_CMDS can be parameterized without using functions, by using
> $($(PKG)_...) variables instead of $(BAREBOX_2_...). That's what I tried to show
> in my first reply:

Off course, silly me... I've been making use of this since forever. It works
because of the eval in $(eval $(kconfig-package)). I'll do it this way.
 
> define BAREBOX_BUILD_CMDS
> 	$($(PKG)_BUILD_BAREBOXENV_CMDS)
> 	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D)
> 	$($(PKG)_BUILD_CUSTOM_ENV)
> endef
> BAREBOX_2_BUILD_CMDS = $(BAREBOX_BUILD_CMDS)
> 
> BAREBOX_2_BUILD_BAREBOXENV_CMDS and BAREBOX_2_BUILD_CUSTOM_ENV will not be set,
> so those parts are removed. The rest should be identical for barebox-2, but if
> you do need something else you can add something like $($(PKG)_EXTRA_FLAGS).

I agree with not needing the additional BAREBOX_2_BUILD_BAREBOXENV_CMDS and
BAREBOX_2_INSTALL_BAREBOXENV_CMDS (why would you need to install bareboxenv to
the rootfs twice), but I would like to keep the BAREBOX_2_BUILD_CUSTOM_ENV and
the built-in variant in Yegor's pending patch-set. They allow customization of
the barebox environment, and therefore the boot behavior.

[snip]

> > I would like to:
> > 1. Ensure that all improvements to barebox propagate to barebox-2 in future.
> > 2. Avoid having something error-prone to resolve the above. IMHO using a review
> >    process to keep two pieces of code in sync is quite error-prone and an
> >    unnecessary cognitive burden on developers.
> 
>  There isn't really much to keep in sync between the two, only when you suddenly
> add _INSTALL_STAGING_CMDS for instance you'd have to update barebox-2.mk to copy
> that as well.
> 
>  There are two reasons why I prefer the copying of variables:
> 
> 1. I think that functions are a bit more difficult to understand.
> 2. I'm considering to add infrastructure that facilitates the pattern of copying
> variables, something like
> 
> $(eval $(call inherit-package,barebox))
>
> 
> which would expand to
> 
> BAREBOX_2_VERSION ?= BAREBOX_VERSION
> BAREBOX_2_SITE ?= BAREBOX_SITE
> ...
> BAREBOX_2_BUILD_CMDS ?= BAREBOX_BUILD_CMDS
> 
> so that in the end the barebox-2.mk does indeed become nothing more than a
> single eval line, and that the same approach can easily be used for other packages.

This would certainly be an elegant improvement! Do any of the other packages
need this? I can help with this if you don't have the time. Off-course I would
rather do this in a later patch-series.

>  However, this is just my opinion, other developers may see it differently,
> hence the CC.

Off course. Your opinion is held in rather high regard, so I would like to have
at least one of the regular barebox developers on board. ;-)

[snip]

- Pieter 
