From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue, 11 Dec 2018 10:21:06 +0100
Subject: [Buildroot] [v3] package/mosquitto: installing the mosquitto broker
 can be optional
Message-ID: <20181211092107.23800-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mosquitto package provides both the MQTT client library and
a broker, and the latter may be not needed (when connecting to
a remote broker). It should be therefore possible to not install and
start it on the target

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
Changes v1->v2:
    * Remove a useless patch to modify mosquitto's Makefile
    * Change the setting name from BR2_PACKAGE_MOSQUITTO_INSTALL_BROKER
                                to BR2_PACKAGE_MOSQUITTO_BROKER
    * Don't create a mosquitto user
Changes v2-> v3:
    * Require BR2_USE_MMU only for the broker
        * However there seems to be no real world example of
          (!MMU && STATIC_LIBS) in buildroot at the moment
    * Remove the dependency on BR2_TOOLCHAIN_HAS_SYNC_4, tested on:
        * br-m68k-5208-full.config   [SKIPPED]
        * br-m68k-68040-full.config  [OK]
        * br-sparc-uclibc.config     [OK]
        * br-sparc-uclibc.config     [OK]
    * Fix missing quotes around a variable in make invocation
---
 package/mosquitto/Config.in    | 15 +++++++++++----
 package/mosquitto/mosquitto.mk | 13 ++++++++++---
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 1e6418a4de..82bb83a8f4 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_MOSQUITTO
 	bool "mosquitto"
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_STATIC_LIBS # builds .so
 	help
 	  Mosquitto is an open source message broker that implements
@@ -15,6 +13,15 @@ config BR2_PACKAGE_MOSQUITTO
 	  http://mosquitto.org/
 
 comment "mosquitto needs a toolchain w/ dynamic library"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS
+
+config BR2_PACKAGE_MOSQUITTO_BROKER
+	bool "install the mosquitto broker"
+	default y
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_MOSQUITTO
+	help
+	  Build and install the mosquitto broker onto target.
+
+comment "the mosquitto broker needs a system with MMU"
+	depends on !BR2_USE_MMU
\ No newline at end of file
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index fcce0535cb..fd36d4452e 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -67,24 +67,30 @@ endef
 MOSQUITTO_POST_PATCH_HOOKS += MOSQUITTO_DISABLE_CPP
 endif
 
+MOSQUITTO_MAKE_DIRS = lib client
+ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER),y)
+	MOSQUITTO_MAKE_DIRS += src
+endif
+
 define MOSQUITTO_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DIRS="$(MOSQUITTO_MAKE_DIRS)" \
 		$(MOSQUITTO_MAKE_OPTS)
 endef
 
 define MOSQUITTO_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DIRS="$(MOSQUITTO_MAKE_DIRS)" \
 		$(MOSQUITTO_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
 endef
 
 define MOSQUITTO_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DIRS="$(MOSQUITTO_MAKE_DIRS)" \
 		$(MOSQUITTO_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 	rm -f $(TARGET_DIR)/etc/mosquitto/*.example
 	$(INSTALL) -D -m 0644 $(@D)/mosquitto.conf \
 		$(TARGET_DIR)/etc/mosquitto/mosquitto.conf
 endef
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER),y)
 define MOSQUITTO_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/mosquitto/S50mosquitto \
 		$(TARGET_DIR)/etc/init.d/S50mosquitto
@@ -101,5 +107,6 @@ endef
 define MOSQUITTO_USERS
 	mosquitto -1 nogroup -1 * - - - Mosquitto user
 endef
+endif
 
 $(eval $(generic-package))
-- 
2.19.2
