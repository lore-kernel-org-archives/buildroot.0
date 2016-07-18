From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 18 Jul 2016 19:37:29 +0200
Subject: [Buildroot] [PATCH] package/acpitool: not available for bfin
In-Reply-To: <1468778160-32413-1-git-send-email-yann.morin.1998@free.fr>
References: <1468778160-32413-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAK4VdL1HipqOpg5CuYi+KDZiyrLBZQvNLYcDsECLHNC+pqsAiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Jul 17, 2016 at 7:56 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> bfin is the only arch on which acpitool fails to build with the
> autobuilders:
>
>     http://autobuild.buildroot.org/?reason=acpitool-0.5.1
>     http://autobuild.buildroot.org/results/802/802f6bbc74ad8e89b2bb6a2f592ac91ef9cd88e3/
>     http://autobuild.buildroot.org/results/d2c/d2c708fc2aa18ecfc368a4ce93400cfc44366102/
>     [...]
>
> The cryptic error message;
>     configure: error: C++ compiler cannot create executables
>
> is due to the order in which AC_PROG_CXX and AC_PROG_CC are called.
> Calling AC_PROG_CC first fixes this error message.
>
> But then we get linking errors:
>
>     /home/ymorin/dev/buildroot/O/host/usr/bin/bfin-linux-g++  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os    -o acpitool main.o acpitool.o ac_adapter.o toshiba.o asus.o thinkpad.o cpu.o battery.o freq.o -lgcc
>     acpitool.o: In function `Has_ACPI(char*)':
>     acpitool.cpp:(.text+0x1be): undefined reference to `_Unwind_Resume'
>     acpitool.o: In function `Get_Kernel_Version(char*, int)':
>     acpitool.cpp:(.text+0x2aa): undefined reference to `_Unwind_Resume'
>     acpitool.o: In function `Set_Kernel_Version()':
>     acpitool.cpp:(.text+0x43e): undefined reference to `_Unwind_Resume'
>     acpitool.o: In function `Do_Fan_Info(int)':
>     acpitool.cpp:(.text+0x60a): undefined reference to `_Unwind_Resume'
>     acpitool.o: In function `Show_WakeUp_Devices(int)':
>     acpitool.cpp:(.text+0x770): undefined reference to `_Unwind_Resume'
>     acpitool.o:acpitool.cpp:(.text+0x9ca): more undefined references to `_Unwind_Resume' follow
>     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld: acpitool: hidden symbol `___udivsi3' in /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/libgcc.a(_udivsi3.o) is referenced by DSO
>     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld: final link failed: Bad value
>     collect2: error: ld returned 1 exit status
>
> The last one of those (the hidden ___udivsi3 symbol) is mopst
> concerning, and even the unwind stuff is not trivial.
>
> Because there's not many chances that a bfin board has ACPI, we just
> disable acpitoll for bfin.


No problem with me about disabling it for bfin.


I'm just not sure whether it is actually acpitool's fault, I have
performed the following tests regarding the toolchain referenced in
the autobuilder config:

$ cat main.cpp
int main(int argc, char **argv)
{
    return 0;
}
$ output/host/usr/bin/bfin-linux-g++ main.cpp
/home/erico/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld:
a.out: hidden symbol `___udivsi3' in
/home/erico/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/libgcc.a(_udivsi3.o)
is referenced by DSO
/home/erico/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld:
final link failed: Bad value
collect2: error: ld returned 1 exit status

I have then also picked one other C++ package at random to test with
this toolchain, called "bellagio". It also shows the same "configure:
error: C++ compiler cannot create executables" error with the
autobuilder toolchain. Not sure why the autobuilders haven't ever
reported this one, though.
It's possible to reproduce this by running 'make bellagio' with
http://autobuild.buildroot.org/results/802/802f6bbc74ad8e89b2bb6a2f592ac91ef9cd88e3/defconfig
.

If I switch the toolchain to "Blackfin.uclinux.org 2014R1", then
acpitool, bellagio build fine and I also don't get a linking error
with the simple test program.

So it seems to me that acpitool is taking the blame for just being the
first C++ package (alphabetically) to be built with the toolchain
referenced by these autobuilder failures?

Erico
