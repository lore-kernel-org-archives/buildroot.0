From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 19:51:06 +0100
Subject: [Buildroot] [git commit] arch/Config.in.x86: drop BR2_x86_generic
Message-ID: <20141107185346.68E2FB2F56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80e406090893ab5a7b5d78e4d243d12fca2b22fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fuzzy generic x86 variant doesn't make much sense in the context of
Buildroot, and the recent change to use -march instead of -mtune broke it.

From the GCC manual:

https://gcc.gnu.org/onlinedocs/gcc-4.9.2/gcc/i386-and-x86-64-Options.html#i386-and-x86-64-Options:

-mtune=cpu-type
    Tune to cpu-type everything applicable about the generated code,
    except for the ABI and the set of available instructions. While
    picking a specific cpu-type schedules things appropriately for that
    particular chip, the compiler does not generate any code that cannot
    run on the default machine type unless you use a -march=cpu-type
    option. For example, if GCC is configured for i686-pc-linux-gnu then
    -mtune=pentium4 generates code that is tuned for Pentium 4 but still
    runs on i686 machines.

    The choices for cpu-type are the same as for -march. In addition,
    -mtune supports 2 extra choices for cpu-type:

    ???generic???
        Produce code optimized for the most common IA32/AMD64/EM64T
        processors. If you know the CPU on which your code will run,
        then you should use the corresponding -mtune or -march option
        instead of -mtune=generic. But, if you do not know exactly what
        CPU users of your application will have, then you should use
        this option.

        As new processors are deployed in the marketplace, the behavior
        of this option will change. Therefore, if you upgrade to a newer
        version of GCC, code generation controlled by this option will
        change to reflect the processors that are most common at the
        time that version of GCC is released.

        There is no -march=generic option because -march indicates the
        instruction set the compiler can use, and there is no generic
        instruction set applicable to all processors. In contrast,
        -mtune indicates the processor (or, in this case, collection of
        processors) for which the code is optimized.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.x86 |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 0b7919b..8a844db 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -18,12 +18,9 @@ choice
 	prompt "Target Architecture Variant"
 	depends on BR2_i386 || BR2_x86_64
 	default BR2_x86_i586 if BR2_i386
-	default BR2_x86_generic if BR2_x86_64
 	help
 	  Specific CPU variant to use
 
-config BR2_x86_generic
-	bool "generic"
 config BR2_x86_i386
 	bool "i386"
 	depends on !BR2_x86_64
@@ -197,7 +194,6 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_athlon
 	default "i686"		if BR2_x86_athlon_4
 	default "x86_64"	if BR2_x86_64
-	default "i386"		if BR2_x86_generic
 
 config BR2_ENDIAN
 	default "LITTLE"
@@ -234,4 +230,3 @@ config BR2_GCC_TARGET_ARCH
 	default "c3"		if BR2_x86_c3
 	default "c3-2"		if BR2_x86_c32
 	default "geode"		if BR2_x86_geode
-	default "generic"	if BR2_x86_generic
