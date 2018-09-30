From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 20:04:23 +0200
Subject: [Buildroot] [git commit] package/expedite: remove package
Message-ID: <20180930181808.A7EE38A47C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=addcc3932cf5a5ea64e7bb1d65d0ecedf363d0f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As noticed with the last version bump [1], expedite
is not actively maintained by upstream [2].

[1] http://lists.busybox.net/pipermail/buildroot/2018-September/231763.html
[2] https://sourceforge.net/p/enlightenment/mailman/message/36428571

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy               |  7 +++++++
 DEVELOPERS                     |  1 -
 package/Config.in              |  1 -
 package/expedite/Config.in     | 12 ------------
 package/expedite/expedite.hash |  3 ---
 package/expedite/expedite.mk   | 24 ------------------------
 6 files changed, 7 insertions(+), 41 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3b84e3da91..e1a0276b7d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.11"
 
+config BR2_PACKAGE_EXPEDITE
+	bool "expedite package has been removed"
+	select BR2_LEGACY
+	help
+	  expedite is not actively maintained anymore.
+	  https://sourceforge.net/p/enlightenment/mailman/message/36428571
+
 config BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT
 	bool "mesa3d opengl texture float option removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index c036fa30c4..d11713de57 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1771,7 +1771,6 @@ F:	package/aubio/
 F:	package/bullet/
 F:	package/efl/
 F:	package/enlightenment/
-F:	package/expedite/
 F:	package/flare-engine/
 F:	package/flare-game/
 F:	package/irrlicht/
diff --git a/package/Config.in b/package/Config.in
index 8fd60cdec2..125e8ca7dc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -260,7 +260,6 @@ endmenu
 menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
-	source "package/expedite/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
 	source "package/glmark2/Config.in"
diff --git a/package/expedite/Config.in b/package/expedite/Config.in
deleted file mode 100644
index fdfc671907..0000000000
--- a/package/expedite/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_EXPEDITE
-	bool "expedite"
-	depends on BR2_PACKAGE_EFL
-	depends on BR2_INSTALL_LIBSTDCPP
-	help
-	  Expedite is the official Evas benchmark tool. It can test
-	  different engines, such as X11, XRender, OpenGL (also ES
-	  variant), SDL, DirectFB and so on. Its tests are quite
-	  extensive, trying to reproduce real world usage cases.
-
-comment "expedite needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/expedite/expedite.hash b/package/expedite/expedite.hash
deleted file mode 100644
index d813cb38c3..0000000000
--- a/package/expedite/expedite.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256 5f621a3cb70fae943893e256722cc7f7b0c4357035da7cc3cbbbb83e4ec1eb9a expedite-6a69955e71a00a720e1b0a9bc7b64dd3dd5673db.tar.gz
-sha256 0f024d9d9ddd18f94a4800d72e72d2ca198e9479c02b21afb9cacc2923ef2f2b COPYING
diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
deleted file mode 100644
index fbcc4b5675..0000000000
--- a/package/expedite/expedite.mk
+++ /dev/null
@@ -1,24 +0,0 @@
-################################################################################
-#
-# expedite
-#
-################################################################################
-
-EXPEDITE_VERSION = 6a69955e71a00a720e1b0a9bc7b64dd3dd5673db
-EXPEDITE_SITE = http://git.enlightenment.org/tools/expedite.git
-EXPEDITE_SITE_METHOD = git
-EXPEDITE_LICENSE = BSD-2-Clause
-EXPEDITE_LICENSE_FILES = COPYING
-
-EXPEDITE_DEPENDENCIES = host-efl host-pkgconf efl
-
-# There is no configure script in the git tree.
-EXPEDITE_AUTORECONF = YES
-
-ifeq ($(BR2_PACKAGE_EFL_X_XLIB),y)
-EXPEDITE_CONF_OPTS += --with-x=$(STAGING_DIR) \
-	--x-includes=$(STAGING_DIR)/usr/include \
-	--x-libraries=$(STAGING_DIR)/usr/lib
-endif
-
-$(eval $(autotools-package))
