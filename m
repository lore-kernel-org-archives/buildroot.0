From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 21:48:14 +0200
Subject: [Buildroot] [PATCH] package/acpitool: not available for bfin
In-Reply-To: <CAK4VdL1HipqOpg5CuYi+KDZiyrLBZQvNLYcDsECLHNC+pqsAiA@mail.gmail.com>
References: <1468778160-32413-1-git-send-email-yann.morin.1998@free.fr>
 <CAK4VdL1HipqOpg5CuYi+KDZiyrLBZQvNLYcDsECLHNC+pqsAiA@mail.gmail.com>
Message-ID: <20160718214814.4a5df315@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jul 2016 19:37:29 +0200, Erico Nunes wrote:

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

It is not normal if such a simple C++ program does not build with our
Blackfin internal toolchain. I'm adding Waldemar in Cc so that he is
aware of the issue, and hopefully can find a fix.

> I have then also picked one other C++ package at random to test with
> this toolchain, called "bellagio". It also shows the same "configure:
> error: C++ compiler cannot create executables" error with the
> autobuilder toolchain. Not sure why the autobuilders haven't ever
> reported this one, though.
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

Agreed. So disabling it on Blackfin is not the proper solution (even
though I agree with Yann that acpitool is pretty much useless on
Blackfin, disabling it is just papering over the issue that will anyway
affect other packages).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
