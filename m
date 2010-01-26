From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Tue, 26 Jan 2010 13:04:43 +0100
Subject: [Buildroot] [PATCH] SDL needs tslib to be compiled first when
	selected.
Message-ID: <1264507483-25049-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

If SDL is built before tslib, then SDL can't detect it at configure time and so
touchscreen's support in SDL is crappy.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/sdl/sdl.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index f66ecc4..959be7e 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -41,6 +41,10 @@ else
 SDL_X11=--enable-video-x11=no
 endif
 
+ifeq ($(BR2_PACKAGE_TSLIB),y)
+SDL_DEPENDENCIES += tslib
+endif
+
 $(DL_DIR)/$(SDL_SOURCE):
 	$(call DOWNLOAD,$(SDL_SITE),$(SDL_SOURCE))
 
-- 
1.6.0.4
