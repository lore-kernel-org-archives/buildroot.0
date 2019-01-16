From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 16 Jan 2019 23:51:34 +0200
Subject: [Buildroot] [RFC 2/3] package/s6-linux-init: Allow to install as
 init system
In-Reply-To: <20190116215135.32142-1-vadim4j@gmail.com>
References: <20190116215135.32142-1-vadim4j@gmail.com>
Message-ID: <20190116215135.32142-3-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add BR2_INIT_S6 option which allows to install minimal init support
by s6-linux-init-maker into /etc/s6 and link /sbin/init to it.

Also 2 additional files /etc/rc.init and /etc/rc.shutdown are generated as
dummy "execline'd" scripts which are triggered by /etc/s6/init.

Consider generic tty option support and generate getty service if
needed by s6-linux-init-maker.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/s6-linux-init/s6-linux-init.mk | 40 ++++++++++++++++++++++++++++++++++
 system/Config.in                       |  9 ++++++--
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index 913f837c1f..c298d62477 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -33,6 +33,46 @@ define S6_LINUX_INIT_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
+ifeq ($(BR2_INIT_S6),y)
+
+# Don't let Busybox to install it's own tools like poweroff, reboot, halt, etc
+S6_LINUX_INIT_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
+
+S6_LINUX_INIT_MAKER_OPTS = -b /usr/bin -c /etc/s6
+
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
+S6_LINUX_INIT_MAKER_OPTS += -d 0
+else
+S6_LINUX_INIT_MAKER_OPTS += $(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS),,-d 1)
+endif
+
+ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
+S6_LINUX_INIT_MAKER_OPTS += -G "/sbin/getty -L \
+			  $(SYSTEM_GETTY_OPTIONS) \
+			  $(SYSTEM_GETTY_PORT) \
+			  $(SYSTEM_GETTY_BAUDRATE) \
+			  $(SYSTEM_GETTY_TERM)"
+endif
+
+define S6_LINUX_INIT_INSTALL_INIT
+	ln -sf ../etc/s6/init $(TARGET_DIR)/sbin/init
+
+	ln -sf /usr/bin/s6-reboot $(TARGET_DIR)/sbin/reboot
+	ln -sf /usr/bin/s6-poweroff $(TARGET_DIR)/sbin/poweroff
+	ln -sf /usr/bin/s6-halt $(TARGET_DIR)/sbin/halt
+
+	echo "#! /usr/bin/execlineb -P" > $(@D)/rc.init
+	$(INSTALL) -m 0755 $(@D)/rc.init $(TARGET_DIR)/etc/rc.init
+	echo "#! /usr/bin/execlineb -P" > $(@D)/rc.shutdown
+	$(INSTALL) -m 0755 $(@D)/rc.shutdown $(TARGET_DIR)/etc/rc.shutdown
+
+	rm -rf $(TARGET_DIR)/etc/s6
+	$(HOST_DIR)/bin/s6-linux-init-maker $(S6_LINUX_INIT_MAKER_OPTS) $(TARGET_DIR)/etc/s6
+endef
+S6_LINUX_INIT_POST_INSTALL_TARGET_HOOKS += S6_LINUX_INIT_INSTALL_INIT
+
+endif # BR2_INIT_S6
+
 HOST_S6_LINUX_INIT_DEPENDENCIES = host-s6
 
 HOST_S6_LINUX_INIT_CONF_OPTS = \
diff --git a/system/Config.in b/system/Config.in
index 9941807e5d..5bab283931 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -12,6 +12,7 @@ config BR2_ROOTFS_SKELETON_DEFAULT
 	select BR2_PACKAGE_SKELETON_INIT_SYSV if BR2_INIT_SYSV
 	select BR2_PACKAGE_SKELETON_INIT_SYSV if BR2_INIT_BUSYBOX
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_SKELETON_INIT_COMMON if BR2_INIT_S6
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_INIT_NONE
 	help
 	  Use default target skeleton
@@ -124,6 +125,10 @@ comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.10"
 		!BR2_TOOLCHAIN_HAS_SSP || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 
+config BR2_INIT_S6
+	bool "s6"
+	select BR2_PACKAGE_S6_LINUX_INIT
+
 config BR2_INIT_NONE
 	bool "None"
 	help
@@ -342,7 +347,7 @@ config BR2_TARGET_GENERIC_GETTY_TERM
 	string "TERM environment variable"
 	default "vt100"
 	# currently observed only by busybox and sysvinit
-	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV
+	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV || BR2_INIT_S6
 	help
 	  Specify a TERM type.
 
@@ -350,7 +355,7 @@ config BR2_TARGET_GENERIC_GETTY_OPTIONS
 	string "other options to pass to getty"
 	default ""
 	# currently observed only by busybox and sysvinit
-	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV
+	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV || BR2_INIT_S6
 	help
 	  Any other flags you want to pass to getty,
 	  Refer to getty --help for details.
-- 
2.14.1
