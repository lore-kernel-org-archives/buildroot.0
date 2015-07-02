From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 11:01:55 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: add option to
	install vcdbg
Message-ID: <20150702090455.D8181818D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d16b32a40164f6bb2a9334ad7dcb6ab8ba95e172
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vcdbg is a tool to help debug the communication with the GPU.
It comes as a binary-only, and in two flavours: one for the hard
floating point ABI, one for the software floating point ABI.

Unfortunately, we have no source code for that tool, only a binary that
was dynamically linked with glibc and libraries from rpi-userland.

So, just install that executable, and let's hope there is no symbol
issue at runtime.

Note: vcdbg needs glibc, threads and !static. Since glibc already
implies threads and !static, we only need to depend on glibc.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc; Floris Bos <bos@je-eigen-domein.nl>
Cc: Pascal de Bruijn <pmjdebruijn@pcode.nl>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/Config.in       |   11 +++++++++++
 package/rpi-firmware/rpi-firmware.mk |    7 +++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index a060b4e..405674f 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -65,4 +65,15 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 	  Say 'y' here if you need to load one or more of the DTB overlays,
 	  to support HATs (Hardware Attached on Top, add-on modules).
 
+config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
+	bool "vcdbg"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_INSTALL_LIBSTDCPP # rpi-userland
+	select BR2_PACKAGE_RPI_USERLAND
+	help
+	  Install vcdbg, to help debug communication with the GPU.
+
+comment "vcdbg needs an (e)glibc toolchain w/ C++"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
+
 endif # BR2_PACKAGE_RPI_FIRMWARE
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 56d6925..1ef15aa 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -29,6 +29,13 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
+define RPI_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 0700 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/bin/vcdbg \
+		$(TARGET_DIR)/usr/sbin/vcdbg
+endef
+endif # INSTALL_VCDBG
+
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
 	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
