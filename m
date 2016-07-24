From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 16:10:18 +0200
Subject: [Buildroot] [git commit] package/ti-sgx-demos: new package
Message-ID: <20160724141038.A88E581DE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88ac054a3e0aa5b84837b585edc21cba4d45c1e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package adds the SGX demos from Imagination Technologies, they are
available as binaries only.
This package contains binaries compiled for the SGX graphics accelerator used
in the following Texas Instruments SoCs: AM335x, AM437x, AM4430, AM5430.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |  1 +
 package/ti-sgx-demos/Config.in         |  9 +++++++++
 package/ti-sgx-demos/ti-sgx-demos.hash |  2 ++
 package/ti-sgx-demos/ti-sgx-demos.mk   | 18 ++++++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 72c0be3..181921b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -454,6 +454,7 @@ endmenu
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
+	source "package/ti-sgx-demos/Config.in"
 	source "package/ti-sgx-km/Config.in"
 	source "package/ti-sgx-um/Config.in"
 	source "package/ti-uim/Config.in"
diff --git a/package/ti-sgx-demos/Config.in b/package/ti-sgx-demos/Config.in
new file mode 100644
index 0000000..ea06fdb
--- /dev/null
+++ b/package/ti-sgx-demos/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_TI_SGX_DEMOS
+	bool "ti-sgx-demos"
+	depends on BR2_PACKAGE_TI_SGX_UM
+	help
+	  These SGX powervr demo applications from Imagination
+	  Technologies are availabe as binaries only.  The binaries
+	  are compiled for the TI SGX implementation.
+
+	  http://git.ti.com/graphics/img-pvr-sdk
diff --git a/package/ti-sgx-demos/ti-sgx-demos.hash b/package/ti-sgx-demos/ti-sgx-demos.hash
new file mode 100644
index 0000000..43acf91
--- /dev/null
+++ b/package/ti-sgx-demos/ti-sgx-demos.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 9d1d4da2c2b35303e239f99eb4003b8b206078a682aa083d5fb831ee4197f3bf ti-sgx-demos-f24650bc8243b25c23d6a0a502ed79fc472ac424.tar.gz
diff --git a/package/ti-sgx-demos/ti-sgx-demos.mk b/package/ti-sgx-demos/ti-sgx-demos.mk
new file mode 100644
index 0000000..80af79b
--- /dev/null
+++ b/package/ti-sgx-demos/ti-sgx-demos.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# ti-sgx-demos
+#
+################################################################################
+
+# This correpsonds to SDK 02.00.00.00
+TI_SGX_DEMOS_VERSION = f24650bc8243b25c23d6a0a502ed79fc472ac424
+TI_SGX_DEMOS_SITE = git://git.ti.com/graphics/img-pvr-sdk.git
+TI_SGX_DEMOS_LICENSE = Imagination Technologies License Agreement
+TI_SGX_DEMOS_LICENSE_FILES = LegalNotice.txt
+
+define TI_SGX_DEMOS_INSTALL_TARGET_CMDS
+	cp -dpfr $(@D)/targetfs/Examples/Advanced/OGLES* \
+		$(TARGET_DIR)/usr/bin/
+endef
+
+$(eval $(generic-package))
