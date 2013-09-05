From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Thu, 5 Sep 2013 08:53:27 -0500
Subject: [Buildroot] [PATCH v2] eigen: new package
Message-ID: <1378389207-31680-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
Changes v1 -> v2:
  * Fixed order of where new pkg was added in package/Config.in (suggested by Arnout)
  * Cleaned up pkg description in package/eigen/Config.in (suggested by Arnout)
  * Fixed SITE/SOURCE issue.  Ended up switching to a mercurial repo tag instead of
    source pkg.  This was because of the download site renaming the archive
    to have a different name then what was provided for a download URL.
    (version vs hashtag used in archive naming) (suggested by Arnout)
  * Cleaned up license list and added all the license files (suggested by Arnout)
  * Removed uninstall and added cleanup cmds before the cp in the install staging (suggested by Arnout)

 package/Config.in       |    1 +
 package/eigen/Config.in |   14 ++++++++++++++
 package/eigen/eigen.mk  |   22 ++++++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 package/eigen/Config.in
 create mode 100644 package/eigen/eigen.mk

diff --git a/package/Config.in b/package/Config.in
index a94cb62..52513a9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -616,6 +616,7 @@ source "package/apr-util/Config.in"
 source "package/libcofi/Config.in"
 source "package/classpath/Config.in"
 source "package/cppcms/Config.in"
+source "package/eigen/Config.in"
 source "package/elfutils/Config.in"
 source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
diff --git a/package/eigen/Config.in b/package/eigen/Config.in
new file mode 100644
index 0000000..bfb1ab7
--- /dev/null
+++ b/package/eigen/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_EIGEN
+	bool "eigen"
+	help
+	  Eigen is a C++ template library for linear algebra: vectors, 
+	  matrices, and related algorithms. It is versatile, fast, elegant 
+	  and works on many platforms (OS/Compilers).
+
+	  This package only installs header files to the include path. 
+	  If you just want to use Eigen, you can use the header files 
+	  right away. There is no binary to link to. Eigen is a pure 
+	  template library defined in the headers.
+
+	  http://eigen.tuxfamily.org/
+
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
new file mode 100644
index 0000000..1a88d90
--- /dev/null
+++ b/package/eigen/eigen.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# Eigen - a C++ template library for linear algebra
+#
+#############################################################
+# version 3.2
+EIGEN_VERSION = ffa86ffb5570
+EIGEN_SITE    = https://bitbucket.org/eigen/eigen/
+EIGEN_SITE_METHOD = hg
+EIGEN_LICENSE = MPL2, BSD-3c, LGPLv2.1
+EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
+EIGEN_INSTALL_STAGING = YES
+EIGEN_INSTALL_TARGET = NO
+
+# This package only consists of headers that need to be
+# copied over to the sysroot for compile time use
+define EIGEN_INSTALL_STAGING_CMDS
+	$(RM) -r $(STAGING_DIR)/usr/include/Eigen
+	cp -a $(@D)/Eigen $(STAGING_DIR)/usr/include/
+endef
+
+$(eval $(generic-package))
-- 
1.7.1
