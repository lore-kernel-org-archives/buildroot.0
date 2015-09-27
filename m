From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Sep 2015 23:13:52 +0200
Subject: [Buildroot] [git commit] graphite2: new package
Message-ID: <20150927211643.7DE1E8083A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80a5956dc02d984aeeb3e80d1f75585bd94609e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - tweak description of the patch
 - turn the doc/test removal hook as a post patch hook rather than a
   pre-configure hook.]

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 .../graphite2/0001-disable-double-promotion.patch  |   20 +++++++++++++++++
 package/graphite2/Config.in                        |   13 +++++++++++
 package/graphite2/graphite2.hash                   |    3 ++
 package/graphite2/graphite2.mk                     |   23 ++++++++++++++++++++
 5 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9dff5e8..0e0c5cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -803,6 +803,7 @@ menu "Graphics"
 	source "package/gdk-pixbuf/Config.in"
 	source "package/giblib/Config.in"
 	source "package/giflib/Config.in"
+	source "package/graphite2/Config.in"
 	source "package/harfbuzz/Config.in"
 	source "package/ijs/Config.in"
 	source "package/imlib2/Config.in"
diff --git a/package/graphite2/0001-disable-double-promotion.patch b/package/graphite2/0001-disable-double-promotion.patch
new file mode 100644
index 0000000..9199a63
--- /dev/null
+++ b/package/graphite2/0001-disable-double-promotion.patch
@@ -0,0 +1,20 @@
+Don't use -Wdouble-promotion gcc option
+
+The warning flag isn't recognized for older GCC versions (blackfin),
+so just disable it.
+
+Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
+
+diff -Nura graphite2-1.3.3.orig/src/CMakeLists.txt graphite2-1.3.3/src/CMakeLists.txt
+--- graphite2-1.3.3.orig/src/CMakeLists.txt	2015-09-24 10:06:28.877851596 -0300
++++ graphite2-1.3.3/src/CMakeLists.txt	2015-09-24 10:06:48.201519767 -0300
+@@ -111,9 +111,6 @@
+         COMPILE_FLAGS   "-Wall -Wextra -Wno-unknown-pragmas -Wendif-labels -Wshadow -Wctor-dtor-privacy -Wnon-virtual-dtor -fno-rtti -fno-exceptions -fvisibility=hidden -fvisibility-inlines-hidden -fno-stack-protector"
+         LINK_FLAGS      "-nodefaultlibs ${GRAPHITE_LINK_FLAGS}" 
+         LINKER_LANGUAGE C)
+-    if (CMAKE_COMPILER_IS_GNUCXX)
+-        add_definitions(-Wdouble-promotion)
+-    endif (CMAKE_COMPILER_IS_GNUCXX)
+     if (${CMAKE_CXX_COMPILER} MATCHES  ".*mingw.*")
+         target_link_libraries(graphite2 kernel32 msvcr90 mingw32 gcc user32)
+     else (${CMAKE_CXX_COMPILER} MATCHES  ".*mingw.*")
diff --git a/package/graphite2/Config.in b/package/graphite2/Config.in
new file mode 100644
index 0000000..0ec07a2
--- /dev/null
+++ b/package/graphite2/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_GRAPHITE2
+	bool "graphite2"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	help
+	  Graphite is a project within SIL's scripts and software dev
+	  groups to provide cross-platform rendering for complex
+	  writing systems.
+
+	  http://sourceforge.net/projects/silgraphite/
+
+comment "graphite2 needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/graphite2/graphite2.hash b/package/graphite2/graphite2.hash
new file mode 100644
index 0000000..1e8a54b
--- /dev/null
+++ b/package/graphite2/graphite2.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/silgraphite/files/graphite2
+md5	7cda6fc6bc197b216777b15ce52c38a8	graphite2-1.3.3.tgz
+sha1	54b04c283bab4695de63ae2dd6cff392dd49d7f0	graphite2-1.3.3.tgz
diff --git a/package/graphite2/graphite2.mk b/package/graphite2/graphite2.mk
new file mode 100644
index 0000000..0de4178
--- /dev/null
+++ b/package/graphite2/graphite2.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# graphite2
+#
+################################################################################
+
+GRAPHITE2_VERSION = 1.3.3
+GRAPHITE2_SOURCE = graphite2-$(GRAPHITE2_VERSION).tgz
+GRAPHITE2_SITE = http://downloads.sourceforge.net/project/silgraphite/graphite2
+GRAPHITE2_INSTALL_STAGING = YES
+GRAPHITE2_LICENSE = LGPLv2.1+
+GRAPHITE2_LICENSE_FILES = LICENSE
+
+# Avoid building docs and tests to save time
+define GRAPHITE2_DISABLE_TESTS_DOC
+	$(SED) '/^add_subdirectory(doc)/d' \
+		-e '/^add_subdirectory(tests)/d' \
+		-e '/add_subdirectory(gr2fonttest)/d' \
+		$(@D)/CMakeLists.txt
+endef
+GRAPHITE2_POST_PATCH_HOOKS += GRAPHITE2_DISABLE_TESTS_DOC
+
+$(eval $(cmake-package))
