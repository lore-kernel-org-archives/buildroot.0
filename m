From: Dagg Stompler <daggs@gmx.com>
Date: Sat, 10 Mar 2018 17:04:18 +0200
Subject: [Buildroot] [PATCH v3 2/4] odroidc2-ATF: new Package
In-Reply-To: <20180310150420.22364-1-daggs@gmx.com>
References: <20180310150420.22364-1-daggs@gmx.com>
Message-ID: <20180310150420.22364-2-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the odroidc2 board requires a ATF (ARM Trusted Firmware) to boot u-boot.
the ATF can be found only in the vendor's u-boot repository.
this package will retrieve the needed files to sign the mainline u-boot
image.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
Changes v2 -> v3:
 - add entry to DEVELOPERS file

Changes v1 -> v2:
 - refractor mainline post image script by moving the ATF part to a seperate package.
 - handle general mail patch rejects (Thomas)

 DEVELOPERS                             |  1 +
 package/Config.in.host                 |  1 +
 package/odroidc2-ATF/Config.in.host    |  7 +++++++
 package/odroidc2-ATF/odroidc2-ATF.hash |  2 ++
 package/odroidc2-ATF/odroidc2-ATF.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/odroidc2-ATF/Config.in.host
 create mode 100644 package/odroidc2-ATF/odroidc2-ATF.hash
 create mode 100644 package/odroidc2-ATF/odroidc2-ATF.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a622e7cc08..1cb46cfd28 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -468,6 +468,7 @@ F:	board/hardkernel/odroidc2
 F:	configs/odroidc2_defconfig
 F:	package/libamcodec/
 F:	package/meson-tools/
+F:	package/odroidc2-ATF/
 F:	package/odroid-mali/
 F:	package/odroid-scripts/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 5f17640eb1..965fef93ed 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -35,6 +35,7 @@ menu "Host utilities"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
 	source "package/mxsldr/Config.in.host"
+	source "package/odroidc2-ATF/Config.in.host"
 	source "package/omap-u-boot-utils/Config.in.host"
 	source "package/openocd/Config.in.host"
 	source "package/opkg-utils/Config.in.host"
diff --git a/package/odroidc2-ATF/Config.in.host b/package/odroidc2-ATF/Config.in.host
new file mode 100644
index 0000000000..7af3bf79fe
--- /dev/null
+++ b/package/odroidc2-ATF/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_ODROIDC2_ATF
+	bool "host odroidc2-ATF"
+	help
+	  odroidc2-ATF is a package that extracts the ATF (ARM Trusted Firmware) from hardkernel's
+	  uboot repository and uses it to allow safe boot of mainline u-boot kernels.
+
+	  https://github.com/hardkernel/u-boot/tree/odroidc2-v2015.01
diff --git a/package/odroidc2-ATF/odroidc2-ATF.hash b/package/odroidc2-ATF/odroidc2-ATF.hash
new file mode 100644
index 0000000000..5481ddcde2
--- /dev/null
+++ b/package/odroidc2-ATF/odroidc2-ATF.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	7e436e83e21819605480938dda6e366a4ccd01acbb8402997a3633e25ff2d383  odroidc2-ATF-1dad487200543c2c1d116e8b2f070fe491070432.tar.gz
diff --git a/package/odroidc2-ATF/odroidc2-ATF.mk b/package/odroidc2-ATF/odroidc2-ATF.mk
new file mode 100644
index 0000000000..6eb42b72bc
--- /dev/null
+++ b/package/odroidc2-ATF/odroidc2-ATF.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# odroidc2-ATF
+#
+################################################################################
+
+HOST_ODROIDC2_ATF_VERSION = 1dad487200543c2c1d116e8b2f070fe491070432
+HOST_ODROIDC2_ATF_SITE = $(call github,hardkernel,u-boot,$(HOST_ODROIDC2_ATF_VERSION))
+HOST_ODROIDC2_ATF_LICENSE = GPL-2.0
+HOST_ODROIDC2_ATF_LICENSE_FILES = COPYING COPYING.txt README
+HOST_ODROIDC2_ATF_FIRMWARE_FOLDER = $(HOST_DIR)/usr/share/odroidc2_atf
+HOST_ODROIDC2_ATF_FIRMWARE_FILES = sd_fuse/bl1.bin.hardkernel fip/gxb/bl30.bin fip/gxb/bl301.bin fip/gxb/bl31.bin fip/gxb/bl2.package
+
+define HOST_ODROIDC2_ATF_BUILD_CMDS
+	$(MAKE) -C $(@D)/tools/fip_create CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)"
+endef
+
+define HOST_ODROIDC2_ATF_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/tools/fip_create/fip_create $(HOST_DIR)/bin
+	mkdir -p $(HOST_ODROIDC2_ATF_FIRMWARE_FOLDER)
+	$(foreach f,$(HOST_ODROIDC2_ATF_FIRMWARE_FILES),
+		$(INSTALL) -D -m 0644 $(@D)/$(f) $(HOST_ODROIDC2_ATF_FIRMWARE_FOLDER)/
+	)
+endef
+
+$(eval $(host-generic-package))
-- 
2.16.2
