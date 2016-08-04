From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 00:20:06 +0200
Subject: [Buildroot] [PATCH] gdb: fix sim support for ARM
In-Reply-To: <20160731112751.GA26681@waldemar-brodkorb.de>
References: <20160731112751.GA26681@waldemar-brodkorb.de>
Message-ID: <20160805002006.7534eb58@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Jul 2016 13:27:51 +0200, Waldemar Brodkorb wrote:

> +-/* TODO: Probably should just delete SIM_CPU.  */
> ++/* GCC 4.4 and older should not define this.  */
> ++#define GCC_VERSION (__GNUC__ * 10000 \
> ++                               + __GNUC_MINOR__ * 100 \
> ++                               + __GNUC_PATCHLEVEL__)
> ++#if __GCC_VERSION > 40400
> + typedef struct _sim_cpu SIM_CPU;
> ++#endif
> + typedef struct _sim_cpu sim_cpu;

This is not the proper fix, and will potentially break again the build
for architectures other than Blackfin, when built with gcc 4.4.x.

The core of the problem is a commit from Mike Frysinger that refactors
the definition of the SIM_CPU type into a common header file. However,
due to include ordering issues, Mike had to keep a redefinition of
SIM_CPU in the Blackfin specific header file. This is fine with recent
compiler versions with which you can redefine multiple times the same
type, but causes a build failures with older compilers.

However, not all architectures have their own redefinition of SIM_CPU,
so if you remove it for gcc 4.4.x and older, you will break the build
of those architectures when gcc 4.4.x or older is used.

So, I've instead committed a patch that reverts Mike's commit for both
7.10 and 7.11. I've tested the build of the simulator on Blackfin and
ARM, with modern and ancient compilers and it seems to have fixed the
problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
