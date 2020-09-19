From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 22:36:18 +0200
Subject: [Buildroot] [git commit] package/sentry-cli: new package
Message-ID: <20200919203432.DD2F088FE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28c28ba303ee14bfeb6b1b25c300f5bc03d771f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Tested-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in.host             |  1 +
 package/sentry-cli/Config.in.host  | 10 ++++++++++
 package/sentry-cli/sentry-cli.hash |  3 +++
 package/sentry-cli/sentry-cli.mk   | 30 ++++++++++++++++++++++++++++++
 5 files changed, 45 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5fb5127573..fd839c8f63 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1423,6 +1423,7 @@ F:	package/python-schedule/
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
index 0000000000..3124015367
--- /dev/null
+++ b/package/sentry-cli/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_SENTRY_CLI
+	bool "host sentry-cli"
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
index 0000000000..5f60d27366
--- /dev/null
+++ b/package/sentry-cli/sentry-cli.mk
@@ -0,0 +1,30 @@
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
+HOST_SENTRY_CLI_CARGO_OPTS = \
+	--release \
+	--manifest-path=$(@D)/Cargo.toml
+
+define HOST_SENTRY_CLI_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(HOST_SENTRY_CLI_CARGO_ENV) \
+		cargo build $(HOST_SENTRY_CLI_CARGO_OPTS)
+endef
+
+define HOST_SENTRY_CLI_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/target/release/sentry-cli \
+		$(HOST_DIR)/bin/sentry-cli
+endef
+
+$(eval $(host-generic-package))
