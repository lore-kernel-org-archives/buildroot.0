From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 10 Jul 2017 14:05:57 +0000
Subject: [Buildroot] [PATCH] ARC: Add support for ARC HS38 with Hardware
 Floating Point
In-Reply-To: <20170710154629.442a4411@windsurf.lan>
References: <20170710133650.8692-1-abrodkin@synopsys.com>
 <20170710154629.442a4411@windsurf.lan>
Message-ID: <1499695556.6394.30.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2017-07-10 at 15:46 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 10 Jul 2017 16:36:50 +0300, Alexey Brodkin wrote:
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > ---
> > ?arch/Config.in.arc???????| 10 +++++++---
> > ?package/uclibc/Config.in |??1 +
> > ?2 files changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> > index 7d341f3136..d0e2286557 100644
> > --- a/arch/Config.in.arc
> > +++ b/arch/Config.in.arc
> > @@ -14,12 +14,15 @@ config BR2_arc770d
> > ?config BR2_archs38
> > ?	bool "ARC HS38"
> > ?
> > +config BR2_archs38_hf
> > +	bool "ARC HS38 with hard floating-point"
> 
> Does it need to be a separate CPU type, or an option when HS38 is
> selected ?

Well this is a real "-mcpu" value understood by GCC for ARC
------------------------------>8-------------------------------
arc-linux-gcc --target-help
...
ARC-specific assembler options:
? -mcpu=<cpu name>	??(default: hs38), assemble for CPU <cpu name>, one of:
??????????????????????????arc700, nps400, arcem, em, em4, em4_dmips, em4_fpus,?
??????????????????????????em4_fpuda, quarkse_em, archs, hs, hs34, hs38,?
??????????????????????????hs38_linux, arc600, arc600_norm, arc600_mul64,?
??????????????????????????arc600_mul32x16, arc601, arc601_norm, arc601_mul64,?
??????????????????????????arc601_mul32x16
------------------------------>8-------------------------------

And in itself this is pretty much an alias to a set of HW features
selected by default in the same ARC HS38 "template" in CPU configuration
utility. In fact it is "-mcpu=hs38 -mfpu=fpud_all". But when we configure GCC
with "-mcpu" option it then is used by default, i.e. even if we later build
a random application with a simple "arc-linux-gcc test.c" it implicitly gets
optimized for that same "-mcpu"... i.e. there's no need in adding stuff in
TARGET_ABI variable in Buildroot etc.

For example in OpenEmbedded we went via separate options instead of those
"templates" as the same toolchain is reused between different builds which
differs from Buildroot where we build everything for just one HW configuration.
So IMHO templates approach in Buildroot is more convenient.

> ?config BR2_ARCH
> > ?	default "arc"	if BR2_arcle
> > @@ -37,6 +40,7 @@ config BR2_GCC_TARGET_CPU
> > ?	default "arc700" if BR2_arc750d
> > ?	default "arc700" if BR2_arc770d
> > ?	default "archs"	?if BR2_archs38
> > +	default "hs38_linux"	?if BR2_archs38_hf
> 
> gcc really understands -mcpu=hs38_linux ?
> 
> It seems odd to have the operating system name encoded in the CPU name.

The rationale behind that naming was to highlight a template which is
the best option for Linux use-case. I.e. if you want to build a system that
runs
Linux on top of ARC HS38 core please consider usage of that "template"
which has HW features that [may significantly] improve performance of the
system.

Still not sure if now you feel more comfortable with that stuff :))

-Alexey
