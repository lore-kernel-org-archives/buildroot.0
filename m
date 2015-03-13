From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 13 Mar 2015 09:24:08 +0100
Subject: [Buildroot] [PATCH v7 1/3] pkg-cmake: allow to build package in a
	subdirectory
Message-ID: <1426235050-3482-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

For some cmake based packages, like GNURadio, it's forbidden to do the
compilation directly in the sources directory. This patch add a new 
variable to specify, if needed, the name of a sub-directory used to compile.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v6 -> v7:
 * move and reformulate LIBFOO_SUPPORTS_IN_SOURCE_BUILD description.
 * adds default value to YES and test if _SUPPORT_IN_SOURCE_BUILD is equal to 
   YES instead of NO
Changes v5 -> v6:
 * s/, no/,NO/
 * s/$$($(2)_SUPPORTS_IN_SOURCE_BUILD)/$$($(3)_SUPPORTS_IN_SOURCE_BUILD)/
Changes v4 -> v5:
 * Instead of overloading BUILDDIR uses a variable to set if package is compiled
   in-source-tree or not
 * update again manual
Changes v2 -> v3:
 * Update docs to add detail about LIBFOO_BUILDDIR
Changes v1 -> v2:
 * Allow to overload $(2)_BUILDDIR instead of adding a new variable and test
---
 docs/manual/adding-packages-cmake.txt |  4 ++++
 package/pkg-cmake.mk                  | 14 ++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index d92b209..87c51a8 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -100,6 +100,10 @@ typical packages will therefore only use a few of them.
   necessary to set them in the package's +*.mk+ file unless you want
   to override them:
 
+* +LIBFOO_SUPPORTS_IN_SOURCE_BUILD = NO+ should be set when the package
+  cannot be built inside the source tree but needs a separate build
+  directory.
+
 ** +CMAKE_BUILD_TYPE+ is driven by +BR2_ENABLE_DEBUG+;
 ** +CMAKE_INSTALL_PREFIX+;
 ** +BUILD_SHARED_LIBS+ is driven by +BR2_STATIC_LIBS+;
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 2404c40..2262012 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -61,7 +61,15 @@ $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install
 
 $(2)_SRCDIR			= $$($(2)_DIR)/$$($(2)_SUBDIR)
+
+$(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
+
+
+ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
 $(2)_BUILDDIR			= $$($(2)_SRCDIR)
+else
+$(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
+endif
 
 #
 # Configure step. Only define it if not already defined by the package
@@ -73,7 +81,8 @@ ifeq ($(4),target)
 
 # Configure package for target
 define $(2)_CONFIGURE_CMDS
-	(cd $$($$(PKG)_BUILDDIR) && \
+	(mkdir -p $$($$(PKG)_BUILDDIR) && \
+	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
@@ -98,7 +107,8 @@ else
 
 # Configure package for host
 define $(2)_CONFIGURE_CMDS
-	(cd $$($$(PKG)_BUILDDIR) && \
+	(mkdir -p $$($$(PKG)_BUILDDIR) && \
+	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
 	$$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
-- 
2.0.5
