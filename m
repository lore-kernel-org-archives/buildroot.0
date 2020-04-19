From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 21:37:12 +0200
Subject: [Buildroot] [git commit] package/ibm-sw-tpm2: new package
Message-ID: <20200419192310.B374A8F223@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43162eaaa1bf9b95d9756626fc81a5aa5f82918a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This project is an implementation of the TCG TPM 2.0 specification. It
is based on the TPM specification Parts 3 and 4 source code donated by
Microsoft, with additional files to complete the implementation.

Signed-off-by: Philippe Reynes <philippe.reynes@softathome.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  3 +++
 package/Config.in                    |  1 +
 package/ibm-sw-tpm2/Config.in        | 16 ++++++++++++++++
 package/ibm-sw-tpm2/ibm-sw-tpm2.hash |  6 ++++++
 package/ibm-sw-tpm2/ibm-sw-tpm2.mk   | 23 +++++++++++++++++++++++
 5 files changed, 49 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4f8a9255ed..f56d70dc20 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2092,6 +2092,9 @@ F:	package/lttng-tools/
 F:	package/python-ipython/
 F:	package/liburcu/
 
+N:	Philippe Reynes <philippe.reynes@softathome.com>
+F:	package/ibm-sw-tpm2/
+
 N:	Pierre Crokaert <pct@crookies.net>
 F:	board/hardkernel/odroidxu4/
 F:	configs/odroidxu4_defconfig
diff --git a/package/Config.in b/package/Config.in
index 5e72b750ea..afa54f739e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2338,6 +2338,7 @@ menu "System tools"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/htop/Config.in"
+	source "package/ibm-sw-tpm2/Config.in"
 	source "package/initscripts/Config.in"
 	source "package/iotop/Config.in"
 	source "package/iprutils/Config.in"
diff --git a/package/ibm-sw-tpm2/Config.in b/package/ibm-sw-tpm2/Config.in
new file mode 100644
index 0000000000..dc5630490f
--- /dev/null
+++ b/package/ibm-sw-tpm2/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_IBM_SW_TPM2
+	bool "ibm-sw-tpm2"
+	depends on !BR2_STATIC_LIBS # ibm-sw-tpm2
+	select BR2_PACKAGE_OPENSSL
+	# libressl is not supported
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	help
+	  This project is an implementation of the TCG TPM 2.0
+	  specification. It is based on the TPM specification Parts 3
+	  and 4 source code donated by Microsoft, with additional
+	  files to complete the implementation.
+
+	  https://sourceforge.net/projects/ibmswtpm2/
+
+comment "ibm-sw-tpm2 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.hash b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
new file mode 100644
index 0000000000..f57dcbbb5b
--- /dev/null
+++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
@@ -0,0 +1,6 @@
+# from https://sourceforge.net/projects/ibmswtpm2/files
+sha1  a2a5335024a2edc1739f08b99e716fa355be627d  ibmtpm1563.tar.gz
+md5  13013612b3a13dc935fefe1a5684179c  ibmtpm1563.tar.gz
+# Locally computed:
+sha256  fc3a17f8315c1f47670764f2384943afc0d3ba1e9a0422dacb08d455733bd1e9  ibmtpm1563.tar.gz
+sha256  dd2d31b560011ea673e197251e710e52669d911367d83cd3cfd018f8ed58bde9  LICENSE
diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.mk b/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
new file mode 100644
index 0000000000..58102667d1
--- /dev/null
+++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# ibm-sw-tpm2
+#
+################################################################################
+
+IBM_SW_TPM2_VERSION = 1563
+IBM_SW_TPM2_SOURCE = ibmtpm$(IBM_SW_TPM2_VERSION).tar.gz
+IBM_SW_TPM2_SITE = https://sourceforge.net/projects/ibmswtpm2/files
+IBM_SW_TPM2_LICENSE = BSD-3-Clause
+IBM_SW_TPM2_LICENSE_FILES = LICENSE
+IBM_SW_TPM2_DEPENDENCIES = openssl
+
+define IBM_SW_TPM2_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src $(TARGET_CONFIGURE_OPTS)
+endef
+
+define IBM_SW_TPM2_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src $(TARGET_CONFIGURE_OPTS) install \
+		DESTDIR=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
