From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Thu, 29 Mar 2018 13:33:46 +0200
Subject: [Buildroot] [PATCH v4 11/11] package/clinfo: new package
In-Reply-To: <20180329113346.10367-1-valentin.korenblit@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
Message-ID: <20180329113346.10367-12-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This tool allows to verify if the OpenCL environment is set up correctly and
output information related to the supported OpenCL platforms.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/clinfo/Config.in   |  7 +++++++
 package/clinfo/clinfo.hash |  2 ++
 package/clinfo/clinfo.mk   | 23 +++++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/clinfo/Config.in
 create mode 100644 package/clinfo/clinfo.hash
 create mode 100644 package/clinfo/clinfo.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6bcafb6d2a..adedae9219 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1860,6 +1860,7 @@ F:	package/tstools/
 
 N:	Valentin Korenblit <valentin.korenblit@smile.fr>
 F:	package/clang/
+F:	package/clinfo/
 F:	package/libclc/
 F:	package/llvm/
 
diff --git a/package/Config.in b/package/Config.in
index bc2228ed17..9d529b4a4e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1478,6 +1478,7 @@ menu "Other"
 	source "package/clang/Config.in"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
+	source "package/clinfo/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
diff --git a/package/clinfo/Config.in b/package/clinfo/Config.in
new file mode 100644
index 0000000000..ce6c8bccae
--- /dev/null
+++ b/package/clinfo/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CLINFO
+	bool "clinfo"
+	depends on BR2_PACKAGE_MESA3D_OPENCL
+	help
+	  clinfo is a simple command-line application that enumerates
+	  all possible (known) properties of the OpenCL platform and
+	  devices available on the system.
diff --git a/package/clinfo/clinfo.hash b/package/clinfo/clinfo.hash
new file mode 100644
index 0000000000..e1c10afc9e
--- /dev/null
+++ b/package/clinfo/clinfo.hash
@@ -0,0 +1,2 @@
+# locally calculated
+sha256 64b02e68ccff3b95437bd0bd70dcb88438c58adec16a7145a5d4e5c26a898ccf clinfo-2.2.18.03.26.tar.gz
diff --git a/package/clinfo/clinfo.mk b/package/clinfo/clinfo.mk
new file mode 100644
index 0000000000..04000247bc
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
+#libOpenCL is needed
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
2.14.3
