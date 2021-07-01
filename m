From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Thu,  1 Jul 2021 07:24:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2: Fix sdl2-config.cmake
Message-ID: <20210701062432.978633-1-glex.spb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SDL2 autotools-provided sdl2-config.cmake uses the absolute /usr prefix.
For this reason, we previously removed it (as of d59261836a).

This commit fixes sdl2-config.cmake to use relative paths instead.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 package/sdl2/sdl2.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index a2e426e578..68a6e1abca 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -24,13 +24,13 @@ SDL2_CONF_OPTS += \
 
 # We are using autotools build system for sdl2, so the sdl2-config.cmake
 # include path are not resolved like for sdl2-config script.
-# Remove sdl2-config.cmake file and avoid unsafe include path if this
-# file is used by a cmake based package.
+# Change the absolute /usr path to resolve relatively to the sdl2-config.cmake location.
 # https://bugzilla.libsdl.org/show_bug.cgi?id=4597
-define SDL2_REMOVE_SDL2_CONFIG_CMAKE
-	rm -rf $(STAGING_DIR)/usr/lib/cmake/SDL2
+define SDL2_FIX_SDL2_CONFIG_CMAKE
+	$(SED) '2s|^|get_filename_component(PACKAGE_PREFIX_DIR "$${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)\n|; s|"/usr"|$${PACKAGE_PREFIX_DIR}|' \
+	  $(STAGING_DIR)/usr/lib/cmake/SDL2/sdl2-config.cmake
 endef
-SDL2_POST_INSTALL_STAGING_HOOKS += SDL2_REMOVE_SDL2_CONFIG_CMAKE
+SDL2_POST_INSTALL_STAGING_HOOKS += SDL2_FIX_SDL2_CONFIG_CMAKE
 
 # We must enable static build to get compilation successful.
 SDL2_CONF_OPTS += --enable-static
-- 
2.30.2
