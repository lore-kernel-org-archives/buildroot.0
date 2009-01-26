From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Mon, 26 Jan 2009 10:16:20 +0100
Subject: [Buildroot] [PATCH 2/2] mplayer: add -fomit-frame-pointer for i386
Message-ID: <200901261016.20373.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This seems to be required to compile some of the inline asm.

This solves the following compiler errors:
h264.c: In function 'decode_cabac_residual':
h264.c:6158: warning: passing argument 4 of 'decode_significance_8x8_x86' discards qualifiers from pointer target type
cabac.h: In function 'get_cabac_noinline':
cabac.h:513: error: can't find a register in class 'GENERAL_REGS' while reloading 'asm'
cabac.h:513: error: 'asm' operand has impossible constraints

While searching several weeks ago, I hit the following URL, which
unfortunately currently doesn't seem to work anymore and I can't
remember what the bug was about.

Also see http://bugs.uclibc.org/view.php?id=4604

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 package/multimedia/mplayer/mplayer.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 719cc67..b65d288 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -25,6 +25,11 @@ else
 MPLAYER_LARGEFILE:=--disable-largefiles
 endif
 
+ifeq ($(BR2_i386),y)
+# This seems to be required to compile some of the inline asm
+MPLAYER_CFLAGS:=-fomit-frame-pointer
+endif
+
 $(DL_DIR)/$(MPLAYER_SOURCE):
 	$(call DOWNLOAD,$(MPLAYER_SITE),$(MPLAYER_SOURCE))
 
@@ -38,7 +43,7 @@ $(MPLAYER_DIR)/.configured: $(MPLAYER_DIR)/.unpacked
 	(cd $(MPLAYER_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
+		CFLAGS="$(TARGET_CFLAGS) $(MPLAYER_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--prefix=/usr \
-- 
1.6.1.1.227.g86702
