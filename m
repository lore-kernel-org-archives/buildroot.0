From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 23:32:38 +0200
Subject: [Buildroot] [RFC 2/2] qt5base: fix build issue on 32bits armv8
 target
In-Reply-To: <20170416151409.7665-3-gael.portay@savoirfairelinux.com>
References: <20170416151409.7665-1-gael.portay@savoirfairelinux.com>
 <20170416151409.7665-3-gael.portay@savoirfairelinux.com>
Message-ID: <2c646323-9ea9-bf01-7166-e362e50b507b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-04-17 17:14, Ga?l PORTAY wrote:
> __ARM_FEATURE_CRC32 macro is set for armv8 cpus.
> 
> In case of a 32bits armv8 target, gcc complains about an unknown
> attribute +crc.
> 
> 	tools/qhash.cpp:148:54: error: attribute(target("+crc")) is unknown
> 	 static uint crc32(const Char *ptr, size_t len, uint h)
> 
> This attribute looks to not be available in 32bits mode.

 That looks like a compiler bug, so I'm not sure this is the right fix.

 Also, I haven't been able to reproduce with a small test program (see below)
with various compilers I tried. Instead I get

/tmp/crc.c:7:1: warning: target attribute is not supported on this machine

I do get the link error in the end because of the missing __crc32w intrinsic. Or
when crc32 really is available (i.e. with -mcpu=cortex-a53), I get an assembler
error "selected processor does not support ARM mode `crc32w r3,r3,r2'". This
error I *don't* have when I use binutils 2.28, but I *do* have it with binutils
2.24. So my error sounds like a binutils issue.

 With which compiler did you have this issue?

crc.c:
------
#include <stdint.h>
#include <arm_acle.h>

__attribute__((__target__("+crc")))
int main(int argc, char *argv[])
{
  return __crc32w(0, *(uint32_t *)argv[0]);
}
------


 Note by the way that all cortex-aXX armv8-a processors seem to support the
optional CRC instruction, at least according to gcc. A processor that doesn't
have it is xgene1, but we don't support that one. So for Buildroot, the
target("+crc32") is pretty much redundant, since we always have -mcpu=cortex-aXX
for any processor that has __ARM_FEATURE_CRC32 set.

 Which makes me realize: the code in qhash.cpp is in fact rubbish... After
expanding a few macros, it basically has:

#if defined(__ARM_FEATURE_CRC32)
__attribute__((target("+crc32")))
static uint crc32(const Char *ptr, size_t len, uint h)

but __ARM_FEATURE_CRC32 is only defined if the compilation flags already contain
the equivalent of +crc32...


 So that makes me think that the proper (upstreamable) fix could be:

* Remove the bogus QT_FUNCTION_TARGET(CRC32) from qhash.cpp.

* Add a config.test that checks for broken assemblers that don't support the
crc32x instructions, and disable fast crc32 on those.


 Regards,
 Arnout



 Regards,
 Arnout


