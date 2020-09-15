From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 15 Sep 2020 13:57:38 -0700
Subject: [Buildroot] [PATCH] package/sentry-cli: new package
Message-ID: <20200915205738.2144347-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in.host             |  1 +
 package/sentry-cli/Config.in.host  | 10 ++++++++
 package/sentry-cli/sentry-cli.hash |  3 +++
 package/sentry-cli/sentry-cli.mk   | 39 ++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)
 create mode 100644 package/sentry-cli/Config.in.host
 create mode 100644 package/sentry-cli/sentry-cli.hash
 create mode 100644 package/sentry-cli/sentry-cli.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d59d538e42..9a2b10c4c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1422,6 +1422,7 @@ F:	package/python-schedule/
 F:	package/python-sentry-sdk/
 F:	package/python-websockets/
 F:	package/python-xlib/
+F:	package/sentry-cli/
 F:	package/unclutter-xfixes/
 
 N:	Joshua Henderson <joshua.henderson@microchip.com>
diff --git a/package/Config.in.host b/package/Config.in.host
index 243da8969f..58b600d948 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -74,6 +74,7 @@ menu "Host utilities"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/sdbusplus/Config.in.host"
+	source "package/sentry-cli/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
diff --git a/package/sentry-cli/Config.in.host b/package/sentry-cli/Config.in.host
new file mode 100644
index 0000000000..b71f7f2f9b
--- /dev/null
+++ b/package/sentry-cli/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_SENTRY_CLI
+	bool "sentry-cli"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  Official Sentry command line interface
+
+	  For managing debug information files and source maps.
+
+	  https://docs.sentry.io/cli/
diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
new file mode 100644
index 0000000000..3b0733a276
--- /dev/null
+++ b/package/sentry-cli/sentry-cli.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  5d0f7acf6a139d1c1716b9a8ff76c8bfaab09104ba663c957bb9a5dba2ffbabd  sentry-cli-1.57.0.tar.gz
+sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
new file mode 100644
index 0000000000..55bc03d1ec
--- /dev/null
+++ b/package/sentry-cli/sentry-cli.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# sentry-cli
+#
+################################################################################
+
+SENTRY_CLI_VERSION = 1.57.0
+SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
+SENTRY_CLI_LICENSE = BSD-3-clause
+SENTRY_CLI_LICENSE_FILES = LICENSE
+
+SENTRY_CLI_DEPENDENCIES = host-rustc
+
+HOST_SENTRY_CLI_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
+
+HOST_SENTRY_CLI_BIN_DIR = target/$(SENTRY_CLI_CARGO_BIN_SUBDIR)/
+
+HOST_SENTRY_CLI_CARGO_OPTS = \
+	$(if $(BR2_ENABLE_DEBUG),,--release) \
+	--manifest-path=$(@D)/Cargo.toml
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+SENTRY_CLI_CARGO_BIN_SUBDIR = debug
+else
+SENTRY_CLI_CARGO_OPTS += --release
+SENTRY_CLI_CARGO_BIN_SUBDIR = release
+endif
+
+define HOST_SENTRY_CLI_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(HOST_SENTRY_CLI_CARGO_ENV) \
+		cargo build $(HOST_SENTRY_CLI_CARGO_OPTS)
+endef
+
+define HOST_SENTRY_CLI_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/$(HOST_SENTRY_CLI_BIN_DIR)/sentry-cli \
+		$(HOST_DIR)/bin
+endef
+
+$(eval $(host-generic-package))
-- 
2.28.0
