From: Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Sat, 20 Oct 2018 16:34:51 +0200
Subject: [Buildroot] [PATCH v8 4/4] package/clinfo: new package
In-Reply-To: <1540046091-13736-1-git-send-email-valentinkorenblit@gmail.com>
References: <1540046091-13736-1-git-send-email-valentinkorenblit@gmail.com>
Message-ID: <1540046091-13736-5-git-send-email-valentinkorenblit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This tool allows to verify if the OpenCL environment is set up correctly
and provides information related to the supported OpenCL platforms.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/clinfo/Config.in   |  9 +++++++++
 package/clinfo/clinfo.hash |  3 +++
 package/clinfo/clinfo.mk   | 23 +++++++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/clinfo/Config.in
 create mode 100644 package/clinfo/clinfo.hash
 create mode 100644 package/clinfo/clinfo.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ffcbc76..659fa2d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2116,6 +2116,7 @@ F:	package/tstools/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
+F:	package/clinfo/
 F:	package/libclc
 F:	package/llvm/
 
diff --git a/package/Config.in b/package/Config.in
index 8d53c72..18b6421 100644
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
index 0000000..279b5ac
--- /dev/null
+++ b/package/clinfo/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_CLINFO
+	bool "clinfo"
+	depends on BR2_PACKAGE_MESA3D_OPENCL
+	help
+	  clinfo is a simple command-line application that enumerates
+	  all possible (known) properties of the OpenCL platform and
+	  devices available on the system.
+
+	  https://github.com/Oblomov/clinfo
diff --git a/package/clinfo/clinfo.hash b/package/clinfo/clinfo.hash
new file mode 100644
index 0000000..1ba3481
--- /dev/null
+++ b/package/clinfo/clinfo.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256 64b02e68ccff3b95437bd0bd70dcb88438c58adec16a7145a5d4e5c26a898ccf clinfo-2.2.18.03.26.tar.gz
+sha256 a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499 legalcode.txt
diff --git a/package/clinfo/clinfo.mk b/package/clinfo/clinfo.mk
new file mode 100644
index 0000000..1477b76
--- /dev/null
+++ b/package/clinfo/clinfo.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# clinfo
+#
+################################################################################
+
+CLINFO_VERSION = 2.2.18.03.26
+CLINFO_SITE = $(call github,Oblomov,clinfo,$(CLINFO_VERSION))
+CLINFO_LICENSE = CC0-1.0
+CLINFO_LICENSE_FILES = legalcode.txt
+
+# libOpenCL is needed
+CLINFO_DEPENDENCIES = mesa3d
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
2.7.4
