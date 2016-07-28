From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jul 2016 23:28:02 +0200
Subject: [Buildroot] [git commit] kmsxx: new package
Message-ID: <20160728212806.C6B018225E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93811a2b8a5efa43754e26a4a44f463cdbd9f1b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

KMS++ is a suite of library and test tools to interact with KMS drivers in
the linux kernel.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
[Thomas:
 - rename prompt to kms++, suggested by Yann E. Morin
 - fixup the thread dependency comment
 - remove the mention of the python wrapper in the Config.in help
   text, since they are not installed
 - fix the Config.in comment to mention the C++ and gcc >= 4.8
   dependencies
 - use = instead of += when appropriate
 - use a loop to install the test programs
 - use a loop to install the libraries
 - add installation to staging as well, both the libraries and header
   files
 - add missing dependency on host-pkgconf
 - add hash file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |  1 +
 package/kmsxx/Config.in  | 25 +++++++++++++++++++++++++
 package/kmsxx/kmsxx.hash |  2 ++
 package/kmsxx/kmsxx.mk   | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 76 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f0180cc..0eaeb1b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -941,6 +941,7 @@ menu "Graphics"
 	source "package/imlib2/Config.in"
 	source "package/jasper/Config.in"
 	source "package/jpeg/Config.in"
+	source "package/kmsxx/Config.in"
 	source "package/lcms2/Config.in"
 	source "package/lesstif/Config.in"
 	source "package/libart/Config.in"
diff --git a/package/kmsxx/Config.in b/package/kmsxx/Config.in
new file mode 100644
index 0000000..a2143a9
--- /dev/null
+++ b/package/kmsxx/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_KMSXX
+	bool "kms++"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	select BR2_PACKAGE_LIBDRM
+	help
+	  libkms++ is a C++11 library for kernel mode setting.
+
+	  Also included are simple test tools for KMS.
+
+	  https://github.com/tomba/kmsxx
+
+if BR2_PACKAGE_KMSXX
+
+config BR2_PACKAGE_KMSXX_INSTALL_TESTS
+	bool "Install test programs"
+	help
+	  This option allows to install the kmsxx test programs.
+
+endif
+
+comment "kms++ needs a toolchain w/ threads, C++, gcc >= 4.8"
+        depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/kmsxx/kmsxx.hash b/package/kmsxx/kmsxx.hash
new file mode 100644
index 0000000..4615a65
--- /dev/null
+++ b/package/kmsxx/kmsxx.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 62bd9e8c9686e5624ebeba27234cae956eeec7830a742563f051ee4a2fe522c7  kmsxx-a706f157b86e90696808025db01de99646d51a77.tar.gz
diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
new file mode 100644
index 0000000..d49ec8f
--- /dev/null
+++ b/package/kmsxx/kmsxx.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# kmsxx
+#
+################################################################################
+
+KMSXX_VERSION = a706f157b86e90696808025db01de99646d51a77
+KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
+KMSXX_LICENSE = MPLv2.0
+KMSXX_LICENSE_FILES = LICENSE
+KMSXX_INSTALL_STAGING = YES
+KMSXX_DEPENDENCIES = libdrm host-pkgconf
+KMSXX_CONF_OPTS = -DKMSXX_ENABLE_PYTHON=OFF
+
+ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
+KMSXX_TESTS = \
+	fbtestpat kmsblank kmscapture \
+	kmsprint kmsview testpat wbcap \
+	wbm2m
+
+define KMSXX_INSTALL_TARGET_TESTS
+	$(foreach t,$(KMSXX_TESTS),\
+		$(INSTALL) -D -m 0755 $(@D)/bin/$(t) \
+			$(TARGET_DIR)/usr/bin/$(t)
+	)
+endef
+endif
+
+KMSXX_LIBS = kms++ kms++util
+
+define KMSXX_INSTALL_TARGET_CMDS
+	$(foreach l,$(KMSXX_LIBS),\
+		$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).so \
+			$(TARGET_DIR)/usr/lib/lib$(l).so
+	)
+	$(KMSXX_INSTALL_TARGET_TESTS)
+endef
+
+define KMSXX_INSTALL_STAGING_CMDS
+	$(foreach l,$(KMSXX_LIBS),\
+		$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).so \
+			$(STAGING_DIR)/usr/lib/lib$(l).so ; \
+		mkdir -p $(STAGING_DIR)/usr/include/$(l) ; \
+		cp -dpfr $(@D)/$(l)/inc/$(l)/* $(STAGING_DIR)/usr/include/$(l)/
+	)
+endef
+
+$(eval $(cmake-package))
