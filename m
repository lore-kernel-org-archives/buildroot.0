From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jun 2021 22:39:31 +0200
Subject: [Buildroot] [git commit] package/flare-engine: disable effect of
 CMAKE_BUILD_TYPE
Message-ID: <20210607144658.8780380E35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2f318270e3fcffc502b45a4503ecdde7033bf1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

flare-engine enables profiling when CMAKE_BUILD_TYPE is 'Debug'. The
Buildroot package explicitly avoided that by forcing CMAKE_BUILD_TYPE to
'RelWithDebInfo' when pkg-cmake.mk would normally set it to 'Debug'. Until
recently, this was the case when BR2_ENABLE_DEBUG was enabled.

A previous commit changed the condition under which CMAKE_BUILD_TYPE=Debug
was set, from BR2_ENABLE_DEBUG=y to BR2_ENABLE_RUNTIME_DEBUG=y, so logically
the flare-engine package would have to be updated accordingly.

However, apart from the profiling flag, the flare-engine package only uses
CMAKE_BUILD_TYPE to determine flags that Buildroot wants to control itself,
like optimization and debugging flags.

This means we can fake CMAKE_BUILD_TYPE to a value that has no meaning for
flare-engine itself, without needing to check BR2_ENABLE_DEBUG nor
BR2_ENABLE_RUNTIME_DEBUG.

Incidentally, this trick was already done in case
BR2_TOOLCHAIN_HAS_GCC_BUG_85180 was true, so move that line out of this
condition.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flare-engine/flare-engine.mk | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
index e2f3eefa28..b91fc16af3 100644
--- a/package/flare-engine/flare-engine.mk
+++ b/package/flare-engine/flare-engine.mk
@@ -14,16 +14,12 @@ FLARE_ENGINE_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf
 # Don't use /usr/games and /usr/share/games
 FLARE_ENGINE_CONF_OPTS += -DBINDIR=bin -DDATADIR=share/flare
 
-# Don't use the default Debug type as it adds -pg (gprof)
-ifeq ($(BR2_ENABLE_DEBUG),y)
-FLARE_ENGINE_CONF_OPTS += -DCMAKE_BUILD_TYPE=RelWithDebInfo
-endif
+# CMAKE_BUILD_TYPE is only used to set optimization and debug flags, all of
+# which we want Buildroot to steer explicitly. Explicitly set a fake build type
+# to get this control.
+FLARE_ENGINE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Buildroot
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
-# CMakeLists.txt sets CMAKE_CXX_FLAGS_<BUILD_TYPE> depending on
-# BUILD_TYPE, and this comes after the generic CMAKE_CXX_FLAGS.
-# Override CMAKE_BUILD_TYPE so no overrides are applied.
-FLARE_ENGINE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Buildroot
 FLARE_ENGINE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -O0"
 endif
 
