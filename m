From: Esben Haabendal <esben@geanix.com>
Date: Tue, 11 Jun 2019 10:42:41 +0200
Subject: [Buildroot] [PATCH 2/2] arch: Add support for Westmere targets
In-Reply-To: <87sgskbd8n.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 08 Jun 2019 12:08:56 +0200")
References: <20190607125313.20376-1-esben@geanix.com>
 <20190607125313.20376-2-esben@geanix.com>
 <87sgskbd8n.fsf@dell.be.48ers.dk>
Message-ID: <87a7eoa4xq.fsf@geanix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <peter@korsgaard.com> writes:

>>>>>> "Esben" == Esben Haabendal <esben@geanix.com> writes:
>
>  > The westmere line of x86_64 targets lies between nehalem (corei7) and
>  > sandybridge (corei7-avx).  Allowing use of -march=westmere enables use of AES
>  > instruction set on these targets.
>
>  > Signed-off-by: Esben Haabendal <esben@geanix.com>
>  > ---
>  >  arch/Config.in.x86         | 10 ++++++++++
>  >  package/openblas/Config.in |  2 +-
>  >  2 files changed, 11 insertions(+), 1 deletion(-)
>
>  > diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
>  > index 3f6983ac1b63..26496b8d08e9 100644
>  > --- a/arch/Config.in.x86
>  > +++ b/arch/Config.in.x86
>  > @@ -101,6 +101,15 @@ config BR2_x86_corei7
>  >  	select BR2_X86_CPU_HAS_SSSE3
>  >  	select BR2_X86_CPU_HAS_SSE4
>  >  	select BR2_X86_CPU_HAS_SSE42
>  > +config BR2_x86_westmere
>  > +	bool "westmere"
>  > +	select BR2_X86_CPU_HAS_MMX
>  > +	select BR2_X86_CPU_HAS_SSE
>  > +	select BR2_X86_CPU_HAS_SSE2
>  > +	select BR2_X86_CPU_HAS_SSE3
>  > +	select BR2_X86_CPU_HAS_SSSE3
>  > +	select BR2_X86_CPU_HAS_SSE4
>  > +	select BR2_X86_CPU_HAS_SSE42
>  >  config BR2_x86_corei7_avx
>  >  	bool "corei7-avx"
>  >  	select BR2_X86_CPU_HAS_MMX
>  > @@ -235,6 +244,7 @@ config BR2_ARCH
>  >  	default "i686"		if BR2_x86_nocona && BR2_i386
>  >  	default "i686"		if BR2_x86_core2 && BR2_i386
>  >  	default "i686"		if BR2_x86_corei7 && BR2_i386
>  > +	default "i686"		if BR2_x86_westmere && BR2_i386
>  >  	default "i686"		if BR2_x86_corei7_avx && BR2_i386
>  >  	default "i686"		if BR2_x86_core_avx2 && BR2_i386
>  >  	default "i686"		if BR2_x86_atom && BR2_i386
>
> No BR2_GCC_TARGET_ARCH? That doesn't seem right.

Definitely not right.

>> diff --git a/package/openblas/Config.in b/package/openblas/Config.in
>  > index 8e71a43f982c..c8a516bb9f93 100644
>  > --- a/package/openblas/Config.in
>  > +++ b/package/openblas/Config.in
>  > @@ -6,7 +6,7 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
>  >  	default "PRESCOTT"     if BR2_x86_prescott || BR2_x86_nocona
>  >  	default "BANIAS"       if BR2_x86_pentium_m
>  >  	default "CORE2"        if BR2_x86_core2
>  > -	default "NEHALEM"      if BR2_x86_corei7 || BR2_x86_silvermont
>  > + default "NEHALEM" if BR2_x86_corei7 || BR2_x86_westmere ||
>  > BR2_x86_silvermont
>
> Please put this openblas change in a separate patch. I know we don't do
> it consistently, but please sort these alphabetically - E.G. put
> westmere after silvermont.

Ok, will do.

I just tried to keep the split identical to the most recent similar
change, which is 1eecd462ae05 ("arch: add Atom CPUs as Silvermont
Architecture target").

Sending v2...

/Esben
