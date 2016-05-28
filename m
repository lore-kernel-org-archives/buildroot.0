From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 19:10:44 +0200
Subject: [Buildroot] [PATCH v2 2/4] toolchain: add bfin support
In-Reply-To: <20160528154229.GI22609@waldemar-brodkorb.de>
References: <20160513121557.GA30570@waldemar-brodkorb.de>
 <20160528153349.7a4e1cee@free-electrons.com>
 <20160528154229.GI22609@waldemar-brodkorb.de>
Message-ID: <20160528191044.5d7919b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 May 2016 17:42:29 +0200, Waldemar Brodkorb wrote:

> > > -config BR2_GCC_TARGET_CPU
> > > +config BR2_TARGET_CPU  
> > 
> > This seems wrong. Why are you doing this?  
> 
> In the first patch I disabled --with-cpu for gcc and bfin, as gcc
> does not support --with-cpu on bfin. You could use
> -mcpu=$(BR2_TARGET_CPU) to optimize code for a specific Bfin CPU,
> that is the reason the second version of the patch renamed
> the config symbols for a later use.

Hum, this is really annoying. All the internal toolchain backend of
Buildroot is based on the assumption that the gcc configure options
--with-arch, --with-cpu, --with-float, --with-fpu and --with-abi allow
to specify the default values for -march, -mcpu, -mfloat, -mfpu and
-mabi. For this reason, we pass the values at gcc configure time, but
then afterwards we don't pass any mcpu/mfloat/march/... values when
building packages, because gcc is supposed to generate by default code
for the selected arch/cpu.

It seems like Blackfin violates this assumption, and it will require a
bit more work than the patch you're submitting to make things working.

It seems like we need to distinguish the cases where the arch/cpu/etc.
can be defined at gcc configure time from the cases where it cannot.

According to the gcc installation documentation
(https://gcc.gnu.org/install/configure.html) :

"""
--with-cpu=cpu
--with-cpu-32=cpu
--with-cpu-64=cpu

  Specify which cpu variant the compiler should generate code for by
  default. cpu will be used as the default value of the -mcpu= switch.
  This option is only supported on some targets, including ARC, ARM,
  i386, M68k, PowerPC, and SPARC. It is mandatory for ARC. The
  --with-cpu-32 and --with-cpu-64 options specify separate default CPUs
  for 32-bit and 64-bit modes; these options are only supported for
  i386, x86-64 and PowerPC.
"""

So indeed, there is no guarantee that --with-cpu is supported on all
architectures.


> > At the very least, it needs to be explained in the commit log,
> > including the impact on the Blackfin external toolchain support.  
> 
> I thought it has no impact on the external toolchain.
> Is BR2_GCC_TARGET_CPU used in any way for external toolchains?

It is, yes. See toolchain-external.mk:

ifeq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU))
else
CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
endif

ifneq ($(CC_TARGET_CPU_),)
TOOLCHAIN_EXTERNAL_CFLAGS += -mcpu=$(CC_TARGET_CPU_)
TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_CPU='"$(CC_TARGET_CPU_)"'
endif

And then in the toolchain wrapper:

#ifdef BR_CPU
                *cur++ = "-mcpu=" BR_CPU;
#endif

This logic ensures that the value of BR2_GCC_TARGET_CPU is always
passed as -mcpu by the toolchain wrapper.

Since the toolchain wrapper is also used for the internal toolchain, we
can re-use the same strategy to hardcode the mcpu value.

> So how we go further with the internal Bfin toolchain stuff?

The easiest option by far is to have a per-architecture hidden
Config.in boolean option that says whether the arch/mcpu/etc. options
should be set at gcc configure time or not. If it's set to "y", then we
do like we do today. If it's not set to "y", then the logic to build
the toolchain wrapper for the internal toolchain case should be
modified to pass -mcpu/-mabi/-mfloat/etc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
