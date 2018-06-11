From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Mon, 11 Jun 2018 14:47:16 +0000
Subject: [Buildroot] Fwd: [PATCH] arm: ensure symbol is a thumb symbol
 in new binutils
In-Reply-To: <1d8f302b-5ece-9921-b930-8c4bca61743e@redhat.com>
References: <20171121172751.29545-1-Jason@zx2c4.com>
 <CAHmME9quDFbdOR9hKRz-Px=Mh3FvYEyhVrs4V_+JT+GjDajMrA@mail.gmail.com>
 <20171121174942.GK31757@n2100.armlinux.org.uk>
 <CAHmME9oMTNJFnOwfhu26QSRSP92Axbc-+v9cCPsTKxekZvGvxg@mail.gmail.com>
 <20171123103518.GL31757@n2100.armlinux.org.uk>
 <CAHmME9qBxgDV-HGeqj75ohr=4Bf+TD73PcC0DUqTRh5PTOKyhQ@mail.gmail.com>
 <20171123140228.GP31757@n2100.armlinux.org.uk>
 <CAKv+Gu8TJi8qSWAkL231WhQkWxK+vSQm2tnQn_qN-2wdFaNaEA@mail.gmail.com>
 <765227b5-981d-0cea-c831-73cfe2f58721@redhat.com>
 <aaf57bb5-13e6-852c-0f67-f72aedef0e79@gmail.com>
 <254af731-459b-1f1d-2d93-27c5a91e7bfb@redhat.com>
 <1e9b8ffd-cc1d-2c39-e34a-d1e33f49a645@gmail.com>
 <aca33630-3c36-4ba9-0237-b971cb7ffee7@st.com>
 <2a8151c1-644e-a6b0-9a21-2c570ac7000b@redhat.com>
 <9495e928-0ea5-8b47-84b6-5609078950b2@st.com>
 <ec2b0134-6c4a-53ff-4ae2-69c3f0646ded@redhat.com>
 <93bd3c78-3884-40be-76f5-f7946f7e03a8@st.com>
 <1d8f302b-5ece-9921-b930-8c4bca61743e@redhat.com>
Message-ID: <eb3b78be-9ee6-2100-084c-25539553f188@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nick,
On 06/11/2018 04:03 PM, Nick Clifton wrote:
> Hi Christophe,
>
>> On code generated we see the issue on entry-common.o
>> (arch/arm/kernel/entry-common.o):
>> code ok: f2af 1e3b ??? subw??? lr, pc, #315??? ; 0x13b
>> code KO: f2af 1e3a ??? subw??? lr, pc, #314??? ; 0x13a
>> (see assembler code obtained by objdump)
> OK - so this translates to the use of the "badr" macro defined
> in include/asm/assembler.h:
>
> 	.macro	badr\c, rd, sym
> #ifdef CONFIG_THUMB2_KERNEL
> 	adr\c	\rd, \sym + 1
> #else
> 	adr\c	\rd, \sym
> #endif
> 	.endm
>
>
> What is the CONFIG_THUMB2_KERNEL flag ?
Defiinition of CONFIG_THUMB2_KERNEL
config THUMB2_KERNEL "Compile the kernel in Thumb-2 mode"
 ??? help
 ??? ? By enabling this option, the kernel will be compiled in
 ??? ? Thumb-2 mode. A compiler/assembler that understand the unified
 ??? ? ARM-Thumb syntax is needed.

>
> I am wondering why it alters the behaviour of the badr macro...
>
>
>> -fno-PIE -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp
> Question - is the -mno-thumb-interwork flag always used ?
The compilation option "-mno-thumb-interwork" are used only
if "CONFIG_AEABI" are put in place for arm platform therefore yes for 
arm cortex-M
is used on all ARM of kernel configuration.

>
> It seems to me that this flag might provide a much simpler option
> to fix the assembler.  Ie:  if -mthumb-interwork is enabled then
> the ADR pseudo-instruction should include the interworking bit (for
> thumb function symbols), whereas if -mno-thumb-interwork is in
> effect, then it should not.
>
> Cheers
>    Nick
Info for CONFIG_AEABI: Use the ARM EABI to compile the kernel.
This option allows for the kernel to be compiled using the latest
ARM ABI (aka EABI).? This is only useful if you are using a user
space environment that is also compiled with EABI.
Since there are major incompatibilities between the legacy ABI and
EABI, especially with regard to structure member alignment, this
option also changes the kernel syscall calling convention to
disambiguate both ABIs and allow for backward compatibility support

Thanks for the analysis


-- 

Best regards / Cordialement,

Christophe Priouzeau | Tel: +33 244027320
STMicroelectronics
ST online: www.st.com<http://www.st.com/>
