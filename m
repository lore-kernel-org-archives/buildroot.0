From: Tom Sparks <tom_a_sparks@yahoo.com.au>
Date: Sun,  9 Aug 2015 10:00:19 +1000
Subject: [Buildroot] [PATCH 1/1] ibrdtn-tools: new package
Message-ID: <1439078419-2828-1-git-send-email-tom_a_sparks@yahoo.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tom Sparks <tom_a_sparks@yahoo.com.au>
---
 package/ibrdtn-tools/Config.in       | 16 ++++++++++++++++
 package/ibrdtn-tools/ibrdtn-tools.mk | 30 ++++++++++++++++++++++++++++++
 package/ibrdtnd/Config.in            |  1 +
 3 files changed, 47 insertions(+)
 create mode 100644 package/ibrdtn-tools/Config.in
 create mode 100644 package/ibrdtn-tools/ibrdtn-tools.mk

diff --git a/package/ibrdtn-tools/Config.in b/package/ibrdtn-tools/Config.in
new file mode 100644
index 0000000..d7f2db1
--- /dev/null
+++ b/package/ibrdtn-tools/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_IBRDTN-TOOLS
+	bool "ibrdtn-tools"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_IBRDTND
+
+	help
+	  IBR-DTN is a small dtn application that supports:
+	  Bundle Protocol RFC 5050
+	  Bundle Security Protocol RFC 6257
+
+	  http://trac.ibr.cs.tu-bs.de/project-cm-2012-ibrdtn
+
+comment "ibrcommon needs a toolchain w/ C++, threads"
+        depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
\ No newline at end of file
diff --git a/package/ibrdtn-tools/ibrdtn-tools.mk b/package/ibrdtn-tools/ibrdtn-tools.mk
new file mode 100644
index 0000000..9eb1d38
--- /dev/null
+++ b/package/ibrdtn-tools/ibrdtn-tools.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# ibrdtn-tools
+#
+################################################################################
+
+IBRDTN-TOOLS_VERSION = 1.0.1
+IBRDTN-TOOLS_SOURCE = IBRDTN-TOOLS-$(IBRDTN-TOOLS_VERSION).tar.gz
+IBRDTN-TOOLS_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases/
+IBRDTN-TOOLS_INSTALL_STAGING = YES
+IBRDTN-TOOLS_LICENSE = Apache-2.0
+IBRDTN-TOOLS_LICENSE_FILES = COPYING
+IBRDTN-TOOLS_CONF_OPTS =
+IBRDTN-TOOLS_DEPENDENCIES = IBRDTN-TOOLS
+
+# While the configuration system uses autoconf, the Makefiles are
+# hand-written and do not use automake. Therefore, we have to hack
+# around their deficiencies by passing installation paths.
+IBRDTN-TOOLS_INSTALL_STAGING_OPTS = \
+	prefix=$(STAGING_DIR)/usr \
+	exec_prefix=$(STAGING_DIR)/usr  \
+	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib \
+	install
+
+IBRDTN-TOOLS_INSTALL_TARGET_OPTS =  \
+	prefix=$(TARGET_DIR)/usr \
+	exec_prefix=$(TARGET_DIR)/usr  \
+	install
+
+$(eval $(autotools-package))
\ No newline at end of file
diff --git a/package/ibrdtnd/Config.in b/package/ibrdtnd/Config.in
index 9cd55f3..37ba94d 100644
--- a/package/ibrdtnd/Config.in
+++ b/package/ibrdtnd/Config.in
@@ -19,6 +19,7 @@ if BR2_PACKAGE_IBRDTND
 
 source "package/ibrcommon/Config.in"
 source "package/ibrdtn/Config.in"
+source "package/ibrdtn-tools/Config.in"
 
 endif
 
-- 
1.9.1
