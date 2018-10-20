From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 00:14:37 +0200
Subject: [Buildroot] [PATCH 6/6] package/clinfo: new package
In-Reply-To: <20181020221437.12687-1-thomas.petazzoni@bootlin.com>
References: <20181020221437.12687-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181020221437.12687-7-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Valentin Korenblit <valentinkorenblit@gmail.com>

This tool allows to verify if the OpenCL environment is set up correctly
and provides information related to the supported OpenCL platforms.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
[Thomas:
 - use the libopencl virtual package
 - add LICENSE to the license files]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/clinfo/Config.in   | 12 ++++++++++++
 package/clinfo/clinfo.hash |  4 ++++
 package/clinfo/clinfo.mk   | 21 +++++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/clinfo/Config.in
 create mode 100644 package/clinfo/clinfo.hash
 create mode 100644 package/clinfo/clinfo.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 61f3cac9e4..3827489321 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2120,6 +2120,7 @@ F:	package/tstools/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
+F:	package/clinfo/
 F:	package/libclc/
 F:	package/llvm/
 
diff --git a/package/Config.in b/package/Config.in
index 8d53c72138..18b6421e30 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -83,6 +83,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
 	source "package/cache-calibrator/Config.in"
+	source "package/clinfo/Config.in"
 	source "package/dhrystone/Config.in"
 	source "package/dieharder/Config.in"
 	source "package/dmalloc/Config.in"
diff --git a/package/clinfo/Config.in b/package/clinfo/Config.in
new file mode 100644
index 0000000000..3df4feeca2
--- /dev/null
+++ b/package/clinfo/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_CLINFO
+	bool "clinfo"
+	depends on BR2_PACKAGE_HAS_LIBOPENCL
+	help
+	  clinfo is a simple command-line application that enumerates
+	  all possible (known) properties of the OpenCL platform and
+	  devices available on the system.
+
+	  https://github.com/Oblomov/clinfo
+
+comment "clinfo needs an OpenCL provider"
+	depends on !BR2_PACKAGE_HAS_LIBOPENCL
diff --git a/package/clinfo/clinfo.hash b/package/clinfo/clinfo.hash
new file mode 100644
index 0000000000..d5766e6322
--- /dev/null
+++ b/package/clinfo/clinfo.hash
@@ -0,0 +1,4 @@
+# locally calculated
+sha256 64b02e68ccff3b95437bd0bd70dcb88438c58adec16a7145a5d4e5c26a898ccf clinfo-2.2.18.03.26.tar.gz
+sha256 a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499 legalcode.txt
+sha256 2a7a9321be169ea6edbc6b1010e8f7bb0f4c1482a2f65c34a49e9719f129b79a LICENSE
diff --git a/package/clinfo/clinfo.mk b/package/clinfo/clinfo.mk
new file mode 100644
index 0000000000..cf08692316
--- /dev/null
+++ b/package/clinfo/clinfo.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# clinfo
+#
+################################################################################
+
+CLINFO_VERSION = 2.2.18.03.26
+CLINFO_SITE = $(call github,Oblomov,clinfo,$(CLINFO_VERSION))
+CLINFO_LICENSE = CC0-1.0
+CLINFO_LICENSE_FILES = legalcode.txt LICENSE
+CLINFO_DEPENDENCIES = libopencl
+
+define CLINFO_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define CLINFO_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/clinfo $(TARGET_DIR)/usr/bin/clinfo
+endef
+
+$(eval $(generic-package))
-- 
2.14.4
