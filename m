From: Dagg Stompler <daggs@gmx.com>
Date: Sat, 18 Apr 2020 18:10:18 +0300
Subject: [Buildroot] [PATCH 3/5] OdroidC2ATF: new Package
In-Reply-To: <20200418151020.17197-1-daggs@gmx.com>
References: <20200418151020.17197-1-daggs@gmx.com>
Message-ID: <20200418151020.17197-3-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

introduce a package that holds the ATF for AmLogic's Odroid C2 boards

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in.host               |  1 +
 package/OdroidC2ATF/Config.in.host   |  8 ++++++++
 package/OdroidC2ATF/OdroidC2ATF.hash |  2 ++
 package/OdroidC2ATF/OdroidC2ATF.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 38 insertions(+)
 create mode 100644 package/OdroidC2ATF/Config.in.host
 create mode 100644 package/OdroidC2ATF/OdroidC2ATF.hash
 create mode 100644 package/OdroidC2ATF/OdroidC2ATF.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 94d9c68208..8e12ede746 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -641,6 +641,7 @@ F:	package/kvm-unit-tests

 N:	Dagg Stompler <daggs@gmx.com>
 F:	package/meson-tools/
+F:	package/OdroidC2ATF/

 N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
diff --git a/package/Config.in.host b/package/Config.in.host
index a5ad2a3f11..f753182136 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -48,6 +48,7 @@ menu "Host utilities"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
 	source "package/mxsldr/Config.in.host"
+	source "package/OdroidC2ATF/Config.in.host"
 	source "package/omap-u-boot-utils/Config.in.host"
 	source "package/openocd/Config.in.host"
 	source "package/opkg-utils/Config.in.host"
diff --git a/package/OdroidC2ATF/Config.in.host b/package/OdroidC2ATF/Config.in.host
new file mode 100644
index 0000000000..a8199d4f57
--- /dev/null
+++ b/package/OdroidC2ATF/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_ODROIDC2ATF
+	bool "host OdroidC2ATF"
+	help
+	  OdroidC2ATF is a package that holst the minimal file needed for the ATF (ARM Trusted Firmware) from hardkernel's
+	  uboot repository and uses it to allow safe boot of mainline u-boot kernels.
+	  the files were taken without chaning from https://github.com/hardkernel/u-boot/tree/odroidc2-v2015.01
+
+	  https://github.com/daggs1/OdroidC2ATF
diff --git a/package/OdroidC2ATF/OdroidC2ATF.hash b/package/OdroidC2ATF/OdroidC2ATF.hash
new file mode 100644
index 0000000000..b9ec3bddb7
--- /dev/null
+++ b/package/OdroidC2ATF/OdroidC2ATF.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	991fb15908410c6c8a6ef2e0da368ca8e2b813d123382f0e8958814ad0aead97  OdroidC2ATF-13a8560b2884cb5fa13537e1aa193e3cb7b2d996.tar.gz
diff --git a/package/OdroidC2ATF/OdroidC2ATF.mk b/package/OdroidC2ATF/OdroidC2ATF.mk
new file mode 100644
index 0000000000..166ce839b2
--- /dev/null
+++ b/package/OdroidC2ATF/OdroidC2ATF.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# Odroidc2ATF
+#
+################################################################################
+
+HOST_ODROIDC2ATF_VERSION = 13a8560b2884cb5fa13537e1aa193e3cb7b2d996
+HOST_ODROIDC2ATF_SITE = $(call github,daggs1,OdroidC2ATF,$(HOST_ODROIDC2ATF_VERSION))
+HOST_ODROIDC2ATF_LICENSE = GPL-2.0
+HOST_ODROIDC2ATF_LICENSE_FILES = COPYING COPYING.txt README
+HOST_ODROIDC2ATF_FIRMWARE_FOLDER = $(HOST_DIR)/usr/share/odroidc2_atf
+HOST_ODROIDC2ATF_FIRMWARE_FILES = bins/bl1.bin.hardkernel bins/bl30.bin bins/bl301.bin bins/bl31.bin bins/bl2.package
+
+define HOST_ODROIDC2ATF_BUILD_CMDS
+	$(MAKE) -C $(@D)/fip_create CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)"
+endef
+
+define HOST_ODROIDC2ATF_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/fip_create/fip_create $(HOST_DIR)/bin
+	mkdir -p $(HOST_ODROIDC2ATF_FIRMWARE_FOLDER)
+	$(foreach f,$(HOST_ODROIDC2ATF_FIRMWARE_FILES),
+		$(INSTALL) -D -m 0644 $(@D)/$(f) $(HOST_ODROIDC2ATF_FIRMWARE_FOLDER)/
+	)
+endef
+
+$(eval $(host-generic-package))
--
2.26.1
