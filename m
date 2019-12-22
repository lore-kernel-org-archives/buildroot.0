From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 22 Dec 2019 14:23:14 +0100
Subject: [Buildroot] [PATCH] package/cctz: new package
Message-ID: <20191222132314.15130-1-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CCTZ is a C++ library for translating between absolute
and civil times using the rules of a time zone.

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/cctz/Config.in | 29 +++++++++++++++++++++++++++++
 package/cctz/cctz.hash |  3 +++
 package/cctz/cctz.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 61 insertions(+)
 create mode 100644 package/cctz/Config.in
 create mode 100644 package/cctz/cctz.hash
 create mode 100644 package/cctz/cctz.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d2089e2672..57fcab3ea7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -983,6 +983,7 @@ F:	configs/qemu_*
 N:	Gilles Talis <gilles.talis@gmail.com>
 F:	board/freescale/imx8mmevk/
 F:	configs/freescale_imx8mmevk_defconfig
+F:	package/cctz/
 F:	package/fdk-aac/
 F:	package/httping/
 F:	package/iozone/
diff --git a/package/Config.in b/package/Config.in
index 2bfec09702..3c8fc32dd9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1728,6 +1728,7 @@ menu "Other"
 	source "package/boost/Config.in"
 	source "package/c-capnproto/Config.in"
 	source "package/capnproto/Config.in"
+	source "package/cctz/Config.in"
 	source "package/clang/Config.in"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
diff --git a/package/cctz/Config.in b/package/cctz/Config.in
new file mode 100644
index 0000000000..73a0f9f7e7
--- /dev/null
+++ b/package/cctz/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_CCTZ
+	bool "cctz"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	select BR2_TARGET_TZ_INFO # runtime dependency
+	help
+	  CCTZ is a C++ library for translating between absolute
+	  and civil times using the rules of a time zone.
+
+	  https://github.com/google/cctz
+
+if BR2_PACKAGE_CCTZ
+
+config BR2_PACKAGE_CCTZ_INSTALL_TOOLS
+	bool "Install tools"
+	help
+	  This option allows installing CCTZ tools.
+
+config BR2_PACKAGE_CCTZ_INSTALL_EXAMPLES
+	bool "Install example programs"
+	help
+	  This option allows installing CCTZ example programs.
+
+endif
+
+comment "cctz needs a toolchain w/ C++, threads, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/cctz/cctz.hash b/package/cctz/cctz.hash
new file mode 100644
index 0000000000..fe8897c501
--- /dev/null
+++ b/package/cctz/cctz.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256 8615b20d4e33e02a271c3b93a3b208e3d7d5d66880f5f6208b03426e448f32db cctz-2.3.tar.gz
+sha256 c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747 LICENSE.txt
diff --git a/package/cctz/cctz.mk b/package/cctz/cctz.mk
new file mode 100644
index 0000000000..bcc80bad47
--- /dev/null
+++ b/package/cctz/cctz.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# cctz
+#
+################################################################################
+
+CCTZ_VERSION = 2.3
+CCTZ_SITE = $(call github,google,cctz,v$(CCTZ_VERSION))
+CCTZ_LICENSE = Apache-2.0
+CCTZ_LICENSE_FILES = LICENSE.txt
+CCTZ_INSTALL_STAGING = YES
+
+CCTZ_CONF_OPTS = -DBUILD_TESTING=OFF
+
+ifeq ($(BR2_PACKAGE_CCTZ_INSTALL_TOOLS),y)
+CCTZ_CONF_OPTS += -DBUILD_TOOLS=ON
+else
+CCTZ_CONF_OPTS += -DBUILD_TOOLS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_CCTZ_INSTALL_EXAMPLES),y)
+CCTZ_CONF_OPTS += -DBUILD_EXAMPLES=ON
+else
+CCTZ_CONF_OPTS += -DBUILD_EXAMPLES=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.17.1
