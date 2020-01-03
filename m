From: Philippe Reynes <philippe.reynes@softathome.com>
Date: Fri,  3 Jan 2020 16:16:57 +0100
Subject: [Buildroot] [PATCH] package/ibm-sw-tpm2: new package
Message-ID: <1578064617-24787-1-git-send-email-philippe.reynes@softathome.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This project is an implementation of the TCG TPM 2.0
specification. It is based on the TPM specification
Parts 3 and 4 source code donated by Microsoft, with
additional files to complete the implementation.

Signed-off-by: Philippe Reynes <philippe.reynes@softathome.com>
---
 package/Config.in                    |  1 +
 package/ibm-sw-tpm2/Config.in        | 15 +++++++++++++++
 package/ibm-sw-tpm2/ibm-sw-tpm2.hash |  5 +++++
 package/ibm-sw-tpm2/ibm-sw-tpm2.mk   | 22 ++++++++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 package/ibm-sw-tpm2/Config.in
 create mode 100644 package/ibm-sw-tpm2/ibm-sw-tpm2.hash
 create mode 100644 package/ibm-sw-tpm2/ibm-sw-tpm2.mk

diff --git a/package/Config.in b/package/Config.in
index 894284c..776bbd0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2285,6 +2285,7 @@ menu "System tools"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/htop/Config.in"
+	source "package/ibm-sw-tpm2/Config.in"
 	source "package/initscripts/Config.in"
 	source "package/iotop/Config.in"
 	source "package/iprutils/Config.in"
diff --git a/package/ibm-sw-tpm2/Config.in b/package/ibm-sw-tpm2/Config.in
new file mode 100644
index 0000000..d9174b6
--- /dev/null
+++ b/package/ibm-sw-tpm2/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_IBM_SW_TPM2
+	bool "ibm-sw-tpm2"
+	depends on !BR2_STATIC_LIBS # ibm-sw-tpm2
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	help
+	  This project is an implementation of the TCG TPM 2.0
+	  specification. It is based on the TPM specification
+	  Parts 3 and 4 source code donated by Microsoft, with
+	  additional files to complete the implementation.
+
+	  https://sourceforge.net/projects/ibmswtpm2/
+
+comment "ibm-sw-tpm2 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.hash b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
new file mode 100644
index 0000000..cfe75fe
--- /dev/null
+++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
@@ -0,0 +1,5 @@
+# from https://sourceforge.net/projects/ibmswtpm2/files
+sha1   a2a5335024a2edc1739f08b99e716fa355be627d                          ibmtpm1563.tar.gz
+md5    13013612b3a13dc935fefe1a5684179c                                  ibmtpm1563.tar.gz
+# Locally computed:
+sha256 fc3a17f8315c1f47670764f2384943afc0d3ba1e9a0422dacb08d455733bd1e9  ibmtpm1563.tar.gz
diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.mk b/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
new file mode 100644
index 0000000..1524b8c
--- /dev/null
+++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# ibm-sw-tpm2
+#
+################################################################################
+
+IBM_SW_TPM2_VERSION = 1563
+IBM_SW_TPM2_SOURCE = ibmtpm$(IBM_SW_TPM2_VERSION).tar.gz
+IBM_SW_TPM2_SITE = https://sourceforge.net/projects/ibmswtpm2/files
+IBM_SW_TPM2_LICENSE = BSD
+IBM_SW_TPM2_LICENSE_FILES = LICENSE
+IBM_SW_TPM2_DEPENDENCIES = openssl
+
+define IBM_SW_TPM2_BUILD_CMDS
+	$(MAKE) -C $(@D)/src $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define IBM_SW_TPM2_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/src $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) install DESTDIR=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
