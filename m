From: Tom Sparks <tom_a_sparks@yahoo.com.au>
Date: Sat,  8 Aug 2015 22:49:05 +1000
Subject: [Buildroot] [PATCH 1/1] ibrdtn: new package
Message-ID: <1439038145-10822-1-git-send-email-tom_a_sparks@yahoo.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tom Sparks <tom_a_sparks@yahoo.com.au>
---
 package/ibrdtn/Config.in | 15 +++++++++++++++
 package/ibrdtn/ibrdtn.mk | 30 ++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 package/ibrdtn/Config.in
 create mode 100644 package/ibrdtn/ibrdtn.mk

diff --git a/package/ibrdtn/Config.in b/package/ibrdtn/Config.in
new file mode 100644
index 0000000..407ee7b
--- /dev/null
+++ b/package/ibrdtn/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_IBRDTN
+	bool "ibrdtn"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_IBRCOMMON
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
diff --git a/package/ibrdtn/ibrdtn.mk b/package/ibrdtn/ibrdtn.mk
new file mode 100644
index 0000000..82b1914
--- /dev/null
+++ b/package/ibrdtn/ibrdtn.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# ibrdtn
+#
+################################################################################
+
+IBRDTN_VERSION = 1.0.1
+IBRDTN_SOURCE = ibrdtn-$(IBRDTN_VERSION).tar.gz
+IBRDTN_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases/
+IBRDTN_INSTALL_STAGING = YES
+IBRDTN_LICENSE = Apache-2.0
+IBRDTN_LICENSE_FILES = COPYING
+IBRDTN_CONF_OPTS = --with-compression
+IBRDTN_DEPENDENCIES = ibrcommon
+
+# While the configuration system uses autoconf, the Makefiles are
+# hand-written and do not use automake. Therefore, we have to hack
+# around their deficiencies by passing installation paths.
+IBRDTN_INSTALL_STAGING_OPTS = \
+	prefix=$(STAGING_DIR)/usr \
+	exec_prefix=$(STAGING_DIR)/usr  \
+	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib \
+	install
+
+IBRDTN_INSTALL_TARGET_OPTS = \
+	prefix=$(TARGET_DIR)/usr \
+	exec_prefix=$(TARGET_DIR)/usr \
+	install
+
+$(eval $(autotools-package))
\ No newline at end of file
-- 
1.9.1
