From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Dec 2016 10:07:28 +0100
Subject: [Buildroot] [git commit] arch/Config.in.arm: Add Cortex-A53 CPU
In-Reply-To: <20161205221749.A89387FEC4@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 5 Dec 2016 23:07:13 +0100")
References: <20161205221749.A89387FEC4@busybox.osuosl.org>
Message-ID: <87zik8gl9r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=785a73fb8f64d14c68b0c035aa40b203a2a17378
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Adds the Cortex-A53 CPU to the target architecture variant choice. This
 > sets the toolchain to use Cortex-A53 as the target. The effect is that
 > various Cortex-A53 tunings are enabled for the compilation of packages.

 > Signed-off-by: Matt Flax <flatmax@flatmax.org>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  arch/Config.in.arm | 10 ++++++++++
 >  1 file changed, 10 insertions(+)

 > diff --git a/arch/Config.in.arm b/arch/Config.in.arm
 > index c98efcd..592b097 100644
 > --- a/arch/Config.in.arm
 > +++ b/arch/Config.in.arm
 > @@ -191,6 +191,13 @@ config BR2_cortex_a17
 >  	select BR2_ARM_CPU_ARMV7A
 >  	select BR2_ARCH_HAS_MMU_OPTIONAL
 >  	depends on !BR2_ARCH_IS_64
 > +config BR2_cortex_a53
 > +	bool "cortex-A53"
 > +	select BR2_ARM_CPU_HAS_ARM
 > +	select BR2_ARM_CPU_HAS_NEON
 > +	select BR2_ARM_CPU_HAS_FP_ARMV8
 > +	select BR2_ARM_CPU_ARMV8
 > +	select BR2_ARCH_HAS_MMU_OPTIONAL

This unfortunately breaks a bunch of packages that use
BR2_ARM_CPU_HAS_ARM to know if the target supports classic ARM
instructions. This breaks as the aarch64 compiler doesn't understand
them:

http://autobuild.buildroot.net/results/5e6/5e67cc067a06f7364cde1a8393ea72608fe7fef1/

I think the best solution is to do something like:

select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64

I will send a patch shortly.

We might also need to review use of BR2_ARM_CPU_HAS_NEON and possibly
add a BR2_AARCH64_HAS_NEON.

I also see we don't select BR2_ARM_CPU_HAS_THUMB2, which we probably
should.

-- 
Bye, Peter Korsgaard
