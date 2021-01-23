From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2021 22:32:49 +0100
Subject: [Buildroot] [git commit] package/libgeos: new package
Message-ID: <20210123211541.0E5A5814FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92c9f6408dc9873b229fadaec8c144650dc1258a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GEOS (Geometry Engine - Open Source) is a C++ port of the JTS Topology
Suite (JTS). It aims to contain the complete functionality of JTS in
C++. This includes all the OpenGIS Simple Features for SQL spatial
predicate functions and spatial operators, as well as specific JTS
enhanced functions.

https://trac.osgeo.org/geos

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
[yann.morin.1998 at free.fr:
  - wrap long lines in Config.in
  - wrap long lines in commit log
  - drop "invsible characters" <200b>
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in            |  1 +
 package/libgeos/Config.in    | 14 ++++++++++++++
 package/libgeos/libgeos.hash |  3 +++
 package/libgeos/libgeos.mk   | 15 +++++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 4ddde0d985..fb1312b21f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1902,6 +1902,7 @@ menu "Other"
 	source "package/libevent/Config.in"
 	source "package/libffi/Config.in"
 	source "package/libgee/Config.in"
+	source "package/libgeos/Config.in"
 	source "package/libglib2/Config.in"
 	source "package/libglob/Config.in"
 	source "package/libical/Config.in"
diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
new file mode 100644
index 0000000000..224c30c2ad
--- /dev/null
+++ b/package/libgeos/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBGEOS
+	bool "libgeos"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  GEOS (Geometry Engine - Open Source) is a C++ port of the
+	  JTS Topology Suite (JTS). It aims to contain the complete
+	  functionality of JTS in C++. This includes all the OpenGIS
+	  Simple Features for SQL spatial predicate functions and
+	  spatial operators, as well as specific JTS enhanced functions.
+
+	  https://trac.osgeo.org/geos
+
+comment "libgeos needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
new file mode 100644
index 0000000000..5b5e44c7c5
--- /dev/null
+++ b/package/libgeos/libgeos.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  bd8082cf12f45f27630193c78bdb5a3cba847b81e72b20268356c2a4fc065269  geos-3.9.0.tar.bz2
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
new file mode 100644
index 0000000000..7b4ace122d
--- /dev/null
+++ b/package/libgeos/libgeos.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libgeos
+#
+################################################################################
+
+LIBGEOS_VERSION = 3.9.0
+LIBGEOS_SITE = http://download.osgeo.org/geos
+LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
+LIBGEOS_LICENSE = LGPL-2.1
+LIBGEOS_LICENSE_FILES = COPYING
+LIBGEOS_INSTALL_STAGING = YES
+LIBGEOS_CONFIG_SCRIPTS = geos-config
+
+$(eval $(cmake-package))
