From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 24 Apr 2015 21:46:11 +0200
Subject: [Buildroot] [PATCH 1/3] package/bullet: new package
In-Reply-To: <1429904773-460-1-git-send-email-romain.naour@openwide.fr>
References: <1429904773-460-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1429904773-460-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/Config.in        |  1 +
 package/bullet/Config.in | 10 ++++++++++
 package/bullet/bullet.mk | 18 ++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/bullet/Config.in
 create mode 100644 package/bullet/bullet.mk

diff --git a/package/Config.in b/package/Config.in
index afa145e..fcd9b8f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -222,6 +222,7 @@ comment "Graphic applications"
 	source "package/rrdtool/Config.in"
 
 comment "Graphic libraries"
+	source "package/bullet/Config.in"
 	source "package/cegui06/Config.in"
 	source "package/directfb/Config.in"
 	source "package/directfb-examples/Config.in"
diff --git a/package/bullet/Config.in b/package/bullet/Config.in
new file mode 100644
index 0000000..8e57bbf
--- /dev/null
+++ b/package/bullet/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_BULLET
+	bool "bullet"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Bullet is a Collision Detection and Rigid Body Dynamics Library.
+
+	  http://bulletphysics.org
+
+comment "bullet needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
new file mode 100644
index 0000000..8cb273e
--- /dev/null
+++ b/package/bullet/bullet.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# bullet
+#
+################################################################################
+
+# This is the git id of the 2.82 release.
+BULLET_VERSION = 19f999ac087e68ffc2551ffb73e35e60271a0d27
+BULLET_SITE = $(call github,bulletphysics,bullet3,$(BULLET_VERSION))
+BULLET_INSTALL_STAGING = YES
+BULLET_LICENSE = Zlib
+BULLET_LICENSE_FILES = BulletLicense.txt COPYING
+
+# Disable GLUT support since there is no freeglut or OpenGLUT package and we
+# don't build the demos apps.
+BULLET_CONF_OPTS = -DUSE_GLUT=OFF -DBUILD_DEMOS=OFF
+
+$(eval $(cmake-package))
-- 
1.9.3
