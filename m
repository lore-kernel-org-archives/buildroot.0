From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 24 Jul 2015 00:08:46 +0200
Subject: [Buildroot] [PATCH] zxing_cpp: New package
Message-ID: <1437689326-23261-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ZXing was hosted on Google Code, which is a closing forges.
The current link was already redirecting to the github repo.

But upstream is no longer supporting the cpp bindings, it's now a Java
library/application.

A fork has been created from the latests cpp source of the original
upstream.
So this is a new package from an old one and a legacy option has been
added.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 Config.in.legacy                       |  8 +++++++
 package/Config.in                      |  2 +-
 package/{zxing => zxing-cpp}/Config.in | 10 ++++-----
 package/zxing-cpp/zxing-cpp.mk         | 33 ++++++++++++++++++++++++++++
 package/zxing/0001-makefile.patch      | 30 -------------------------
 package/zxing/zxing.mk                 | 40 ----------------------------------
 6 files changed, 47 insertions(+), 76 deletions(-)
 rename package/{zxing => zxing-cpp}/Config.in (52%)
 create mode 100644 package/zxing-cpp/zxing-cpp.mk
 delete mode 100644 package/zxing/0001-makefile.patch
 delete mode 100644 package/zxing/zxing.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 4afeb83..c6cebcb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_ZXING
+	bool "zxing option has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_ZXING_CPP
+	help
+	  ZXing no longer provides the cpp bindings, it has been renamed to
+	  BR2_PACKAGE_ZXING_CPP which uses a new upstream.
+
 config BR2_PACKAGE_PERF
 	bool "perf option has been renamed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 9942e3a..5a135ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -828,7 +828,7 @@ menu "Graphics"
 	source "package/wayland/Config.in"
 	source "package/webkit/Config.in"
 	source "package/webp/Config.in"
-	source "package/zxing/Config.in"
+	source "package/zxing-cpp/Config.in"
 endmenu
 
 menu "Hardware handling"
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
diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
new file mode 100644
index 0000000..36ba0fe
--- /dev/null
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# zxing-cpp
+#
+################################################################################
+
+ZXING_CPP_VERSION = e7594421d240d8a79633a83c7ad3d26b670e038f
+ZXING_CPP_SITE = $(call github,glassechidna,zxing-cpp,$(ZXING_CPP_VERSION))
+ZXING_CPP_LICENSE = Apache-2.0
+ZXING_CPP_LICENSE_FILES = COPYING
+ZXING_CPP_INSTALL_STAGING = YES
+ZXING_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
+
+ifneq ($(BR2_ENABLE_LOCALE),y)
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+ZXING_CPP_DEPENDENCIES += libiconv
+endif
+endif
+
+define ZXING_CPP_INSTALL_STAGING_CMDS
+	for i in $$(find $(@D)/buildroot-build/core/src -iname *.h); do \
+		$(INSTALL) -m 644 $$i $(TARGET_DIR)/usr/local/include; \
+	done
+endef
+
+define ZXING_CPP_INSTALL_TARGET_CMDS
+	for i in $$(find $(@D)/buildroot-build/ -iname *.so -o -iname *.a); do \
+		$(INSTALL) -m 644 $$i $(TARGET_DIR)/usr/lib; \
+	done
+	$(INSTALL) -m 755 $(@D)/buildroot-build/zxing $(TARGET_DIR)/usr/sbin
+endef
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
-- 
2.1.4
