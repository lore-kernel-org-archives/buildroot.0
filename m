From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 12 Nov 2013 15:40:05 -0600
Subject: [Buildroot] [PATCH v2 2/5] gcc: add microblaze internal
 toolchain
In-Reply-To: <20131112220752.6fea927d@skate>
References: <1384277505-11503-1-git-send-email-spenser@gillilanding.com>
 <1384277505-11503-3-git-send-email-spenser@gillilanding.com>
 <20131112220752.6fea927d@skate>
Message-ID: <1384292405.30195.23.camel@scotch.dyn.gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2013-11-12 at 22:07 +0100, Thomas Petazzoni wrote:
> Dear Spenser Gilliland,
> 
> On Tue, 12 Nov 2013 11:31:42 -0600, Spenser Gilliland wrote:

Oops, forgot to respond to the review comments. See inline.

> > +# Until gcc 4.7, a three stage build process was needed when using
> > +# NPTL. This hidden option tells whether gcc is a version that
> > +# requires this three stage build process.
> > +config BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
> > +	bool
> 
> Hum, is this really meant to be part of your patch? :-)

No, will fix.

> 
> > @@ -16,39 +23,44 @@ choice
> >  	config BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
> >  		depends on BR2_avr32
> >  		bool "gcc 4.2.2-avr32-2.1.5"
> > +		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
> 
> and this (and all the other occurrences).

Same.

> > +GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
> > +else ifeq ($(findstring microblaze,$(GCC_VERSION)),microblaze)
> > +MBGCC_VERSION = b93bb009e021aba64dd4b8cdb0bbc5a176c55543
> 
> MBGCC_VERSION ?

When initially doing this I felt that the git refs were to opaque.
However, I now realize that was a bad decision.

> 
> > +GCC_SITE = http://github.com/Xilinx/gcc/tarball/$(MBGCC_VERSION)
> > +GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
> >  else
> >  GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
> > -endif
> > -
> >  GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
> > +endif
> >  
> >  #
> >  # Xtensa special hook
> > @@ -60,7 +66,7 @@ endef
> >  #
> >  
> >  define HOST_GCC_EXTRACT_CMDS
> > -	$(BZCAT) $(DL_DIR)/$(GCC_SOURCE) | \
> > +	$(call suitable-extractor,$(GCC_SOURCE),$(BZCAT)) $(DL_DIR)/$(GCC_SOURCE) | \
> 
> The suitable-extractor macro doesn't take a second argument, so
> the ,$(BZCAT) here is useless.

Will fix.

> >  		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) \
> >  		--exclude='libjava/*' \
> >  		--exclude='libgo/*' \
> 
> Another issue is that this series is going to conflict quite badly with
> the series posted by Mischa to add specific binutils/gcc/gdb/uClibc
> versions for ARC.
> 
> It would probably be good if you could sync up on these two series.
> 
> Thanks!
> 
> Thomas


-- 
Spenser Gilliland
Computer Engineer
IIT ECASP Lab
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131112/e80818fd/attachment.asc>
