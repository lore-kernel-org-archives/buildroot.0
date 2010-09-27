From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Sep 2010 23:14:31 +0200
Subject: [Buildroot] [git commit master 1/1] lm-sensors: full install,
	install into staging, make bins configurable
Message-ID: <20100927211702.577298B6F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e4fe19c9b4049b47f7ae14f9878805a95fef5a93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use make install to install so we get libraries and man pages if enabled,
install into staging so other programs can find libsensors and add kconfig
options for each of the available programs.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lm-sensors/Config.in     |   41 ++++++++++++++++++++++++++++++++++++++
 package/lm-sensors/lm-sensors.mk |   37 +++++++++++++++++++++++-----------
 2 files changed, 66 insertions(+), 12 deletions(-)

diff --git a/package/lm-sensors/Config.in b/package/lm-sensors/Config.in
index 50eac38..33c59fd 100644
--- a/package/lm-sensors/Config.in
+++ b/package/lm-sensors/Config.in
@@ -8,3 +8,44 @@ config BR2_PACKAGE_LM_SENSORS
 
 	  http://www.lm-sensors.org/
 
+if BR2_PACKAGE_LM_SENSORS
+comment "lm-sensors tools"
+
+config BR2_PACKAGE_LM_SENSORS_SENSORS
+	bool "sensors"
+	default y
+	help
+	  Sensors is used to show the current readings of all sensor
+	  chips.
+
+config BR2_PACKAGE_LM_SENSORS_FANCONTROL
+	bool "fancontrol"
+	help
+	  Script for temperature driven fan control
+
+config BR2_PACKAGE_LM_SENSORS_ISADUMP
+	bool "isadump"
+	help
+	  Isadump is a small helper program to examine registers
+	  visible through the ISA bus.
+
+config BR2_PACKAGE_LM_SENSORS_ISASET
+	bool "isaset"
+	help
+	  Isaset is a small helper program to set register visible
+	  through the ISA bus.
+
+config BR2_PACKAGE_LM_SENSORS_PWMCONFIG
+	bool "pwmconfig"
+	help
+	  Pwmconfig searches your sensors for pulse width modulation (PWM)
+	  controls, and tests each one to see if it controls a fan on
+	  your motherboard.
+
+config BR2_PACKAGE_LM_SENSORS_SENSORS_DETECT
+	bool "sensors-detect"
+	help
+	  Sensors-detect is an interactive program for detecting
+	  available hardware monitoring chips.
+
+endif
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 9eb8a87..9543d2e 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -6,27 +6,40 @@
 LM_SENSORS_VERSION = 3.1.2
 LM_SENSORS_SOURCE = lm_sensors-$(LM_SENSORS_VERSION).tar.bz2
 LM_SENSORS_SITE = http://dl.lm-sensors.org/lm-sensors/releases
-LM_SENSORS_TARGET_BINARY = usr/bin/sensors
+LM_SENSORS_INSTALL_STAGING = YES
+
+LM_SENSORS_BINS_ = bin/sensors-conf-convert
+LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_SENSORS) += bin/sensors
+LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_FANCONTROL) += sbin/fancontrol
+LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_ISADUMP) += sbin/isadump
+LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_ISASET) += sbin/isaset
+LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_SENSORS_DETECT) += sbin/sensors-detect
 
 define LM_SENSORS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) MACHINE=$(KERNEL_ARCH) -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) MACHINE=$(KERNEL_ARCH) \
+		PREFIX=/usr -C $(@D)
+endef
+
+define LM_SENSORS_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) install
+	rm -f $(addprefix $(STAGING_DIR)/usr/,$(LM_SENSORS_BINS_) $(LM_SENSORS_BINS_y))
+endef
+
+define LM_SENSORS_UNINSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) uninstall
 endef
 
 define LM_SENSORS_INSTALL_TARGET_CMDS
-	if [ ! -f $(TARGET_DIR)/etc/sensors.conf ]; then \
-		cp -dpf $(@D)/etc/sensors.conf.eg $(TARGET_DIR)/etc/sensors.conf; \
-		$(SED) '/^#/d' -e '/^[[:space:]]*$$/d' $(TARGET_DIR)/etc/sensors.conf; \
-	fi
-	cp -dpf $(@D)/prog/sensors/sensors $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY)
-	cp -dpf $(@D)/lib/libsensors.so* \
-		$(@D)/lib/libsensors.a $(TARGET_DIR)/usr/lib/
+	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
+	rm -f $(addprefix $(TARGET_DIR)/usr/,$(LM_SENSORS_BINS_))
+endef
+
+define LM_SENSORS_UNINSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) uninstall
 endef
 
 define LM_SENSORS_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
-	rm -f $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY) \
-		$(TARGET_DIR)/usr/lib/libsensors* \
-		$(TARGET_DIR)/etc/sensors.conf
 endef
 
 $(eval $(call GENTARGETS,package,lm-sensors))
-- 
1.7.1
