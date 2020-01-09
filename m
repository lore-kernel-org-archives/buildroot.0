From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  9 Jan 2020 10:16:18 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/wireguard: change to the
 wireguard-tools package
In-Reply-To: <20200109091620.21008-1-peter@korsgaard.com>
References: <20200109091620.21008-1-peter@korsgaard.com>
Message-ID: <20200109091620.21008-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the kernel support for WireGuard getting mainlined, the upstream repo
has been split in a wireguard-tools repo for the userspace tooling and
wireguard-linux-compat for the kernel side (for 3.10+ legacy kernels).

So rename the package to wireguard-tools, use the new upstream and drop the
kernel module handling.

Also add Config.in.legacy handling for existing users.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
Changes since v1:
- Rename package to wireguard-tools
- Add Config.in.legacy handling

Config.in.legacy                              |  9 ++++
 DEVELOPERS                                    |  2 +-
 package/Config.in                             |  2 +-
 .../{wireguard => wireguard-tools}/Config.in  | 15 ++++---
 package/wireguard-tools/wireguard-tools.hash  |  4 ++
 package/wireguard-tools/wireguard-tools.mk    | 36 ++++++++++++++++
 package/wireguard/wireguard.hash              |  4 --
 package/wireguard/wireguard.mk                | 41 -------------------
 8 files changed, 58 insertions(+), 55 deletions(-)
 rename package/{wireguard => wireguard-tools}/Config.in (63%)
 create mode 100644 package/wireguard-tools/wireguard-tools.hash
 create mode 100644 package/wireguard-tools/wireguard-tools.mk
 delete mode 100644 package/wireguard/wireguard.hash
 delete mode 100644 package/wireguard/wireguard.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index c483ac3856..b9bb1aa57d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_WIREGUARD
+	bool "wireguard package renamed"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	select BR2_LEGACY
+	select BR2_PACKAGE_WIREGUARD_TOOLS
+	help
+	  The wireguard package has been renamed to wireguard-tools to
+	  match upstream.
+
 config BR2_PACKAGE_PERL_NET_PING
 	bool "perl-net-ping was removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 1f86c256a5..66dc7cf4c2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1945,7 +1945,7 @@ F:	package/python-websocket-client/
 F:	package/sedutil/
 F:	package/tpm2-totp/
 F:	package/triggerhappy/
-F:	package/wireguard/
+F:	package/wireguard-tools/
 F:	support/testing/tests/package/test_docker_compose.py
 
 N:	Peter Seiderer <ps.report@gmx.net>
diff --git a/package/Config.in b/package/Config.in
index 45935ce18e..170a1c986d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2176,7 +2176,7 @@ endif
 	source "package/wavemon/Config.in"
 	source "package/wget/Config.in"
 	source "package/whois/Config.in"
-	source "package/wireguard/Config.in"
+	source "package/wireguard-tools/Config.in"
 	source "package/wireless-regdb/Config.in"
 	source "package/wireless_tools/Config.in"
 	source "package/wireshark/Config.in"
diff --git a/package/wireguard/Config.in b/package/wireguard-tools/Config.in
similarity index 63%
rename from package/wireguard/Config.in
rename to package/wireguard-tools/Config.in
index fe92fd6cfc..bae8a9dc6e 100644
--- a/package/wireguard/Config.in
+++ b/package/wireguard-tools/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_WIREGUARD
-	bool "wireguard"
+config BR2_PACKAGE_WIREGUARD_TOOLS
+	bool "wireguard tools"
 	# kernel module requires 3.10+, userspace makes no sense without it
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	select BR2_PACKAGE_LIBMNL
@@ -11,13 +11,12 @@ config BR2_PACKAGE_WIREGUARD
 	  more performant than OpenVPN. WireGuard is designed as a
 	  general purpose VPN for running on embedded interfaces and
 	  super computers alike, fit for many different
-	  circumstances. Initially released for the Linux kernel, it
-	  plans to be cross-platform and widely deployable. It is
-	  currently under heavy development, but already it might be
-	  regarded as the most secure, easiest to use, and simplest
-	  VPN solution in the industry.
+	  circumstances.
+
+	  This package provides the userspace tooling to configure
+	  WireGuard tunnels.
 
 	  https://www.wireguard.com
 
