From: Guo Ren <guoren@kernel.org>
Date: Wed, 29 May 2019 16:30:43 +0800
Subject: [Buildroot] [PATCH V3 03/10] arch/csky: Add FLOAT_ABI compiler
 options
In-Reply-To: <20190529095739.18d4d3c8@windsurf.home>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-4-git-send-email-guoren@kernel.org>
 <20190529092307.6c78996b@windsurf.home>
 <CAJF2gTSgReEOOJAvXY=MraqTLV4DwkKOqsbQ-4rBdNiaibxQfQ@mail.gmail.com>
 <20190529095739.18d4d3c8@windsurf.home>
Message-ID: <CAJF2gTRb4W=ZUz4-WxPwzdaQMMo1suwPsxU47QeGdjfBvgs3og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 29, 2019 at 3:57 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Wed, 29 May 2019 15:30:14 +0800
> Guo Ren <guoren@kernel.org> wrote:
>
> > > What is abiv1 vs. abiv2 ? Also, in your next commit, abiv1 is
> > > apparently used for ck610, but here this BR2_GCC_TARGET_FLOAT_ABI is
> > > defined for all cases, which seems to contradict your commit log.
> > abiv1 contain: ck610
> > abiv2 contain: ck807 ck810 ck860
> >
> > Abiv1 is almost the same as mcore and it's ELF_CODE is 39
> > Abiv2 is C-SKY own ISA and it's ELF_CODE is 252
> >
> > We don't support FPU in abiv1, because its opcode width is only
> > 16-bits and we don't want to continue developing it.
>
> Ah, and indeed BR2_CSKY_FPU cannot be selected for BR2_ck610.
>
> Please explain all of this in the commit log. Thanks!
>
OK, change the commit log with:

C-SKY CPU is seperated into two ABIs:
 - abiv1: mcore based ELF_NUM:39 and do not support FPU & VDSP. (CPU: 610)
 - abiv2: C-SKY own ISA with ELF_NUM:252 and support FPU & VDSP. (CPU:
807, 810, 860)

So we don't care BR2_GCC_TARGET_FLOAT_ABI for abiv1, because it based
on CSKY_FPU and it'll
never be selected by ck610.
