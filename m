From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Jul 2016 20:30:59 +0200
Subject: [Buildroot] [PATCH] package/acpitool: not available for bfin
In-Reply-To: <CAK4VdL1HipqOpg5CuYi+KDZiyrLBZQvNLYcDsECLHNC+pqsAiA@mail.gmail.com>
References: <1468778160-32413-1-git-send-email-yann.morin.1998@free.fr>
 <CAK4VdL1HipqOpg5CuYi+KDZiyrLBZQvNLYcDsECLHNC+pqsAiA@mail.gmail.com>
Message-ID: <20160718183059.GA12720@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erico, All,

On 2016-07-18 19:37 +0200, Erico Nunes spake thusly:
> On Sun, Jul 17, 2016 at 7:56 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > bfin is the only arch on which acpitool fails to build with the
> > autobuilders:
> >
> >     http://autobuild.buildroot.org/?reason=acpitool-0.5.1
> >     http://autobuild.buildroot.org/results/802/802f6bbc74ad8e89b2bb6a2f592ac91ef9cd88e3/
> >     http://autobuild.buildroot.org/results/d2c/d2c708fc2aa18ecfc368a4ce93400cfc44366102/
> >     [...]
> >
> > The cryptic error message;
> >     configure: error: C++ compiler cannot create executables
> >
> > is due to the order in which AC_PROG_CXX and AC_PROG_CC are called.
> > Calling AC_PROG_CC first fixes this error message.
> >
> > But then we get linking errors:
> >
> >     /home/ymorin/dev/buildroot/O/host/usr/bin/bfin-linux-g++  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os    -o acpitool main.o acpitool.o ac_adapter.o toshiba.o asus.o thinkpad.o cpu.o battery.o freq.o -lgcc
> >     acpitool.o: In function `Has_ACPI(char*)':
> >     acpitool.cpp:(.text+0x1be): undefined reference to `_Unwind_Resume'
> >     acpitool.o: In function `Get_Kernel_Version(char*, int)':
> >     acpitool.cpp:(.text+0x2aa): undefined reference to `_Unwind_Resume'
> >     acpitool.o: In function `Set_Kernel_Version()':
> >     acpitool.cpp:(.text+0x43e): undefined reference to `_Unwind_Resume'
> >     acpitool.o: In function `Do_Fan_Info(int)':
> >     acpitool.cpp:(.text+0x60a): undefined reference to `_Unwind_Resume'
> >     acpitool.o: In function `Show_WakeUp_Devices(int)':
> >     acpitool.cpp:(.text+0x770): undefined reference to `_Unwind_Resume'
> >     acpitool.o:acpitool.cpp:(.text+0x9ca): more undefined references to `_Unwind_Resume' follow
> >     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld: acpitool: hidden symbol `___udivsi3' in /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/libgcc.a(_udivsi3.o) is referenced by DSO
> >     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld: final link failed: Bad value
> >     collect2: error: ld returned 1 exit status
> >
> > The last one of those (the hidden ___udivsi3 symbol) is mopst
> > concerning, and even the unwind stuff is not trivial.
> >
> > Because there's not many chances that a bfin board has ACPI, we just
> > disable acpitoll for bfin.
> 
> No problem with me about disabling it for bfin.

Is that an Acked-by you? ;-)

> I'm just not sure whether it is actually acpitool's fault, I have
> performed the following tests regarding the toolchain referenced in
> the autobuilder config:
> 
> $ cat main.cpp
> int main(int argc, char **argv)
> {
>     return 0;
> }
> $ output/host/usr/bin/bfin-linux-g++ main.cpp
> /home/erico/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld:
> a.out: hidden symbol `___udivsi3' in
> /home/erico/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/libgcc.a(_udivsi3.o)
> is referenced by DSO
> /home/erico/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld:
> final link failed: Bad value
> collect2: error: ld returned 1 exit status

Yeah, I also tried that. As I said, I'm not investigating this issue;
it's too weird! ;-)

But I've had a further look now, and all I can say is that ld-uClibc.so.1
defines the ___udivsi3 symbol, and it is not undefined (i.e. it *is* in
there). At the same time, libgcc.a also has the same symbol, but set to
be hidden, so they clash.

I suspect there is a bug somewhere in the bfin toolchain. Not sure whose
fault it is: gcc, uClibc-ng or ld...

> I have then also picked one other C++ package at random to test with
> this toolchain, called "bellagio". It also shows the same "configure:
> error: C++ compiler cannot create executables" error with the
> autobuilder toolchain.

That's because Bellagio also checks for AC_PROG_CXX before AC_PROG_CC:

    https://sourceforge.net/p/omxil/omxil/ci/master/tree/configure.ac

    129 # Check for a working C compiler
    130 AC_PROG_CXX
    131 AC_PROG_CC

If you inverse the checks (i.e. AC_PROG_CC then AC_PROG_CXX) it works.
I also tried that with acpitool, and it indeed fixes the configure issue
(but then there was the build issue, at which point I bailed out).

> Not sure why the autobuilders haven't ever
> reported this one, though.

There are:

    http://autobuild.buildroot.org/?reason=bellagio-0.9.3
    http://autobuild.buildroot.org/results/e9b/e9b18697e3c519d38ea3666f69bed5cf008d772d/
    http://autobuild.buildroot.org/results/05f/05fa9cb522514e9e5b9e81893f145aab00abd803/

There's even one such failure on ARM:
    http://autobuild.buildroot.org/results/f6d/f6db9a9072e19d0632c8e6d64f67248e90f227ce/

And on ARC:
    http://autobuild.buildroot.org/results/203/203eb72ead23ea7930dc1a55dd54a8b3eea5c576/
    http://autobuild.buildroot.org/results/5d5/5d5fd738f10697985adbc6ed58e6c52ee95b8b33/

It's just that nobody really investigated them, since they are not
frequent... The last such failure occured in exactly one year ago; but I
was not able to see what changed in Bellagio that it no longer occurs...

> It's possible to reproduce this by running 'make bellagio' with
> http://autobuild.buildroot.org/results/802/802f6bbc74ad8e89b2bb6a2f592ac91ef9cd88e3/defconfig
> .
> 
> If I switch the toolchain to "Blackfin.uclinux.org 2014R1", then
> acpitool, bellagio build fine and I also don't get a linking error
> with the simple test program.
> 
> So it seems to me that acpitool is taking the blame for just being the
> first C++ package (alphabetically) to be built with the toolchain
> referenced by these autobuilder failures?

Maybe. Don't add packages that sort alphabetically-early if you don't
want to be noticed! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
