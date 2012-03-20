From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 19 Mar 2012 20:56:49 -0400
Subject: [Buildroot] [PATCH] New package: zxing
Message-ID: <1332205009-31559-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/Config.in                                  |    1 +
 package/zxing/Config.in                            |   14 +++++++
 package/zxing/zxing-2.0-crosscompile-support.patch |   30 +++++++++++++++
 package/zxing/zxing.mk                             |   38 ++++++++++++++++++++
 4 files changed, 83 insertions(+), 0 deletions(-)
 create mode 100644 package/zxing/Config.in
 create mode 100644 package/zxing/zxing-2.0-crosscompile-support.patch
 create mode 100644 package/zxing/zxing.mk

diff --git a/package/Config.in b/package/Config.in
index f0ce963..063da26 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -322,6 +322,7 @@ source "package/pango/Config.in"
 source "package/pixman/Config.in"
 source "package/tiff/Config.in"
 source "package/webkit/Config.in"
+source "package/zxing/Config.in"
 endmenu
 
 menu "Hardware handling"
diff --git a/package/zxing/Config.in b/package/zxing/Config.in
new file mode 100644
index 0000000..27cdf09
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
diff --git a/package/zxing/zxing-2.0-crosscompile-support.patch b/package/zxing/zxing-2.0-crosscompile-support.patch
new file mode 100644
index 0000000..0e863fb
--- /dev/null
+++ b/package/zxing/zxing-2.0-crosscompile-support.patch
@@ -0,0 +1,30 @@
+From 20826bfedafcdcddd1dc441c71ace9106bb7f3d9 Mon Sep 17 00:00:00 2001
+From: Frank Hunleth <fhunleth@troodon-software.com>
+Date: Sun, 18 Mar 2012 19:28:13 -0400
+Subject: [PATCH] SConscript: Add commandline parameter to specify crosscompile toolchain
+
+Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
+---
+ cpp/SConscript |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/cpp/SConscript b/cpp/SConscript
+index 51c191d..584ae17 100644
+--- a/cpp/SConscript
++++ b/cpp/SConscript
+@@ -8,6 +8,12 @@ vars = Variables()
+ vars.Add(BoolVariable('DEBUG', 'Set to disable optimizations', 1))
+ vars.Add(BoolVariable('PIC', 'Set to 1 for to always generate PIC code', 0))
+ env = Environment(variables = vars)
++
++TARGET_CROSS = ARGUMENTS.get('TARGET_CROSS', '')
++env.Replace(CXX = TARGET_CROSS + 'gcc')
++env.Replace(AR = TARGET_CROSS + 'ar')
++env.Replace(RANLIB = TARGET_CROSS + 'ranlib')
++
+ # env.Replace(CXX = "clang++") 
+ 
+ debug = env['DEBUG']
+-- 
+1.7.0.4
+
diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
new file mode 100644
index 0000000..5f5b6f1
--- /dev/null
+++ b/package/zxing/zxing.mk
@@ -0,0 +1,38 @@
+#############################################################
+#
+# zxing
+#
+#############################################################
+ZXING_VERSION = 2.0
+ZXING_SITE = http://zxing.googlecode.com/files
+ZXING_SOURCE = ZXing-$(ZXING_VERSION).zip
+ZXING_DEPENDENCIES = host-python
+ZXING_INSTALL_STAGING = YES
+ZXING_INSTALL_TARGET = NO
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
+	(cd $(@D)/cpp; \
+		$(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/python $(@D)/cpp/scons/scons.py TARGET_CROSS=$(TARGET_CROSS) DEBUG=0 lib) 
+endef
+
+define ZXING_INSTALL_STAGING_CMDS
+	(cd $(@D)/cpp/build/core/src; \
+		find . -name "*.h" -exec $(INSTALL) -D "{}" "$(STAGING_DIR)/usr/include/{}" ";")
+	$(INSTALL) -D -m 0644 $(@D)/cpp/build/libzxing.a \
+		$(STAGING_DIR)/usr/lib/libzxing.a
+endef
+
+define ZXING_UNINSTALL_STAGING_CMDS
+	rm -f $(STAGING_DIR)/usr/lib/libzxing.a
+	rm -fr $(STAGING_DIR)/usr/include/zxing
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.0.4
