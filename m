From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 17:22:48 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-12-25
In-Reply-To: <CANQCQpZtU10yqmgxmEHOtwLmRK_7bEfw7nosbD0V_Ffgujf7Tg@mail.gmail.com>
References: <20171226070035.2CF762072B@mail.free-electrons.com>
 <CANQCQpZtU10yqmgxmEHOtwLmRK_7bEfw7nosbD0V_Ffgujf7Tg@mail.gmail.com>
Message-ID: <20171229172248.6c41ef2f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Dec 2017 19:02:30 -0600, Matthew Weber wrote:

> Looked like a couple different failures for brltty, so I ran it
> through utils/test-pkg.

Thanks for doing this!

> Builds which failed:
>                    br-arm-cortex-a9-musl [ 7/47]: FAILED
>                    br-bfin-full [12/47]: FAILED
>                    br-sh4-full [28/47]: FAILED
> ports_glibc.o: In function `enablePorts':
> ports_glibc.c:(.text+0x1c): undefined reference to `ioperm'
> ports_glibc.o: In function `disablePorts':
> ports_glibc.c:(.text+0x74): undefined reference to `ioperm'
> ports_glibc.o: In function `readPort1':
> ports_glibc.c:(.text+0xc0): undefined reference to `inb'
> ports_glibc.o: In function `writePort1':
> ports_glibc.c:(.text+0xd8): undefined reference to `outb'

Mario has sent a patch for this today, I made some comments, but
hopefully, we're on track to solve it.

>                    br-arm-cortex-m4-full [ 8/47]: FAILED
>                    br-m68k-5208-full [15/47]: FAILED
> checking for msgmerge... /usr/bin/msgmerge
> checking for msgfmt... /usr/bin/msgfmt
> checking for linuxdoc... false
> checking for doxygen... false
> configure: error: dynamic linkage not supported for uclinux-uclibcgnueabi

Seems like we need to depends on !BR2_STATIC_LIBS.

>                       br-arm-full-static [11/47]: FAILED
> /nvme/rc-buildroot-hardening/brltty/br-arm-full-static/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os):
> In function `__uClibc_fini':
> __uClibc_main.c:(.text+0x164): undefined reference to `__fini_array_end'
> __uClibc_main.c:(.text+0x168): undefined reference to `__fini_array_start'
> __uClibc_main.c:(.text+0x16c): undefined reference to `__fini_array_start'

Seems like we need to depends on !BR2_STATIC_LIBS again :-)

>                      br-mips64-n64-full [19/47]: FAILED
>                      br-mips64r6-el-hf-glibc [20/47]: FAILED
>                      mips64el-ctng_n64-linux-gnu [38/47]: FAILED
>                      sourcery-mips64 [43/47]: FAILED
> /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld
> -r -o  braille.o eu_braille.o eu_clio.o eu_esysiris.o
> /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> eu_braille.o: ABI is incompatible with that of the selected emulation
> /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> failed to merge target specific data of file eu_braille.o
> /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> eu_clio.o: ABI is incompatible with that of the selected emulation
> /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> failed to merge target specific data of file eu_clio.o
> /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> eu_esysiris.o: ABI is incompatible with that of the selected emulation
> /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> failed to merge target specific data of file eu_esysiris.o
> /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> Attempt to do relocatable link with elf64-tradlittlemips input and
> elf32-ntradlittlemips output
> /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> eu_braille.o: file class ELFCLASS64 incompatible with ELFCLASS32
> /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> final link failed: File in wrong format

This generally happens when the package build system is using "ld"
directly at link time instead of using "gcc". It should use "gcc" to
work on all platforms. Mario, could you have a look into this, and
generally test with test-pkg that brltty builds on all configurations ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
