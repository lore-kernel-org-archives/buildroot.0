From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 11:09:41 +0200
Subject: [Buildroot] [git commit] package/bullet: new package
Message-ID: <20150425091024.C0A01805E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=176e408b36555ad56dc65c007e1fbba5dcc9ea36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - move package to 'Libraries -> Graphics'
  - wrap the Config.in help text
  - change license from "Zlib" to "zlib license" to match what the
    zlib package is doing.]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/bullet/Config.in |   11 +++++++++++
 package/bullet/bullet.mk |   18 ++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index afa145e..7e25109 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -750,6 +750,7 @@ endmenu
 
 menu "Graphics"
 	source "package/atk/Config.in"
+	source "package/bullet/Config.in"
 	source "package/cairo/Config.in"
 	source "package/exiv2/Config.in"
 	source "package/fltk/Config.in"
diff --git a/package/bullet/Config.in b/package/bullet/Config.in
new file mode 100644
index 0000000..fc285ab
--- /dev/null
+++ b/package/bullet/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_BULLET
+	bool "bullet"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Bullet is a Collision Detection and Rigid Body Dynamics
+	  Library.
+
+	  http://bulletphysics.org
+
+comment "bullet needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
new file mode 100644
index 0000000..3ec97b4
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
+BULLET_LICENSE = zlib license
+BULLET_LICENSE_FILES = BulletLicense.txt COPYING
+
+# Disable GLUT support since there is no freeglut or OpenGLUT package and we
+# don't build the demos apps.
+BULLET_CONF_OPTS = -DUSE_GLUT=OFF -DBUILD_DEMOS=OFF
+
+$(eval $(cmake-package))
