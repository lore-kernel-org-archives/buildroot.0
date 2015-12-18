From: Abhishek Singh <Abhishek.Singh@imgtec.com>
Date: Fri, 18 Dec 2015 14:57:14 +0530
Subject: [Buildroot] [PATCH v4] cxxtest: new package
Message-ID: <1450430834-15568-1-git-send-email-Abhishek.Singh@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Reviewed-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Reviewed-by: Piotr Nakraszewicz <piotr.nakraszewicz@imgtec.com>
Reviewed-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Abhishek Singh <Abhishek.Singh@imgtec.com>
---
changes v3 -> v4:
	- remove CXXTEST_SOURCE (suggested by Jerzy Grzegorek)

changes v2 -> v3:
	- change source download path (suggested by Yann E. Morin)
	- modify comment (suggested by Yann E. Morin)

changes v1 -> v2:
	- remove dependency on host-python (suggested by Thomas Petazzoni)
	- add comments in mk file (suggested by Thomas Petazzoni)
---
 package/Config.in            |  1 +
 package/cxxtest/Config.in    | 10 ++++++++++
 package/cxxtest/cxxtest.hash |  2 ++
 package/cxxtest/cxxtest.mk   | 30 ++++++++++++++++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 package/cxxtest/Config.in
 create mode 100644 package/cxxtest/cxxtest.hash
 create mode 100644 package/cxxtest/cxxtest.mk

diff --git a/package/Config.in b/package/Config.in
index 1eea89b..d9015c8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -118,6 +118,7 @@ menu "Development tools"
 	source "package/cmake/Config.in"
 	source "package/cppunit/Config.in"
 	source "package/cvs/Config.in"
+	source "package/cxxtest/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/diffutils/Config.in"
 	source "package/dos2unix/Config.in"
diff --git a/package/cxxtest/Config.in b/package/cxxtest/Config.in
new file mode 100644
index 0000000..7512e4b
--- /dev/null
+++ b/package/cxxtest/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_CXXTEST
+	bool "cxxtest"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  CxxTest is a unit testing framework for C++
+
+	  http://cxxtest.com/
+
+comment "cxxtest needs toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/cxxtest/cxxtest.hash b/package/cxxtest/cxxtest.hash
new file mode 100644
index 0000000..f552e80
--- /dev/null
+++ b/package/cxxtest/cxxtest.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	1c154fef91c65dbf1cd4519af7ade70a61d85a923b6e0c0b007dc7f4895cf7d8	cxxtest-4.4.tar.gz
diff --git a/package/cxxtest/cxxtest.mk b/package/cxxtest/cxxtest.mk
new file mode 100644
index 0000000..22ebd78
--- /dev/null
+++ b/package/cxxtest/cxxtest.mk
@@ -0,0 +1,30 @@
+#######################################################################################
+#
+# cxxtest
+#
+#######################################################################################
+
+CXXTEST_VERSION = 4.4
+CXXTEST_SITE = https://github.com/CxxTest/cxxtest/releases/download/$(CXXTEST_VERSION)
+CXXTEST_LICENSE = LGPLv3
+CXXTEST_LICENSE_FILES = COPYING
+CXXTEST_INSTALL_STAGING = YES
+CXXTEST_INSTALL_TARGET = NO
+CXXTEST_DEPENDENCIES = host-cxxtest
+HOST_CXXTEST_SETUP_TYPE = setuptools
+HOST_CXXTEST_SUBDIR = python
+
+# Copy CxxTest header files to staging directory
+define CXXTEST_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/cxxtest
+	cp $(@D)/cxxtest/* $(STAGING_DIR)/usr/include/cxxtest
+endef
+
+# CxxTest uses python infrastructure as the build system. It consists of two parts:
+# 1. cxxtestgen tool to process tests defined in header files to generate C++ source
+# files. cxxtestgen is built as a host package, so that it can be used natively.
+# 2. A set of header files which are installed in staging directory. This will be
+# used in cross-compiling test harness to generate executable which will run on target.
+
+$(eval $(generic-package))
+$(eval $(host-python-package))
-- 
2.6.2
