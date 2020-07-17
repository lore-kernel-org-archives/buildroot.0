From: Dagg Stompler <daggs@gmx.com>
Date: Fri, 17 Jul 2020 19:46:41 +0300
Subject: [Buildroot] [PATCH 2/4] odroidc2_atf: new Package
In-Reply-To: <20200717164643.4702-1-daggs@gmx.com>
References: <20200717164643.4702-1-daggs@gmx.com>
Message-ID: <20200717164643.4702-2-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

introduce a package that holds the ATF for AmLogic's Odroid C2 boards

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in.host                 |  1 +
 package/odroidc2_atf/Config.in.host    |  8 ++++++++
 package/odroidc2_atf/odroidc2_atf.hash |  2 ++
 package/odroidc2_atf/odroidc2_atf.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 38 insertions(+)
 create mode 100644 package/odroidc2_atf/Config.in.host
 create mode 100644 package/odroidc2_atf/odroidc2_atf.hash
 create mode 100644 package/odroidc2_atf/odroidc2_atf.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 64af92dd2f..82044605b7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -622,6 +622,7 @@ F:	package/kvm-unit-tests

 N:	Dagg Stompler <daggs@gmx.com>
 F:	package/meson-tools/
+F:	package/odroidc2_atf/

 N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
diff --git a/package/Config.in.host b/package/Config.in.host
index e222e7e448..964ab00aec 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -50,6 +50,7 @@ menu "Host utilities"
 	source "package/mtools/Config.in.host"
 	source "package/mxsldr/Config.in.host"
 	source "package/odb/Config.in.host"
+	source "package/odroidc2_atf/Config.in.host"
 	source "package/omap-u-boot-utils/Config.in.host"
 	source "package/openocd/Config.in.host"
 	source "package/opkg-utils/Config.in.host"
diff --git a/package/odroidc2_atf/Config.in.host b/package/odroidc2_atf/Config.in.host
new file mode 100644
index 0000000000..b5307fb05d
--- /dev/null
+++ b/package/odroidc2_atf/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_ODROIDC2_ATF
+	bool "host odroidc2_atf"
+	help
+	  odroidc2_atf is a package that holst the minimal file needed for the ATF (ARM Trusted Firmware) from hardkernel's
+	  uboot repository and uses it to allow safe boot of mainline u-boot kernels.
+	  the files were taken without chaning from https://github.com/hardkernel/u-boot/tree/odroidc2-v2015.01
+
+	  https://github.com/daggs1/odroidc2_atf
diff --git a/package/odroidc2_atf/odroidc2_atf.hash b/package/odroidc2_atf/odroidc2_atf.hash
new file mode 100644
index 0000000000..41ea3a6ba5
--- /dev/null
+++ b/package/odroidc2_atf/odroidc2_atf.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	991fb15908410c6c8a6ef2e0da368ca8e2b813d123382f0e8958814ad0aead97  odroidc2_atf-13a8560b2884cb5fa13537e1aa193e3cb7b2d996.tar.gz
diff --git a/package/odroidc2_atf/odroidc2_atf.mk b/package/odroidc2_atf/odroidc2_atf.mk
new file mode 100644
index 0000000000..ee2f9e85b3
--- /dev/null
+++ b/package/odroidc2_atf/odroidc2_atf.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# Odroidc2ATF
+#
+################################################################################
+
+HOST_ODROIDC2_ATF_VERSION = 13a8560b2884cb5fa13537e1aa193e3cb7b2d996
+HOST_ODROIDC2_ATF_SITE = $(call github,daggs1,OdroidC2ATF,$(HOST_ODROIDC2_ATF_VERSION))
+HOST_ODROIDC2_ATF_LICENSE = GPL-2.0
+HOST_ODROIDC2_ATF_LICENSE_FILES = COPYING COPYING.txt README
+HOST_ODROIDC2_ATF_FIRMWARE_FOLDER = $(HOST_DIR)/usr/share/odroidc2_atf
+HOST_ODROIDC2_ATF_FIRMWARE_FILES = bins/bl1.bin.hardkernel bins/bl30.bin bins/bl301.bin bins/bl31.bin bins/bl2.package
+
+define HOST_ODROIDC2_ATF_BUILD_CMDS
+	$(MAKE) -C $(@D)/fip_create CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)"
+endef
+
+define HOST_ODROIDC2_ATF_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/fip_create/fip_create $(HOST_DIR)/bin
+	mkdir -p $(HOST_ODROIDC2_ATF_FIRMWARE_FOLDER)
+	$(foreach f,$(HOST_ODROIDC2_ATF_FIRMWARE_FILES),
+		$(INSTALL) -D -m 0644 $(@D)/$(f) $(HOST_ODROIDC2_ATF_FIRMWARE_FOLDER)/
+	)
+endef
+
+$(eval $(host-generic-package))
--
2.27.0
