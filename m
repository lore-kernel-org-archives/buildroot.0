From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Aug 2016 00:01:29 +0200
Subject: [Buildroot] [git commit] ffmpeg: explicitly disable NEON support
Message-ID: <20160816220523.0D48082133@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae7becfe50cca2f6000342475f52750cab53985c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_ARM_CPU_HAS_NEON=y, we pass --enable-neon. However, when
BR2_ARM_CPU_HAS_NEON is disabled, we don't pass anything. This generally
works fine, but turned out to integrate NEON code in ARMv7-M
builds (since it's ARMv7, ffmpeg assumed it should enable NEON code).

Even though ffmpeg is now disabled for ARMv7-M, it still makes sense to
be explicit, and disable NEON support when the CPU doesn't have it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index c42336f..2b4219a 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -437,6 +437,8 @@ FFMPEG_CONF_OPTS += --disable-vfp
 endif
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 FFMPEG_CONF_OPTS += --enable-neon
+else
+FFMPEG_CONF_OPTS += --disable-neon
 endif
 
 ifeq ($(BR2_MIPS_SOFT_FLOAT),y)
