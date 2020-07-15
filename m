From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 23:31:27 +0200
Subject: [Buildroot] [git commit] package/python-networkx: needs python3
Message-ID: <20200715212746.875648716B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09b94b1e8f94d1f49f7a2349b4c8cbfecefa73da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python3 is mandatory since version 2.3 and
https://github.com/networkx/networkx/commit/8f4845e94709dd62a4ebf3775fe02ca777ec49f2

Fixes:
 - http://autobuild.buildroot.org/results/c34d9c92cadbfb0e333eba91c9fae3baac53d0a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-networkx/Config.in |  1 +
 package/setools/Config.in         |  7 +++++--
 package/setools/setools.mk        | 10 +---------
 3 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/package/python-networkx/Config.in b/package/python-networkx/Config.in
index 0f3e86f497..2ae3841dfa 100644
--- a/package/python-networkx/Config.in
+++ b/package/python-networkx/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_NETWORKX
 	bool "python-networkx"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
 	help
 	  A Python package for the creation, manipulation,
diff --git a/package/setools/Config.in b/package/setools/Config.in
index 56a85b01c8..9475bbef65 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -4,8 +4,7 @@ config BR2_PACKAGE_SETOOLS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU
-	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_ENUM34 if !BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_NETWORKX # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS
 	select BR2_PACKAGE_LIBSELINUX
@@ -24,3 +23,7 @@ comment "setools needs a toolchain w/ threads, C++, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+
+comment "setools needs python3"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_PYTHON3
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index fc49fc218e..24da3613c4 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -13,14 +13,6 @@ SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 SETOOLS_SETUP_TYPE = setuptools
 HOST_SETOOLS_DEPENDENCIES = host-python-cython host-libselinux host-libsepol host-python-networkx
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-SETOOLS_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
-else
-SETOOLS_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
-SETOOLS_DEPENDENCIES += python-enum34
-HOST_SETOOLS_DEPENDENCIES += host-python-enum34
-endif
-
 define SETOOLS_FIX_SETUP
 	# By default, setup.py will look for libsepol.a in the host machines
 	# /usr/lib directory. This needs to be changed to the staging directory.
@@ -43,7 +35,7 @@ HOST_SETOOLS_POST_PATCH_HOOKS += HOST_SETOOLS_FIX_SETUP
 ifeq ($(BR2_PACKAGE_PYTHON_PYQT5),)
 define SETOOLS_REMOVE_QT_SCRIPTS
 	$(RM) $(TARGET_DIR)/usr/bin/apol
-	$(RM) -r $(TARGET_DIR)/lib/$(SETOOLS_PYLIBVER)/site-packages/setoolsgui/
+	$(RM) -r $(TARGET_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/setoolsgui/
 endef
 SETOOLS_POST_INSTALL_TARGET_HOOKS += SETOOLS_REMOVE_QT_SCRIPTS
 endif
