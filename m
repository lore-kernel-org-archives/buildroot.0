From: Pieter Smith <pieter@boesman.nl>
Date: Wed, 2 Mar 2016 08:50:49 +0100
Subject: [Buildroot] [v3,
	1/4] barebox: prepare for secondary config build
In-Reply-To: <56D620F2.3090605@mind.be>
References: <1453329821-3167-1-git-send-email-pieter@boesman.nl>
 <1453329821-3167-2-git-send-email-pieter@boesman.nl>
 <56D0DCFB.8060601@mind.be> <20160228081204.GB4297@smipidev>
 <20160229074707.GA17808@smipidev> <56D620F2.3090605@mind.be>
Message-ID: <20160302075049.GA10481@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 02, 2016 at 12:08:34AM +0100, Arnout Vandecappelle wrote:
> On 02/29/16 08:47, Pieter Smith wrote:
[snip]
> >  
> > Thanks for the suggestion. It is shaping up nicely. There is one aspect that I
> > would appreciate input on: To all but completely eliminate duplication in the
> > makefiles for the two packages, I am wrapping all the current functionality in
> > boot/barebox/barebox.mk in a parameterized barebox-package function. E.g.:
> > 
> >   define barebox-package
> >   $(1)_VERSION = $$(call qstrip,$$(BR2_TARGET_BAREBOX_VERSION))
> >   ...
> >   $$(eval $$(kconfig-package))
> >   endef
> >   $(eval $(call barebox-package,BAREBOX))
> > 
> > And the whole of boot/barebox/barebox-2/barebox-2.mk becomes:
> > 
> >   $(eval $(call barebox-package,BAREBOX_2))
> 
>  No, I don't think we want this, because it hides a lot of what barebox-2 is
> doing internally. It's OK and actually better (in my opinion) if barebox-2.mk is
> just a long list like:

Pity. This quite elegantly solved my concerns. barebox and barebox-2 differ
only in menuconfig and barebox environment configuration space. The rest should
always be identical.

> BAREBOX_2_VERSION = $(BAREBOX_VERSION)
> BAREBOX_2_SITE = $(BAREBOX_SITE)

This shouldn't change much in future, so I can still do the variable copying if
you prefer.

> BAREBOX_2_BUILD_CMDS = $(BAREBOX_BUILD_CMDS)

This will not work. Both the BAREBOX_BUILD_CMDS and BAREBOX_INSTALL_IMAGES_CMDS
need parameterization. I can solve this with with:
1. A scaled down version of the above barebox-package function to generate the
   boilerplate, or
2. Parameterizable functions and duplicated boilerplate.

IMHO reducing duplication always improves clarity and maintenance, so I would
go for option 1.

What has your preference?

> ...
> $(eval $(kconfig-package))
> 
> 
>  Regards,
>  Arnout

[snip]

I would like to:
1. Ensure that all improvements to barebox propagate to barebox-2 in future.
2. Avoid having something error-prone to resolve the above. IMHO using a review
   process to keep two pieces of code in sync is quite error-prone and an
   unnecessary cognitive burden on developers.

- Pieter
