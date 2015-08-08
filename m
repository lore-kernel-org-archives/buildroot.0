From: Tom Sparks <tom_a_sparks@yahoo.com.au>
Date: Sat,  8 Aug 2015 23:07:41 +1000
Subject: [Buildroot] [PATCH 1/2] ibrdtnd: new package
Message-ID: <1439039262-11803-1-git-send-email-tom_a_sparks@yahoo.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tom Sparks <tom_a_sparks@yahoo.com.au>
---
 package/ibrdtnd/Config.in  | 27 +++++++++++++++++++++++++++
 package/ibrdtnd/ibrdtnd.mk | 30 ++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 package/ibrdtnd/Config.in
 create mode 100644 package/ibrdtnd/ibrdtnd.mk

diff --git a/package/ibrdtnd/Config.in b/package/ibrdtnd/Config.in
new file mode 100644
index 0000000..9cd55f3
--- /dev/null
+++ b/package/ibrdtnd/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_IBRDTND
+	bool "ibrdtnd"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_IBRDTN
+	select BR2_PACKAGE_LIBDAEMON
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_OPENSSL
+
+	help
+	  IBR-DTN is a small dtn application that supports:
+	  Bundle Protocol RFC 5050
+	  Bundle Security Protocol RFC 6257
+
+	  http://trac.ibr.cs.tu-bs.de/project-cm-2012-ibrdtn
+
+if BR2_PACKAGE_IBRDTND
+
+source "package/ibrcommon/Config.in"
+source "package/ibrdtn/Config.in"
+
+endif
+
+comment "ibrcommon needs a toolchain w/ C++, threads"
+        depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
\ No newline at end of file
diff --git a/package/ibrdtnd/ibrdtnd.mk b/package/ibrdtnd/ibrdtnd.mk
new file mode 100644
index 0000000..91a1de0
--- /dev/null
+++ b/package/ibrdtnd/ibrdtnd.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# ibrdtnd
+#
+################################################################################
+
+IBRDTND_VERSION = 1.0.1
+IBRDTND_SOURCE = ibrdtnd-$(IBRDTND_VERSION).tar.gz
+IBRDTND_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases/
+IBRDTND_INSTALL_STAGING = YES
+IBRDTND_LICENSE = Apache-2.0
+IBRDTND_LICENSE_FILES = COPYING
+IBRDTND_CONF_OPTS = --with-curl --with-sqlite --with-tls  
+IBRDTND_DEPENDENCIES = ibrdtn libdaemon libcurl sqlite openssl 
+
+# While the configuration system uses autoconf, the Makefiles are
+# hand-written and do not use automake. Therefore, we have to hack
+# around their deficiencies by passing installation paths.
+IBRDTND_INSTALL_STAGING_OPTS = \
+	prefix=$(STAGING_DIR)/usr \
+	exec_prefix=$(STAGING_DIR)/usr  \
+	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib \
+	install
+
+IBRDTND_INSTALL_TARGET_OPTS =  \
+	prefix=$(TARGET_DIR)/usr \
+	exec_prefix=$(TARGET_DIR)/usr  \
+	install
+
+$(eval $(autotools-package))
\ No newline at end of file
-- 
1.9.1
