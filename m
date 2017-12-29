From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Dec 2017 18:13:04 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-12-25
In-Reply-To: <20171229172248.6c41ef2f@windsurf.lan>
References: <20171226070035.2CF762072B@mail.free-electrons.com>
 <CANQCQpZtU10yqmgxmEHOtwLmRK_7bEfw7nosbD0V_Ffgujf7Tg@mail.gmail.com>
 <20171229172248.6c41ef2f@windsurf.lan>
Message-ID: <20171229171304.GO3176@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Matt, Mario, All,

On 2017-12-29 17:22 +0100, Thomas Petazzoni spake thusly:
> On Tue, 26 Dec 2017 19:02:30 -0600, Matthew Weber wrote:
> > Looked like a couple different failures for brltty, so I ran it
> > through utils/test-pkg.
[--SNIP--]
> >                      sourcery-mips64 [43/47]: FAILED
> > /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld
> > -r -o  braille.o eu_braille.o eu_clio.o eu_esysiris.o
> > /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> > eu_braille.o: ABI is incompatible with that of the selected emulation
> > /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> > failed to merge target specific data of file eu_braille.o
> > /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> > eu_clio.o: ABI is incompatible with that of the selected emulation
> > /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> > failed to merge target specific data of file eu_clio.o
> > /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> > eu_esysiris.o: ABI is incompatible with that of the selected emulation
> > /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> > failed to merge target specific data of file eu_esysiris.o
> > /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> > Attempt to do relocatable link with elf64-tradlittlemips input and
> > elf32-ntradlittlemips output
> > /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> > eu_braille.o: file class ELFCLASS64 incompatible with ELFCLASS32
> > /nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
> > final link failed: File in wrong format
> 
> This generally happens when the package build system is using "ld"
> directly at link time instead of using "gcc". It should use "gcc" to
> work on all platforms. Mario, could you have a look into this, and
> generally test with test-pkg that brltty builds on all configurations ?

I've had a go at trying to use gcc instead of ld, but no amount of love
would make it build...

In Drivers/Braille/EuroBraille/Makefile.in, it basically is doing:

    ld -r -o braille.sO braille*.o

'ld -r -o' comes from $(MKOBJ), which comes from configure.ac, where it
gets the value of ${brltty_cv_prog_mkobj}, which defaults to $(LD) -r -o

I don't know how to do that with gcc. I've tried:

    brltty_cv_prog_mkobj='$(TARGET_CC) -Wl,-r -o'

but it fails...

I've tried a few other things as well, and the build eventually
succeeded once, but I have no idea wether my change was correct or not,
so I dropped it (something to do with using -shared).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
