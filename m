From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 22:34:43 +0100
Subject: [Buildroot] [git commit] pkg-cmake: allow to build package in a
	subdirectory
Message-ID: <20150313214018.BAFB88186A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=604c92043bf0e40a8eb23aa54f57d0e49ca6fbe2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some cmake based packages, like GNURadio, it's forbidden to do the
compilation directly in the sources directory. This patch add a new
variable to specify, if needed, the name of a sub-directory used to compile.

[Thomas: put the documentation at the right place in the manual, not
in the middle of the <pkg>_CONF_OPTS description.]

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-cmake.txt |    4 ++++
 package/pkg-cmake.mk                  |   14 ++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index d92b209..6ccf390 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -107,6 +107,10 @@ typical packages will therefore only use a few of them.
 ** +BUILD_EXAMPLE+, +BUILD_EXAMPLES+ are disabled;
 ** +BUILD_TEST+, +BUILD_TESTS+, +BUILD_TESTING+ are disabled.
 
+* +LIBFOO_SUPPORTS_IN_SOURCE_BUILD = NO+ should be set when the package
+  cannot be built inside the source tree but needs a separate build
+  directory.
+
 * +LIBFOO_MAKE+, to specify an alternate +make+ command. This is
   typically useful when parallel make is enabled in the configuration
   (using +BR2_JLEVEL+) but that this feature should be disabled for
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
