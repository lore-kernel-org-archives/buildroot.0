From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 15:32:04 +0100
Subject: [Buildroot] [PATCH 3/7 v6] package/fftw: add ARM optimisations
In-Reply-To: <20150316153050.68ab2d76@x230.trabucayre.com>
References: <cover.1426513949.git.yann.morin.1998@free.fr>
 <930765fdc259da928cc44c19eb191f71d5132eef.1426513949.git.yann.morin.1998@free.fr>
 <20150316153050.68ab2d76@x230.trabucayre.com>
Message-ID: <20150316143204.GC4271@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2015-03-16 15:30 +0100, gwenhael.goavec spake thusly:
> Dear Yann E. MORIN
> On Mon, 16 Mar 2015 14:54:01 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> [SNIP]
> >  choice
> >  	prompt "fftw precision"
> >  	default BR2_PACKAGE_FFTW_PRECISION_NONE
> > @@ -33,6 +36,7 @@ config BR2_PACKAGE_FFTW_PRECISION_SINGLE
> >  	bool "single precision"
> >  	select BR2_PACKAGE_FFTW_USE_SSE if BR2_X86_CPU_HAS_SSE
> >  	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
> > +	select BR2_PACKAGE_FFTW_USE_NEON if BR2_ARM_FPU_NEON
> >  	help
> [SNIP]
> s/BR2_ARM_FPU_NEON/BR2_ARM_CPU_HAS_NEON/

No, because even if the CPU has NEON, it is not enough for NEOn to be
enabled.

That's what I initially tried, but it did not work, as fftw compiles
parts of its code without specifying -mfpu=neon, and thus it falls to
the value specified by Buildroot, and the compilation breaks.

I should probably have said so in the commit log, indeed...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