-comment "wireguard needs a toolchain w/ headers >= 3.10"
+comment "wireguard-tools needs a toolchain w/ headers >= 3.10"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
diff --git a/package/wireguard-tools/wireguard-tools.hash b/package/wireguard-tools/wireguard-tools.hash
new file mode 100644
index 0000000000..b8b1dac1ac
--- /dev/null
+++ b/package/wireguard-tools/wireguard-tools.hash
@@ -0,0 +1,4 @@
+# https://lists.zx2c4.com/pipermail/wireguard/2020-January/004819.html
+sha256 547cd1c2f8dca904faac9e8d3964f1ef956c24bb12e3498da88dde95243c7f08  wireguard-tools-1.0.20200102.tar.xz
+# Locally calculated
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-tools/wireguard-tools.mk b/package/wireguard-tools/wireguard-tools.mk
new file mode 100644
index 0000000000..6fcfebf13a
--- /dev/null
+++ b/package/wireguard-tools/wireguard-tools.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# wireguard-tools
+#
+################################################################################
+
+WIREGUARD_TOOLS_VERSION = 1.0.20200102
+WIREGUARD_TOOLS_SITE = https://git.zx2c4.com/wireguard-tools/snapshot
+WIREGUARD_TOOLS_SOURCE = wireguard-tools-$(WIREGUARD_TOOLS_VERSION).tar.xz
+WIREGUARD_TOOLS_LICENSE = GPL-2.0
+WIREGUARD_TOOLS_LICENSE_FILES = COPYING
+WIREGUARD_TOOLS_DEPENDENCIES = host-pkgconf libmnl
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+WIREGUARD_TOOLS_MAKE_OPTS += WITH_SYSTEMDUNITS=yes
+else
+WIREGUARD_TOOLS_MAKE_OPTS += WITH_SYSTEMDUNITS=no
+endif
+
+ifeq ($(BR2_PACKAGE_BASH),y)
+WIREGUARD_TOOLS_MAKE_OPTS += WITH_BASHCOMPLETION=yes WITH_WGQUICK=yes
+else
+WIREGUARD_TOOLS_MAKE_OPTS += WITH_BASHCOMPLETION=no WITH_WGQUICK=no
+endif
+
+define WIREGUARD_TOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(WIREGUARD_TOOLS_MAKE_OPTS) \
+		-C $(@D)/src
+endef
+
+define WIREGUARD_TOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(WIREGUARD_TOOLS_MAKE_OPTS) \
+		-C $(@D)/src install DESTDIR=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
deleted file mode 100644
index 66ebf41dc6..0000000000
--- a/package/wireguard/wireguard.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2019-December/004764.html
-sha256 b0d718380f7a8822b2f12d75e462fa4eafa3a77871002981f367cd4fe2a1b071  WireGuard-0.0.20191212.tar.xz
-# Locally calculated
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
deleted file mode 100644
index 3c604b3014..0000000000
--- a/package/wireguard/wireguard.mk
+++ /dev/null
@@ -1,41 +0,0 @@
-################################################################################
-#
-# wireguard
-#
-################################################################################
-
-WIREGUARD_VERSION = 0.0.20191212
-WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
-WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
-WIREGUARD_LICENSE = GPL-2.0
-WIREGUARD_LICENSE_FILES = COPYING
-WIREGUARD_DEPENDENCIES = host-pkgconf libmnl
-
-ifeq ($(BR2_INIT_SYSTEMD),y)
-WIREGUARD_MAKE_OPTS += WITH_SYSTEMDUNITS=yes
-else
-WIREGUARD_MAKE_OPTS += WITH_SYSTEMDUNITS=no
-endif
-
-ifeq ($(BR2_PACKAGE_BASH),y)
-WIREGUARD_MAKE_OPTS += WITH_BASHCOMPLETION=yes WITH_WGQUICK=yes
-else
-WIREGUARD_MAKE_OPTS += WITH_BASHCOMPLETION=no WITH_WGQUICK=no
-endif
-
-define WIREGUARD_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(WIREGUARD_MAKE_OPTS) \
-		-C $(@D)/src/tools
-endef
-
-define WIREGUARD_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(WIREGUARD_MAKE_OPTS) \
-		-C $(@D)/src/tools install DESTDIR=$(TARGET_DIR)
-endef
-
-ifeq ($(BR2_LINUX_KERNEL),y)
-WIREGUARD_MODULE_SUBDIRS = src
-$(eval $(kernel-module))
-endif
-
-$(eval $(generic-package))
-- 
2.20.1
