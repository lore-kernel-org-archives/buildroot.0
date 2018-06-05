From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Tue, 5 Jun 2018 14:11:11 +0000
Subject: [Buildroot] Fwd: [PATCH] arm: ensure symbol is a thumb symbol
 in new binutils
In-Reply-To: <ec2b0134-6c4a-53ff-4ae2-69c3f0646ded@redhat.com>
References: <20171121172751.29545-1-Jason@zx2c4.com>
 <20171121173857.GJ31757@n2100.armlinux.org.uk>
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
Message-ID: <93bd3c78-3884-40be-76f5-f7946f7e03a8@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nick,
On 06/05/2018 01:37 PM, Nick Clifton wrote:
> Hi Christophe, Hi Romain,
>
>> I have made several test, with or without the define
>> "DEFAULT_THUMB_ADR_SETS_INTERWORKING",
>> but my test are always fails (no boot of my kernel).
> OK - now I am confused.  If changing the behaviour of the ADR and ADRL
> pseudo-ops is not working, then what is causing the boot failure ?
>
> Hmm, or is it that my patch is not working (at all) and not changing
> anything.
>
> Christophe - are you able to supply an assembler source file that
> I can try assembling to see what changes, if anything, when I use
> the new options ?
>
> Cheers
>    Nick
>
>
I'm not able to provide a simplest code which generate a bad assembler.
I have only the source code of kernel 4.11 use on my configuration of 
buildroot.
On code generated we see the issue on entry-common.o 
(arch/arm/kernel/entry-common.o):
code ok: f2af 1e3b ??? subw??? lr, pc, #315??? ; 0x13b
code KO: f2af 1e3a ??? subw??? lr, pc, #314??? ; 0x13a
(see assembler code obtained by objdump)

Info:
AFLAGS=-Wp,-MD,arch/arm/kernel/.entry-common.o.d? -nostdinc -isystem 
/mnt/internal_storage/stm32f7/buildroot_to_test_02/output/host/lib/gcc/arm-buildroot-uclinux-uclibcgnueabi/6.4.0/include 
-I./arch/arm/include -I./arch/arm/include/generated/uapi 
-I./arch/arm/include/generated? -I./include -I./arch/arm/include/uapi 
-I./include/uapi -I./include/generated/uapi -include 
./include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -D__ASSEMBLY__ 
-fno-PIE -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp 
-funwind-tables -mthumb -Wa,-mimplicit-it=always 
-Wa,-mno-warn-deprecated -Wa,-mthumb -D__LINUX_ARM_ARCH__=7 
-march=armv7-m -Wa,-march=armv7-m -include asm/unified.h -msoft-float 
-DCC_HAVE_ASM_GOTO -Wa,-gdwarf-2

/mnt/internal_storage/stm32f7/buildroot_to_test_02/output/host/bin/arm-buildroot-uclinux-uclibcgnueabi-gcc 
-Wp,-MD,arch/arm/kernel/.entry-common.o.d? -nostdinc -isystem 
/mnt/internal_storage/stm32f7/buildroot_to_test_02/output/host/lib/gcc/arm-buildroot-uclinux-uclibcgnueabi/6.4.0/include 
-I./arch/arm/include -I./arch/arm/include/generated/uapi 
-I./arch/arm/include/generated? -I./include -I./arch/arm/include/uapi 
-I./include/uapi -I./include/generated/uapi -include 
./include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -D__ASSEMBLY__ 
-fno-PIE -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp 
-funwind-tables -mthumb -Wa,-mimplicit-it=always 
-Wa,-mno-warn-deprecated -Wa,-mthumb -D__LINUX_ARM_ARCH__=7 
-march=armv7-m -Wa,-march=armv7-m -include asm/unified.h -msoft-float 
-DCC_HAVE_ASM_GOTO -Wa,-gdwarf-2?? -c -o arch/arm/kernel/entry-common.o 
arch/arm/kernel/entry-common.S

PS: More I made test and more I don't understand what are generating the 
issue.
With the test provided on mail thread: 
https://patchwork.kernel.org/patch/10072631/ , I obtain the same code 
with the two version of binutils (2.28.1 and 2.30).

I Hope this kind of information can help you.
Thanks for yours time.
Regards
Christophe

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: entry-common_disassembled_kernel_4.11_functionnal.objdump
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180605/79cc7035/attachment.ksh>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: entry-common_disassembled_kernel_4.11_ko.objdump
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180605/79cc7035/attachment-0001.ksh>
