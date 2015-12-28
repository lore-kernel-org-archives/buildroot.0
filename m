From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 22:59:34 +0100
Subject: [Buildroot] [git commit] assimp: new package
Message-ID: <20151228215948.5E8DB81E7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30249f33986b31ae96ebed7596476f05372b029f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
Changes v1 -> v2:
  - use github helper (thanks to J??rg Krause)

Changes v2 -> v3:
  - add c++ dependency (suggested by Thomas Petazzoni)
  - fix linking problem with builtin zlib (linking code
    with/without '-fpic' compiled, see e.g. [2]), workaround by selecting
    buildroot zlib package (failure detected by Thomas Petazzoni [2])

[1] https://cmake.org/pipermail/cmake/2006-March/008482.html
[2] http://lists.busybox.net/pipermail/buildroot/2015-December/146859.html
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |  1 +
 package/assimp/Config.in | 14 ++++++++++++++
 package/assimp/assimp.mk | 16 ++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ffd3207..a024d3d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -829,6 +829,7 @@ menu "Filesystem"
 endmenu
 
 menu "Graphics"
+	source "package/assimp/Config.in"
 	source "package/atk/Config.in"
 	source "package/atkmm/Config.in"
 	source "package/bullet/Config.in"
diff --git a/package/assimp/Config.in b/package/assimp/Config.in
new file mode 100644
index 0000000..35e2f23
--- /dev/null
+++ b/package/assimp/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_ASSIMP
+	bool "assimp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_ZLIB
+	help
+	  Open Asset Import Library (assimp) is a portable Open Source
+	  library to import various well-known 3D model formats in a uniform
+	  manner. The most recent version also knows how to export 3d files
+	  and is therefore suitable as a general-purpose 3D model converter.
+
+	  http://www.assimp.org
+
+comment "assimp needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
new file mode 100644
index 0000000..fd556e5
--- /dev/null
+++ b/package/assimp/assimp.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# assimp
+#
+################################################################################
+
+ASSIMP_VERSION = v3.2
+ASSIMP_SITE = $(call github,assimp,assimp,$(ASSIMP_VERSION))
+ASSIMP_LICENSE = BSD-3c
+ASSIMP_LICENSE_FILES = LICENSE
+ASSIMP_DEPENDENCIES = zlib
+ASSIMP_INSTALL_STAGING = YES
+
+ASSIMP_CONF_OPTS += -DASSIMP_BUILD_TESTS=OFF
+
+$(eval $(cmake-package))
