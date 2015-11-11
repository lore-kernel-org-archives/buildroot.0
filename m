From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 15:19:23 +0100
Subject: [Buildroot] [git commit] package/mplayer: needs host-yasm for mmx
	support
Message-ID: <20151111142131.E020C7FC65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c63534de711247ecb98a3c18f21e29f5f5f23a29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/6a8/6a8c3a70e33cb5b3fc40d036fb0716d915185f33/
http://autobuild.buildroot.net/results/cef/cef30d4e14d39ab64bb27a6514a0390755f4a9d2/
http://autobuild.buildroot.net/results/03b/03b1b42688b07789971a99337708b4dbe4278665/
http://autobuild.buildroot.net/results/5e3/5e3320dfc6793a9ff0494161cdc9a3be795462c4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 2f58864..99fc469 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -259,6 +259,13 @@ ifeq ($(BR2_i386),y)
 MPLAYER_CFLAGS += -fomit-frame-pointer
 endif
 
+ifeq ($(BR2_X86_CPU_HAS_MMX),y)
+MPLAYER_CONF_OPTS += --yasm=$(HOST_DIR)/usr/bin/yasm
+MPLAYER_DEPENDENCIES += host-yasm
+else
+MPLAYER_CONF_OPTS += --yasm=''
+endif
+
 define MPLAYER_CONFIGURE_CMDS
 	(cd $(@D); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -273,7 +280,6 @@ define MPLAYER_CONFIGURE_CMDS
 		--charset=UTF-8 \
 		--extra-cflags="$(MPLAYER_CFLAGS)" \
 		--extra-ldflags="$(MPLAYER_LDFLAGS)" \
-		--yasm='' \
 		--enable-fbdev \
 		$(MPLAYER_CONF_OPTS) \
 		--enable-cross-compile \
