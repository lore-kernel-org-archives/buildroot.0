From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 15:11:57 +0100
Subject: [Buildroot] [git commit] zxing-cpp: new package, replacing zxing
Message-ID: <20151004141350.96AB581D5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e5ddbcb0645cbecd9838c3d4fe8aafe66fa04aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ZXing was hosted on Google Code, which is a closing. The current link
was already redirecting to the github repo.

But upstream is no longer supporting the cpp bindings, it's now a Java
library/application.

A fork has been created from the latest cpp source of the original
upstream. So this commit creates a new package, zxing-cpp, and adds
Config.in.legacy handling for the old zxing pakcage that is removed.

[Thomas:
  - add a patch that improves the CMakeLists.txt file to add
    installation rules. This allows to remove the manual installation
    logic from zxing-cpp.mk.
  - make libiconv a normal optional dependency. No need to involve
    BR2_ENABLE_LOCALE in the condition, since libiconv can only be
    enabled when !BR2_ENABLE_LOCALE.
  - bump to the latest upstream version.
  - add hash file.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |    8 ++++
 package/Config.in                                  |    2 +-
 ...001-CMakeLists-add-rules-for-installation.patch |   33 ++++++++++++++++
 package/{zxing => zxing-cpp}/Config.in             |   10 ++--
 package/zxing-cpp/zxing-cpp.hash                   |    2 +
 package/zxing-cpp/zxing-cpp.mk                     |   18 +++++++++
 package/zxing/0001-makefile.patch                  |   30 ---------------
 package/zxing/zxing.mk                             |   40 --------------------
 8 files changed, 67 insertions(+), 76 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8975b95..9a59e73 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.11"
 
+config BR2_PACKAGE_ZXING
+	bool "zxing option has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_ZXING_CPP
+	help
+	  ZXing no longer provides the cpp bindings, it has been renamed to
+	  BR2_PACKAGE_ZXING_CPP which uses a new upstream.
+
 # Since FreeRDP has new dependencies, protect this legacy to avoid the
 # infamous "unmet direct dependencies" kconfig error.
 config BR2_PACKAGE_FREERDP_CLIENT
diff --git a/package/Config.in b/package/Config.in
index a74669e..4c8bb21 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -851,7 +851,7 @@ menu "Graphics"
 	source "package/webkit/Config.in"
 	source "package/webkitgtk24/Config.in"
 	source "package/webp/Config.in"
-	source "package/zxing/Config.in"
+	source "package/zxing-cpp/Config.in"
 endmenu
 
 menu "Hardware handling"
diff --git a/package/zxing-cpp/0001-CMakeLists-add-rules-for-installation.patch b/package/zxing-cpp/0001-CMakeLists-add-rules-for-installation.patch
new file mode 100644
index 0000000..034f200
--- /dev/null
+++ b/package/zxing-cpp/0001-CMakeLists-add-rules-for-installation.patch
@@ -0,0 +1,33 @@
+From 2bc58a87dd629cef4cd2c62c5132c319bede61fa Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 4 Oct 2015 11:49:52 +0100
+Subject: [PATCH] CMakeLists: add rules for installation
+
+This commit adds some CMake rules that allow to do a "make install" to
+install the zxing binary, its library and corresponding header files.
+
+Submitted upstream: https://github.com/glassechidna/zxing-cpp/pull/31
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f49b28d..7151d90 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -68,6 +68,10 @@ file(GLOB_RECURSE ZXING_FILES
+ )
+ add_executable(zxing ${ZXING_FILES})
+ target_link_libraries(zxing libzxing)
++install(TARGETS zxing libzxing
++	LIBRARY DESTINATION lib
++	RUNTIME DESTINATION bin)
++install(DIRECTORY core/src/zxing/ DESTINATION include/zxing FILES_MATCHING PATTERN "*.h")
+ 
+ # Add testrunner executable.
+ find_package(CPPUNIT)
+-- 
+2.6.0
+
diff --git a/package/zxing/Config.in b/package/zxing-cpp/Config.in
similarity index 52%
rename from package/zxing/Config.in
rename to package/zxing-cpp/Config.in
index 1e04635..1695d27 100644
--- a/package/zxing/Config.in
+++ b/package/zxing-cpp/Config.in
@@ -1,13 +1,13 @@
-comment "zxing needs a toolchain w/ C++"
+comment "zxing-cpp needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
-config BR2_PACKAGE_ZXING
-	bool "zxing"
+config BR2_PACKAGE_ZXING_CPP
+	bool "zxing-cpp"
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
-	  ZXing (pronounced "zebra crossing") is an open-source,
+	  ZXing-cpp (pronounced "zebra crossing") is an open-source,
 	  multi-format 1D/2D barcode image processing library
 	  implemented in Java, with ports to other languages. This
 	  compiles the C++ port.
 
-	  http://code.google.com/p/zxing/
+	  https://github.com/glassechidna/zxing-cpp
diff --git a/package/zxing-cpp/zxing-cpp.hash b/package/zxing-cpp/zxing-cpp.hash
new file mode 100644
index 0000000..bc3b11d
--- /dev/null
+++ b/package/zxing-cpp/zxing-cpp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 c3934e9e59b7496c9a4db7ad4d8eb43668da4b321ec705feebaf085b185b2d08 zxing-cpp-4abdbb62c9939014eca3e43ac7dfa30daa344536.tar.gz
diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
new file mode 100644
index 0000000..64c20f3
--- /dev/null
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# zxing-cpp
+#
+################################################################################
+
+ZXING_CPP_VERSION = 4abdbb62c9939014eca3e43ac7dfa30daa344536
+ZXING_CPP_SITE = $(call github,glassechidna,zxing-cpp,$(ZXING_CPP_VERSION))
+ZXING_CPP_LICENSE = Apache-2.0
+ZXING_CPP_LICENSE_FILES = COPYING
+ZXING_CPP_INSTALL_STAGING = YES
+ZXING_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+ZXING_CPP_DEPENDENCIES += libiconv
+endif
+
+$(eval $(cmake-package))
diff --git a/package/zxing/0001-makefile.patch b/package/zxing/0001-makefile.patch
deleted file mode 100644
index 66896bf..0000000
--- a/package/zxing/0001-makefile.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-[PATCH] add Makefile
-
-The scons based build system doesn't handle cross compilation, special
-compiler flags or (un)installation, so add a simple makefile instead
-which does.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- cpp/core/src/Makefile |   14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-Index: zxing-2.0/cpp/core/src/Makefile
-===================================================================
---- /dev/null
-+++ zxing-2.0/cpp/core/src/Makefile
-@@ -0,0 +1,14 @@
-+override CXXFLAGS += -I.
-+SRCS := $(shell find -name '*.cpp')
-+
-+libzxing.a: $(SRCS:.cpp=.o)
-+	$(AR) $(ARFLAGS) $@ $^
-+
-+install: libzxing.a
-+	install -D -m 0644 $^ $(DESTDIR)/usr/lib/$^
-+	find -name '*.h' -exec install -m 0644 -D "{}" \
-+		"$(DESTDIR)/usr/include/{}" ";"
-+
-+uninstall:
-+	rm -f $(DESTDIR)/usr/lib/libzxing.a
-+	rm -rf $(DESTDIR)/usr/include/zxing
diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
deleted file mode 100644
index 94e8b1f..0000000
--- a/package/zxing/zxing.mk
+++ /dev/null
@@ -1,40 +0,0 @@
-################################################################################
-#
-# zxing
-#
-################################################################################
-
-ZXING_VERSION = 2.3.0
-ZXING_SITE = http://zxing.googlecode.com/files
-ZXING_SOURCE = ZXing-$(ZXING_VERSION).zip
-ZXING_LICENSE = Apache-2.0
-ZXING_LICENSE_FILES = COPYING
-ZXING_INSTALL_STAGING = YES
-
-ifneq ($(BR2_ENABLE_LOCALE),y)
-ifeq ($(BR2_PACKAGE_LIBICONV),y)
-ZXING_DEPENDENCIES += libiconv
-else
-# There is no locale support in the toolchain and libiconv
-# is not available so disable iconv support in zxing
-ZING_MAKE_OPTS = CXXFLAGS+="-DNO_ICONV"
-endif
-endif
-
-define ZXING_EXTRACT_CMDS
-	$(UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(ZXING_SOURCE)
-endef
-
-define ZXING_BUILD_CMDS
-	$(MAKE) -C $(@D)/cpp/core/src $(TARGET_CONFIGURE_OPTS) $(ZING_MAKE_OPTS)
-endef
-
-define ZXING_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(STAGING_DIR) install
-endef
-
-define ZXING_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
