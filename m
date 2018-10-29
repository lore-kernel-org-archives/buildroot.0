From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 29 Oct 2018 17:54:24 +0100
Subject: [Buildroot] [-v2] package/mosquitto: installing the mosquitto
 broker can be optional
In-Reply-To: <20181024190103.24158-1-titouan.christophe@railnova.eu>
References: <20181024190103.24158-1-titouan.christophe@railnova.eu>
Message-ID: <20181029165424.1282-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mosquitto package providess both the MQTT client library and
a broker, and the latter may be not needed (when connecting to
a remote broker). It should be therefore possible to not install and
start it on the target

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/mosquitto/Config.in    |  7 +++++++
 package/mosquitto/mosquitto.mk | 13 ++++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 1e6418a4de..92fbd7af89 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -14,6 +14,13 @@ config BR2_PACKAGE_MOSQUITTO
 
 	  http://mosquitto.org/
 
+config BR2_PACKAGE_MOSQUITTO_BROKER
+	bool "Install the mosquitto broker"
+	default y
+	depends on BR2_PACKAGE_MOSQUITTO
+	help
+	  Build and install the mosquitto broker onto target
+
 comment "mosquitto needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 1d72f9b16e..6e0dd34a8f 100644
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
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DIRS=$(MOSQUITTO_MAKE_DIRS) \
 		$(MOSQUITTO_MAKE_OPTS)
 endef
 
 define MOSQUITTO_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DIRS=$(MOSQUITTO_MAKE_DIRS) \
 		$(MOSQUITTO_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
 endef
 
 define MOSQUITTO_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DIRS=$(MOSQUITTO_MAKE_DIRS) \
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
2.18.1
