From: Julien Olivain <juju@cotds.org>
Date: Sun, 14 Jun 2020 19:37:54 +0200
Subject: [Buildroot] [PATCH v2] package/eigen: use cmake-package infra
In-Reply-To: <20200613161643.609929-1-juju@cotds.org>
References: <20200613161643.609929-1-juju@cotds.org>
Message-ID: <20200614173754.702855-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The eigen package was introduced as a generic package, but upstream was
in fact using CMake.

The motivation of this change is to fix package detection with CMake.

Eigen3 library normally installs a signature file named
"signature_of_eigen3_matrix_library" to help library detection:
https://gitlab.com/libeigen/eigen/-/blob/3.3.7/CMakeLists.txt#L423

The library also provide a CMake macro that use this file to
detect it:
https://gitlab.com/libeigen/eigen/-/blob/3.3.7/cmake/FindEigen3.cmake#L76

Without the signature file installed, packages searching for this
library with this method will fail. Other packages usings pkg-config are
not affected by this issue.

By using the cmake-package infrastructure, all the needed files
are now installed, fixing this CMake detection issue.

Other changes in this patch:
- Updated the Eigen git repository to the new url:
  https://gitlab.com/libeigen/eigen
- Removed all build and install staging commands
  (now included in upstream cmake)
- Package needs EIGEN_SUPPORTS_IN_SOURCE_BUILD = NO
- Removed the BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES option,
  as this option is not proposed by the upstream CMake
- Updated hash for source package
- Reformat hash file with two spaces delimiters
- Define EIGEN_CONF_OPTS to set pkg-config .pc install path

Signed-off-by: Julien Olivain <juju@cotds.org>

---
Changes v1 -> v2:
  - use cmake package infra, instead of fixing cmake detection
    issue by duplicating upstream commands, as suggested by Yann.

---
 package/eigen/Config.in  |  8 --------
 package/eigen/eigen.hash | 14 +++++++-------
 package/eigen/eigen.mk   | 37 ++++++++-----------------------------
 3 files changed, 15 insertions(+), 44 deletions(-)

diff --git a/package/eigen/Config.in b/package/eigen/Config.in
index 48752e0c8d..ef0a16f2f7 100644
--- a/package/eigen/Config.in
+++ b/package/eigen/Config.in
@@ -13,13 +13,5 @@ config BR2_PACKAGE_EIGEN
 
 	  http://eigen.tuxfamily.org/
 
-if BR2_PACKAGE_EIGEN
-
-config BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES
-	bool "unsupported modules"
-	help
-	  Install eigen unsupported modules
-endif
-
 comment "eigen needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/eigen/eigen.hash b/package/eigen/eigen.hash
index e5c8404022..5ec561ad10 100644
--- a/package/eigen/eigen.hash
+++ b/package/eigen/eigen.hash
@@ -1,8 +1,8 @@
 # Locally computed
-sha256 9f13cf90dedbe3e52a19f43000d71fdf72e986beb9a5436dddcd61ff9d77a3ce 3.3.7.tar.bz2
-sha256 4f877e5ae4672568ef82cfd0023e2cef4a7cf55d867ab249efc9569a7eb9e5b1 COPYING.BSD
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING.GPL
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LGPL
-sha256 f5b330efdad110cdd84d585ec61220b0650461fa599e36b13e1726c9346dcfb9 COPYING.MINPACK
-sha256 fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85 COPYING.MPL2
-sha256 c83230b770f17ef1386ea1fd3681271dd98aa93646bdbfb5bff3a1b7050fff9d COPYING.README
+sha256  685adf14bd8e9c015b78097c1dc22f2f01343756f196acdc76a678e1ae352e11  eigen-3.3.7.tar.bz2
+sha256  4f877e5ae4672568ef82cfd0023e2cef4a7cf55d867ab249efc9569a7eb9e5b1  COPYING.BSD
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPL
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
+sha256  f5b330efdad110cdd84d585ec61220b0650461fa599e36b13e1726c9346dcfb9  COPYING.MINPACK
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  COPYING.MPL2
+sha256  c83230b770f17ef1386ea1fd3681271dd98aa93646bdbfb5bff3a1b7050fff9d  COPYING.README
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 5c9e028442..993b85e351 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -5,38 +5,17 @@
 ################################################################################
 
 EIGEN_VERSION = 3.3.7
-EIGEN_SOURCE = $(EIGEN_VERSION).tar.bz2
-EIGEN_SITE = https://bitbucket.org/eigen/eigen/get
+EIGEN_SOURCE = eigen-$(EIGEN_VERSION).tar.bz2
+EIGEN_SITE = https://gitlab.com/libeigen/eigen/-/archive/$(EIGEN_VERSION)
 EIGEN_LICENSE = MPL2, BSD-3-Clause, LGPL-2.1
 EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
 EIGEN_INSTALL_STAGING = YES
 EIGEN_INSTALL_TARGET = NO
-EIGEN_DEST_DIR = $(STAGING_DIR)/usr/include/eigen3
+EIGEN_SUPPORTS_IN_SOURCE_BUILD = NO
 
-ifeq ($(BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES),y)
-define EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS
-	mkdir -p $(EIGEN_DEST_DIR)/unsupported
-	cp -a $(@D)/unsupported/Eigen $(EIGEN_DEST_DIR)/unsupported
-endef
-endif
+# Default Eigen CMake installs .pc file in
+# $(STAGING)/usr/share/pkgconfig
+# change it to lib/pkgconfig, to be consistent with other packages.
+EIGEN_CONF_OPTS = -DPKGCONFIG_INSTALL_DIR:PATH=lib/pkgconfig
 
-# Generate the .pc file at build time
-define EIGEN_BUILD_CMDS
-	sed -r -e 's,^Version: .*,Version: $(EIGEN_VERSION),' \
-		-e 's,^Cflags: .*,Cflags: -I$$\{prefix\}/include/eigen3,' \
-		-e 's,^prefix.*,prefix=/usr,' \
-		$(@D)/eigen3.pc.in >$(@D)/eigen3.pc
-endef
-
-# This package only consists of headers that need to be
-# copied over to the sysroot for compile time use
-define EIGEN_INSTALL_STAGING_CMDS
-	$(RM) -r $(EIGEN_DEST_DIR)
-	mkdir -p $(EIGEN_DEST_DIR)
-	cp -a $(@D)/Eigen $(EIGEN_DEST_DIR)
-	$(EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS)
-	$(INSTALL) -D -m 0644 $(@D)/eigen3.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/eigen3.pc
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
2.26.2
