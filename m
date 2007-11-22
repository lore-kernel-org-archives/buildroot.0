From: Daniel Mack <daniel@caiaq.de>
Date: Thu, 22 Nov 2007 15:55:23 +0100
Subject: [Buildroot] Wrong Image/zImage for arm 926T toolchain?
In-Reply-To: <46361d9e0711220639l7b064ae6nd1db1814b774908e@mail.gmail.com>
References: <46361d9e0711220639l7b064ae6nd1db1814b774908e@mail.gmail.com>
Message-ID: <3CD5659B-8B85-4A16-B2DD-7153F1307AD4@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Nov 22, 2007, at 3:39 PM, udmd-eric wann wrote:

>        The new toolchain build the kernel "vmlinux" is only about 1M
>        However, I find linux-2.6.23/arch/arm/bootp/Image is very large
>        and zImage is >3M ....
>
>        If I use my previous toolchain, the output zImage is only  
> 500K...
>        I guest my objectcopy is wrong...
>        What's wrong with my setting? Could anybody give me a hint...

Your arch/arm/boot/Image is ~3GB, right? I had that too and it drove  
me nuts for several hours. The explanation is that recent versions  
(2.18) of binutils get confused about .note.gnu.build-id sections and  
produce garbage then. The solution is to eigther use 32bit-only  
userspace binaries to build your toolchain and kernel or to apply the  
following patch to your kernel tree.

http://svn.o-hand.com/view/poky/trunk/meta/packages/linux/linux- 
rp-2.6.22%2B2.6.23-rc4/binutils-buildid-arm.patch?rev=2726&view=markup

Hope that helps.

Greets,
Daniel
