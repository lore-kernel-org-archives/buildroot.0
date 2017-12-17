From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Dec 2017 10:16:53 +0100
Subject: [Buildroot] [git commit] proj: new package
Message-ID: <20171217091827.F219281114@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb8ff6ffc9ab0eb10bd58533bfb37a778c58905b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
[Thomas:
 - switch to the autotools build system, which supports static linking
   properly
 - add <pkg>_LICENSE_FILES
 - add sha256 hash for the tarball, in addition to the md5 one
 - add license file hash
 - squash DEVELOPERS file addition]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/proj/Config.in | 14 ++++++++++++++
 package/proj/proj.hash |  5 +++++
 package/proj/proj.mk   | 14 ++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 63674d7..f820b97 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1889,6 +1889,7 @@ F:	utils/scanpypi
 N:	Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
 F:	package/crudini/
 F:	package/grantlee/
+F:	package/proj/
 F:	package/python-configobj/
 F:	package/python-iniparse/
 F:	package/qjson/
diff --git a/package/Config.in b/package/Config.in
index e7435eb..1423147 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1594,6 +1594,7 @@ menu "Miscellaneous"
 	source "package/linux-syscall-support/Config.in"
 	source "package/mcrypt/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
+	source "package/proj/Config.in"
 	source "package/qemu/Config.in"
 	source "package/qpdf/Config.in"
 	source "package/shared-mime-info/Config.in"
diff --git a/package/proj/Config.in b/package/proj/Config.in
new file mode 100644
index 0000000..788aee8
--- /dev/null
+++ b/package/proj/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PROJ
+	bool "proj"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  proj.4 is a standard UNIX filter function which converts
+	  geographic longitude and latitude coordinates into cartesian
+	  coordinates (and vice versa), and it is a C API for software
+	  developers to include coordinate transformation in their own
+	  software.
+
+	  http://proj4.org/
+
+comment "proj needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/proj/proj.hash b/package/proj/proj.hash
new file mode 100644
index 0000000..6a791ba
--- /dev/null
+++ b/package/proj/proj.hash
@@ -0,0 +1,5 @@
+# Fetched from http://download.osgeo.org/proj/proj-4.9.3.tar.gz.md5
+md5 d598336ca834742735137c5674b214a1 proj-4.9.3.tar.gz
+# Locally calculated
+sha256 6984542fea333488de5c82eea58d699e4aff4b359200a9971537cd7e047185f7 proj-4.9.3.tar.gz
+sha256 2dcac4af6990093ef48b896bfb81452d46a31b08d46cce34b27e83f93b2e37f6 COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
new file mode 100644
index 0000000..5607dc0
--- /dev/null
+++ b/package/proj/proj.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# proj
+#
+################################################################################
+
+PROJ_VERSION = 4.9.3
+PROJ_SOURCE = proj-$(PROJ_VERSION).tar.gz
+PROJ_SITE = http://download.osgeo.org/proj
+PROJ_LICENSE = MIT
+PROJ_LICENSE_FILES = COPYING
+PROJ_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
