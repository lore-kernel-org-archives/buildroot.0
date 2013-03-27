From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 27 Mar 2013 20:28:00 +0000
Subject: [Buildroot] [PATCH] libjson: new package
Message-ID: <1364416080-10797-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in                                  |    1 +
 package/libjson/Config.in                          |   11 ++++
 .../libjson/libjson-0001-fix-broken-makefile.patch |   16 ++++++
 package/libjson/libjson.mk                         |   53 ++++++++++++++++++++
 4 files changed, 81 insertions(+)
 create mode 100644 package/libjson/Config.in
 create mode 100644 package/libjson/libjson-0001-fix-broken-makefile.patch
 create mode 100644 package/libjson/libjson.mk

diff --git a/package/Config.in b/package/Config.in
index 463d1b9..5f9c6c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -609,6 +609,7 @@ source "package/expat/Config.in"
 source "package/ezxml/Config.in"
 source "package/json-c/Config.in"
 source "package/json-glib/Config.in"
+source "package/libjson/Config.in"
 source "package/libroxml/Config.in"
 source "package/libxml-parser-perl/Config.in"
 source "package/libxml2/Config.in"
diff --git a/package/libjson/Config.in b/package/libjson/Config.in
new file mode 100644
index 0000000..949c748
--- /dev/null
+++ b/package/libjson/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBJSON
+	bool "libjson"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  A JSON reader and writer which is super-efficient and usually
+	  runs circles around other JSON libraries.
+
+	  http://sourceforge.net/projects/libjson/
+
+comment "libjson requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libjson/libjson-0001-fix-broken-makefile.patch b/package/libjson/libjson-0001-fix-broken-makefile.patch
new file mode 100644
index 0000000..8ceb0ca
--- /dev/null
+++ b/package/libjson/libjson-0001-fix-broken-makefile.patch
@@ -0,0 +1,16 @@
+Fix the broken libjson makefile.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/makefile b/makefile
+--- a/makefile	2012-05-30 10:15:42.000000000 +0100
++++ b/makefile	2013-03-27 18:45:34.814670534 +0000
+@@ -170,7 +170,7 @@ include_path     = $(prefix)/$(includedi
+ # Usage check
+ ifdef CXXFLAGS
+ ifdef BUILD_TYPE
+-	$(error CXXFLAGS and BUILD_TYPE are mutually exclusive)
++$(error CXXFLAGS and BUILD_TYPE are mutually exclusive)
+ endif
+ endif
+ 
diff --git a/package/libjson/libjson.mk b/package/libjson/libjson.mk
new file mode 100644
index 0000000..9bd9030
--- /dev/null
+++ b/package/libjson/libjson.mk
@@ -0,0 +1,53 @@
+#############################################################
+#
+# libjson
+#
+#############################################################
+
+LIBJSON_VERSION = 7.6.1
+LIBJSON_SITE = http://downloads.sourceforge.net/project/libjson
+LIBJSON_SOURCE = libjson_$(LIBJSON_VERSION).zip
+LIBJSON_INSTALL_STAGING = YES
+LIBJSON_LICENSE = BSD-2c
+LIBJSON_LICENSE_FILES = License.txt
+
+LIBJSON_MAKE_OPT = BUILD_TYPE= SHARED=1
+
+define LIBJSON_EXTRACT_CMDS
+	unzip -d $(@D) $(DL_DIR)/$(LIBJSON_SOURCE)
+	mv $(@D)/libjson/* $(@D)
+	$(RM) -r $(@D)/libjson
+endef
+
+define LIBJSON_BUILD_CMDS
+	mkdir -p $(@D)/Objects_shared $(@D)/_internal/Source/Dependencies
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		$(LIBJSON_MAKE_OPT) -C $(@D)
+endef
+
+define LIBJSON_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		$(LIBJSON_MAKE_OPT) prefix=$(TARGET_DIR)/usr install -C $(@D)
+endef
+
+define LIBJSON_UNINSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		$(LIBJSON_MAKE_OPT) prefix=$(TARGET_DIR)/usr uninstall -C $(@D)
+endef
+
+define LIBJSON_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		$(LIBJSON_MAKE_OPT) prefix=$(STAGING_DIR)/usr install -C $(@D)
+endef
+
+define LIBJSON_UNINSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		$(LIBJSON_MAKE_OPT) prefix=$(STAGING_DIR)/usr uninstall -C $(@D)
+endef
+
+define LIBJSON_CLEAN_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) $(LIBJSON_MAKE_OPT) \
+		clean -C $(@D)
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
