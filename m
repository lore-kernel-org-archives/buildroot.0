From: Ash Charles <ashcharles@gmail.com>
Date: Wed, 16 Nov 2016 14:24:33 -0500
Subject: [Buildroot] [PATCH 2/2] ti-pru-support: add staging files for PRU
	firmware
In-Reply-To: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
References: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
Message-ID: <1479324273-13589-2-git-send-email-ash.charles@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TI provides a set of headers files and libraries useful in developing
firmware for real-time (PRU) cores embedded in some processors e.g.
AM3358.  This package stages these files for any packages creating
PRU firmware.

Note: As per [1], use commit v4.0.2 to sync with common TI Linux
      versions.

[1] http://e2e.ti.com/support/arm/sitara_arm/f/791/p/552190/2018113#2018113

Signed-off-by: Ash Charles <ash.charles@savoirfairelinux.com>
---
 package/Config.in                        |  1 +
 package/ti-pru-support/Config.in         | 10 ++++++++++
 package/ti-pru-support/ti-pru-support.mk | 25 +++++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/ti-pru-support/Config.in
 create mode 100644 package/ti-pru-support/ti-pru-support.mk

diff --git a/package/Config.in b/package/Config.in
index 9ed296f..4f333c2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -463,6 +463,7 @@ endmenu
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
+	source "package/ti-pru-support/Config.in"
 	source "package/ti-sgx-demos/Config.in"
 	source "package/ti-sgx-km/Config.in"
 	source "package/ti-sgx-um/Config.in"
diff --git a/package/ti-pru-support/Config.in b/package/ti-pru-support/Config.in
new file mode 100644
index 0000000..af17d54
--- /dev/null
+++ b/package/ti-pru-support/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_TI_PRU_SUPPORT
+	bool "TI PRU support"
+	select BR2_PACKAGE_HOST_TI_CGT_PRU
+	help
+	  This package provides useful headers and libraries for the
+	  PRU unit found on some TI processors e.g. AM3358.  This
+	  package provides staging only; the included labs and
+	  examples aren't built.
+
+	  https://git.ti.com/pru-software-support-package/pru-software-support-package/trees/master
diff --git a/package/ti-pru-support/ti-pru-support.mk b/package/ti-pru-support/ti-pru-support.mk
new file mode 100644
index 0000000..9adb859
--- /dev/null
+++ b/package/ti-pru-support/ti-pru-support.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# ti-pru-support
+#
+################################################################################
+
+TI_PRU_SUPPORT_VERSION = 804b548e69ef9fdf44445f6d0968d81cb8a1e7b4
+TI_PRU_SUPPORT_SITE = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git"
+TI_PRU_SUPPORT_LICENSE =  BSD-3c, GPLv2
+TI_PRU_SUPPORT_LICENSE_FILES = PRU_Package-v5.0-Manifest.html
+TI_PRU_SUPPORT_INSTALL_STAGING = YES
+TI_PRU_SUPPORT_DEPENDENCIES = host-ti-cgt-pru
+
+define TI_PRU_SUPPORT_BUILD_CMDS
+	$(MAKE) PRU_CGT=$(PRU_CGT) -C $(@D)/lib/src
+endef
+
+define TI_PRU_SUPPORT_INSTALL_STAGING_CMDS
+	$(INSTALL) -d $(STAGING_DIR)/usr/include
+	cp -af $(@D)/include/* $(STAGING_DIR)/usr/include
+	$(INSTALL) -d $(STAGING_DIR)/usr/lib
+	$(INSTALL) -m 0644 $(@D)/lib/src/*/gen/*.lib $(STAGING_DIR)/usr/lib/
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
