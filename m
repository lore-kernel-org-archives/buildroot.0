From: =?UTF-8?q?C=C3=A9dric=20Marie?= <cedric.marie@openmailbox.org>
Date: Fri,  6 Jan 2017 23:37:48 +0100
Subject: [Buildroot] [PATCH 2/2] Update documentation of CMake infrastructure
In-Reply-To: <20170106223748.2203-1-cedric.marie@openmailbox.org>
References: <20170106223748.2203-1-cedric.marie@openmailbox.org>
Message-ID: <20170106223748.2203-2-cedric.marie@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Describe BR2_CMAKE_USE_NINJA_BACKEND option, and update all the
variables that have changed with this evolution.

Replace LIBFOO_INSTALL_STAGING_OPTS and LIBFOO_INSTALL_TARGET_OPTS with
LIBFOO_INSTALL_STAGING_ENV, LIBFOO_INSTALL_TARGET_ENV and
LIBFOO_INSTALL_OPTS.

Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>
---
 docs/manual/adding-packages-cmake.txt | 37 +++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index 6ccf390..06331dd 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -117,25 +117,38 @@ typical packages will therefore only use a few of them.
   the given package, for one reason or another. By default, set to
   +$(MAKE)+. If parallel building is not supported by the package,
   then it should be set to +LIBFOO_MAKE=$(MAKE1)+.
+  When +BR2_CMAKE_USE_NINJA_BACKEND+ is enabled, the default value is
+  +$(HOST_DIR)/usr/bin/ninja+. If parallel building is not supported by
+  the package, then it should be set to
+  +LIBFOO_MAKE=$(HOST_DIR)/usr/bin/ninja -j1+.
 
 * +LIBFOO_MAKE_ENV+, to specify additional environment variables to
   pass to make in the build step. These are passed before the +make+
   command. By default, empty.
 
 * +LIBFOO_MAKE_OPTS+, to specify additional variables to pass to make
-  in the build step. These are passed after the +make+ command. By
-  default, empty.
-
-* +LIBFOO_INSTALL_STAGING_OPTS+ contains the make options used to
-  install the package to the staging directory. By default, the value
-  is +DESTDIR=$(STAGING_DIR) install+, which is correct for most
-  CMake packages. It is still possible to override it.
-
-* +LIBFOO_INSTALL_TARGET_OPTS+ contains the make options used to
+  in the build step. These are passed after the +make+ or +ninja+
+  command. If +BR2_CMAKE_USE_NINJA_BACKEND+ is enabled and +VERBOSE+ is
+  set, the default value is -v. Otherwise it is empty. With Ninja
+  backend, the verbose mode is not set in the configure step. Instead,
+  ninja -v option must be used in the following steps.
+
+* +LIBFOO_INSTALL_STAGING_ENV+ contains environment variables to pass
+  to make or ninja, to install the package to the staging directory. By
+  default, the value is +DESTDIR=$(STAGING_DIR)+, which is correct for
+  most CMake packages. It is still possible to override it.
+
+* +LIBFOO_INSTALL_TARGET_ENV+ contains environment variables to pass
+  to make or ninja, to install the package to the target directory. By
+  default, the value is +DESTDIR=$(TARGET_DIR)+. The default value is
+  correct for most CMake packages, but it is still possible to override
+  it if needed.
+
+* +LIBFOO_INSTALL_OPTS+ contains the make or ninja options used to
   install the package to the target directory. By default, the value
-  is +DESTDIR=$(TARGET_DIR) install+. The default value is correct
-  for most CMake packages, but it is still possible to override it if
-  needed.
+  is +install/fast+ for make and +install+ for ninja. The default value
+  is correct for most CMake packages, but it is still possible to
+  override it if needed.
 
 With the CMake infrastructure, all the steps required to build and
 install the packages are already defined, and they generally work well
-- 
2.9.3
