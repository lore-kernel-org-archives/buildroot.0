From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 16 Apr 2019 09:01:10 +0300
Subject: [Buildroot] [RFC 1/1] toolchain-external/Config.in: Allow to
 select custom external-toolchain package
In-Reply-To: <20190415171509.GR2539@scaer>
References: <20190414212654.14910-1-vadim4j@gmail.com>
 <f0ea00e5-8b75-807d-a1cd-245cd3bd080d@mind.be>
 <20190415085724.0528c3f7@windsurf>
 <ba3c32a6-d28a-bbb1-6ea5-b12136599f5a@mind.be>
 <20190415171509.GR2539@scaer>
Message-ID: <20190416060110.d55fk33dloukl5tx@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On Mon, Apr 15, 2019 at 07:15:09PM +0200, Yann E. MORIN wrote:
> Arnout, Thomas, All,
> 
> On 2019-04-15 10:54 +0200, Arnout Vandecappelle spake thusly:
> > On 15/04/2019 08:57, Thomas Petazzoni wrote:
> > > On Sun, 14 Apr 2019 23:39:38 +0200
> > >>> +config BR2_TOOLCHAIN_EXTERNAL_OTHER
> > >>> +	bool "Other"
> > >>> +	help
> > >>> +	  Use this option to use a external toolchain from custom package
> > >>> +	  (e.g. in external project).  
> > >>
> > >>  So, the idea is to extend the choice with toolchains that come from
> > >> BR2_EXTERNAL and that you can't select here, right? And you need something like
> > >> that because it's a choice, and there's no way to extend the choice in a
> > >> different Kconfig file.
> > >>
> > >>  I think this is a worthwhile idea, so I'd like to work it out a little more...
> > >> Adding Yann in Cc since he like that kind of external craziness :-)
> 
> Aha! It's bneen quite a long time I've thought about doing exactly that,
> but I always postponed it because, well, 24h in a day...
> 
> > >>  If kept like this, then I think you should make it depend on a new (blind)
> > >> BR2_TOOLCHAIN_EXTERNAL_OTHER_AVAILABLE option, and that an external toolchain
> > >> package should select that option. This way, the option is only available if
> > >> your external tree actually makes one available.
> > 
> >  I forgot to mention how this option should be constructed... In the
> > toolchain-external's Config.in, you would have
> > 
> > config BR2_TOOLCHAIN_EXTERNAL_OTHER_AVAILABLE
> > 	bool
> > 
> >  And in the br2-external Config.in:
> > 
> > config BR2_TOOLCHAIN_EXTERNAL_OTHER_AVAILABLE
> > 	bool
> > 	default y
> > 
> > (Kconfig language allows the same symbol to be declared in different places, as
> > long as the definitions are consistent.)
> 
> I was thinking about an alternative, instead, where all the external
> toolchains are gathered in that choice.
> 
> If we go with your solution, then a br2-external may have its own
> choice, e.g.:
> 
>     choice
>         bool "my toolchains"
>     config BR2_MINE_TC_1
>         bool "mine-1"
>     config BR2_MINE_TC_2
>         bool "mine-2"
>     endchoice
> 
> And a second br2-external would have something similar:
> 
>     choice
>         bool "your toolchains"
>     config BR2_YOURS_TC_1
>         bool "yours-1"
>     config BR2_YOURS_TC_2
>         bool "yours-2"
>     endchoice
> 
> Since it is possible to use those two br2-external trees at once, there
> would obviously be a problem here, with two toolchians being selected...
> 
> The proposal from Vadym would not even allow that either, because the
> choices would have to be both guarded by the same depends on
> BR2_TOOLCHAIN_EXTERNAL_OTHER, so we'd be back to square one anyway...
> 
> The only way to make this workable is to gather all the toolchain
> symbols under a unique choice.
> 
> > >>  Also, it should be documented in docs/manual/customize-outside-br.txt.
> > >>
> > >>  However, it's still pretty inconvenient for the user. So perhaps we could
> > >> explicitly extend the external infra to generate a .br2-external.toolchain.in
> > >> that is included from here. This file would be populated based on the file
> > >> toolchain/Config.in in the external.
> > >>
> > >>  Thomas, is that idea over-engineered?
> > > 
> > > It is over-engineered, but there is not much choice if we want to allow
> > > implementing external toolchains in BR2_EXTERNAL, which would
> > > definitely be useful.
> > > 
> > > The downside of Vadim's approach is that it limits the BR2_EXTERNAL to
> > > implementing only one external toolchain, since it's only adding one
> > > entry to the choice. Your approach would be more flexible.
> > 
> >  Well, you *can* still add a second choice in the br2-external. But then having
> > multiple options from multiple br2-externals becomes difficult...
> 
> Exactly.
> 
> I don't see any other way than to aggregate all into the same choice...
> 
> The reason why I did not yet work or provide this, is because I would
> also like to have a generic way to doing such a thing.
> 
> For example, we have a choice for libjpeg, but it does not allow for a
> custom implementation to be provided by a br2external tree, with some
> vendors having an API-compatible libjpeg that is optimised for their
> SoC for example.
> 
> And providing something generic is far from trivial... :-(
> 
> However, as a first step, having something ad-hoc for the toolchains
> would be a net improvement nonetheless...
> 

So, the solution with aggregation external tree toolchains into
.br2-external.in.toolchain and then include it into
toolchain/toolchain-external/Config.in looks good, and it is worth to try to
implement ?

Regards,
Vadim Kochan
