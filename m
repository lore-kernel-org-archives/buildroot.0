From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Nov 2018 22:34:39 +0100
Subject: [Buildroot] [PATCH 1/1] flare-engine: fix debug build
Message-ID: <20181118213439.10404-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If BR2_ENABLE_DEBUG is set, use RelWithDebInfo instead of default Debug
as Debug will add -pg (gprof) which is not always available on toolchain

Fixes:
 - http://autobuild.buildroot.org/results/a12ae622a44bbe025c3a8b7e8e4c253b52927ae8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flare-engine/flare-engine.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
index 0aac3bd33c..2f36602348 100644
--- a/package/flare-engine/flare-engine.mk
+++ b/package/flare-engine/flare-engine.mk
@@ -14,4 +14,9 @@ FLARE_ENGINE_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf
 # Don't use /usr/games and /usr/share/games
 FLARE_ENGINE_CONF_OPTS += -DBINDIR=bin -DDATADIR=share/flare
 
+# Don't use the default Debug type as it adds -pg (gprof)
+ifeq ($(BR2_ENABLE_DEBUG),y)
+FLARE_ENGINE_CONF_OPTS += -DCMAKE_BUILD_TYPE=RelWithDebInfo
+endif
+
 $(eval $(cmake-package))
-- 
2.17.1
