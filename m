From: Davide Viti <zinosat@tiscali.it>
Date: Fri, 18 Apr 2014 23:36:03 +0200
Subject: [Buildroot] [v2] qhull: new package
Message-ID: <1397856963-30409-1-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Davide Viti <d.viti@infosolution.it>

Signed-off-by: Davide Viti <d.viti@infosolution.it>
---
Changes v1 -> v2:
  - add dependency on BR2_INSTALL_LIBSTDCPP  (Thomas Petazzoni)
  - no need to specify "QHULL_SITE_METHOD = git"
  - add "depends on !BR2_bfin" (see [1]) 

As suggested, I've tried to switch from git to http(s) with no success:
gitorious provides tarballs but wget needs to be invoked with
"--no-check-certificate". I've checked the "packages" folder and all
the packages hosted on gitorious use a git site

I successfully tried to build for qemu x86,x86_64 and arm-vexpress
using the available config files

I rebuilt the packages also with the suggested minimal config files on
a debian testing machine, inside a pbuilder-based chroot:

 * br-arm-basic.config: compilation, as expected, fails because of
   missing C++ support ("C++ support is selected but is not available
   in external toolchain")
 * br-arm-full-nothread.config: success

[1] bfin-uclinux.config: errors while linking (see
http://pastebin.com/ygCd05ad). Not sure worth fixing, thus marking the
package depending on "!BR2_bfin"

regards,
Davide

 package/Config.in       |  1 +
 package/qhull/Config.in | 18 ++++++++++++++++++
 package/qhull/qhull.mk  | 14 ++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/qhull/Config.in
 create mode 100644 package/qhull/qhull.mk

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
index 0000000..f49c96d
--- /dev/null
+++ b/package/qhull/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_QHULL
+	bool "qhull"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_bfin
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
+comment "qhull needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
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
-- 
1.9.1
