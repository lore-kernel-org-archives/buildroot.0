From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 10 Feb 2021 15:12:54 +0100
Subject: [Buildroot] [PATCH 5/7] package/flare-engine: remove explicit
 setting of CMAKE_BUILD_TYPE
In-Reply-To: <20210210141256.6438-1-patrickdepinguin@gmail.com>
References: <20210210141256.6438-1-patrickdepinguin@gmail.com>
Message-ID: <20210210141256.6438-6-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

flare-engine set CMAKE_BUILD_TYPE=RelWithDebInfo to avoid '-pg' for
profiling.

With the introduction of BR2_ENABLE_RUNTIME_DEBUG, this change should no
longer be necessary. Users that do not wish to have profiling information,
just keep BR2_ENABLE_RUNTIME_DEBUG disabled (default value), and those that
enable BR2_ENABLE_RUNTIME_DEBUG will get profiling.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/flare-engine/flare-engine.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
index e2f3eefa28..7022eac7ae 100644
--- a/package/flare-engine/flare-engine.mk
+++ b/package/flare-engine/flare-engine.mk
@@ -14,11 +14,6 @@ FLARE_ENGINE_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf
 # Don't use /usr/games and /usr/share/games
 FLARE_ENGINE_CONF_OPTS += -DBINDIR=bin -DDATADIR=share/flare
 
-# Don't use the default Debug type as it adds -pg (gprof)
-ifeq ($(BR2_ENABLE_DEBUG),y)
-FLARE_ENGINE_CONF_OPTS += -DCMAKE_BUILD_TYPE=RelWithDebInfo
-endif
-
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 # CMakeLists.txt sets CMAKE_CXX_FLAGS_<BUILD_TYPE> depending on
 # BUILD_TYPE, and this comes after the generic CMAKE_CXX_FLAGS.
-- 
2.26.2
