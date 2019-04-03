From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 22:24:46 +0200
Subject: [Buildroot] [git commit] package/bats-core: new package
Message-ID: <20190403202810.1945E8CA1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=157a9c431c8a8271dc6c68cacefdee22516d5a61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A bash-based automated testing system.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/bats-core/Config.in      | 11 +++++++++++
 package/bats-core/bats-core.hash |  5 +++++
 package/bats-core/bats-core.mk   | 16 ++++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4ffb473487..36e3ab20c8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1715,6 +1715,7 @@ F:	configs/orangepi_pc_defconfig
 F:	configs/pandaboard_defconfig
 F:	configs/roseapplepi_defconfig
 F:	configs/sheevaplug_defconfig
+F:	package/bats-core/
 F:	package/docker-compose/
 F:	package/dump1090/
 F:	package/flickcurl/
diff --git a/package/Config.in b/package/Config.in
index 6fd047ec8c..e5a93dba1f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -138,6 +138,7 @@ menu "Debugging, profiling and benchmark"
 endmenu
 
 menu "Development tools"
+	source "package/bats-core/Config.in"
 	source "package/binutils/Config.in"
 	source "package/bsdiff/Config.in"
 	source "package/bustle/Config.in"
diff --git a/package/bats-core/Config.in b/package/bats-core/Config.in
new file mode 100644
index 0000000000..73c38e5a04
--- /dev/null
+++ b/package/bats-core/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_BATS_CORE
+	bool "bats"
+	depends on BR2_PACKAGE_BASH # runtime
+	help
+	  Bats: Bash Automated Testing System
+
+	  Bats is a TAP-compliant testing framework for Bash. It
+	  provides a simple way to verify that the UNIX programs you
+	  write behave as expected.
+
+	  https://github.com/bats-core/bats-core
diff --git a/package/bats-core/bats-core.hash b/package/bats-core/bats-core.hash
new file mode 100644
index 0000000000..04e00ab601
--- /dev/null
+++ b/package/bats-core/bats-core.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256 855d8b8bed466bc505e61123d12885500ef6fcdb317ace1b668087364717ea82  bats-core-v1.1.0.tar.gz
+
+# License files
+sha256 55074b2b3b87809105034e1468e59076554d76a80c67bcc592000cc3d929852d  LICENSE.md
diff --git a/package/bats-core/bats-core.mk b/package/bats-core/bats-core.mk
new file mode 100644
index 0000000000..739e7fc1f0
--- /dev/null
+++ b/package/bats-core/bats-core.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# bats-core
+#
+################################################################################
+
+BATS_CORE_VERSION = v1.1.0
+BATS_CORE_SITE = $(call github,bats-core,bats-core,$(BATS_CORE_VERSION))
+BATS_CORE_LICENSE = MIT
+BATS_CORE_LICENSE_FILES = LICENSE.md
+
+define BATS_CORE_INSTALL_TARGET_CMDS
+	$(@D)/install.sh $(TARGET_DIR)/usr
+endef
+
+$(eval $(generic-package))
