From: David Pierret <david.pierret@smile.fr>
Date: Fri, 27 Mar 2020 18:40:35 +0100
Subject: [Buildroot] [v2 1/1] package/bat: new package
Message-ID: <20200327174035.11503-1-david.pierret@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bat is a cat(1) clone with syntax highlighting and Git integration.

This package need rust version 1.37.0 or later

Signed-off-by: David Pierret <david.pierret@smile.fr>

----
bat supports syntax highlighting for a large number of programming
and markup languages. He can communicates with git to show
modifications with respect to the index.
For conveignance use, bat can pipe its own output to less if the
output is too large for one screen.

v1 -> v2
Add selection of less out of busybox for command line option
compatibility
---
 DEVELOPERS            |  3 +++
 package/Config.in     |  1 +
 package/bat/Config.in | 13 +++++++++++++
 package/bat/bat.hash  |  4 ++++
 package/bat/bat.mk    | 39 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 60 insertions(+)
 create mode 100644 package/bat/Config.in
 create mode 100644 package/bat/bat.hash
 create mode 100644 package/bat/bat.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7cb61e2b98..3afa45fc7f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -688,6 +688,9 @@ F:	linux/linux-ext-ev3dev-linux-drivers.mk
 F:	package/brickd/
 F:	package/ev3dev-linux-drivers/
 
+N:	David Pierret <david.pierret@smile.fr>
+F:	package/bat/
+
 N:	Davide Viti <zinosat@tiscali.it>
 F:	package/flann/
 F:	package/python-paho-mqtt/
diff --git a/package/Config.in b/package/Config.in
index 7b73198d50..e0fc92c347 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2385,6 +2385,7 @@ menu "System tools"
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
index 0000000000..89711ac33b
--- /dev/null
+++ b/package/bat/bat.mk
@@ -0,0 +1,39 @@
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
+		 --bins \
+		 --$(BAT_CARGO_MODE) \
+		 --target=$(RUSTC_TARGET_NAME) \
+		 --manifest-path=$(@D)/Cargo.toml
+
+define BAT_BUILD_CMDS
+	# we need to use the 'env' command to set the CC_<target> variable since
+	# the rustc_target_name contain minus characters not allowed in bash.
+	env $(TARGET_MAKE_ENV) $(BAT_CARGO_ENV) \
+	CC_$(RUSTC_TARGET_NAME)=$(TARGET_CC) \
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
2.17.1
