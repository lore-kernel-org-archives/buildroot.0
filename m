From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 22:41:43 +0200
Subject: [Buildroot] [git commit] setools: update to add sedta and seinfoflow
Message-ID: <20180325204154.1124683B85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05dc106db43478f295c29fd708fbfdf1df8b6a1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to add sedta and seinfoflow to setools

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/setools/Config.in  |  2 ++
 package/setools/setools.mk | 16 ++--------------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/package/setools/Config.in b/package/setools/Config.in
index ae0c45fe3f..0a7899b5eb 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_SETOOLS
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_ENUM34 if !BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_NETWORKX # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS
 	select BR2_PACKAGE_LIBSELINUX
 	help
@@ -16,6 +17,7 @@ config BR2_PACKAGE_SETOOLS
 	   * apol - analyze a SELinux policy. (requires python-qt5)
 	   * sediff - semantic policy difference tool for SELinux.
 	   * sedta - Perform domain transition analyses
+	   * seinfoflow - information flow analysis for SELinux
 	   * sesearch - Search rules (allow, type_transition, etc.)
 
 	  https://github.com/TresysTechnology/setools
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 6748c95c23..1ed7e976d6 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -11,7 +11,7 @@ SETOOLS_INSTALL_STAGING = YES
 SETOOLS_LICENSE = GPL-2.0+, LGPL-2.1+
 SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 SETOOLS_SETUP_TYPE = setuptools
-HOST_SETOOLS_DEPENDENCIES = host-libselinux host-libsepol
+HOST_SETOOLS_DEPENDENCIES = host-libselinux host-libsepol host-python-networkx
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 SETOOLS_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
@@ -36,14 +36,6 @@ define HOST_SETOOLS_FIX_SETUP
 endef
 HOST_SETOOLS_POST_PATCH_HOOKS += HOST_SETOOLS_FIX_SETUP
 
-# sedta and seinfoflow depend on python-networkx. This package is not
-# available in buildroot.
-define SETOOLS_REMOVE_BROKEN_SCRIPTS
-	$(RM) $(TARGET_DIR)/usr/bin/sedta
-	$(RM) $(TARGET_DIR)/usr/bin/seinfoflow
-endef
-SETOOLS_POST_INSTALL_TARGET_HOOKS += SETOOLS_REMOVE_BROKEN_SCRIPTS
-
 # apol requires pyqt5. However, the setools installation
 # process will install apol even if pyqt5 is missing.
 # Remove these scripts from the target it pyqt5 is not selected.
@@ -55,12 +47,8 @@ endef
 SETOOLS_POST_INSTALL_TARGET_HOOKS += SETOOLS_REMOVE_QT_SCRIPTS
 endif
 
-# sedta and seinfoflow depend on python-networkx. This package is not
-# available in buildroot. pyqt5 is not a host-package, remove apol
-# from the host directory as well.
+# pyqt5 is not a host-package, remove apol from the host directory.
 define HOST_SETOOLS_REMOVE_BROKEN_SCRIPTS
-	$(RM) $(HOST_DIR)/bin/sedta
-	$(RM) $(HOST_DIR)/bin/seinfoflow
 	$(RM) $(HOST_DIR)/bin/apol
 endef
 HOST_SETOOLS_POST_INSTALL_HOOKS += HOST_SETOOLS_REMOVE_BROKEN_SCRIPTS
