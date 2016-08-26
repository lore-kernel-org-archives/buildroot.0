From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Aug 2016 00:07:59 +0200
Subject: [Buildroot] [PATCH] pixman: properly enable/disable ARM
 optimizations
In-Reply-To: <1472244298-13978-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1472244298-13978-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <04d09d36-c5e7-ac47-a821-84026fd98178@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-08-16 22:44, Thomas Petazzoni wrote:
> The pixman ARM optimized code assumes that ARM instructions are
> available. Unfortunately, the configure.ac checks do not detect that the
> platform is Thumb-only for Cortex-M builds, so it enables the ARM
> optimizations, leading to failures like:
> 
> error: /home/test/autobuild/run/instance-3/output/host/usr/arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib/libpixman-1.a(pixman-arm-simd-asm-scaled.o): Conflicting CPU architectures 13/1
> 
> When building programs linked with pixman on Thumb-only
> architectures. This is due to the fact that some object files in
> libpixman-1.a are built for the ARM instruction set.
> 
> To resolve this, we give better hints to the pixman configure script
> about which ARM optimizations to use: the ARM SIMD optimizations need at
> least a CPU that supports ARM instructions, and obviously the ARM NEON
> optimizations need NEON support.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/54bee2ce382fcd067965d30f758f9d15514478d9/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pixman/pixman.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
> index 38524e6..ed75efe 100644
> --- a/package/pixman/pixman.mk
> +++ b/package/pixman/pixman.mk
> @@ -20,6 +20,18 @@ PIXMAN_AUTORECONF = YES
>  # don't build gtk based demos
>  PIXMAN_CONF_OPTS = --disable-gtk
>  
> +ifeq ($(BR2_ARM_CPU_HAS_ARM),y)

 Minor nit: the instructions used by arm-simd are actually ARMv5TE instructions.
Fortunately, all our ARMv5 CPU options support the E extension, so we can add
!BR2_ARM_CPU_ARMV4 to the condition. Still, it's not strictly necessary, because
the compiler can still generate this v5E code, and the resulting ELF file is
compatible with v4 object files, and there is a CPU check so it will only be run
if it is really supported (I didn't actually test that, but the code is there).
And adding that extra condition will make the code really ugly. It's just weird
to pass --enable-arm-simd when it will not be used in the end.

 So, up to you!

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> +PIXMAN_CONF_OPTS += --enable-arm-simd
> +else
> +PIXMAN_CONF_OPTS += --disable-arm-simd
> +endif
> +
> +ifeq ($(BR2_ARM_CPU_HAS_ARM)$(BR2_ARM_CPU_HAS_NEON),yy)
> +PIXMAN_CONF_OPTS += --enable-arm-neon
> +else
> +PIXMAN_CONF_OPTS += --disable-arm-neon
> +endif
> +
>  # disable iwmmxt support for CPU's that don't have
>  # this feature
>  ifneq ($(BR2_iwmmxt),y)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
