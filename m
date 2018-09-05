From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  5 Sep 2018 20:23:20 +0200
Subject: [Buildroot] [PATCH/next v2,1/1] duktape: new package
Message-ID: <20180905182320.7181-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Duktape is an embeddable Javascript engine, with a focus on
portability and compact footprint.

Duktape is easy to integrate into a C/C++ project: add duktape.c,
duktape.h, and duk_config.h to your build, and use the Duktape API
to call Ecmascript functions from C code and vice versa.

http://www.duktape.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Use latest version
 - Remove both patches (first one already in version, second one
   abandonned)
 - Depends on !BR2_STATIC_LIBS as upstream does not support static
   linking
 - Fix Config.in so lines are less than 72 characters

 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/duktape/Config.in    | 16 ++++++++++++++++
 package/duktape/duktape.hash |  3 +++
 package/duktape/duktape.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 48 insertions(+)
 create mode 100644 package/duktape/Config.in
 create mode 100644 package/duktape/duktape.hash
 create mode 100644 package/duktape/duktape.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3f1f491fb7..4e966727aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -693,6 +693,7 @@ F:	package/alljoyn-tcl/
 F:	package/alljoyn-tcl-base/
 F:	package/boinc/
 F:	package/cairo/
+F:	package/duktape/
 F:	package/expat/
 F:	package/flatbuffers/
 F:	package/gtksourceview/
diff --git a/package/Config.in b/package/Config.in
index f5a17492c7..0e0186c7ac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1293,6 +1293,7 @@ menu "External AngularJS plugins"
 endmenu
 endif
 	source "package/bootstrap/Config.in"
+	source "package/duktape/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
 	source "package/jquery/Config.in"
diff --git a/package/duktape/Config.in b/package/duktape/Config.in
new file mode 100644
index 0000000000..5dad5c3e7c
--- /dev/null
+++ b/package/duktape/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_DUKTAPE
+	bool "duktape"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Duktape is an embeddable Javascript engine, with a focus on
+	  portability and compact footprint.
+
+	  Duktape is easy to integrate into a C/C++ project: add
+	  duktape.c, duktape.h, and duk_config.h to your build, and use
+	  the Duktape API to call Ecmascript functions from C code and
+	  vice versa.
+
+	  http://www.duktape.org
+
+comment "duktape needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/duktape/duktape.hash b/package/duktape/duktape.hash
new file mode 100644
index 0000000000..0a819b4739
--- /dev/null
+++ b/package/duktape/duktape.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	0df1c0a9d40bfae31733e5c44f0eabaeae59e0a2ebf7693ff68bbabd49aae331	duktape-v2.3.0.tar.gz
+sha256	5358498534dac625c89a69c10becf3dcc40f9af58e6b69ee358ebdf6934f49c6	LICENSE.txt
diff --git a/package/duktape/duktape.mk b/package/duktape/duktape.mk
new file mode 100644
index 0000000000..97b51f94b1
--- /dev/null
+++ b/package/duktape/duktape.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# duktape
+#
+################################################################################
+
+DUKTAPE_VERSION = v2.3.0
+DUKTAPE_SITE = $(call github,svaarala,duktape-releases,$(DUKTAPE_VERSION))
+DUKTAPE_LICENSE = MIT
+DUKTAPE_LICENSE_FILES = LICENSE.txt
+DUKTAPE_INSTALL_STAGING = YES
+
+define DUKTAPE_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f Makefile.sharedlibrary
+endef
+
+define DUKTAPE_INSTALL_STAGING_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f Makefile.sharedlibrary \
+		INSTALL_PREFIX=$(STAGING_DIR)/usr install
+endef
+
+define DUKTAPE_INSTALL_TARGET_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f Makefile.sharedlibrary \
+		INSTALL_PREFIX=$(TARGET_DIR)/usr install
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
