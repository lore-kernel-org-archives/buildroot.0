From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 23:37:54 +0200
Subject: [Buildroot] [git commit] duktape: new package
Message-ID: <20180907111608.2F2467F9D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=387ff26b6d3ce3032751136ad02dec443bed43b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Duktape is an embeddable Javascript engine, with a focus on
portability and compact footprint.

Duktape is easy to integrate into a C/C++ project: add duktape.c,
duktape.h, and duk_config.h to your build, and use the Duktape API
to call Ecmascript functions from C code and vice versa.

http://www.duktape.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/duktape/Config.in    | 16 ++++++++++++++++
 package/duktape/duktape.hash |  3 +++
 package/duktape/duktape.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 48 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bd8095bd20..e58f125d6f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -719,6 +719,7 @@ F:	package/alljoyn-tcl/
 F:	package/alljoyn-tcl-base/
 F:	package/boinc/
 F:	package/cairo/
+F:	package/duktape/
 F:	package/flatbuffers/
 F:	package/gtksourceview/
 F:	package/gssdp/
diff --git a/package/Config.in b/package/Config.in
index 66f303ec58..0323045e57 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1318,6 +1318,7 @@ menu "External AngularJS plugins"
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
