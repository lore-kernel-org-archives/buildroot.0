From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 12 Sep 2014 17:50:09 +0200
Subject: [Buildroot] [PATCH 10/12] sdl: remove dga support in no MMU
In-Reply-To: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
Message-ID: <1410537011-29662-11-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DGA support use fork. This prevent executables to link with libSDL.so.

Fixes:
  http://sysmic.org/~jezz/results/5e50c243 (package sdl_mixer)
  http://sysmic.org/~jezz/results/734afef8 (package sdl_net)
  http://sysmic.org/~jezz/results/e2310eb9 (package sdl_image)
  http://sysmic.org/~jezz/results/e2cdcc9a (package sdl_sound)

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/sdl/sdl.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 8d0e5bd..77fbdd9 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -53,6 +53,10 @@ else
 SDL_CONF_OPT += --enable-video-x11=no
 endif
 
+ifneq ($(BR2_USE_MMU),y)
+SDL_CONF_OPT += --enable-dga=no
+endif
+
 ifeq ($(BR2_PACKAGE_TSLIB),y)
 SDL_DEPENDENCIES += tslib
 endif
-- 
2.1.0
