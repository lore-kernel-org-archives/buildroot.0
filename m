From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 19:04:01 +0200
Subject: [Buildroot] [git commit] qhull: new package
Message-ID: <20140419170932.B6E039C910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ebff54e510890a35c31cee71fb6a21eb0d92e5b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Davide Viti <d.viti@infosolution.it>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    1 +
 package/qhull/Config.in |   19 +++++++++++++++++++
 package/qhull/qhull.mk  |   14 ++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 748d28e..44c35ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -820,6 +820,7 @@ source "package/p11-kit/Config.in"
 source "package/poco/Config.in"
 source "package/protobuf/Config.in"
 source "package/protobuf-c/Config.in"
+source "package/qhull/Config.in"
 source "package/schifra/Config.in"
 source "package/startup-notification/Config.in"
 source "package/tz/Config.in"
diff --git a/package/qhull/Config.in b/package/qhull/Config.in
new file mode 100644
index 0000000..4f172bd
--- /dev/null
+++ b/package/qhull/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_QHULL
+	bool "qhull"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_PREFER_STATIC_LIB
+	help
+	  Qhull computes the convex hull, Delaunay triangulation,
+	  Voronoi diagram, halfspace intersection about a point,
+	  furthest-site Delaunay triangulation, and furthest-site
+	  Voronoi diagram. The source code runs in 2-d, 3-d, 4-d, and
+	  higher dimensions. Qhull implements the Quickhull algorithm
+	  for computing the convex hull. It handles roundoff errors
+	  from floating point arithmetic. It computes volumes, surface
+	  areas, and approximations to the convex hull.
+
+	  http://www.qhull.org
+
+comment "qhull needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/qhull/qhull.mk b/package/qhull/qhull.mk
new file mode 100644
index 0000000..f2bc771
--- /dev/null
+++ b/package/qhull/qhull.mk
@@ -0,0 +1,14 @@
+###############################################################################
+#
+# qhull
+#
+###############################################################################
+
+QHULL_VERSION = 60d55819729d7b49391dde0271e15a56c70992b9
+QHULL_SITE = git://gitorious.org/qhull/qhull.git
+QHULL_INSTALL_STAGING = YES
+QHULL_LICENSE = BSD-Style
+QHULL_LICENSE_FILES = COPYING.txt
+QHULL_CONF_OPT = -DCMAKE_BUILD_TYPE=Release
+
+$(eval $(cmake-package))
