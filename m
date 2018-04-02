From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 2 Apr 2018 13:19:51 +0000
Subject: [Buildroot] [PATCH] ARC: Add support for ARC HS38 with Hardware
 Floating Point
In-Reply-To: <cc3196e6-19db-04e0-6c21-01a3cd1b5fd2@mind.be>
References: <20170710133650.8692-1-abrodkin@synopsys.com>
 <20170710154629.442a4411@windsurf.lan>
 <1499695556.6394.30.camel@synopsys.com>
 <cc3196e6-19db-04e0-6c21-01a3cd1b5fd2@mind.be>
Message-ID: <1522675190.3989.15.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sat, 2018-03-31 at 16:38 +0200, Arnout Vandecappelle wrote:
>  Finally coming back to this old patch...
> 
> On 10-07-17 16:05, Alexey Brodkin wrote:
> > Hi Thomas,
> > 
> > On Mon, 2017-07-10 at 15:46 +0200, Thomas Petazzoni wrote:
> > > Hello,
> > > 
> > > On Mon, 10 Jul 2017 16:36:50 +0300, Alexey Brodkin wrote:
> > > > 
> > > > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > > > ---
> > > >  arch/Config.in.arc       | 10 +++++++---
> > > >  package/uclibc/Config.in |  1 +
> > > >  2 files changed, 8 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> > > > index 7d341f3136..d0e2286557 100644
> > > > --- a/arch/Config.in.arc
> > > > +++ b/arch/Config.in.arc
> > > > @@ -14,12 +14,15 @@ config BR2_arc770d
> > > >  config BR2_archs38
> > > >  	bool "ARC HS38"
> > > >  
> > > > +config BR2_archs38_hf
> > > > +	bool "ARC HS38 with hard floating-point"
> > > 
> > > Does it need to be a separate CPU type, or an option when HS38 is
> > > selected ?
> > 
> > Well this is a real "-mcpu" value understood by GCC for ARC
> > ------------------------------>8-------------------------------
> > arc-linux-gcc --target-help
> > ...
> > ARC-specific assembler options:
> >   -mcpu=<cpu name>	  (default: hs38), assemble for CPU <cpu name>, one of:
> >                           arc700, nps400, arcem, em, em4, em4_dmips, em4_fpus, 
> >                           em4_fpuda, quarkse_em, archs, hs, hs34, hs38, 
> >                           hs38_linux, arc600, arc600_norm, arc600_mul64, 
> >                           arc600_mul32x16, arc601, arc601_norm, arc601_mul64, 
> >                           arc601_mul32x16
> > ------------------------------>8-------------------------------
> > 
> > And in itself this is pretty much an alias to a set of HW features
> > selected by default in the same ARC HS38 "template" in CPU configuration
> > utility. In fact it is "-mcpu=hs38 -mfpu=fpud_all". But when we configure GCC
> > with "-mcpu" option it then is used by default, i.e. even if we later build
> > a random application with a simple "arc-linux-gcc test.c" it implicitly gets
> > optimized for that same "-mcpu"... i.e. there's no need in adding stuff in
> > TARGET_ABI variable in Buildroot etc.
> 
>  As such, I don't think this is a sufficient reason to make it a separate CPU
> option. Rather, I think we should consider what are the likely future
> architectures that are going to be added. We now have 750d, 770d and hs38. I
> guess there is no floating point option for the 750d and 770d? If there is, then
> clearly it would be better to have a separate hf option so it can be used for
> the 750d and 770d as well. If not, we should consider a future hs42: is it
> likely to have an optional fpu? Or is it likely to always have an fpu?

Indeed in case of ARC it's possible to turn features on and off and it
is applicable to HW FPU. That said it maps on a separate option very well.

>  Basically, what we want to avoid in the long run is to have many different
> subarches which are basically different combinations of options.
> 
>  So, in short: making a separate subarch for it is only warranted if you expect
> this will be the only one with an optional FPU (or rather, where in practice an
> FPU is always there, because obviously on ARC anything is possible).

That's all understood but another problem is we really want to build all
target binaries with that option. Quite some time ago I fixed libgcc so it
uses TARGET_CFLAGS, see [1] so we're almost there but still at least uclibc
is not yet there - we discussed it at length back in the day but decision was
made we'd better build uClibc with well-tested pre-defined options and as of today
uClibc only respects either TARGET_ABI or whatever GCC uses implicitly according to
how GCC was configured.

So my approach was a bit of a trick to make sure we build EVERYTHING with HW FPU
support. Maybe indeed this should be solved the other way around: set/reset BR2_SOFT_FLOAT
and patch uClibc such that depending on UCLIBC_HAS_FPU state we pass proper flags
to the compiler.

[1] https://git.buildroot.org/buildroot/commit/?id=0fe633cdff66febadc50bab3e0af4b3be53811c8

-Alexey
