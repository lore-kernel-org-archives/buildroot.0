From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 12:35:09 +0200
Subject: [Buildroot] [git commit] ffmpeg: use the new BR2_ARM_CPU_ARM*
	options
Message-ID: <20141025103545.4C8D6AA3C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ac115d546c305b277326e9a509fec8b06025796
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using the Config.in options for each individual ARM core,
use the newly introduced BR2_ARM_CPU_ARM* options, which exist per ARM
architecture.

This commit is a blind conversion from the per-core options to the
per-architecture. It has the benefit of enabling the ARMv6
optimizations on all ARMv7-A cores, not only A5, A8, A9 and
A15. However, it doesn't fix the condition for
--enable-vfp/--disable-vfp for ARMv6 cores that don't have a FPU, it
is fixed in a follow-up commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ffmpeg/ffmpeg.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 21ec1c9..349bac9 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -277,15 +277,15 @@ endif
 # Explicitly disable everything that doesn't match for ARM
 # FFMPEG "autodetects" by compiling an extended instruction via AS
 # This works on compilers that aren't built for generic by default
-ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
+ifeq ($(BR2_ARM_CPU_ARMV4),y)
 FFMPEG_CONF_OPTS += --disable-armv5te
 endif
-ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s)$(BR2_cortex_a5)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a15),y)
+ifeq ($(BR2_ARM_CPU_ARMV6)$(BR2_ARM_CPU_ARMV7A),y)
 FFMPEG_CONF_OPTS += --enable-armv6
 else
 FFMPEG_CONF_OPTS += --disable-armv6 --disable-armv6t2
 endif
-ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s)$(BR2_cortex_a5)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a15),y)
+ifeq ($(BR2_ARM_CPU_ARMV6)$(BR2_ARM_CPU_ARMV7A),y)
 FFMPEG_CONF_OPTS += --enable-vfp
 else
 FFMPEG_CONF_OPTS += --disable-vfp
