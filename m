From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  6 Nov 2020 23:51:14 +0100
Subject: [Buildroot] [PATCH v2] package/quickjs: new package
Message-ID: <20201106225115.291042-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in            |  1 +
 package/quickjs/Config.in    | 15 +++++++++++++++
 package/quickjs/quickjs.hash |  2 ++
 package/quickjs/quickjs.mk   | 37 ++++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 package/quickjs/Config.in
 create mode 100644 package/quickjs/quickjs.hash
 create mode 100644 package/quickjs/quickjs.mk

diff --git a/package/Config.in b/package/Config.in
index 016a99ed1..8fcea0643 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1245,6 +1245,7 @@ menu "External python modules"
 	source "package/python-zope-interface/Config.in"
 endmenu
 endif
+	source "package/quickjs/Config.in"
 	source "package/ruby/Config.in"
 	source "package/tcl/Config.in"
 if BR2_PACKAGE_TCL
diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
new file mode 100644
index 000000000..89346ceff
--- /dev/null
+++ b/package/quickjs/Config.in
@@ -0,0 +1,15 @@
+
+config BR2_PACKAGE_QUICKJS
+	bool "quickjs"
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # No way to check for fenv support.
+	depends on BR2_USE_MMU # fork()
+	help
+	  QuickJS is a small and embeddable Javascript engine.
+	  It supports the ES2020 specification including modules,
+	  asynchronous generators, proxies and BigInt.
+
+	  https://bellard.org/quickjs/
+
+comment "quickjs needs a glibc or musl toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
new file mode 100644
index 000000000..076e4bddb
--- /dev/null
+++ b/package/quickjs/quickjs.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0021a3e8cdc6b61e225411d05e2841d2437e1ccf4b4cabb9a5f7685ebfb57717  quickjs-2020-09-06.tar.xz
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
new file mode 100644
index 000000000..557ffb196
--- /dev/null
+++ b/package/quickjs/quickjs.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# quickjs
+#
+################################################################################
+
+QUICKJS_VERSION = 2020-09-06
+QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
+QUICKJS_SITE = https://bellard.org/quickjs
+QUICKJS_LICENSE = MIT
+QUICKJS_INSTALL_STAGING = YES
+
+define QUICKJS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CROSS_PREFIX="$(TARGET_CROSS)" \
+		all
+endef
+
+define QUICKJS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CROSS_PREFIX="$(TARGET_CROSS)" \
+		DESTDIR=$(STAGING_DIR) \
+		STRIP=/bin/true \
+		prefix=/usr \
+		install
+endef
+
+define QUICKJS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CROSS_PREFIX="$(TARGET_CROSS)" \
+		DESTDIR=$(TARGET_DIR) \
+		STRIP=/bin/true \
+		prefix=/usr \
+		install
+endef
+
+$(eval $(generic-package))
-- 
2.27.0
