From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 03 Nov 2010 22:25:46 -0300
Subject: [Buildroot] [Review] Add gcc 4.5.1
In-Reply-To: <201011032352.34417.yann.morin.1998@anciens.enib.fr>
References: <1285020197-30269-1-git-send-email-Martin.Banky@gmail.com>
	<4CD1B69C.8020402@zacarias.com.ar>
	<201011032352.34417.yann.morin.1998@anciens.enib.fr>
Message-ID: <4CD20B9A.9000008@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/2010 07:52 PM, Yann E. MORIN wrote:

> Gustavo, All,
> 
> On Wednesday 03 November 2010 20:23:08 Gustavo Zacarias wrote:
>> Word of caution, gcc 4.5 isn't able to build good ARM kernels that can
>> load modules for versions <2.6.36 unless a patch is applied, see
>> https://bugzilla.kernel.org/show_bug.cgi?id=16310
> 
> From what I understand:
> - bug was introduced between 2.6.35-rc1 and -rc2: use the gcc option
>   only for powerpc
> - the mentioned gcc option was previously applied to all architectures
> - the bug has not been fixed on the 2.6.35.y tree
> - it was fixed during the 2.6.36 devel cycle
> 
> Which leads to the conclusion that:
> - 2.6.34 and prior         : not impacted
> - 2.6.35 and dot-releases  : impacted
> - 2.6.36 ( and above ;-) ) : not impacted
> 
> Sounds reasonable?
> 
> Regards,
> Yann E. MORIN.

See also... http://forums.arm.com/index.php?showtopic=8122
It seems gcc 4.5.x emits R_ARM_REL32 relocations by default unless
-fno-dwarf2-cfi-asm is passed as a build option and the ARM kernel
doesn't handle it (see arch/arm/include/asm/elf.h and
arch/arm/kernel/module.c).
I've Considered patching gcc to disable it by default in buildroot but
since it's the kernel at fault i don't see the value in it yet, we'd
just be punishing userland in the process too.
I didn't try with <2.6.35 myself, i'll give it a shot tomorrow to see
how extended this problem might be (bug report talks about 4.4.x rather
than 4.5.x and i've never hit the issue it with 4.4.x).
Regards.
