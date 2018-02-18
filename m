From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Sun, 18 Feb 2018 14:28:30 +0100
Subject: [Buildroot] [PATCH 2/3] imx-atf: new package
In-Reply-To: <1518960511-4823-1-git-send-email-karl.erik.larsson@gmail.com>
References: <1518960511-4823-1-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <1518960511-4823-3-git-send-email-karl.erik.larsson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
---
 package/freescale-imx/Config.in            |  4 ++++
 package/freescale-imx/imx-atf/Config.in    |  5 +++++
 package/freescale-imx/imx-atf/imx-atf.hash |  3 +++
 package/freescale-imx/imx-atf/imx-atf.mk   | 23 +++++++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/freescale-imx/imx-atf/Config.in
 create mode 100644 package/freescale-imx/imx-atf/imx-atf.hash
 create mode 100644 package/freescale-imx/imx-atf/imx-atf.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index b5e5ab2..2535caa 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -88,4 +88,8 @@ source "package/freescale-imx/imx-gpu-viv/Config.in"
 source "package/freescale-imx/kernel-module-imx-gpu-viv/Config.in"
 endif
 
+if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	source "package/freescale-imx/imx-atf/Config.in"
+endif
+
 endif
diff --git a/package/freescale-imx/imx-atf/Config.in b/package/freescale-imx/imx-atf/Config.in
new file mode 100644
index 0000000..200203d
--- /dev/null
+++ b/package/freescale-imx/imx-atf/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_IMX_ATF
+	bool "imx-atf"
+	help
+	  ARM Trusted Firmware provides a reference implementation
+	  of secure world software for `ARMv8-A`
diff --git a/package/freescale-imx/imx-atf/imx-atf.hash b/package/freescale-imx/imx-atf/imx-atf.hash
new file mode 100644
index 0000000..5b653a7
--- /dev/null
+++ b/package/freescale-imx/imx-atf/imx-atf.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 aa5879af507df44b9981d75852e2a520612c6c5c43dc423480ca36b6deff5160  imx-atf-imx_4.9.51_imx8m_beta.tar.gz
+sha256 487795b8023df866259fa159bab94706b747fb0d623b7913f1c4955c0ab5f164  license.rst
diff --git a/package/freescale-imx/imx-atf/imx-atf.mk b/package/freescale-imx/imx-atf/imx-atf.mk
new file mode 100644
index 0000000..f0aa988
--- /dev/null
+++ b/package/freescale-imx/imx-atf/imx-atf.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# imx-atf
+#
+################################################################################
+
+IMX_ATF_VERSION = imx_4.9.51_imx8m_beta
+IMX_ATF_SITE = https://source.codeaurora.org/external/imx/imx-atf
+IMX_ATF_SITE_METHOD = git
+IMX_AFT_LICENSE = BSD-3-Clause
+IMX_AFT_LICESE_FILES = license.rst
+
+define IMX_ATF_BUILD_CMDS
+	$(TARGET_MAKE_ENV) \
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	$(MAKE) -C $(@D) PLAT=imx8mq bl31
+endef
+
+define IMX_ATF_INSTALL_TARGET_CMDS
+	cp $(@D)/build/imx8mq/release/bl31.bin $(BINARIES_DIR)/imx-boot
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
