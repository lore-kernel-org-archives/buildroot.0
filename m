From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 27 Jul 2020 16:09:22 +0200
Subject: [Buildroot] [PATCHv3] package/bat: new package
Message-ID: <20200727140922.2614959-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: David Pierret <david.pierret@smile.fr>

bat is a cat(1) clone with syntax highlighting and Git integration.

This package need rust version 1.37.0 or later

Using the Aarch64 ARM toolchain that use the prefix
"aarch64-none-linux-gnu-", we need to set CC_aarch64_unknown_linux_gnu
in the environment to provide the right toolchain prefix.

Otherwise the build fail because rust use aarch64-unknown-linux-gnu as
default toolchain prefix.

Since we set CC_aarch64_unknown_linux_gnu, convert RUSTC_TARGET_NAME
aarch64-unknown-linux-gnu to aarch64_unknown_linux_gnu since bash
doesn't allow to minus characters in environement variables.

See for all supported toolchain prefix:
https://github.com/rust-lang/rust/blob/52d2c7ac948d6abdc18eb9e05a53d03ddcaffd98/src/librustc_target/spec/mod.rs#L492

Signed-off-by: David Pierret <david.pierret@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Romain: Use CC_$(RUSTC_TARGET_NAME)]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
bat supports syntax highlighting for a large number of programming
and markup languages. He can communicates with git to show
modifications with respect to the index.
For conveignance use, bat can pipe its own output to less if the
output is too large for one screen.

v3: remove "env" and use CC_$(subst -,_,$(RUSTC_TARGET_NAME))
    instead of CC_$(RUSTC_TARGET_NAME)

v1 -> v2
Add selection of less out of busybox for command line option
compatibility
---
 DEVELOPERS            |  3 +++
 package/Config.in     |  1 +
 package/bat/Config.in | 13 +++++++++++++
 package/bat/bat.hash  |  4 ++++
 package/bat/bat.mk    | 37 +++++++++++++++++++++++++++++++++++++
 5 files changed, 58 insertions(+)
 create mode 100644 package/bat/Config.in
 create mode 100644 package/bat/bat.hash
 create mode 100644 package/bat/bat.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ee840dbb8b..62af154af9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -680,6 +680,9 @@ F:	linux/linux-ext-ev3dev-linux-drivers.mk
 F:	package/brickd/
 F:	package/ev3dev-linux-drivers/
 
+N:	David Pierret <david.pierret@smile.fr>
+F:	package/bat/
+
 N:	Davide Viti <zinosat@gmail.com>
 F:	board/friendlyarm/nanopi-r1/
 F:	configs/nanopi_r1_defconfig
diff --git a/package/Config.in b/package/Config.in
index 5c30d27b7a..d713c73092 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2427,6 +2427,7 @@ menu "System tools"
 endmenu
 
 menu "Text editors and viewers"
+	source "package/bat/Config.in"
 	source "package/ed/Config.in"
 	source "package/joe/Config.in"
 	source "package/less/Config.in"
diff --git a/package/bat/Config.in b/package/bat/Config.in
new file mode 100644
index 0000000000..33a33673a8
--- /dev/null
+++ b/package/bat/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_BAT
+	bool "bat"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	# we need a full version of less
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	# less needs ncurses
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_LESS
+	help
+	  A cat(1) clone with syntax highlighting and Git integration.
+
+	  https://github.com/sharkdp/bat
diff --git a/package/bat/bat.hash b/package/bat/bat.hash
new file mode 100644
index 0000000000..14438b8a6f
--- /dev/null
+++ b/package/bat/bat.hash
@@ -0,0 +1,4 @@
+# Locally generated
+sha256 f4aee370013e2a3bc84c405738ed0ab6e334d3a9f22c18031a7ea008cd5abd2a  bat-0.13.0.tar.gz
+sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
+sha256 dc931b3f4376dc2b12486ded9f51487719099074587d757ea6125bb59deeb221  LICENSE-MIT
diff --git a/package/bat/bat.mk b/package/bat/bat.mk
new file mode 100644
index 0000000000..994a268bf6
--- /dev/null
+++ b/package/bat/bat.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# bat
+#
+################################################################################
+
+BAT_VERSION = 0.13.0
+BAT_SITE = $(call github,sharkdp,bat,v$(BAT_VERSION))
+BAT_LICENSE = Apache-2.0 or MIT
+BAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+BAT_DEPENDENCIES = host-rustc
+
+BAT_CFLAGS = $(TARGET_CFLAGS)
+
+BAT_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
+BAT_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
+
+BAT_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(BAT_CARGO_MODE)
+
+BAT_CARGO_OPTS = \
+	 --bins \
+	 --$(BAT_CARGO_MODE) \
+	 --target=$(RUSTC_TARGET_NAME) \
+	 --manifest-path=$(@D)/Cargo.toml
+
+define BAT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(BAT_CARGO_ENV) \
+	CC_$(subst -,_,$(RUSTC_TARGET_NAME))=$(TARGET_CC) \
+		cargo build $(BAT_CARGO_OPTS)
+endef
+
+define BAT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/$(BAT_BIN_DIR)/bat \
+		$(TARGET_DIR)/usr/bin/bat
+endef
+
+$(eval $(generic-package))
-- 
2.25.4
