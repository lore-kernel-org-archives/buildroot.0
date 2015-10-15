From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 15 Oct 2015 13:22:55 +0100
Subject: [Buildroot] [PATCH] ffmpeg: let the user override the --cpu value
Message-ID: <1444911775-45783-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grab the content of BR2_PACKAGE_FFMPEG_EXTRACONF after guessing the CPU,
so the user will still have the possibility to override it.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ffmpeg/ffmpeg.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f361970..ec260de 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -421,14 +421,14 @@ else
 FFMPEG_CONF_OPTS += --disable-pic
 endif
 
-FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
-
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
 FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_CPU)
 else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
 FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_ARCH)
 endif
 
+FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
+
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
 define FFMPEG_CONFIGURE_CMDS
 	(cd $(FFMPEG_SRCDIR) && rm -rf config.cache && \
-- 
1.7.1
