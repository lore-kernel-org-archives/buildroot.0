From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Mar 2013 09:36:19 +0100
Subject: [Buildroot] [PATCH 3/3] sdl: use <pkg>_CONFIG_SCRIPTS for sdl-config
In-Reply-To: <1363595779-5094-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1363595779-5094-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1363595779-5094-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the <pkg>_CONFIG_SCRIPTS mechanism to handle the sdl-config
script, so that it properly gets removed from the target. However, we
can't completely remove the manual fixup, because it also takes care
of removing the -Wl,-rpath option, which the general
<pkg>_CONFIG_SCRIPTS doesn't do.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl/sdl.mk |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 4786dc5..fb47c4d 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -57,13 +57,10 @@ SDL_CONF_OPT += --enable-pulseaudio=no \
 		--disable-nasm \
 		--disable-video-ps3
 
-# Fixup prefix= and exec_prefix= in sdl-config, and remove the
-# -Wl,-rpath option.
+SDL_CONFIG_SCRIPTS = sdl-config
+
+# Remove the -Wl,-rpath option.
 define SDL_FIXUP_SDL_CONFIG
-	$(SED) 's%prefix=/usr%prefix=$(STAGING_DIR)/usr%' \
-		$(STAGING_DIR)/usr/bin/sdl-config
-	$(SED) 's%exec_prefix=/usr%exec_prefix=$(STAGING_DIR)/usr%' \
-		$(STAGING_DIR)/usr/bin/sdl-config
 	$(SED) 's%-Wl,-rpath,\$${libdir}%%' \
 		$(STAGING_DIR)/usr/bin/sdl-config
 endef
-- 
1.7.9.5
