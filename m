From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 17:16:36 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] flare-engine: fix debug
 build
Message-ID: <20181126161323.E0CAE886EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bf9791d5d4f26041092043c6b2e7839b2243655
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

If BR2_ENABLE_DEBUG is set, use RelWithDebInfo instead of default Debug
as Debug will add -pg (gprof) which is not always available on toolchain

Fixes:
 - http://autobuild.buildroot.org/results/a12ae622a44bbe025c3a8b7e8e4c253b52927ae8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aa9d77c8518c5245b4e220d5f15e7c3733aa78be)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
