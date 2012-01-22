From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Jan 2012 13:04:16 +0100
Subject: [Buildroot] [PATCH] ffmpeg: depends on host-nasm if MMX is enabled
Message-ID: <1327233857-25481-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>


Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/multimedia/ffmpeg/ffmpeg.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 38f04aa..b3f5d31 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -124,8 +124,13 @@ FFMPEG_CONF_OPT += --disable-zlib
 endif
 
 # MMX on is default for x86, disable it for lowly x86-type processors
+# If it is enabled, nasm is required
 ifeq ($(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_i686)$(BR2_x86_pentiumpro)$(BR2_x86_geode),y)
 FFMPEG_CONF_OPT += --disable-mmx
+else
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+FFMPEG_DEPENDENCIES += host-nasm
+endif
 endif
 
 # ARM defaults to v5: clear if less, add extra if more
-- 
1.7.8.3
