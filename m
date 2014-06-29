From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 29 Jun 2014 15:28:59 +0200
Subject: [Buildroot] [PATCH v7] canfestival: new package
Message-ID: <1404048539-14788-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Eric Jarrige <eric.jarrige@armadeus.org>
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Cc: Davide Viti <zinosat@tiscali.it>

---
changes v6 -> v7:
- rebase
- remove patch (merged upstream)
- bump version

changes v5 -> v6:
- rebase
- fix typoes (ThomasP)
- remove Anagate and PeakSystem support (ThomasP)
- fix kernel dependency (ThomasP)
- fix license details (ThomasP)
- add comment why we are using generic-infra (ThomasP)
- make install commands failed if something goes wrong (ThomasP)

changes v4 -> v5:
- rebase
- cosmetic changes (Davide)

changes v3 -> v4:
- rebase
- pass --prefix=/usr to the configure call (Davide)
- misc. cleanup in canfestival.mk (Yann)
- keep package/Config.in alphabetically ordered

changes v2 -> v3:
- rename package libcanfestival -> canfestival (follow upstream name)
- add option to install examples
- use latest revision
- use tarball instead of hg clone
- cosmetic fixes and typos (Peter and Yegor)
- add note about the standard mainline can interface (Peter)
- set default max bus number to 1 (Peter)

changes v1 -> v2:
- clean/fix *.mk
---
 package/Config.in                  |  1 +
 package/canfestival/Config.in      | 96 ++++++++++++++++++++++++++++++++++++++
 package/canfestival/canfestival.mk | 61 ++++++++++++++++++++++++
 3 files changed, 158 insertions(+)
 create mode 100644 package/canfestival/Config.in
 create mode 100644 package/canfestival/canfestival.mk

diff --git a/package/Config.in b/package/Config.in
index d7e1acc..125571f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -724,6 +724,7 @@ endmenu
 menu "Networking"
 	source "package/agentpp/Config.in"
 	source "package/c-ares/Config.in"
+	source "package/canfestival/Config.in"
 	source "package/cppzmq/Config.in"
 	source "package/czmq/Config.in"
 	source "package/filemq/Config.in"
