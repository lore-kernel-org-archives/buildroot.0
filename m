From: Andrei Emeltchenko <Andrei.Emeltchenko.news@gmail.com>
Date: Fri, 26 Jan 2018 16:20:52 +0200
Subject: [Buildroot] [PATCH 1/1] thunderbolt-tools: new package
In-Reply-To: <20180125130903.9481-1-Andrei.Emeltchenko.news@gmail.com>
References: <20180125130903.9481-1-Andrei.Emeltchenko.news@gmail.com>
Message-ID: <20180126142052.26287-1-Andrei.Emeltchenko.news@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Andrei Emeltchenko <andrei.emeltchenko@intel.com>

Add package thunderbolt-tools to handle Thunderbolt devices.

Signed-off-by: Andrei Emeltchenko <andrei.emeltchenko@intel.com>
---
 DEVELOPERS                                       |  3 +++
 package/Config.in                                |  1 +
 package/thunderbolt-tools/Config.in              | 13 +++++++++++++
 package/thunderbolt-tools/thunderbolt-tools.hash |  2 ++
 package/thunderbolt-tools/thunderbolt-tools.mk   | 15 +++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/thunderbolt-tools/Config.in
 create mode 100644 package/thunderbolt-tools/thunderbolt-tools.hash
 create mode 100644 package/thunderbolt-tools/thunderbolt-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 73c0231bc0..822961a467 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1949,3 +1949,6 @@ F:	package/qjson/
 F:	package/quazip/
 F:	package/shapelib/
 F:	package/tinc/
+
+N:	Andrei Emeltchenko <andrei.emeltchenko@intel.com>
+F:	package/thunderbolt-tools/
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
index 0000000000..0187ee4569
--- /dev/null
+++ b/package/thunderbolt-tools/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_THUNDERBOLT_TOOLS
+	bool "thunderbolt-tools"
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Thunderbolt user space tools
+
+	  https://github.com/intel/thunderbolt-software-user-space
+
+comment "thunderbolt-tools package needs udev provided by systemd of eudev, C++"
+	depends on BR2_PACKAGE_HAS_UDEV
diff --git a/package/thunderbolt-tools/thunderbolt-tools.hash b/package/thunderbolt-tools/thunderbolt-tools.hash
new file mode 100644
index 0000000000..b1cfded05a
--- /dev/null
+++ b/package/thunderbolt-tools/thunderbolt-tools.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256 705f56b095a9764ca933f43ecf7629812976cb20600545ac9838730bd0ae6e2c thunderbolt-tools-8c82b2f84dfede86683873bc47a0b95714129a66.tar.gz
diff --git a/package/thunderbolt-tools/thunderbolt-tools.mk b/package/thunderbolt-tools/thunderbolt-tools.mk
new file mode 100644
index 0000000000..6bf7b7a9c7
--- /dev/null
+++ b/package/thunderbolt-tools/thunderbolt-tools.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# thunderbolt-tools
+#
+################################################################################
+
+THUNDERBOLT_TOOLS_VERSION = 8c82b2f84dfede86683873bc47a0b95714129a66
+THUNDERBOLT_TOOLS_SITE = https://github.com/01org/thunderbolt-software-user-space.git
+THUNDERBOLT_TOOLS_SITE = $(call github,intel,thunderbolt-software-user-space,$(THUNDERBOLT_TOOLS_VERSION))
+THUNDERBOLT_TOOLS_LICENSE = BSD-3-Clause
+THUNDERBOLT_TOOLS_LICENSE_FILES = COPYING
+
+THUNDERBOLT_TOOLS_DEPENDENCIES = host-pkgconf boost eudev
+
+$(eval $(cmake-package))
-- 
2.14.1
