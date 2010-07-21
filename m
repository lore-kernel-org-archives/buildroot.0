From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jul 2010 20:59:06 +0200
Subject: [Buildroot] grub compilation issue (x86_64 target)
In-Reply-To: <AANLkTik8QvNu_1RxKW3gkNS5nTbrODJFd9shl6AaqPwA@mail.gmail.com>
References: <AANLkTik8QvNu_1RxKW3gkNS5nTbrODJFd9shl6AaqPwA@mail.gmail.com>
Message-ID: <20100721205906.22d1e269@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Jul 2010 08:11:24 -0700
vbr vbr <vvvg77@gmail.com> wrote:

> There seems to be a compilation issue in the grub area with
> buildroot's latest code (git) with x86_64 target. (or maybe it's just
> my setup) After googling a little bit, the type of error shown in the
> config.log seems to indicate a missing library.
> I attached the config log and my buildroot config.

Yes, this is due to the fact that Grub uses the x86_64
cross-compilation toolchain with the -m32 gcc switch, in order to
produce 32 bits binaries. Unfortunately, the toolchain that Buildroot
produces is a pure 64 bits toolchain, so it cannot support the -m32
switch.

I see four possible solutions to this :

 *) Extend the Buildroot toolchain build system so that it can produce
    a 32/64 bits multilib toolchain that supports -m32. As embedded on
    x86_64 is very uncommon, I'm not sure we'll find someone who is
    interested to work on this.

 *) Extend Crosstool-NG so that it can produce such a 32/64 bits
    toolchain and then use it as an external toolchain. I've started to
    work on multilib support for Crosstool-NG, but it's far from being
    ready at the moment.

 *) Somehow make Buildroot generate two toolchains, a 32 bits one used
    to compile Grub, and a 64 bits toolchain to compile all the rest.
    Since would involve fairly large and complicated modifications,
    which I'm not sure we're ready to do for such a untypical use-case.

 *) Mark Grub as broken on x86_64 so that it cannot be compiled. I
    think this is the solution we're going to choose. Grub can always
    be compiled outside of Buildroot, and the build of bootloaders is
    not the biggest added value of embedded build systems such as
    Buildroot anyway.

Just out of curiosity, what is your use case for using Buildroot on a
x86_64 machine ? Is it just for experimenting/playing, or are they real
embedded products out there using x86_64 and that have footprint
requirements that make using Buildroot an interesting thing compared to
using full-blown distributions ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
