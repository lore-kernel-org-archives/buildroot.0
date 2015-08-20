From: sergey kostanbaev <sergey.kostanbaev@gmail.com>
Date: Fri, 21 Aug 2015 01:40:00 +0300
Subject: [Buildroot] [PATCH v2] Add support for the x86-64 x32 ABI for
 glibc and musl.
In-Reply-To: <2360791440107689@web3h.yandex.ru>
References: <1440070351-29057-1-git-send-email-Guido.Hatzsis@yandex.com>
 <20150820231629.5688e5ed@free-electrons.com>
 <2360791440107689@web3h.yandex.ru>
Message-ID: <CAGtNMfMiV4bi3-tLtSYDR4E_Jh1mZaFuKwmH5FYD9H__t_1juQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guido,

I tried this version on the latest master and it worked further. Thank you
for your work!

However it seems some packet lack support of x32.

I found out at least kexec, libffi and openssl have problems

kexec

/home/serg/projects/buildroot/output/host/usr/bin/x86_64-umsiteroot-linux-muslx32-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -fno-strict-aliasing -Wall -Wstrict-prototypes -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./include
-I./util_lib/include -Iinclude/  -I./kexec/arch/x86_64/include  -c -MD -o
kexec/arch/x86_64/kexec-bzImage64.o kexec/arch/x86_64/kexec-bzImage64.c
/home/serg/projects/buildroot/output/host/usr/bin/x86_64-umsiteroot-linux-muslx32-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -fno-strict-aliasing -Wall -Wstrict-prototypes
-fno-zero-initialized-in-bss -mcmodel=large -Os -fno-builtin -ffreestanding
-mcmodel=large -I./purgatory/include -I./purgatory/arch/x86_64/include
-I./util_lib/include -I./include -Iinclude
-I/home/serg/projects/buildroot/output/host/usr/lib/gcc/x86_64-umsiteroot-linux-muslx32/4.9.3/include
 -c -MD -o purgatory/purgatory.o purgatory/purgatory.c
purgatory/purgatory.c:1:0: error: code model ?large? not supported in x32
mode

 ^

libffi is used by Python and many others.
It seems it mistakenly tries to compile legacy x86 code

libtool: compile:
 /home/serg/projects/buildroot/output/host/usr/bin/x86_64-umsiteroot-linux-muslx32-gcc
-DHAVE_CONFIG_H -I. -I.. -I. -I../include -Iinclude -I../src
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I.
-I../include -Iinclude -I../src -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os -c ../src/x86/sysv.S  -fPIC -DPIC -o
src/x86/.libs/sysv.o
../src/x86/win32.S: Assembler messages:
../src/x86/win32.S:524: Error: invalid instruction suffix for `push'
../src/x86/win32.S:535: Error: invalid instruction suffix for `push'
../src/x86/win32.S:536: Error: invalid instruction suffix for `push'
../src/x86/win32.S:608: Error: operand type mismatch for `jmp'
../src/x86/win32.S:682: Error: invalid instruction suffix for `pop'
../src/x86/win32.S:695: Error: operand type mismatch for `push'
../src/x86/win32.S:708: Error: operand type mismatch for `push'
../src/x86/win32.S:709: Error: operand type mismatch for `push'
../src/x86/win32.S:724: Error: invalid instruction suffix for `push'
../src/x86/win32.S:779: Error: operand type mismatch for `jmp'
../src/x86/win32.S:834: Error: invalid instruction suffix for `pop'
../src/x86/win32.S:846: Error: invalid instruction suffix for `pop'
../src/x86/win32.S:887: Error: invalid instruction suffix for `push'
../src/x86/win32.S:891: Error: invalid instruction suffix for `push'
../src/x86/win32.S:934: Error: operand type mismatch for `jmp'
../src/x86/win32.S:992: Error: invalid instruction suffix for `pop'
../src/x86/win32.S:993: Error: invalid instruction suffix for `pop'
../src/x86/win32.S:1010: Error: invalid instruction suffix for `push'
../src/x86/win32.S:1062: Error: operand type mismatch for `jmp'
../src/x86/win32.S:1120: Error: invalid instruction suffix for `pop'
../src/x86/win32.S:1121: Error: invalid instruction suffix for `pop'
../src/x86/win32.S:1122: Error: invalid instruction suffix for `pop'
../src/x86/win32.S:1133: Error: operand type mismatch for `jmp'
make[5]: *** [src/x86/win32.lo] Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [all-recursive] Error 1
make[3]: *** [all] Error 2
make[2]: *** [all-all] Error 2
make[1]: ***
[/home/serg/projects/buildroot/output/build/libffi-3.1/.stamp_built] Error 2






On Fri, Aug 21, 2015 at 12:54 AM, Guido Hatzsis <guido.hatzsis@yandex.com>
wrote:

> Thomas,
>
> I just have a couple of questions:
>
> 20.08.2015, 17:16, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com
> >:
> >>  +endchoice
> >>  +
> >>  +config BR2_GCC_TARGET_ABI
> >>  + default "x32" if BR2_X86_64_ABI_X32
> >
> > Do we need to provide a value for BR2_X86_64_ABI_GNU ? Or the ABI is
> > empty ?
> >
>
> >>   define GLIBC_INSTALL_TARGET_CMDS
> >>           for libs in $(GLIBC_LIBS_LIB); do \
> >>  - $(call copy_toolchain_lib_root,$(STAGING_DIR)/,,lib,$$libs,/lib) ; \
> >>  + $(call copy_toolchain_lib_root,$(STAGING_DIR)/,,$(if
> $(BR2_X86_64_ABI_X32),libx32,lib),$$libs,/lib) ; \
> >
> > Hum, I'm not too happy with this. How does it work for normal x86-64
> > toolchains that want lib64 as the library directory?
> >
>
> I think that those two are related. The ABI is part of the x86-64 arch.
> Glibc uses libx32 and lib (not lib32 and lib64) when not using multilib.
> This is done here.
>
> 205 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
> 206 HOST_GCC_COMMON_CONF_OPTS += --with-abi=$(BR2_GCC_TARGET_ABI)
> 207 endif
>
> Do you need to set the BR2_GCC_TARGET_ABI to empty? Is this the convention?
>
> Guido
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150821/c5dc8f86/attachment.html>
