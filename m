From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Mon,  6 Jul 2020 05:17:15 -0600
Subject: [Buildroot] [PATCH 1/1] package/cli11: new package
Message-ID: <20200706111715.46462-1-aleksandr.o.makarov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CLI11 is a command line parser for C++11 and beyond
that provides a rich feature set with a simple and
intuitive interface.

https://github.com/CLIUtils/CLI11

Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
---
 package/Config.in        |  1 +
 package/cli11/Config.in  | 26 ++++++++++++++++++++++++++
 package/cli11/cli11.hash |  3 +++
 package/cli11/cli11.mk   | 22 ++++++++++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 package/cli11/Config.in
 create mode 100644 package/cli11/cli11.hash
 create mode 100644 package/cli11/cli11.mk

diff --git a/package/Config.in b/package/Config.in
index 6a34a895af..940bd1542f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1914,6 +1914,7 @@ endmenu
 
 menu "Text and terminal handling"
 	source "package/augeas/Config.in"
+	source "package/cli11/Config.in"
 	source "package/enchant/Config.in"
 	source "package/fmt/Config.in"
 	source "package/fstrcmp/Config.in"
diff --git a/package/cli11/Config.in b/package/cli11/Config.in
new file mode 100644
index 0000000000..77619a1366
--- /dev/null
+++ b/package/cli11/Config.in
@@ -0,0 +1,26 @@
+comment "cli11 needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
+config BR2_PACKAGE_CLI11
+	bool "CLI11"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	help
+	  CLI11 is a command line parser for C++11 and beyond that
+	  provides a rich feature set with a simple and intuitive
+	  interface.
+
+	  https://github.com/CLIUtils/CLI11
+
+if BR2_PACKAGE_CLI11
+
+config BR2_PACKAGE_CLI11_SINGLE_FILE
+	bool "generate single header"
+	select BR2_PACKAGE_HOST_PYTHON
+	help
+	  Generate a single header file.
+
+endif # BR2_PACKAGE_CLI11
diff --git a/package/cli11/cli11.hash b/package/cli11/cli11.hash
new file mode 100644
index 0000000000..2781098bb7
--- /dev/null
+++ b/package/cli11/cli11.hash
@@ -0,0 +1,3 @@
+sha256  c780cf8cf3ba5ec2648a7eeb20a47e274493258f38a9b417628e0576f473a50b  cli11-1.9.1.tar.gz
+sha256  51c69badd1cd4ffb036fb2a2efc4d7db8dd8c89905526e7193d57912968efae1  LICENSE
+
diff --git a/package/cli11/cli11.mk b/package/cli11/cli11.mk
new file mode 100644
index 0000000000..1ada08127f
--- /dev/null
+++ b/package/cli11/cli11.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# cli11
+#
+################################################################################
+
+CLI11_VERSION = 1.9.1
+CLI11_SITE = $(call github,CLIUtils,CLI11,v$(CLI11_VERSION))
+CLI11_LICENSE = BSD-3-Clause
+CLI11_LICENSE_FILES = LICENCE
+CLI11_INSTALL_STAGING = YES
+CLI11_INSTALL_TARGET = NO
+CLI11_CONF_OPTS = -DCLI11_BUILD_EXAMPLES=OFF \
+                  -DCLI11_BUILD_DOCS=OFF
+
+ifeq ($(BR2_PACKAGE_CLI11_SINGLE_FILE),y)
+CLI11_CONF_OPTS += -DCLI11_SINGLE_FILE=ON \
+                   -DCLI11_INSTALL=OFF
+CLI11_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
+endif
+
+$(eval $(cmake-package))
-- 
2.26.0
