From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 13 May 2011 15:12:25 +0200
Subject: [Buildroot] [git commit] ffmpeg: disable altivec optimizations for
	PPC CPUs lacking it
Message-ID: <20110513131406.D9981834CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=29a07684527d922d3896b70a832f16c6c2b763a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use positive logic]
Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/ffmpeg/ffmpeg.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 1e8f09a..1c6e734 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -142,6 +142,14 @@ endif
 ifeq ($(BR2_cortex_a8),y)
 FFMPEG_CONF_OPT += --enable-neon
 endif
+# Set powerpc altivec appropriately
+ifeq ($(BR2_powerpc),y)
+ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
+FFMPEG_CONF_OPT -= --enable-altivec
+else
+FFMPEG_CONF_OPT += --disable-altivec
+endif
+endif
 
 FFMPEG_CONF_OPT += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
-- 
1.7.3.4
