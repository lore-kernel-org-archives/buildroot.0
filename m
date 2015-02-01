From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 21:48:46 +0100
Subject: [Buildroot] target options for Cortex A8/A9
In-Reply-To: <8F194C039449403C9E9AFFB360BCF394@JohanW7>
References: <8F194C039449403C9E9AFFB360BCF394@JohanW7>
Message-ID: <20150201214846.52ebad82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sun, 1 Feb 2015 20:51:48 +0100, Sagaert Johan wrote:

> I am using imx53, this cpu has according to the datasheet an NEON SIMD media accelerator
> and an VFPv3 co-processor.
> So I would assume the same selections options as for the A9.
> I was wondering what makes the target options different for A8 vs A9.
> 
> I would think that for the imx53 it sould be the same as for the A9,
> That is an NEON SIMD extension and a vfpv3 floating point engine.
> Please clarify, it is a bit confusing to me.
> 
> For the A8 I can select vfpv3 OR Neon, but not vfpv3 WITH NEON extension.

On Cortex-A8, NEON is mandatory. On Cortex-A9, NEON is optional. So
when you activate Cortex-A8, Buildroot knows NEON is available. When
you activate Cortex-A9, since NEON is optional, you have to tell
Buildroot if NEON is actually available or not.

See arch/Config.in.arm:

config BR2_cortex_a8
        bool "cortex-A8"
        select BR2_ARM_CPU_HAS_NEON
        select BR2_ARM_CPU_HAS_VFPV3
        select BR2_ARM_CPU_HAS_THUMB2
        select BR2_ARM_CPU_ARMV7A
config BR2_cortex_a9
        bool "cortex-A9"
        select BR2_ARM_CPU_MAYBE_HAS_NEON
        select BR2_ARM_CPU_MAYBE_HAS_VFPV3
        select BR2_ARM_CPU_HAS_THUMB2
        select BR2_ARM_CPU_ARMV7A

Note the difference between BR2_ARM_CPU_HAS_NEON for Cortex-A8 and
BR2_ARM_CPU_MAYBE_HAS_NEON for Cortex-A9.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
