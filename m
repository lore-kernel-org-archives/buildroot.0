From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 8 Sep 2013 22:30:12 +0200
Subject: [Buildroot] [git commit] eigen: new package
Message-ID: <20130908204534.61A779B6AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc51df61258f55763b81d2fec82d73d15708322f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: minor white space tweaks]
Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/eigen/Config.in |   13 +++++++++++++
 package/eigen/eigen.mk  |   23 +++++++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c3b345d..2351839 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -640,6 +640,7 @@ source "package/apr-util/Config.in"
 source "package/libcofi/Config.in"
 source "package/classpath/Config.in"
 source "package/cppcms/Config.in"
+source "package/eigen/Config.in"
 source "package/elfutils/Config.in"
 source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
diff --git a/package/eigen/Config.in b/package/eigen/Config.in
new file mode 100644
index 0000000..c7fcde2
--- /dev/null
+++ b/package/eigen/Config.in
@@ -0,0 +1,13 @@
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
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
new file mode 100644
index 0000000..5abd464
--- /dev/null
+++ b/package/eigen/eigen.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# eigen
+#
+################################################################################
+
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
