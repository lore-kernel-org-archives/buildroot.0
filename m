From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 3 Jun 2019 05:42:03 +0000
Subject: [Buildroot] [PATCH 2/2] arch/arc: arc7x0 always needs -matomic
In-Reply-To: <20190601205046.GI3407@scaer>
References: <cover.1559421222.git.yann.morin.1998@free.fr>
 <16241cb355b045ba585ba806f0f4c829f5aea9f8.1559421222.git.yann.morin.1998@free.fr>
 <20190601223735.4057b840@windsurf> <20190601205046.GI3407@scaer>
Message-ID: <CY4PR1201MB0120ACABE84E384C36A492A5A1140@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas, all,

> -----Original Message-----
> From: Yann E. MORIN <yann.morin.1998@free.fr>
> Sent: Saturday, June 1, 2019 11:51 PM
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>; buildroot at buildroot.org
> Subject: Re: [PATCH 2/2] arch/arc: arc7x0 always needs -matomic
> 
> Thomas, All,
> 
> On 2019-06-01 22:37 +0200, Thomas Petazzoni spake thusly:
> > On Sat,  1 Jun 2019 22:33:51 +0200
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > diff --git a/arch/arch.mk.arc b/arch/arch.mk.arc
> > > new file mode 100644
> > > index 0000000000..d324e5c1e1
> > > --- /dev/null
> > > +++ b/arch/arch.mk.arc
> > > @@ -0,0 +1,4 @@
> > > +# ARC7x0 needs -matomic, always
> > > +ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
> > > +ARCH_TOOLCHAIN_WRAPPER_OPTS = -matomic
> > > +endif
> > So can we drop
> > TARGET_ABI += -matomic
> > from package/Makefile.in ?
> 
> Ah, I see that the condition there is not the same as the one I wrote.
> 
> Alexey, last time I asked [0], you did not reply, so here goes again: what
> variants of ARC really require -matomic, as you reported on [2] [3].
> 
> From [1], I understood that only arc700 was impacted, but the existing
> condition to add -matomic for arc [4] is not the same.
> 
> So, quid?

That's indeed not super straight-forward.

As of today we have 2 families of cores capable of running full-scale OS,
i.e. with MMU at least. These are ARC700 [1] and ARC HS [2].

And while all ARC HS cores have support of atomic instructions in their
base configurations in case of ARC700 they were not included in base configs
(I guess because back in the day in absence of SMP everybody was happy with
compare-exchange). What's worse those atomic-less configurations really exist
and that's why I'd still prefer to support them.

Speaking about atomics support in the toolchain we keep "-matomic" disabled
for "-mcpu=arc700" and have it enabled for all ARC HS varieties
(hs, hs38, hs38_linux etc), see:

| # arc-linux-gcc -mcpu=arc700 -Q --help=target | grep matomic
|   -matomic                              [disabled]
| #?arc-linux-gcc -mcpu=archs -Q --help=target | grep matomic
|   -matomic                              [enabled]

I.e. passing "-matomic" for ARC HS makes not much sense - it's enabled already
implicitly due to either "-mcpu" on GCC invocation or "--with-cpu" on GCC
configuration.

Now answering your and Tomas' questions:
1. In theory ARC750 is exactly that legacy configuration w/o atomics so we
   may just depend on "BR2_arc750d".
2. In practice given atomics might be disabled (or enabled) during core
   configuration [while designing the chip based on ARC700 family] it
   might still be a better option to rely on "BR2_ARC_ATOMIC_EXT" which:
     a) Gets pre-set of !BR2_arc750d
     b) Might be changed by a user

That said I don't have a firm preference here.

If you feel that dropping BR2_ARC_ATOMIC_EXT and relying on "BR2_arc750d"
for disabling atomics makes BR code cleaner let's go that way.

[1] https://www.synopsys.com/designware-ip/processor-solutions/arc-processors/arc-700-family.html
[2] https://www.synopsys.com/designware-ip/processor-solutions/arc-processors/arc-hs-family.html

-Alexey

P.S. BTW is there a chance to get our changes which add more flavors of ARC HS cores
     reviewed?

[3] https://patchwork.ozlabs.org/patch/995220/
