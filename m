From: Pieter Smith <pieter@boesman.nl>
Date: Sat, 5 Mar 2016 14:16:03 +0100
Subject: [Buildroot] [v3,
	1/4] barebox: prepare for secondary config build
In-Reply-To: <20160302213256.GA11826@smipidev>
References: <1453329821-3167-1-git-send-email-pieter@boesman.nl>
 <1453329821-3167-2-git-send-email-pieter@boesman.nl>
 <56D0DCFB.8060601@mind.be> <20160228081204.GB4297@smipidev>
 <20160229074707.GA17808@smipidev> <56D620F2.3090605@mind.be>
 <20160302075049.GA10481@smipidev> <56D72D29.5050600@mind.be>
 <20160302213256.GA11826@smipidev>
Message-ID: <20160305131603.GA7616@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 02, 2016 at 10:32:56PM +0100, Pieter Smith wrote:
> On Wed, Mar 02, 2016 at 07:12:57PM +0100, Arnout Vandecappelle wrote:

[snip]

> >  The BUILD_CMDS can be parameterized without using functions, by using
> > $($(PKG)_...) variables instead of $(BAREBOX_2_...). That's what I tried to show
> > in my first reply:
> 
> Off course, silly me... I've been making use of this since forever. It works
> because of the eval in $(eval $(kconfig-package)). I'll do it this way.
>  
> > define BAREBOX_BUILD_CMDS
> > 	$($(PKG)_BUILD_BAREBOXENV_CMDS)
> > 	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D)
> > 	$($(PKG)_BUILD_CUSTOM_ENV)
> > endef
> > BAREBOX_2_BUILD_CMDS = $(BAREBOX_BUILD_CMDS)
> > 
> > BAREBOX_2_BUILD_BAREBOXENV_CMDS and BAREBOX_2_BUILD_CUSTOM_ENV will not be set,
> > so those parts are removed. The rest should be identical for barebox-2, but if
> > you do need something else you can add something like $($(PKG)_EXTRA_FLAGS).
> 
> I agree with not needing the additional BAREBOX_2_BUILD_BAREBOXENV_CMDS and
> BAREBOX_2_INSTALL_BAREBOXENV_CMDS (why would you need to install bareboxenv to
> the rootfs twice), but I would like to keep the BAREBOX_2_BUILD_CUSTOM_ENV and
> the built-in variant in Yegor's pending patch-set. They allow customization of
> the barebox environment, and therefore the boot behavior.

I am having some trouble with this. I am not able to handle ifdef-space
diversity in this way. Ifdef-space diversity is used to determine how barebox
should be configured, whether / how the barebox environment should be built,
and to print user-friendly config errors. The ifdef logic is not all trivial
(almost half of the makefile logic), so I would like to avoid duplicating it
between barebox and barebox-2. The only way I know of to avoid this duplication
is by extracting the logic info a definition and using $(eval), which is
exactly what you want to avoid.

Also, for two of the ifdef-space diversity sections, $(PKG) seems to be
undefined at the time of evaluation. Getting to the bottom of this is proving
quite taxing. I can get around this by doing an `$(eval $(call ...,BAREBOX))`,
which looks a lot like my initial suggestion.

I am getting to the point where I am just going to duplicate the ifdef sections
and leave the consistency burden with future reviewers. I understand your
concern that some developers do not understanding $(eval) all that well, but
this is like trying to solve the problem with my shoelaces tied.

[snip]
 
> >  However, this is just my opinion, other developers may see it differently,
> > hence the CC.
> 
> Off course. Your opinion is held in rather high regard, so I would like to have
> at least one of the regular barebox developers on board. ;-)

Is there anyone else we can prod to weigh in on this? Please have a look at the
templated proposal and confirm your opinion on $(eval):
https://github.com/smipi1/bbb_buildroot/tree/barebox_2nd_config_build-v4-templated.

[snip]

- Pieter
