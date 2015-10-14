From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 14 Oct 2015 16:58:22 +0100
Subject: [Buildroot] [PATCH] ffmpeg: disable MIPS DSP options by default
Message-ID: <1444838302-13785-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DSP support depends on the core implementation, not on the ISA, so
enabling it for mips64r2 is not correct since you can build a mips64r2
core without DSP support.

Disable mipsdspr1 and mipsdspr2 options by default and let the user
enable them via the BR2_PACKAGE_FFMPEG_EXTRACONF kconfig option, which
will take preference and override the default values.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ffmpeg/ffmpeg.mk |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f817471..87415f3 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -41,6 +41,8 @@ FFMPEG_CONF_OPTS = \
 	--enable-runtime-cpudetect \
 	--disable-hardcoded-tables \
 	--disable-memalign-hack \
+	--disable-mipsdspr1 \
+	--disable-mipsdspr2 \
 	--disable-msa \
 	--enable-hwaccels \
 	--disable-avisynth \
@@ -355,16 +357,6 @@ FFMPEG_CONF_OPTS += \
 	--disable-mips32r2
 endif
 
-ifeq ($(BR2_mips_64r2),y)
-FFMPEG_CONF_OPTS += \
-	--enable-mipsdspr1 \
-	--enable-mipsdspr2
-else
-FFMPEG_CONF_OPTS += \
-	--disable-mipsdspr1 \
-	--disable-mipsdspr2
-endif
-
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 FFMPEG_CONF_OPTS += --enable-altivec
 else
-- 
1.7.1
