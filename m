From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 25 Feb 2015 20:18:31 +0100
Subject: [Buildroot] [PATCH v2 1/4] pkg-cmake: allow to build package in a
	subdirectory
Message-ID: <1424891914-27748-1-git-send-email-gwenj@trabucayre.com>
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
---
Changes v1 -> v2:
 * Allow to overload $(2)_BUILDDIR instead of adding a new variable and test
---
 package/pkg-cmake.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index eacd641..f3bd080 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -57,7 +57,7 @@ $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install
 
 $(2)_SRCDIR			= $$($(2)_DIR)/$$($(2)_SUBDIR)
-$(2)_BUILDDIR			= $$($(2)_SRCDIR)
+$(2)_BUILDDIR			?= $$($(2)_SRCDIR)
 
 #
 # Configure step. Only define it if not already defined by the package
@@ -69,7 +69,8 @@ ifeq ($(4),target)
 
 # Configure package for target
 define $(2)_CONFIGURE_CMDS
-	(cd $$($$(PKG)_BUILDDIR) && \
+	(mkdir -p $$($$(PKG)_BUILDDIR) && \
+	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
@@ -93,7 +94,8 @@ else
 
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
