From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Nov 2018 14:34:52 +0100
Subject: [Buildroot] [PATCH] fs: allow filesystems to set the name of
 their output file
In-Reply-To: <649da177-0e70-3e8a-d4ff-934d49b9c530@mind.be>
References: <20181021132626.GA23085@scaer>
 <20181024010149.3970-1-casantos@datacom.com.br>
 <20181024143616.GA31663@scaer>
 <649da177-0e70-3e8a-d4ff-934d49b9c530@mind.be>
Message-ID: <20181103133452.GA24754@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-11-03 11:37 +0100, Arnout Vandecappelle spake thusly:
> On 24/10/18 16:36, Yann E. MORIN wrote:
[--SNIP--]
> >     +ROOTFS_EXT2_IMAGE_NAME = \
> >     +	$(if $(BR2_TARGET_ROOTFS_EXT2_2r0),rootfs.ext2) \
> >     +	$(if $(BR2_TARGET_ROOTFS_EXT2_2r1),rootfs.ext2) \
> >     +	$(if $(BR2_TARGET_ROOTFS_EXT2_3),rootfs.ext3) \
> >     +	$(if $(BR2_TARGET_ROOTFS_EXT2_4),rootfs.ext4)
> 
>  NACK that. You're defining ROOTFS_EXT2_IMAGE_NAME to contain spaces, so I think
> that's a bug on your side, not on the side where we use the variable.

So, why do we call qstrip on other user-provided options, like FOO_SITE,
FOO_SOURCE, FOO_LICENSE_FILES for example, or others that we simply
strip, like FOO_VERSION? Those are even less prone to contain unexpected
spaces to begin with, yet we decided to sanitise them based on some
feedback from users who would write things like (see 2f074857816):

    FOO_VERSION = something # some comment

Note: in fact, here, when I suggested we call qstrip, I was wrong; I
should have said plain strip instead. Mea culpa.

> The proper
> definition of this variable would be:
> 
> ifeq ($(BR2_TARGET_ROOTFS_EXT2_2r0),y)
> ROOTFS_EXT2_IMAGE_NAME = rootfs.ext2
> else ifeq (....)

We already use the $(if...) construct in many places, so I don't see
what is wrong with it, and I find it in fact more readable than the
alternative... See the huge one in util-linux for an extreme example
(which would be barely readbale should we switch to the ifeq-else-endif
format), or aircrack-ng for a more reasonable case.

We even already use it in fs/btrfs too, which was added recently-ish.

>  Because this is a bit verbose, we often handle the "switch" in Config.in rather
> than *.mk.

Sorry, but the above is pretty trivial, so yes it becomes easy to do in
kconfig. But under more complex situations, where the extension can be
computed, it might be easier to do in the .mk file.

>  You should know this stuff :-)

Well, yeah, I know it, and I even tested it on version 1 of Carlos
patch.

>  Bottom line: NACK against the stripping, Carlos' original patch was fine.

Meh, I was dragged in just because that touches the fs infra, but I
don't even care about this feature; I was even pretty oppposed to it to
begin with. This is even only a corner case that we won't even be
subjected to in Buildroot itself, so I don't care about the outcome...

My position with that would have been to suggest that, should a user
want to name their generated image differently, they should do as we
currently do in the ext filesystem: add a post-gen hook that creates
a (sym|hard)link to the name of their heart's content.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> >     +
> >      $(eval $(rootfs))
> > 
> > And then, the variable gets a leading sapce, unfortunately.
> > 
> > So, you need to qstrip the variable before using it, probably going with
> > an intermediate variable (in the fs infrastructure):
> > 
> >     ROOTFS_$(2)_IMAGE_NAME ?= rootfs.$(1)
> >     ROOTFS_$(2)_FINAL_IMAGE_NAME = $$(call qstrip,$$(ROOTFS_$()_IMAGE_NAME))
> > 
> > and then use ROOTFS_$(2)_FINAL_IMAGE_NAME to generate the rules...
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> >> +$$(BINARIES_DIR)/$$(ROOTFS_$(2)_IMAGE_NAME): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
> >> +$$(BINARIES_DIR)/$$(ROOTFS_$(2)_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
> >> +	@$$(call MESSAGE,"Generating filesystem image $$(ROOTFS_$(2)_IMAGE_NAME)")
> >>  	rm -rf $$(ROOTFS_$(2)_DIR)
> >>  	mkdir -p $$(ROOTFS_$(2)_DIR)
> >>  	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
> >> @@ -164,7 +165,7 @@ endif
> >>  rootfs-$(1)-show-depends:
> >>  	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
> >>  
> >> -rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1)
> >> +rootfs-$(1): $$(BINARIES_DIR)/$$(ROOTFS_$(2)_IMAGE_NAME)
> >>  
> >>  .PHONY: rootfs-$(1) rootfs-$(1)-show-depends
> >>  
> >> -- 
> >> 2.17.1
> >>
> > 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
