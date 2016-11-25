From: Ash Charles <ashcharles@gmail.com>
Date: Fri, 25 Nov 2016 12:49:59 -0500
Subject: [Buildroot] [PATCH v2 2/3] pru-software-support: add library for
	PRU firmware
In-Reply-To: <1480096200-20475-1-git-send-email-ash.charles@savoirfairelinux.com>
References: <1480096200-20475-1-git-send-email-ash.charles@savoirfairelinux.com>
Message-ID: <1480096200-20475-2-git-send-email-ash.charles@savoirfairelinux.com>
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
Changes v1 --> v2
 * change from staging to host package (thanks Arnout & Thomas)
 * match upstream name of pru-software-support (thanks Arnout)
 * ensured config dependencies are propagated (thanks Arnout)
 * added a hash file (thanks Arnout)
 * various little clean-ups
---
 package/Config.in.host                             |  1 +
 package/pru-software-support/Config.in.host        | 12 ++++++++++
 .../pru-software-support/pru-software-support.hash |  2 ++
 .../pru-software-support/pru-software-support.mk   | 26 ++++++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 package/pru-software-support/Config.in.host
 create mode 100644 package/pru-software-support/pru-software-support.hash
 create mode 100644 package/pru-software-support/pru-software-support.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index e244694..840313a 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -33,6 +33,7 @@ menu "Host utilities"
 	source "package/openocd/Config.in.host"
 	source "package/parted/Config.in.host"
 	source "package/patchelf/Config.in.host"
+	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/sam-ba/Config.in.host"
diff --git a/package/pru-software-support/Config.in.host b/package/pru-software-support/Config.in.host
new file mode 100644
index 0000000..9ec3739
--- /dev/null
+++ b/package/pru-software-support/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_PRU_SOFTWARE_SUPPORT
+	bool "host PRU software support"
+	select BR2_PACKAGE_HOST_TI_CGT_PRU
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_arm
+	help
+	  This package provides useful headers and libraries for the
+	  PRU unit found on some TI processors e.g. AM3358.  This
+	  package provides staging only; the included labs and
+	  examples aren't built.
+
+	  https://git.ti.com/pru-software-support-package/pru-software-support-package
diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
new file mode 100644
index 0000000..bbff1db
--- /dev/null
+++ b/package/pru-software-support/pru-software-support.hash
@@ -0,0 +1,2 @@
+# no hash for git checkout
+none	xxx	pru-software-support-804b548e69ef9fdf44445f6d0968d81cb8a1e7b4.tar.gz
diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
new file mode 100644
index 0000000..366680a
--- /dev/null
+++ b/package/pru-software-support/pru-software-support.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# pru-software-support
+#
+################################################################################
+
+PRU_SOFTWARE_SUPPORT_VERSION = 804b548e69ef9fdf44445f6d0968d81cb8a1e7b4
+PRU_SOFTWARE_SUPPORT_SITE = git://git.ti.com/pru-software-support-package/pru-software-support-package.git
+PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3c
+PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU_Package-v5.0-Manifest.html
+PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru
+
+define HOST_PRU_SOFTWARE_SUPPORT_BUILD_CMDS
+	$(MAKE) PRU_CGT=$(TI_CGT_PRU_DIR) -C $(@D)/lib/src
+endef
+
+# install this library support alongside PRU toolchain i.e.
+# everything in TI_CGT_PRU_DIR as PRU_CGT
+define HOST_PRU_SOFTWARE_SUPPORT_INSTALL_CMDS
+	mkdir -p $(TI_CGT_PRU_DIR)/usr/include
+	cp -dpfr $(@D)/include/* $(TI_CGT_PRU_DIR)/usr/include
+	mkdir -p $(TI_CGT_PRU_DIR)/usr/lib
+	$(INSTALL) -m 0644 $(@D)/lib/src/*/gen/*.lib $(TI_CGT_PRU_DIR)/usr/lib/
+endef
+
+$(eval $(host-generic-package))
-- 
2.7.4