> If the
> attribute is bypassed (commented), the build breaks at linkage saying
> crc32x instructions are bad.
> 
> To solve this build issue, this patch checks for both __aarch64__ and
> __ARM_FEATURE_CRC32.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  ...ix-CRC-build-issue-on-32bits-armv8-target.patch | 95 ++++++++++++++++++++++
>  ...ix-CRC-build-issue-on-32bits-armv8-target.patch |  1 +
>  2 files changed, 96 insertions(+)
>  create mode 100644 package/qt5/qt5base/5.6.2/0003-Fix-CRC-build-issue-on-32bits-armv8-target.patch
>  create mode 120000 package/qt5/qt5base/5.8.0/0005-Fix-CRC-build-issue-on-32bits-armv8-target.patch
> 
> diff --git a/package/qt5/qt5base/5.6.2/0003-Fix-CRC-build-issue-on-32bits-armv8-target.patch b/package/qt5/qt5base/5.6.2/0003-Fix-CRC-build-issue-on-32bits-armv8-target.patch
> new file mode 100644
> index 000000000..a648ea04d
> --- /dev/null
> +++ b/package/qt5/qt5base/5.6.2/0003-Fix-CRC-build-issue-on-32bits-armv8-target.patch
> @@ -0,0 +1,95 @@
> +From 0382127e9f39f83e313ea279bc407d4eb6bd5e73 Mon Sep 17 00:00:00 2001
> +From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
> +Date: Tue, 11 Apr 2017 17:28:48 -0400
> +Subject: [PATCH] Fix CRC build issue on 32bits armv8 target
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=utf-8
> +Content-Transfer-Encoding: 8bit
> +
> +__ARM_FEATURE_CRC32 macro is set for armv8 cpus.
> +
> +In case of a 32bits armv8 target, gcc complains about an unknown
> +attribute +crc.
> +
> +	tools/qhash.cpp:148:54: error: attribute(target("+crc")) is unknown
> +	 static uint crc32(const Char *ptr, size_t len, uint h)
> +
> +This attribute looks to not be available in 32bits mode. If the
> +attribute is bypassed (commented), the build breaks at linkage saying
> +crc32x instructions are bad.
> +
> +To solve this build issue, this patch checks for both __aarch64__ and
> +__ARM_FEATURE_CRC32.
> +
> +Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> +---
> + config.tests/arch/arch.cpp  | 2 +-
> + src/corelib/tools/qhash.cpp | 2 +-
> + src/corelib/tools/qsimd.cpp | 2 +-
> + src/corelib/tools/qsimd_p.h | 4 ++--
> + 4 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/config.tests/arch/arch.cpp b/config.tests/arch/arch.cpp
> +index f99c5ca118..72f4af39fe 100644
> +--- a/config.tests/arch/arch.cpp
> ++++ b/config.tests/arch/arch.cpp
> +@@ -249,7 +249,7 @@ const char msg2[] = "==Qt=magic=Qt== Sub-architecture:"
> + #ifdef __IWMMXT__
> + " iwmmxt"
> + #endif
> +-#ifdef __ARM_FEATURE_CRC32
> ++#if defined(__aarch64__) && defined(__ARM_FEATURE_CRC32)
> + " crc32"
> + #endif
> + 
> +diff --git a/src/corelib/tools/qhash.cpp b/src/corelib/tools/qhash.cpp
> +index abec9ebb79..84cbe51731 100644
> +--- a/src/corelib/tools/qhash.cpp
> ++++ b/src/corelib/tools/qhash.cpp
> +@@ -137,7 +137,7 @@ static uint crc32(const Char *ptr, size_t len, uint h)
> +         h = _mm_crc32_u8(h, *p);
> +     return h;
> + }
> +-#elif defined(__ARM_FEATURE_CRC32)
> ++#elif defined(__aarch64__) && defined(__ARM_FEATURE_CRC32)
> + static inline bool hasFastCrc32()
> + {
> +     return qCpuHasFeature(CRC32);
> +diff --git a/src/corelib/tools/qsimd.cpp b/src/corelib/tools/qsimd.cpp
> +index d4edf459de..f07cb2914a 100644
> +--- a/src/corelib/tools/qsimd.cpp
> ++++ b/src/corelib/tools/qsimd.cpp
> +@@ -136,7 +136,7 @@ static inline quint64 detectProcessorFeatures()
> + #if defined(__ARM_NEON__)
> +     features |= Q_UINT64_C(1) << CpuFeatureNEON;
> + #endif
> +-#if defined(__ARM_FEATURE_CRC32)
> ++#if defined(__aarch64__) && defined(__ARM_FEATURE_CRC32)
> +     features |= Q_UINT64_C(1) << CpuFeatureCRC32;
> + #endif
> + 
> +diff --git a/src/corelib/tools/qsimd_p.h b/src/corelib/tools/qsimd_p.h
> +index d5d887598e..92c93ea2e7 100644
> +--- a/src/corelib/tools/qsimd_p.h
> ++++ b/src/corelib/tools/qsimd_p.h
> +@@ -324,7 +324,7 @@
> + #endif
> + #endif
> + // AArch64/ARM64
> +-#if defined(Q_PROCESSOR_ARM_V8) && defined(__ARM_FEATURE_CRC32)
> ++#if defined(__aarch64__) && defined(__ARM_FEATURE_CRC32)
> + #define QT_FUNCTION_TARGET_STRING_CRC32      "+crc"
> + #  include <arm_acle.h>
> + #endif
> +@@ -466,7 +466,7 @@ static const quint64 qCompilerCpuFeatures = 0
> + #if defined __ARM_NEON__
> +         | (Q_UINT64_C(1) << CpuFeatureNEON)
> + #endif
> +-#if defined __ARM_FEATURE_CRC32
> ++#if defined __aarch64__ && defined __ARM_FEATURE_CRC32
> +         | (Q_UINT64_C(1) << CpuFeatureCRC32)
> + #endif
> + #if defined __mips_dsp
> +-- 
> +2.12.1
> +
> diff --git a/package/qt5/qt5base/5.8.0/0005-Fix-CRC-build-issue-on-32bits-armv8-target.patch b/package/qt5/qt5base/5.8.0/0005-Fix-CRC-build-issue-on-32bits-armv8-target.patch
> new file mode 120000
> index 000000000..fce78e496
> --- /dev/null
> +++ b/package/qt5/qt5base/5.8.0/0005-Fix-CRC-build-issue-on-32bits-armv8-target.patch
> @@ -0,0 +1 @@
> +../5.6.2/0003-Fix-CRC-build-issue-on-32bits-armv8-target.patch
> \ No newline at end of file
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
