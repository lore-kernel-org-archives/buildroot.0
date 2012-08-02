From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:33 -0000
Subject: [Buildroot] [git commit branch/next] New package: zxing
Message-ID: <20120802195244.74FAD8C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47aa58a4ddd3774fa78acffbf85384c558b7f2dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Peter: build using make instead of scons, fixup whitespace, target install]
Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                  |    1 +
 package/zxing/Config.in            |   14 ++++++++++++
 package/zxing/zxing-makefile.patch |   30 +++++++++++++++++++++++++++
 package/zxing/zxing.mk             |   39 ++++++++++++++++++++++++++++++++++++
 4 files changed, 84 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 374a5aa..99257b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -361,6 +361,7 @@ source "package/pango/Config.in"
 source "package/pixman/Config.in"
 source "package/tiff/Config.in"
 source "package/webkit/Config.in"
+source "package/zxing/Config.in"
 endmenu
 
 menu "Hardware handling"
diff --git a/package/zxing/Config.in b/package/zxing/Config.in
new file mode 100644
index 0000000..c1d342c
--- /dev/null
+++ b/package/zxing/Config.in
@@ -0,0 +1,14 @@
+comment "zxing requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_ZXING
+	bool "zxing"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  ZXing (pronounced "zebra crossing") is an open-source,
+	  multi-format 1D/2D barcode image processing library
+	  implemented in Java, with ports to other languages. This
+	  compiles the C++ port.
+
+	  http://code.google.com/p/zxing/
diff --git a/package/zxing/zxing-makefile.patch b/package/zxing/zxing-makefile.patch
new file mode 100644
index 0000000..66896bf
--- /dev/null
+++ b/package/zxing/zxing-makefile.patch
@@ -0,0 +1,30 @@
+[PATCH] add Makefile
+
+The scons based build system doesn't handle cross compilation, special
+compiler flags or (un)installation, so add a simple makefile instead
+which does.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ cpp/core/src/Makefile |   14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+Index: zxing-2.0/cpp/core/src/Makefile
+===================================================================
+--- /dev/null
++++ zxing-2.0/cpp/core/src/Makefile
+@@ -0,0 +1,14 @@
++override CXXFLAGS += -I.
++SRCS := $(shell find -name '*.cpp')
++
++libzxing.a: $(SRCS:.cpp=.o)
++	$(AR) $(ARFLAGS) $@ $^
++
++install: libzxing.a
++	install -D -m 0644 $^ $(DESTDIR)/usr/lib/$^
++	find -name '*.h' -exec install -m 0644 -D "{}" \
++		"$(DESTDIR)/usr/include/{}" ";"
++
++uninstall:
++	rm -f $(DESTDIR)/usr/lib/libzxing.a
++	rm -rf $(DESTDIR)/usr/include/zxing
diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
new file mode 100644
index 0000000..9bde4b7
--- /dev/null
+++ b/package/zxing/zxing.mk
@@ -0,0 +1,39 @@
+#############################################################
+#
+# zxing
+#
+#############################################################
+ZXING_VERSION = 2.0
+ZXING_SITE = http://zxing.googlecode.com/files
+ZXING_SOURCE = ZXing-$(ZXING_VERSION).zip
+ZXING_INSTALL_STAGING = YES
+
+ifneq ($(BR2_ENABLE_LOCALE),y)
+ZXING_DEPENDENCIES += libiconv
+endif
+
+define ZXING_EXTRACT_CMDS
+	unzip -d $(BUILD_DIR) $(DL_DIR)/$(ZXING_SOURCE)
+endef
+
+define ZXING_BUILD_CMDS
+	$(MAKE) -C $(@D)/cpp/core/src $(TARGET_CONFIGURE_OPTS)
+endef
+
+define ZXING_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(STAGING_DIR) install
+endef
+
+define ZXING_UNINSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(STAGING_DIR) uninstall
+endef
+
+define ZXING_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(TARGET_DIR) install
+endef
+
+define ZXING_UNINSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(TARGET_DIR) uninstall
+endef
+
+$(eval $(call GENTARGETS))
