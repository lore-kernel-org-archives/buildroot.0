From: Andrei Emeltchenko <Andrei.Emeltchenko.news@gmail.com>
Date: Thu, 25 Jan 2018 15:09:03 +0200
Subject: [Buildroot] [PATCH 1/1] package: Add thunderbolt-tools package
Message-ID: <20180125130903.9481-1-Andrei.Emeltchenko.news@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Andrei Emeltchenko <andrei.emeltchenko@intel.com>

Add package thunderbolt-tools to handle Thunderbolt devices.

Signed-off-by: Andrei Emeltchenko <andrei.emeltchenko@intel.com>
---
 package/Config.in                              |  1 +
 package/thunderbolt-tools/Config.in            | 11 +++++++++++
 package/thunderbolt-tools/thunderbolt-tools.mk | 14 ++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/thunderbolt-tools/Config.in
 create mode 100644 package/thunderbolt-tools/thunderbolt-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 00451f526d..d638ac3a72 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -505,6 +505,7 @@ endmenu
 	source "package/sunxi-mali/Config.in"
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
+	source "package/thunderbolt-tools/Config.in"
 	source "package/ti-gfx/Config.in"
 	source "package/ti-sgx-demos/Config.in"
 	source "package/ti-sgx-km/Config.in"
diff --git a/package/thunderbolt-tools/Config.in b/package/thunderbolt-tools/Config.in
new file mode 100644
index 0000000000..1057300772
--- /dev/null
+++ b/package/thunderbolt-tools/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_THUNDERBOLT_TOOLS
+	bool "thunderbolt-tools"
+#	select BR2_TOOLCHAIN_BUILDROOT_CXX
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	depends on BR2_PACKAGE_HAS_UDEV
+	help
+	  Thunderbolt tools for Linux
+
+comment "thunderbolt-tools package needs udev provided by systemd of eudev, C++"
+	depends on BR2_PACKAGE_HAS_UDEV
diff --git a/package/thunderbolt-tools/thunderbolt-tools.mk b/package/thunderbolt-tools/thunderbolt-tools.mk
new file mode 100644
index 0000000000..5fd469c4ef
--- /dev/null
+++ b/package/thunderbolt-tools/thunderbolt-tools.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# thunderbolt-tools
+#
+################################################################################
+
+THUNDERBOLT_TOOLS_VERSION = master
+THUNDERBOLT_TOOLS_SITE = https://github.com/01org/thunderbolt-software-user-space.git
+#THUNDERBOLT_TOOLS_SITE = $(call github,01org,thunderbolt-software-user-space,$(THUNDERBOLT_TOOLS_VERSION))
+THUNDERBOLT_TOOLS_SITE_METHOD = git
+
+THUNDERBOLT_TOOLS_DEPENDENCIES = host-pkgconf boost eudev
+
+$(eval $(cmake-package))
-- 
2.14.1