diff --git a/package/canfestival/Config.in b/package/canfestival/Config.in
new file mode 100644
index 0000000..83abe49
--- /dev/null
+++ b/package/canfestival/Config.in
@@ -0,0 +1,96 @@
+config BR2_PACKAGE_CANFESTIVAL
+	bool "canfestival"
+	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm
+	help
+	  CanFestival is an OpenSource CANOpen framework, licensed under
+	  LGPLv2.1 and GPLv2 for some drivers (virtual_kernel, lincan and
+	  copcican_comedi).
+
+	  http://www.canfestival.org
+
+if BR2_PACKAGE_CANFESTIVAL
+
+choice
+	prompt "driver to use"
+	default BR2_PACKAGE_CANFESTIVAL_SOCKET
+
+# AnaGate CAN(duo) driver [1] and PeakSystem CAN support [2] are not
+# available (not packaged in Buildroot)
+#
+# [1] http://www.anagate.de/en/index.html
+# [2] http://www.peak-system.com/linux/
+
+config BR2_PACKAGE_CANFESTIVAL_VIRTUAL
+	bool "virtual"
+	help
+	  Unix pipe based virtual CAN driver.
+
+config BR2_PACKAGE_CANFESTIVAL_VIRTUAL_KERNEL
+	bool "virtual_kernel"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Kernel module virtual CAN driver.
+
+config BR2_PACKAGE_CANFESTIVAL_SOCKET
+	bool "socket"
+	help
+	  SocketCAN (the standard mainline CAN bus interface).
+
+	  http://developer.berlios.de/projects/socketcan/
+
+config BR2_PACKAGE_CANFESTIVAL_LINCAN
+	bool "lincan"
+	help
+	  Lincan driver.
+
+	  http://www.ocera.org/download/components/WP7/lincan-0.3.3.html
+
+config BR2_PACKAGE_CANFESTIVAL_CAN4LINUX
+	bool "can4linux"
+	help
+	  Can4linux driver.
+
+	  http://www.port.de/engl/canprod/hw_can4linux.html
+
+config BR2_PACKAGE_CANFESTIVAL_COPCICAN_LINUX
+	bool "copcican_linux"
+	help
+	  User space driver interface for CO-PCICAN card.
+
+	  http://www.cosateq.com/
+
+config BR2_PACKAGE_CANFESTIVAL_COPCICAN_COMEDI
+	bool "copcican_comedi"
+	depends on BR2_LINUX_KERNEL
+	help
+	  COMEDI driver interface for CO-PCICAN card.
+
+	  http://www.cosateq.com/
+
+endchoice
+
+config BR2_PACKAGE_CANFESTIVAL_DRIVER
+	string
+	default "anagate_linux"	  if BR2_PACKAGE_CANFESTIVAL_ANAGATE_LINUX
+	default "peak_linux"	  if BR2_PACKAGE_CANFESTIVAL_PEAK_LINUX
+	default "virtual"	  if BR2_PACKAGE_CANFESTIVAL_VIRTUAL
+	default "virtual_kernel"  if BR2_PACKAGE_CANFESTIVAL_VIRTUAL_KERNEL
+	default "socket"	  if BR2_PACKAGE_CANFESTIVAL_SOCKET
+	default "lincan"	  if BR2_PACKAGE_CANFESTIVAL_LINCAN
+	default "can4linux"	  if BR2_PACKAGE_CANFESTIVAL_CAN4LINUX
+	default "copcican_linux"  if BR2_PACKAGE_CANFESTIVAL_COCPICAN_LINUX
+	default "copcican_comedi" if BR2_PACKAGE_CANFESTIVAL_COPCICAN_COMEDI
+
+config BR2_PACKAGE_CANFESTIVAL_ADDITIONAL_OPTIONS
+	string "additional configure options"
+	help
+	  Additional options can be passed directly to the configure script
+	  (e.g.: --MAX_CAN_BUS_ID=..., --SDO_MAX_LENGTH_TRANSFER=...,
+	  --SDO_BLOCK_SIZE=...).
+
+config BR2_PACKAGE_CANFESTIVAL_INSTALL_EXAMPLES
+	bool "install examples"
+	help
+	  Install binary application examples.
+
+endif
diff --git a/package/canfestival/canfestival.mk b/package/canfestival/canfestival.mk
new file mode 100644
index 0000000..75193cf
--- /dev/null
+++ b/package/canfestival/canfestival.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# canfestival
+#
+################################################################################
+
+# Revision 791:
+CANFESTIVAL_VERSION = 7740ac6fdedc
+CANFESTIVAL_SOURCE = $(CANFESTIVAL_VERSION).tar.bz2
+CANFESTIVAL_SITE = http://dev.automforge.net/CanFestival-3/archive
+# Runtime code is licensed LGPLv2, whereas accompanying developer tools and few
+# drivers (virtual_kernel, lincan and copcican_linux) are licensed GPLv2.
+CANFESTIVAL_LICENSE = LGPLv2.1+, GPLv2 for the virtual_kernel, lincan and copcican_linux drivers
+CANFESTIVAL_LICENSE_FILES = COPYING LICENCE
+CANFESTIVAL_INSTALL_STAGING = YES
+CANFESTIVAL_INSTALLED-y = src drivers
+CANFESTIVAL_INSTALLED-$(BR2_PACKAGE_CANFESTIVAL_INSTALL_EXAMPLES) += examples
+
+ifeq ($(BR2_PACKAGE_CANFESTIVAL_VIRTUAL_KERNEL)$(BR2_PACKAGE_CANFESTIVAL_COPCICAN_COMEDI),y)
+CANFESTIVAL_DEPENDENCIES += linux
+CANFESTIVAL_CONF_OPT += --kerneldir=$(LINUX_DIR)
+endif
+
+# canfestival uses its own hand-written build-system. Though there is configure
+# script, it does not use the autotools at all.
+# So, we use the generic-package infrastructure.
+define CANFESTIVAL_CONFIGURE_CMDS
+	cd $(@D) && \
+		$(TARGET_CONFIGURE_OPTS) ./configure \
+		--target=unix \
+		--arch=$(BR2_ARCH) \
+		--timers=unix \
+		--binutils=$(TARGET_CROSS) \
+		--cc="$(TARGET_CC)" \
+		--cxx="$(TARGET_CC)" \
+		--ld="$(TARGET_CC)" \
+		--prefix=/usr \
+		--can=$(BR2_PACKAGE_CANFESTIVAL_DRIVER) \
+		$(CANFESTIVAL_CONF_OPT) \
+		$(call qstrip,$(BR2_PACKAGE_CANFESTIVAL_ADDITIONAL_OPTIONS))
+endef
+
+define CANFESTIVAL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
+define CANFESTIVAL_INSTALL_TARGET_CMDS
+	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$$d install \
+			DESTDIR=$(TARGET_DIR) || exit 1 ; \
+	done
+endef
+
+define CANFESTIVAL_INSTALL_STAGING_CMDS
+	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$$d install \
+			DESTDIR=$(STAGING_DIR) || exit 1 ; \
+	done
+endef
+
+$(eval $(generic-package))
-- 
2.0.1
