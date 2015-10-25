From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 22:30:54 +0100
Subject: [Buildroot] [PATCH] arch/arm: use EABIhf by default with VFP
In-Reply-To: <CA+sos78tx8Yh4DKjwtHte7E7TuixNfTnT6QgFUy2ffN-iqKa-Q@mail.gmail.com>
References: <87k2qn6gf0.fsf@dell.be.48ers.dk>
 <1445786380-2741-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <877fmaixqa.fsf@dell.be.48ers.dk>
 <CA+sos7-joVOt2bNGPv31uM=t1CmfW=eCyTjHuH-qu2h25O=fSw@mail.gmail.com>
 <87pp02heb2.fsf@dell.be.48ers.dk>
 <CA+sos78tx8Yh4DKjwtHte7E7TuixNfTnT6QgFUy2ffN-iqKa-Q@mail.gmail.com>
Message-ID: <20151025213054.GK11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Beno?t, Peter, All,

On 2015-10-25 21:52 +0100, Beno?t Th?baudeau spake thusly:
> On Sun, Oct 25, 2015 at 9:40 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>>> "Beno?t" == Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com> writes:
> >
> >  > On Sun, Oct 25, 2015 at 7:55 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> >  >>>>>>> "Beno?t" == Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com> writes:
> >  >>
> >  >> > Set EABIhf as the default target ABI for the ARM processors that have or
> >  >> > may have a VFP unit, since this ABI is the most efficient in that case.
> >  >> > Of course, EABI can still be selected manually if needed.
> >  >>
> >  >> On a related note, should we default to thumb2 if the CPU supports it?
> >
> >  > I would say:
> >
> >  >     choice
> >  >            prompt "ARM instruction set"
> >  >            default BR2_ARM_INSTRUCTIONS_ARM if BR2_ARM_CPU_HAS_ARM
> >  >            default BR2_ARM_INSTRUCTIONS_THUMBS2 if BR2_ARM_CPU_HAS_THUMBS2
> >  >            default BR2_ARM_INSTRUCTIONS_THUMBS if BR2_ARM_CPU_HAS_THUMBS
> >
> > I'm not sure it makes sense to default to thumb1 even if the CPU
> > supports it because of various compatibility issues
> 
> It's the first default that wins, not the last one,

To be more precise: it's the first default which dependencies are
fullfiled that wins.

> so above it's ARM over Thumb1.

> > - So simply:
> >
> > default BR2_ARM_INSTRUCTIONS_THUMBS2 if BR2_ARM_CPU_HAS_THUMBS2
> >
> > (if no thumb2 is available, the first available option (ARM) is used).
> 
> With ARM + Thumb2, I would rather use ARM to avoid compatibility
> issues, except on platforms very constrained on memory. On Cortex-M3,
> there's not even ARM. Or is it common to use Thumb2 on bigger
> platforms like Cortex-A*?

I agree that we should default to ARM if available. If not, then default
to Thumb2 if available. Finally, fallback to Thumb1.

We know that if neither ARM not Thumb2 is available, then we must have
Thumb1 available. otherwise it would not make sense to have an ARM CPU
that does not support any of those three.

So, slight ammendment to Beno?t's proposal:

    choice
        prompt "ARM instruction set"
        default BR2_ARM_INSTRUCTIONS_ARM    if BR2_ARM_CPU_HAS_ARM
        default BR2_ARM_INSTRUCTIONS_THUMB2 if BR2_ARM_CPU_HAS_THUMB2
        default BR2_ARM_INSTRUCTIONS_THUMB

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
