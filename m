From: Leach, Daniel J. <dleach@belcan.com>
Date: Mon, 18 Feb 2019 19:19:13 +0000
Subject: [Buildroot] [PATCH 1/1] dacapo: new package
Message-ID: <7B9EA298F6C566489E909E1B85615FB80186965A13@AWHMBX02.belcan.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The DaCapo benchmark suite is intended as a tool for Java benchmarking
by the programming language, memory management and computer architecture
communities.

Depends on the OpenJDK package for Java runtime environment.

Signed-off-by: Daniel J. Leach <dleach@belcan.com>
---
This package depends on openjdk v7 (https://patchwork.ozlabs.org/patch/1040100/) and therefore openjdk-bin v6 (https://patchwork.ozlabs.org/patch/1039292/)

 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/dacapo/Config.in   | 12 ++++++++++++
 package/dacapo/dacapo.hash |  3 +++
 package/dacapo/dacapo.mk   | 21 +++++++++++++++++++++
 5 files changed, 38 insertions(+)
 create mode 100644 package/dacapo/Config.in
 create mode 100644 package/dacapo/dacapo.hash
 create mode 100644 package/dacapo/dacapo.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index baa325eead..a64a671b56 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1405,6 +1405,7 @@ F:	package/checksec/
 F:	package/cgroupfs-mount/
 F:	package/crda/
 F:	package/cunit/
+F:	package/dacapo
 F:	package/devmem2/
 F:	package/dnsmasq/
 F:	package/dosfstools/
diff --git a/package/Config.in b/package/Config.in
index e150e32563..86df6352cb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -83,6 +83,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/bonnie/Config.in"
 	source "package/cache-calibrator/Config.in"
 	source "package/clinfo/Config.in"
+	source "package/dacapo/Config.in"
 	source "package/dhrystone/Config.in"
 	source "package/dieharder/Config.in"
 	source "package/dmalloc/Config.in"
diff --git a/package/dacapo/Config.in b/package/dacapo/Config.in
new file mode 100644
index 0000000000..02dcab9e72
--- /dev/null
+++ b/package/dacapo/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_DACAPO
+	bool "dacapo"
+	depends on BR2_PACKAGE_OPENJDK
+	help
+	  The DaCapo benchmark suite is intended as a tool for Java
+	  benchmarking by the programming language, memory
+	  management and computer architecture communities.
+
+	  http://dacapobench.org/
+
+comment "dacapo needs OpenJDK"
+	depends on !BR2_PACKAGE_OPENJDK
diff --git a/package/dacapo/dacapo.hash b/package/dacapo/dacapo.hash
new file mode 100644
index 0000000000..ca7ad46383
--- /dev/null
+++ b/package/dacapo/dacapo.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 be3db084adcb2867760e1197b3ccf541c3213d918daa19386d8e236648d24be8  dacapo-9.12-MR1-bach.jar
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/dacapo/dacapo.mk b/package/dacapo/dacapo.mk
new file mode 100644
index 0000000000..32d0cc0701
--- /dev/null
+++ b/package/dacapo/dacapo.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# dacapo
+#
+################################################################################
+
+DACAPO_VERSION = 9.12-MR1-bach
+DACAPO_SOURCE = dacapo-$(DACAPO_VERSION).jar
+DACAPO_SITE = http://sourceforge.net/projects/dacapobench/files/9.12-bach-MR1
+DACAPO_LICENSE = Apache-2.0
+DACAPO_LICENSE_FILES = LICENSE
+
+define DACAPO_EXTRACT_CMDS
+	unzip $(DACAPO_DL_DIR)/$(DACAPO_SOURCE) LICENSE -d $(@D)
+endef
+
+define DACAPO_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(DACAPO_DL_DIR)/$(DACAPO_SOURCE) $(TARGET_DIR)/usr/bin/
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
