From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 May 2020 19:12:26 +0200
Subject: [Buildroot] [PATCH 3/4] package/libglew: do not depend on libglu
In-Reply-To: <20200503171227.1411086-1-bernd.kuhls@t-online.de>
References: <20200503171227.1411086-1-bernd.kuhls@t-online.de>
Message-ID: <20200503171227.1411086-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"The inclusion of GLU is historical. [...] It's not needed for GLEW to
 build or run, but it's opt-out that reason. I'd recommend using
 -DGLEW_NO_GLU since GLU is rarely seen in modern codebases nowadays."
https://github.com/nigels-com/glew/issues/192#issuecomment-411641657

This patch prevents libglu being added to the "Requires:" section of
glew.pc fixing libglew detection in the supertuxkart package

-- Checking for module 'glew>=2.1'
--   Package 'glu', required by 'glew', not found

after libglu is removed as dependency of supertuxkart.

Supertuxkart already uses -DGLEW_NO_GLU:
https://github.com/supertuxkart/stk-code/blob/master/CMakeLists.txt#L224

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libglew/libglew.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libglew/libglew.mk b/package/libglew/libglew.mk
index 8a07170e99..fa26292567 100644
--- a/package/libglew/libglew.mk
+++ b/package/libglew/libglew.mk
@@ -15,6 +15,7 @@ LIBGLEW_DEPENDENCIES = libgl xlib_libX11 xlib_libXext xlib_libXi xlib_libXmu
 # using $TARGET_CONFIGURE_OPTS breaks compilation
 define LIBGLEW_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		GLEW_NO_GLU="-DGLEW_NO_GLU" \
 		GLEW_DEST="/usr" LIBDIR="/usr/lib" \
 		AR="$(TARGET_AR)" CC="$(TARGET_CC)" \
 		LD="$(TARGET_CC)" STRIP="$(TARGET_STRIP)" \
@@ -23,12 +24,14 @@ endef
 
 define LIBGLEW_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		GLEW_NO_GLU="-DGLEW_NO_GLU" \
 		GLEW_DEST="$(STAGING_DIR)/usr" LIBDIR="$(STAGING_DIR)/usr/lib" \
 		$(TARGET_CONFIGURE_OPTS) install
 endef
 
 define LIBGLEW_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		GLEW_NO_GLU="-DGLEW_NO_GLU" \
 		GLEW_DEST="$(TARGET_DIR)/usr" LIBDIR="$(TARGET_DIR)/usr/lib" \
 		$(TARGET_CONFIGURE_OPTS) install
 endef
-- 
2.26.2
