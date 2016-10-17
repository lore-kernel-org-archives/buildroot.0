From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 17 Oct 2016 22:44:48 +0200
Subject: [Buildroot] [PATCH v1] motion: fix sdl-config detection
Message-ID: <1476737088-1492-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Overwrite ac_cv_path_CONFIG_SDL in case sdl development is
installed on the host.

Fixes [1]:

  ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/SDL'

[1] http://autobuild.buildroot.net/results/459/4592eb83efa393f77f5ee014f93a271f2313bee6

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/motion/motion.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index de29a2a..cf9be76 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -54,6 +54,9 @@ endif
 ifeq ($(BR2_PACKAGE_SDL),y)
 MOTION_DEPENDENCIES += sdl
 MOTION_CONF_OPTS += --with-sdl=$(STAGING_DIR)/usr
+# overwrite ac_cv_path_CONFIG_SDL in case sdl development is
+# installed on the host
+MOTION_CONF_ENV += ac_cv_path_CONFIG_SDL=$(STAGING_DIR)/usr/bin/sdl-config
 else
 MOTION_CONF_OPTS += --without-sdl
 endif
-- 
2.8.1
