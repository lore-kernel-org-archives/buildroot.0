From: sam.voss at gmail.com <sam.voss@gmail.com>
Date: Wed,  2 Oct 2019 19:31:46 -0500
Subject: [Buildroot] [PATCH v2] package/ripgrep: new package
Message-ID: <20191003003146.942555-1-sam.voss@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam Voss <sam.voss@gmail.com>

Signed-off-by: Sam Voss <sam.voss@gmail.com>
---
Changes v1 -> v2:
  - Fix depends-on values
  - Add hash for license files
  - Make indentation consistant


 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/ripgrep/Config.in    | 14 ++++++++++++++
 package/ripgrep/ripgrep.hash |  3 +++
 package/ripgrep/ripgrep.mk   | 33 +++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)
 create mode 100644 package/ripgrep/Config.in
 create mode 100644 package/ripgrep/ripgrep.hash
 create mode 100644 package/ripgrep/ripgrep.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ac73c7daa5..8aac60f93b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2077,6 +2077,9 @@ F:	package/urg/
 F:	package/ussp-push/
 F:	support/misc/toolchainfile.cmake.in
 
+N:	Sam Voss <sam.voss@gmail.com>
+F:	package/ripgrep/
+
 N:	Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
 F:	package/valijson/
 
diff --git a/package/Config.in b/package/Config.in
index 4d8fce21c0..b17e04e86e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -172,6 +172,7 @@ menu "Development tools"
 	source "package/make/Config.in"
 	source "package/patch/Config.in"
 	source "package/pkgconf/Config.in"
+	source "package/ripgrep/Config.in"
 	source "package/sed/Config.in"
 	source "package/subversion/Config.in"
 	source "package/tree/Config.in"
diff --git a/package/ripgrep/Config.in b/package/ripgrep/Config.in
new file mode 100644
index 0000000000..5446ad046c
--- /dev/null
+++ b/package/ripgrep/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_RIPGREP
+	bool "ripgrep"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_CARGO
+	help
+	  ripgrep is a line-oriented search tool that
+	  recursively searches your current directory
+	  for a regex pattern while respecting your gitignore
+	  rules.
+
+	  ripgrep is similar to other popular search tools like
+	  The Silver Searcher, ack and grep.
+
+	  https://github.com/BurntSushi/ripgrep
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
new file mode 100644
index 0000000000..0841c0185c
--- /dev/null
+++ b/package/ripgrep/ripgrep.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 7035379fce0c1e32552e8ee528b92c3d01b8d3935ea31d26c51a73287be74bb3 ripgrep-0.8.1.tar.gz
+sha256 0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f LICENSE-MIT
diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
new file mode 100644
index 0000000000..0bb7017a96
--- /dev/null
+++ b/package/ripgrep/ripgrep.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# ripgrep
+#
+################################################################################
+
+RIPGREP_VERSION = 0.8.1
+RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
+RIPGREP_LICENSE = MIT
+RIPGREP_LICENSE_FILES = LICENSE-MIT
+
+RIPGREP_DEPENDENCIES = host-cargo
+RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
+RIPGREP_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
+
+RIPGREP_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(RIPGREP_CARGO_MODE)
+
+RIPGREP_CARGO_OPTS = \
+	--$(RIPGREP_CARGO_MODE) \
+	--target=$(RUSTC_TARGET_NAME) \
+	--manifest-path=$(@D)/Cargo.toml
+
+define RIPGREP_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(RIPGREP_CARGO_ENV) \
+		cargo build $(RIPGREP_CARGO_OPTS)
+endef
+
+define RIPGREP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/$(RIPGREP_BIN_DIR)/rg \
+		$(TARGET_DIR)/usr/bin/rg
+endef
+
+$(eval $(generic-package))
-- 
2.23.0
