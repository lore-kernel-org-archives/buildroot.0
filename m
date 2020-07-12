From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 12 Jul 2020 18:34:19 +0200
Subject: [Buildroot] [PATCH 1/4] package/edk2-aarch64-bin: new package
Message-ID: <20200712163422.1162187-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linaro provide pre-built versions of the binary firmware images of
UEFI [1] based on the TianoCore edk2 project [2].

The qemu_aarch64_virt_defconfig will be updated by a follow up commit to
use those firmware to test Aarch64 efi system under Qemu.

Building edk2 firmware from source require to build edk2 package for
the host using a script based buildsystem. Instead we use firmware
provided by Linaro to avoid the maintainance burden.
There is a limited added value to build them just for Qemu testing
purpose.

Building edk2 firmware could be intersting for secure boot or for
other target than Qemu.

We need to package the edk2 Aarch64 and ARM firmware in two separate
packages since the downloaded files are using the same name
(QEMU_EFI.fd and QEMU_VARS.fd). The ARM firmware will be added by
a follow up patch.

[1] http://releases.linaro.org/reference-platform/enterprise/firmware/open-source/19.03/
[2] https://github.com/tianocore/edk2

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in.host                        |  1 +
 package/edk2-aarch64-bin/Config.in.host       | 12 ++++++++++
 .../edk2-aarch64-bin/edk2-aarch64-bin.hash    |  3 +++
 package/edk2-aarch64-bin/edk2-aarch64-bin.mk  | 24 +++++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/edk2-aarch64-bin/Config.in.host
 create mode 100644 package/edk2-aarch64-bin/edk2-aarch64-bin.hash
 create mode 100644 package/edk2-aarch64-bin/edk2-aarch64-bin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ed9f1388a3..0cb76226bb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2191,6 +2191,7 @@ F:	package/binutils/
 F:	package/bullet/
 F:	package/clang/
 F:	package/clinfo/
+F:	package/edk2-aarch64-bin/
 F:	package/efl/
 F:	package/enet/
 F:	package/enlightenment/
diff --git a/package/Config.in.host b/package/Config.in.host
index 647fc24841..28ccc33037 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -18,6 +18,7 @@ menu "Host utilities"
 	source "package/dtc/Config.in.host"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
+	source "package/edk2-aarch64-bin/Config.in.host"
 	source "package/erofs-utils/Config.in.host"
 	source "package/eudev/Config.in.host"
 	source "package/exfatprogs/Config.in.host"
diff --git a/package/edk2-aarch64-bin/Config.in.host b/package/edk2-aarch64-bin/Config.in.host
new file mode 100644
index 0000000000..b4ec08cb48
--- /dev/null
+++ b/package/edk2-aarch64-bin/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_EDK2_AARCH64_BIN
+	bool "host-edk2-aarch64-bin"
+	depends on BR2_aarch64
+	help
+	  This package will install pre-built versions of the binary
+	  firmware images of UEFI based on the TianoCore project.
+
+	  This image is intended to be used by host-qemu to boot UEFI
+	  images for Aarch64 target.
+
+	  https://github.com/tianocore/edk2
+	  http://releases.linaro.org/reference-platform/enterprise/firmware/open-source/19.03/
diff --git a/package/edk2-aarch64-bin/edk2-aarch64-bin.hash b/package/edk2-aarch64-bin/edk2-aarch64-bin.hash
new file mode 100644
index 0000000000..3166b09dae
--- /dev/null
+++ b/package/edk2-aarch64-bin/edk2-aarch64-bin.hash
@@ -0,0 +1,3 @@
+# From http://releases.linaro.org/reference-platform/enterprise/firmware/open-source/19.03/release/qemu-aarch64/SHA256SUMS
+sha256  43301ef5f620945a082c5f47ae933e154e0cff0976ed22a8cff66033020f6020  QEMU_EFI.fd
+sha256  8b634c1e6bd11607850b69111f6c4dbd1583dbbd1460dac72dbacbdc1a4a130a  QEMU_VARS.fd
diff --git a/package/edk2-aarch64-bin/edk2-aarch64-bin.mk b/package/edk2-aarch64-bin/edk2-aarch64-bin.mk
new file mode 100644
index 0000000000..78818cdc81
--- /dev/null
+++ b/package/edk2-aarch64-bin/edk2-aarch64-bin.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# edk2-aarch64-bin
+#
+################################################################################
+
+EDK2_AARCH64_BIN_VERSION = 19.03
+EDK2_AARCH64_BIN_SITE = http://releases.linaro.org/reference-platform/enterprise/firmware/open-source/$(EDK2_AARCH64_BIN_VERSION)/release/qemu-aarch64
+EDK2_AARCH64_BIN_LICENSE = BSD-2-Clause (edk2), ISC (uefi-tools), BSD-3-Clause (ATF)
+
+HOST_EDK2_AARCH64_BIN_SOURCE = QEMU_EFI.fd
+HOST_EDK2_AARCH64_BIN_EXTRA_DOWNLOADS = $(EDK2_AARCH64_BIN_SITE)/QEMU_VARS.fd
+
+define HOST_EDK2_AARCH64_BIN_EXTRACT_CMDS
+	cp $(HOST_EDK2_AARCH64_BIN_DL_DIR)/QEMU_EFI.fd $(@D)/QEMU_EFI.fd
+	cp $(HOST_EDK2_AARCH64_BIN_DL_DIR)/QEMU_VARS.fd $(@D)/QEMU_VARS.fd
+endef
+
+define HOST_EDK2_AARCH64_BIN_INSTALL_CMDS
+	$(INSTALL) -D -m 644 $(@D)/QEMU_EFI.fd $(HOST_DIR)/usr/share/edk2/aarch64/QEMU_EFI.fd
+	$(INSTALL) -D -m 644 $(@D)/QEMU_VARS.fd $(HOST_DIR)/usr/share/edk2/aarch64/QEMU_VARS.fd
+endef
+
+$(eval $(host-generic-package))
-- 
2.25.4
