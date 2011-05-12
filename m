From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 12 May 2011 16:12:40 -0400
Subject: [Buildroot] [PATCH] Disabled altivec optimizations for PPC CPUs
	lacking it
Message-ID: <1305231160-15062-1-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/multimedia/ffmpeg/ffmpeg.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 1e8f09a..e58add4 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -142,6 +142,14 @@ endif
 ifeq ($(BR2_cortex_a8),y)
 FFMPEG_CONF_OPT += --enable-neon
 endif
+#Set powerpc altivec appropriately
+ifeq ($(BR2_powerpc),y)
+ifneq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),)
+FFMPEG_CONF_OPT -= --enable-altivec
+else
+FFMPEG_CONF_OPT += --disable-altivec
+endif
+endif
 
 FFMPEG_CONF_OPT += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
-- 
1.7.3.4
