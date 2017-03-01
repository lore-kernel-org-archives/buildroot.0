From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 14:14:43 +0100
Subject: [Buildroot] [PATCH 1/1] csky: Add new architecture
In-Reply-To: <1174d987-9327-9109-8fd5-f369977cb437@c-sky.com>
References: <1488357224-5141-1-git-send-email-ren_guo@c-sky.com>
 <20170301102208.79668e6f@free-electrons.com>
 <1174d987-9327-9109-8fd5-f369977cb437@c-sky.com>
Message-ID: <20170301141443.62263c29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Mar 2017 20:37:45 +0800, ren_guo wrote:

> > Thanks for submitting the support for this new architecture. I'll
> > review your patch below. However, I have one question: if you add a new
> > architecture like this in Buildroot, then we will need your help to fix
> > the build issues that will arise on this architecture. Indeed, the
> > Buildroot community does a significant build testing effort (see
> > http://autobuild.buildroot.org). Can you comment on whether you will
> > have some time to investigate and fix the build issues that will occur
> > on this CPU architecture ?  
> 
> Yes, I will help to fix the build issues in autobuild as soon as possible.
> I'm preparing my next patch-mail under your guidance and try my best to
> test it.

Great. Then please add an entry for yourself in the DEVELOPERS file,
like:

N:      ren_guo <ren_guo@c-sky.com>
F:      arch/Config.in.csky

You can also add other F: entries for files that you contributed. But
the arch/Config.in.csky is particularly important: by assigning this
file to yourself, you will receive e-mail notifications when there are
build failures for your architecture.

One package that contains architecture-specific code and that often
causes problems is libffi. So if you haven't yet looked at implementing
support for csky in libffi, I would recommend you to have a look.

> > Could you summarize the upstreaming status of the binutils, gcc, glibc
> > and Linux kernel support for csky ?  
> 
> I just put a prebuild toolchain on the https://github.com/c-sky/tools, this has
> been tested by ourserlf.
> 
> binutils: current is 2.20 and we are preparing 2.27
> gcc: current is 4.5.1 and we are preparing 6.3
> glibc: current is 2.17 and we also plan to update it
> kernel: current is 4.9.13 and it can be built with the last stable version,
> I will update it as soon as possible.

OK, thanks.

> All of above source code will be put on the https://github.com/c-sky first, and next
> we will merge them into their own organizations' repo.

Good.

> >> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> >> index 91cddc2..db073a6 100644
> >> --- a/toolchain/toolchain-buildroot/Config.in
> >> +++ b/toolchain/toolchain-buildroot/Config.in
> >> @@ -47,7 +47,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
> >>   		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
> >>   		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
> >>   		   BR2_sh          || BR2_sparc64    || BR2_x86_64 || \
> >> -		   BR2_microblaze || BR2_nios2
> >> +		   BR2_microblaze || BR2_nios2 || BR2_csky  
> > If you do this, then you allow people to build a toolchain for csky
> > using Buildroot. Do you really have upstream support in binutils, gcc
> > and glibc ?
> >
> > If not, then this chunk shouldn't be here.  
> 
> ok, it's unnecessary and ? finished the build without this.

However, since initially you will not support the "internal toolchain
backend" (i.e when Buildroot builds the toolchain from scratch), then
you should change the definition of BR2_TOOLCHAIN_BUILDROOT with:

	depends on !BR2_csky

So that on the csky architecture, only the external toolchain option is
available.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
