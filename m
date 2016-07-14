From: Lothar Felten <lothar.felten@gmail.com>
Date: Thu, 14 Jul 2016 14:04:47 +0200
Subject: [Buildroot] [PATCH v3 3/4] package/ti-sgx-demos: new package
In-Reply-To: <1468497888-6464-1-git-send-email-lothar.felten@gmail.com>
References: <1468497888-6464-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <1468497888-6464-3-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds the SGX demos from Imagination Technologies, they are
available as binaries only.
This package contains binaries compiled for the SGX graphics accelerator used
in the following Texas Instruments SoCs: AM335x, AM437x, AM4430, AM5430.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/Config.in                      |  1 +
 package/ti-sgx-demos/Config.in         | 10 ++++++++++
 package/ti-sgx-demos/ti-sgx-demos.hash |  2 ++
 package/ti-sgx-demos/ti-sgx-demos.mk   | 18 ++++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/ti-sgx-demos/Config.in
 create mode 100644 package/ti-sgx-demos/ti-sgx-demos.hash
 create mode 100644 package/ti-sgx-demos/ti-sgx-demos.mk

diff --git a/package/Config.in b/package/Config.in
index 91109f5..0f05c3b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -451,6 +451,7 @@ endmenu
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
+	source "package/ti-sgx-demos/Config.in"
 	source "package/ti-sgx-km/Config.in"
 	source "package/ti-sgx-um/Config.in"
 	source "package/ti-uim/Config.in"
diff --git a/package/ti-sgx-demos/Config.in b/package/ti-sgx-demos/Config.in
new file mode 100644
index 0000000..52c58e5
--- /dev/null
+++ b/package/ti-sgx-demos/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_TI_SGX_DEMOS
+	bool "ti-sgx-demos"
+	select BR2_PACKAGE_TI_SGX_KM
+	select BR2_PACKAGE_TI_SGX_UM
+	help
+	  These SGX powervr demo applications from Imagination Technologies are
+	  availabe as binaries only.
+	  The binaries are compiled for the TI SGX implementation.
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
index 0000000..6891282
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
+TI_SGX_DEMOS_SITE = http://git.ti.com/graphics/img-pvr-sdk.git
+TI_SGX_DEMOS_LICENSE = Imagination Technologies License Agreement
+TI_SGX_DEMOS_LICENSE_FILES = LegalNotice.txt
+
+define TI_SGX_DEMOS_INSTALL_TARGET_CMDS
+	cp -dpfr $(@D)/targetfs/Examples/Advanced/OGLES* \
+		$(TARGET_DIR)/usr/bin/
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
