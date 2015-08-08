From: Tom Sparks <tom_a_sparks@yahoo.com.au>
Date: Sat,  8 Aug 2015 22:42:14 +1000
Subject: [Buildroot] [PATCH 1/1] ibrcommon: new package
Message-ID: <1439037734-10302-1-git-send-email-tom_a_sparks@yahoo.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tom Sparks <tom_a_sparks@yahoo.com.au>
---
 package/ibrcommon/Config.in    | 17 +++++++++++++++++
 package/ibrcommon/ibrcommon.mk | 30 ++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 package/ibrcommon/Config.in
 create mode 100644 package/ibrcommon/ibrcommon.mk

diff --git a/package/ibrcommon/Config.in b/package/ibrcommon/Config.in
new file mode 100644
index 0000000..32b350d
--- /dev/null
+++ b/package/ibrcommon/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_IBRCOMMON
+	bool "ibrcommon"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_LIBXML2
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
diff --git a/package/ibrcommon/ibrcommon.mk b/package/ibrcommon/ibrcommon.mk
new file mode 100644
index 0000000..b5af083
--- /dev/null
+++ b/package/ibrcommon/ibrcommon.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# ibrcommon
+#
+################################################################################
+
+IBRCOMMON_VERSION = 1.0.1
+IBRCOMMON_SOURCE = ibrcommon-$(IBRCOMMON_VERSION).tar.gz
+IBRCOMMON_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases/
+IBRCOMMON_INSTALL_STAGING = YES
+IBRCOMMON_LICENSE = Apache-2.0
+IBRCOMMON_LICENSE_FILES = COPYING
+IBRCOMMON_CONF_OPTS = --with-openssl --with-lowpan --with-xml 
+IBRCOMMON_DEPENDENCIES = openssl libnl libxml2
+
+# While the configuration system uses autoconf, the Makefiles are
+# hand-written and do not use automake. Therefore, we have to hack
+# around their deficiencies by passing installation paths.
+IBRCOMMON_INSTALL_STAGING_OPTS = \
+	prefix=$(STAGING_DIR)/usr \
+	exec_prefix=$(STAGING_DIR)/usr \
+	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib \
+	install
+
+IBRCOMMON_INSTALL_TARGET_OPTS = \
+	prefix=$(TARGET_DIR)/usr \
+	exec_prefix=$(TARGET_DIR)/usr \
+	install
+
+$(eval $(autotools-package))
\ No newline at end of file
-- 
1.9.1
