From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 24 Sep 2015 11:36:09 -0300
Subject: [Buildroot] [PATCH] graphite2: new package
Message-ID: <1443105369-30869-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/Config.in                                  |  1 +
 .../graphite2/0001-disable-double-promotion.patch  | 18 +++++++++++++++++
 package/graphite2/Config.in                        | 13 ++++++++++++
 package/graphite2/graphite2.hash                   |  3 +++
 package/graphite2/graphite2.mk                     | 23 ++++++++++++++++++++++
 5 files changed, 58 insertions(+)
 create mode 100644 package/graphite2/0001-disable-double-promotion.patch
 create mode 100644 package/graphite2/Config.in
 create mode 100644 package/graphite2/graphite2.hash
 create mode 100644 package/graphite2/graphite2.mk

diff --git a/package/Config.in b/package/Config.in
index 949a4ee..1eacae5 100644
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
index 0000000..636b3a2
--- /dev/null
+++ b/package/graphite2/0001-disable-double-promotion.patch
@@ -0,0 +1,18 @@
+The warnig flag isn't recognized for older GCC versions (blackfin),
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
index 0000000..4db0835
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
index 0000000..2343189
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
+GRAPHITE2_PRE_CONFIGURE_HOOKS += GRAPHITE2_DISABLE_TESTS_DOC
+
+$(eval $(cmake-package))
-- 
2.4.9
