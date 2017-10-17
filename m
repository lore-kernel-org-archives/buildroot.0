From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 21:03:54 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <9955dbb8-0447-5a3d-9e78-a0f6f42e7e6c@mind.be>
References: <20171011105809.2bf05267@windsurf.lan>
 <1508170801-31062-1-git-send-email-anisse@astier.eu>
 <20171016185248.0463ac82@windsurf.lan>
 <20171016211842.GA32198@bifrost>
 <20171017091152.67d7ad28@windsurf.lan>
 <4234cedb-0646-496e-9ee1-0bc60c847810@mind.be>
 <20171017141133.4d57ee87@windsurf.lan>
 <9955dbb8-0447-5a3d-9e78-a0f6f42e7e6c@mind.be>
Message-ID: <20171017210354.38d89b3c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Oct 2017 16:44:04 +0200, Arnout Vandecappelle wrote:

> > Therefore, you end up in a situation where a lot of things have been
> > displayed, and then nothing happens (because foo is being built). So
> > you're wondering "what the heck is going on in here". And once "foo"
> > has finished building, everything is displayed, and you understand what
> > was going on. Perhaps this can be solved by having the message
> > displayed as part of a separate target. Or perhaps we don't need to
> > solve this problem at all?  
> 
>  I think we do need to do something about it, but it could be as simple as
> letting MESSAGE print to /dev/tty instead of stdout.

True. I had some code doing that as part of my experiments, so I could
revive this.

> 
> > Another thing is that I'd ideally want this to be done automatically by
> > Buildroot, which is something we can do as part of the
> > "make-calls-itself" in the main Makefile. Except that at this point, we
> > don't have the Buildroot configuration available, and I wanted to make
> > this conditional on some BR2_PARALLEL_BUILD=y option. Or we make
> > -Orecurse the default, but that is going to significantly change the
> > visible behavior even for people not using top-level parallel build.  
> 
>  Ah, you would make top-level parallel build a config option?

Yes, my idea was to have a BR2_PARALLEL_BUILD like we have
BR2_REPRODUCIBLE, mainly to guard the feature while it is being
developed/validated. Fully reliable top-level parallel build is not
going to arrive over night, so initially I would prefer to keep the
current behavior totally unchanged, except for users that opt-in by
enabling BR2_PARALLEL_BUILD. Once we agree that the feature is
reasonably safe, we can drop that option and make it the default.

> Isn't it enough to observe the -j in MAKEFLAGS?

Interestingly:

all:
	@echo $(MAKEFLAGS)
ifneq ($(filter -j%,$(MAKEFLAGS)),)
	@echo "BINGO"
endif

Never shows BINGO when called with "make -j2" even if the echo
$(MAKEFLAGS) does show that -j2 has been passed. Also a:

$(warning $(MAKEFLAGS))

shows an empty value.

>  I'm not convinced we want to add this option automatically, however, because it
> makes it more difficult for people who don't want it. Why not add it to
> utils/brmake, for example, and point people there in the documentation of
> top-level parallel build?

Sorry I lost you here :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
