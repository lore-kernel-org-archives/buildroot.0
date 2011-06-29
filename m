From: Matias Garcia <mgarcia@rossvideo.com>
Date: Wed, 29 Jun 2011 14:48:13 -0400
Subject: [Buildroot] buildroot tool chain won't support SPE abi?
In-Reply-To: <BANLkTi=OQK2-HSPZ0V3W3Kmsh5wioOcLZw@mail.gmail.com>
References: <BANLkTi=OQK2-HSPZ0V3W3Kmsh5wioOcLZw@mail.gmail.com>
Message-ID: <1309373293.3540.7.camel@matias-lnx-host>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Raymond,

On Wed, 2011-06-29 at 13:27 -0400, raymond zhao wrote:
> Hi,
> My platform is freescale P1020 CPU, which uses e500v2 core.
> After tried and studied a few days, I think it is impossible to make
> buildroot to support spe abi with uclibc. The reason is that the gcc
> configure and build system need parse the tuple name of the target. My
> understand is the tuple name could be powerpc-unkown-linux-uclibc or
> powerpc-unkown-linux-gnuspe. Buildroot use uclibc one so that gcc
> configure system will disable the spe abi for the target CPU.
> So, here are my questions:
> 1. Am I right?

Yes, AFAIK. While I believe this behaviour (parsing the tuple name to
determine which instruction set to use) is disgusting, I trust someone
smarter than me chose it for a reason, and I never found a way around
it...

> 2. If I am right, is there any one know who or how to overcome this
> problem. I like uclibc, but I also need the spe. My current solution
> is to use eglibc, which is a little bigger than uclibc in size.

Before switching to the CodeSourcery toolchain, I modified the buildroot
makefiles to add 'spe' to the 'uclibc' tuple. I used the arm eabi as an
example, and added a cpu=e500v2 option to the list, which I checked for
modifying the tuple. It was a bit complicated, and I never submitted it
because some of the packages didn't link properly (i.e. linker used
soft-float while compiler used hard-float). I started playing with
LDFLAGS in order to accomplish that (e.g. add BR2_TARGET_OPTIMIZATIONS
to LDFLAGS also). The final tuple was powerpc-unknown-linux-uclibcspe.
 
> 
> thanks,
> 
> Raymond
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
