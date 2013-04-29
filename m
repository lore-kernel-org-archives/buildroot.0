From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Apr 2013 22:51:34 +0200
Subject: [Buildroot] [git commit] libjson: new package
Message-ID: <20130429205838.7B8329B8E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26406543db143b546eade6f61629c85a71208329
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix static builds, don't run ldconfig, disable assert checks]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/libjson/Config.in                          |   11 ++++
 .../libjson/libjson-0001-fix-broken-makefile.patch |   16 ++++++
 package/libjson/libjson.mk                         |   56 ++++++++++++++++++++
 4 files changed, 84 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bcd3d8d..bdc1de1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -621,6 +621,7 @@ source "package/ezxml/Config.in"
 source "package/jansson/Config.in"
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
index 0000000..deca0f8
--- /dev/null
+++ b/package/libjson/libjson.mk
@@ -0,0 +1,56 @@
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
+LIBJSON_MAKE_OPT = BUILD_TYPE= SHARED=$(if $(BR2_PREFER_STATIC_LIB),0,1) \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -DNDEBUG"
+
+define LIBJSON_EXTRACT_CMDS
+	unzip -d $(@D) $(DL_DIR)/$(LIBJSON_SOURCE)
+	mv $(@D)/libjson/* $(@D)
+	$(RM) -r $(@D)/libjson
+	$(SED) '/ldconfig/d' $(@D)/makefile
+endef
+
+define LIBJSON_BUILD_CMDS
+	mkdir -p $(@D)/Objects_$(if $(BR2_PREFER_STATIC_LIB),static,shared) \
+		$(@D)/_internal/Source/Dependencies
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
