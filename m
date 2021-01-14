From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Jan 2021 22:30:46 +0100
Subject: [Buildroot] [git commit] package/rcw-smarc-sal28: new package
Message-ID: <20210114211221.1FF0E81036@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94807b0bd9b4680a49d0217779a6879a8ffa826c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Walle <michael@walle.cc>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/rcw-smarc-sal28/Config.in            | 25 +++++++++++++++++++
 package/rcw-smarc-sal28/rcw-smarc-sal28.hash |  3 +++
 package/rcw-smarc-sal28/rcw-smarc-sal28.mk   | 37 ++++++++++++++++++++++++++++
 5 files changed, 67 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 05b509c9c4..e4f1c13fb4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1873,6 +1873,7 @@ N:	Michael Walle <michael@walle.cc>
 F:	board/kontron/smarc-sal28/
 F:	configs/kontron_smarc_sal28_defconfig
 F:	package/libavl/
+F:	package/rcw-smarc-sal28/
 
 N:	Micha?? ??yszczek <michal.lyszczek@bofc.pl>
 F:	board/altera/socrates_cyclone5/
diff --git a/package/Config.in b/package/Config.in
index 5a16814ca8..81ad4979a1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -409,6 +409,7 @@ menu "Firmware"
 	source "package/murata-cyw-fw/Config.in"
 	source "package/odroidc2-firmware/Config.in"
 	source "package/qcom-db410c-firmware/Config.in"
+	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-bt-firmware/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/rpi-wifi-firmware/Config.in"
diff --git a/package/rcw-smarc-sal28/Config.in b/package/rcw-smarc-sal28/Config.in
new file mode 100644
index 0000000000..2a46c9f84c
--- /dev/null
+++ b/package/rcw-smarc-sal28/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_RCW_SMARC_SAL28
+	bool "rcw-smarc-sal28"
+	help
+	  The reset configuration word for the SMARC-sAL28 board. All
+	  available RCWs are copied into the images output directory.
+	  Additionally, you have to choose one default RCW which is
+	  used for booting the board.
+
+if BR2_PACKAGE_RCW_SMARC_SAL28
+config BR2_PACKAGE_RCW_SMARC_SAL28_BUILD_UPDATE_SCRIPT
+	bool "Build RCW u-boot update script"
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
+	help
+	  Build the RCW updater script which can be used in the
+	  bootloader to change the installed RCW during runtime. The
+	  update script is called update-rcw.img and will be copied
+	  to the output directory.
+
+config BR2_PACKAGE_RCW_SMARC_SAL28_BOOT_VARIANT
+	string "RCW variant for booting"
+	default "3-11_q"
+	help
+	  The suffix of the RCW filename without the ".bin" part.
+	  E.g.  setting this to "3-11_q" will use "sl28-3-11_q.bin".
+endif
diff --git a/package/rcw-smarc-sal28/rcw-smarc-sal28.hash b/package/rcw-smarc-sal28/rcw-smarc-sal28.hash
new file mode 100644
index 0000000000..1f9b42c0ba
--- /dev/null
+++ b/package/rcw-smarc-sal28/rcw-smarc-sal28.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256	8e53dfceeb7f15d9e890dd4f69db505727276185f7438a5034616d392ff8f223  rcw-smarc-sal28-10.tar.gz
+sha256	803c65088eed36a6697ca9f03f4379bbad24e276dc8da7fef5eb4dc4008415a1  COPYING
diff --git a/package/rcw-smarc-sal28/rcw-smarc-sal28.mk b/package/rcw-smarc-sal28/rcw-smarc-sal28.mk
new file mode 100644
index 0000000000..0dce543811
--- /dev/null
+++ b/package/rcw-smarc-sal28/rcw-smarc-sal28.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# rcw-smarc-sal28
+#
+################################################################################
+
+RCW_SMARC_SAL28_VERSION = 10
+RCW_SMARC_SAL28_SITE = $(call github,kontron,rcw-smarc-sal28,v$(RCW_SMARC_SAL28_VERSION))
+RCW_SMARC_SAL28_LICENSE = BSD-2-Clause
+RCW_SMARC_SAL28_LICENSE_FILES = COPYING
+RCW_SMARC_SAL28_INSTALL_TARGET = NO
+RCW_SMARC_SAL28_INSTALL_IMAGES = YES
+
+RCW_SMARC_SAL28_BOOT_VARIANT = $(call qstrip,$(BR2_PACKAGE_RCW_SMARC_SAL28_BOOT_VARIANT))
+
+ifeq ($(BR2_PACKAGE_RCW_SMARC_SAL28_BUILD_UPDATE_SCRIPT),y)
+RCW_SMARC_SAL28_DEPENDENCIES = host-uboot-tools
+define RCW_SMARC_SAL28_UPDATE_SCRIPT_BUILD_CMDS
+	MKIMAGE=$(HOST_DIR)/bin/mkimage $(MAKE) -C $(@D)/contrib all
+endef
+define RCW_SMARC_SAL28_UPDATE_SCRIPT_INSTALL_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/contrib/update-rcw.img $(BINARIES_DIR)/
+endef
+endif
+
+define RCW_SMARC_SAL28_BUILD_CMDS
+	$(RCW_SMARC_SAL28_UPDATE_SCRIPT_BUILD_CMDS)
+endef
+
+define RCW_SMARC_SAL28_INSTALL_IMAGES_CMDS
+	$(INSTALL) -d $(BINARIES_DIR)/rcw
+	$(INSTALL) -D -m 0644 $(@D)/sl28-*.bin $(BINARIES_DIR)/rcw/
+	ln -sf rcw/sl28-$(RCW_SMARC_SAL28_BOOT_VARIANT).bin $(BINARIES_DIR)/rcw.bin
+	$(RCW_SMARC_SAL28_UPDATE_SCRIPT_INSTALL_CMDS)
+endef
+
+$(eval $(generic-package))
