From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 09:57:00 +0200
Subject: [Buildroot] [git commit] mplayer: fix ARM floating point related
	build failures
Message-ID: <20140421083437.B3C169C90A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3de3ae58e830729bde1fcdc7da634567f4f3fa2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes two separate, but related build failures:

 * A failure that was happening when the ARM CPU supports NEON,
   floating point is enabled, but not with the NEON FPU. In this case,
   the NEON ARM assembly is rejected by the assembler, with messages
   like "Error: selected FPU does not support instruction -- `vmul.f32
   q0,q0,q1'". To fix this, we pass -mfpu=neon when we build mplayer
   with NEON support.

   Fixes:

     http://autobuild.buildroot.org/results/257/257a10e9cb5022bb09e0c6a03844be5b5b3e0bd4/

 * A failure that was happening when the ARM CPU supports NEON, but
   the configuration is anyway using soft-float. In this case, mplayer
   attempts to compile NEON floating point instructions, but this
   obviously fail in a soft-float context, with errors such as 'Error:
   selected processor does not support ARM mode `vmov d0,r7,r8''. To
   fix this, we do not allow NEON to be enabled when we are in a
   soft-float configuration.

   Fixes:

     http://autobuild.buildroot.org/results/7b3/7b3c89fcd496c0bc80063f63ecd58c827e8077ea/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 84d99ab..d2485e9 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -113,8 +113,11 @@ ifeq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),armv6j)
 MPLAYER_CONF_OPTS += --enable-armv6
 endif
 
+ifeq ($(BR2_ARM_SOFT_FLOAT),)
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 MPLAYER_CONF_OPTS += --enable-neon
+MPLAYER_CFLAGS += -mfpu=neon
+endif
 endif
 
 ifeq ($(BR2_i386),y)
