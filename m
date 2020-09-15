From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 19:51:47 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/wlroots: always
 disable xcb-errors
Message-ID: <20200915175147.0231E8B50A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9924dc7d572d86b6ae6ed2601d9fb5fa723d05bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Stop trying to enable the xcb-errors Meson option and always disable it:
there is no xcb-util-errors package in Buildroot. The build recipe was
wrongly assuming that the XCB errors library would be installed as part
of the xcb-util package, which is not the case.

Fixes the following autobuilder failure:

  http://autobuild.buildroot.net/results/1891aa624b29e4bbcbbe6bc752a1cc90c316024e/

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c2bc0694c45bb6bc0a19e06b2fcddff365be5a2e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wlroots/wlroots.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 988643485f..8b646b4536 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -21,7 +21,7 @@ WLROOTS_DEPENDENCIES = \
 	wayland \
 	wayland-protocols
 
-WLROOTS_CONF_OPTS = -Dexamples=false
+WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled
 
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
 WLROOTS_DEPENDENCIES += ffmpeg
@@ -59,13 +59,6 @@ else
 WLROOTS_CONF_OPTS += -Dxwayland=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_XCB_UTIL),y)
-WLROOTS_CONF_OPTS += -Dxcb-errors=enabled
-WLROOTS_DEPENDENCIES += xcb-util
-else
-WLROOTS_CONF_OPTS += -Dxcb-errors=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_XCB_UTIL_WM),y)
 WLROOTS_CONF_OPTS += -Dxcb-icccm=enabled
 WLROOTS_DEPENDENCIES += xcb-util-wm
