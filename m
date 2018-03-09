From: Johannes Schmitz <johannes.schmitz1@gmail.com>
Date: Fri, 9 Mar 2018 15:52:38 +0100
Subject: [Buildroot] [PATCH RESEND] toolchain: use -ffp-contract=off on
 MIPS in the wrapper when needed
In-Reply-To: <CAAEAJfApADjywenR1NfeXrVqTLNPAtv0SFWOdgie6eS7xhQr8g@mail.gmail.com>
References: <20180308121430.20013-1-ezequiel@vanguardiasur.com.ar>
 <20180308123336.ywdsi5b5lo4iwjvv@tarshish>
 <CAAEAJfApADjywenR1NfeXrVqTLNPAtv0SFWOdgie6eS7xhQr8g@mail.gmail.com>
Message-ID: <CAMbDF3Jw248mK9bUPPfMGJ3sG7D-o+KX7Y025v-f=4c-vJ8Jrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-03-09 14:38 GMT+01:00 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>:

> Hi Baruch,
>
> On 8 March 2018 at 09:33, Baruch Siach <baruch@tkos.co.il> wrote:
> > Hi Ezequiel,
> >
> > On Thu, Mar 08, 2018 at 09:14:30AM -0300, Ezequiel Garcia wrote:
> >> From: Johannes Schmitz <johannes.schmitz1@gmail.com>
> >>
> >> This fix is necessary for to build for MIPS, for example for the MIPS
> >> XBurst architecture used on ci20 boards.
> >>
> >> GCC has replaced (no)mfused-madd with ffp-contract.
> >> Find more details and a long discussion at
> >> https://gcc.gnu.org/ml/gcc-patches/2015-06/msg00876.html
> >>
> >> Signed-off-by: Johannes Schmitz <johannes.schmitz1@gmail.com>
> >> Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> >> ---
> >> Ci20 builds are currently broken without this patch.
> >>
> >>  toolchain/toolchain-wrapper.c  | 3 ---
> >>  toolchain/toolchain-wrapper.mk | 4 ++++
> >>  2 files changed, 4 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/toolchain/toolchain-wrapper.c
> b/toolchain/toolchain-wrapper.c
> >> index 2928ea42d0e6..04b263199547 100644
> >> --- a/toolchain/toolchain-wrapper.c
> >> +++ b/toolchain/toolchain-wrapper.c
> >> @@ -79,9 +79,6 @@ static char *predef_args[] = {
> >>  #ifdef BR_OMIT_LOCK_PREFIX
> >>       "-Wa,-momit-lock-prefix=yes",
> >>  #endif
> >> -#ifdef BR_NO_FUSED_MADD
> >
> > Since you remove this macro reference, ...
> >
> >> -     "-mno-fused-madd",
> >> -#endif
> >>  #ifdef BR_BINFMT_FLAT
> >>       "-Wl,-elf2flt",
> >>  #endif
> >> diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/
> toolchain-wrapper.mk
> >> index 7f72a0cadec9..7faa033f605c 100644
> >> --- a/toolchain/toolchain-wrapper.mk
> >> +++ b/toolchain/toolchain-wrapper.mk
> >> @@ -28,8 +28,12 @@ endif
> >>
> >>  # Avoid FPU bug on XBurst CPUs
> >>  ifeq ($(BR2_mips_xburst),y)
> >> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_6),y)
> >> +TOOLCHAIN_WRAPPER_ARGS += -DBR_FP_CONTRACT_OFF
> >> +else
> >>  TOOLCHAIN_WRAPPER_ARGS += -DBR_NO_FUSED_MADD
> >
> > ... why not remove it here as well?
> >
>
> OK, so now I actually looked at this patch, and I think that it's
> all wrong:
>
> 1. BR_FP_CONTRACT_OFF is not used anywhere.
> 2. BR_NO_FUSED_MADD usage is removed,
> although it's still defined for GCC < 4.6.
>
> Johannes, want to give a shot at sending a correct version?
> Probably we just need to add:
>
> #ifdef BR_FP_CONTRACT_OFF
>     "-ffp-contract=off",
> #endif
>
> somewhere?
> --
> Ezequiel Garc?a, VanguardiaSur
> www.vanguardiasur.com.ar
>
Hello,
I will give it a try.

Regards
Johannes
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180309/2451a79c/attachment.html>
