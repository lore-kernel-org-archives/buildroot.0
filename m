From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 18:29:04 +0200
Subject: [Buildroot] [git commit] chipmunk: new package
Message-ID: <20180428163449.D60788900F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c599c07398a92f17a1ac756a80b1133c33a806c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: use BUILD_SHARED, BUILD_STATIC and INSTALL_STATIC options.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/chipmunk/Config.in     | 12 ++++++++++++
 package/chipmunk/chipmunk.hash |  5 +++++
 package/chipmunk/chipmunk.mk   | 28 ++++++++++++++++++++++++++++
 5 files changed, 47 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b281245df2..3a4ad60044 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -706,6 +706,7 @@ F:	board/olimex/a20_olinuxino
 F:	configs/olimex_a20_olinuxino_*
 F:	package/4th/
 F:	package/botan/
+F:	pacakge/chipmunk/
 F:	package/dado/
 F:	package/ficl/
 F:	package/gdbm/
diff --git a/package/Config.in b/package/Config.in
index 19aa012933..d5ba5cd36c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1126,6 +1126,7 @@ menu "Graphics"
 	source "package/bullet/Config.in"
 	source "package/cairo/Config.in"
 	source "package/cairomm/Config.in"
+	source "package/chipmunk/Config.in"
 	source "package/exiv2/Config.in"
 	source "package/fltk/Config.in"
 	source "package/fontconfig/Config.in"
diff --git a/package/chipmunk/Config.in b/package/chipmunk/Config.in
new file mode 100644
index 0000000000..7275d684a6
--- /dev/null
+++ b/package/chipmunk/Config.in
@@ -0,0 +1,12 @@
+
+comment "chipmunk needs an OpenGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL
+
+config BR2_PACKAGE_CHIPMUNK
+	bool "chipmunk"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	help
+	  Chipmunk2D is a simple, lightweight, fast and portable 2D
+	  rigid body physics library written in C.
+
+	  http://chipmunk-physics.net/
diff --git a/package/chipmunk/chipmunk.hash b/package/chipmunk/chipmunk.hash
new file mode 100644
index 0000000000..7bd9b15692
--- /dev/null
+++ b/package/chipmunk/chipmunk.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256	6b6d8d5d910c4442fb9c8c4c46a178126d8c21d075cdb3ce439a7f8d8757b0ca  Chipmunk-7.0.2.tar.gz
+
+# Hash for license file:
+sha256	109cedb0301cba4e05fa99241f162bdad015c9541ae84b420b0148ac1ea588e2  LICENSE.txt
diff --git a/package/chipmunk/chipmunk.mk b/package/chipmunk/chipmunk.mk
new file mode 100644
index 0000000000..a84af22823
--- /dev/null
+++ b/package/chipmunk/chipmunk.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# chipmunk
+#
+################################################################################
+
+CHIPMUNK_VERSION = 7.0.2
+CHIPMUNK_SITE = https://github.com/slembcke/Chipmunk2D/archive
+CHIPMUNK_SOURCE = Chipmunk-$(CHIPMUNK_VERSION).tar.gz
+CHIPMUNK_INSTALL_STAGING = YES
+CHIPMUNK_LICENSE = MIT
+CHIPMUNK_LICENSE_FILES = LICENSE.txt
+CHIPMUNK_DEPENDENCIES = libgl
+CHIPMUNK_CONF_OPTS = -DBUILD_DEMOS=OFF
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+CHIPMUNK_CONF_OPTS += -DBUILD_STATIC=ON -DINSTALL_STATIC=ON
+else
+CHIPMUNK_CONF_OPTS += -DBUILD_STATIC=OFF -DINSTALL_STATIC=OFF
+endif
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+CHIPMUNK_CONF_OPTS += -DBUILD_SHARED=ON
+else
+CHIPMUNK_CONF_OPTS += -DBUILD_SHARED=OFF
+endif
+
+$(eval $(cmake-package))
