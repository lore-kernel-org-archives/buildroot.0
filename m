From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 22:48:47 +0100
Subject: [Buildroot] [git commit] package/pkg-qmake: add
 <pkg>_SYNC_QT_HEADERS support
Message-ID: <20201206193042.2B5DD8390C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39d334faa5c160c730e702cfad2e033f26d38181
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some qmake based packages need to call the syncqt.pl script before
building to have a properly populated "include" directory inside the
package build tree.

This script is normally automatically executed by qmake when a source
tree is from a git clone: buildroot purges the .git directory hence
the script never runs, and we need to call it explicitly. Setting
<pkg>_SYNC_QT_HEADERS = YES will force calling this script.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-qmake.txt |  4 ++++
 package/pkg-qmake.mk                  | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/docs/manual/adding-packages-qmake.txt b/docs/manual/adding-packages-qmake.txt
index e1621e914e..c7e6ff354a 100644
--- a/docs/manual/adding-packages-qmake.txt
+++ b/docs/manual/adding-packages-qmake.txt
@@ -79,3 +79,7 @@ also be defined.
 * +LIBFOO_INSTALL_TARGET_OPTS+, to specify additional targets to pass
   to the +make+ command during the target installation step. By default,
   +install+.
+
+* +LIBFOO_SYNC_HEADERS+, to run syncqt.pl before qmake. Some packages
+  need this to have a properly populated include directory before
+  running the build.
diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
index 27727119d7..a77286fe3a 100644
--- a/package/pkg-qmake.mk
+++ b/package/pkg-qmake.mk
@@ -20,6 +20,13 @@
 #
 ################################################################################
 
+#
+# Hook to sync Qt headers
+#
+define QT_HEADERS_SYNC_HOOK
+	$(Q)cd $($(PKG)_BUILDDIR) && $(HOST_DIR)/bin/syncqt.pl -version $(QT5_VERSION)
+endef
+
 ################################################################################
 # inner-qmake-package -- defines how the configuration, compilation and
 # installation of a qmake package should be done, implements a few hooks
@@ -44,6 +51,11 @@ ifneq ($(1),qt5base)
 $(2)_DEPENDENCIES 		+= qt5base
 endif
 
+ifeq ($$($(2)_SYNC_QT_HEADERS),YES)
+$(2)_DEPENDENCIES 		+= host-perl
+$(2)_PRE_CONFIGURE_HOOKS        += QT_HEADERS_SYNC_HOOK
+endif
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file.
