From: Tom Sparks <tom_a_sparks@yahoo.com.au>
Date: Thu,  6 Aug 2015 22:50:24 +1000
Subject: [Buildroot] [PATCH 1/1] ibrdtn
Message-ID: <1438865424-5000-1-git-send-email-tom_a_sparks@yahoo.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tom Sparks <tom_a_sparks@yahoo.com.au>
---
 package/ibrcommon/Config.in    | 13 +++++++++++++
 package/ibrcommon/ibrcommon.mk | 32 ++++++++++++++++++++++++++++++++
 package/ibrdtn/Config.in       | 13 +++++++++++++
 package/ibrdtn/ibrdtn.mk       | 32 ++++++++++++++++++++++++++++++++
 package/ibrdtnd/Config.in      | 23 +++++++++++++++++++++++
 package/ibrdtnd/ibrdtnd.mk     | 32 ++++++++++++++++++++++++++++++++
 6 files changed, 145 insertions(+)
 create mode 100644 package/ibrcommon/Config.in
 create mode 100644 package/ibrcommon/ibrcommon.mk
 create mode 100644 package/ibrdtn/Config.in
 create mode 100644 package/ibrdtn/ibrdtn.mk
 create mode 100644 package/ibrdtnd/Config.in
 create mode 100644 package/ibrdtnd/ibrdtnd.mk

diff --git a/package/ibrcommon/Config.in b/package/ibrcommon/Config.in
new file mode 100644
index 0000000..c1d400b
--- /dev/null
+++ b/package/ibrcommon/Config.in
@@ -0,0 +1,13 @@
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
diff --git a/package/ibrcommon/ibrcommon.mk b/package/ibrcommon/ibrcommon.mk
new file mode 100644
index 0000000..3a67307
--- /dev/null
+++ b/package/ibrcommon/ibrcommon.mk
@@ -0,0 +1,32 @@
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
+IBRCOMMON_CONF_OPTS = --with-openssl --with-lowpan   --with-xml 
+IBRCOMMON_DEPENDENCIES = openssl libnl libxml2
+
+# While the configuration system uses autoconf, the Makefiles are
+# hand-written and do not use automake. Therefore, we have to hack
+# around their deficiencies by passing installation paths.
+IBRCOMMON_INSTALL_STAGING_OPTS = 			\
+	prefix=$(STAGING_DIR)/usr 		\
+	exec_prefix=$(STAGING_DIR)/usr 		\
+	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib	\
+	install
+
+IBRCOMMON_INSTALL_TARGET_OPTS = 			\
+	prefix=$(TARGET_DIR)/usr 		\
+	exec_prefix=$(TARGET_DIR)/usr 		\
+	install
+
+
+
+$(eval $(autotools-package))
diff --git a/package/ibrdtn/Config.in b/package/ibrdtn/Config.in
new file mode 100644
index 0000000..9da2b54
--- /dev/null
+++ b/package/ibrdtn/Config.in
@@ -0,0 +1,13 @@
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
+
diff --git a/package/ibrdtn/ibrdtn.mk b/package/ibrdtn/ibrdtn.mk
new file mode 100644
index 0000000..744bd2f
--- /dev/null
+++ b/package/ibrdtn/ibrdtn.mk
@@ -0,0 +1,32 @@
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
+IBRDTN_INSTALL_STAGING_OPTS = 			\
+	prefix=$(STAGING_DIR)/usr 		\
+	exec_prefix=$(STAGING_DIR)/usr 		\
+	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib	\
+	install
+
+IBRDTN_INSTALL_TARGET_OPTS = 			\
+	prefix=$(TARGET_DIR)/usr 		\
+	exec_prefix=$(TARGET_DIR)/usr 		\
+	install
+
+
+
+$(eval $(autotools-package))
diff --git a/package/ibrdtnd/Config.in b/package/ibrdtnd/Config.in
new file mode 100644
index 0000000..ffc6e09
--- /dev/null
+++ b/package/ibrdtnd/Config.in
@@ -0,0 +1,23 @@
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
diff --git a/package/ibrdtnd/ibrdtnd.mk b/package/ibrdtnd/ibrdtnd.mk
new file mode 100644
index 0000000..d201787
--- /dev/null
+++ b/package/ibrdtnd/ibrdtnd.mk
@@ -0,0 +1,32 @@
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
+IBRDTND_CONF_OPTS =   --with-curl  --with-sqlite     --with-tls  
+IBRDTND_DEPENDENCIES = ibrdtn libdaemon libcurl sqlite openssl 
+
+# While the configuration system uses autoconf, the Makefiles are
+# hand-written and do not use automake. Therefore, we have to hack
+# around their deficiencies by passing installation paths.
+IBRDTND_INSTALL_STAGING_OPTS = 			\
+	prefix=$(STAGING_DIR)/usr 		\
+	exec_prefix=$(STAGING_DIR)/usr 		\
+	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib	\
+	install
+
+IBRDTND_INSTALL_TARGET_OPTS = 			\
+	prefix=$(TARGET_DIR)/usr 		\
+	exec_prefix=$(TARGET_DIR)/usr 		\
+	install
+
+
+
+$(eval $(autotools-package))
-- 
1.9.1
