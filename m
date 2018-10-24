From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 24 Oct 2018 21:01:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: installing the mosquitto
 broker can be optional
Message-ID: <20181024190103.24158-1-titouan.christophe@railnova.eu>
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
 .../0002-DIRS-externally-configurable.patch         |  9 +++++++++
 package/mosquitto/Config.in                         |  9 +++++++++
 package/mosquitto/mosquitto.mk                      | 13 ++++++++++---
 3 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 package/mosquitto/0002-DIRS-externally-configurable.patch

diff --git a/package/mosquitto/0002-DIRS-externally-configurable.patch b/package/mosquitto/0002-DIRS-externally-configurable.patch
new file mode 100644
index 0000000000..a95a7db14b
--- /dev/null
+++ b/package/mosquitto/0002-DIRS-externally-configurable.patch
@@ -0,0 +1,9 @@
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ include config.mk
+ 
+-DIRS=lib client src
++DIRS:=lib client src
+ DOCDIRS=man
+ DISTDIRS=man
diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 1e6418a4de..54856c1c80 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -14,6 +14,15 @@ config BR2_PACKAGE_MOSQUITTO
 
 	  http://mosquitto.org/
 
+
+config BR2_PACKAGE_MOSQUITTO_INSTALL_BROKER
+	bool "Install the mosquitto broker"
+	default y
+	depends on BR2_PACKAGE_MOSQUITTO
+	help
+	  Build and install the mosquitto broker onto target
+
+
 comment "mosquitto needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 1d72f9b16e..c6604efda3 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -67,24 +67,30 @@ endef
 MOSQUITTO_POST_PATCH_HOOKS += MOSQUITTO_DISABLE_CPP
 endif
 
+MOSQUITTO_MAKE_DIRS = lib client
+ifeq ($(BR2_PACKAGE_MOSQUITTO_INSTALL_BROKER),y)
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
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_INSTALL_BROKER),y)
 define MOSQUITTO_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/mosquitto/S50mosquitto \
 		$(TARGET_DIR)/etc/init.d/S50mosquitto
@@ -97,6 +103,7 @@ define MOSQUITTO_INSTALL_INIT_SYSTEMD
 	ln -fs ../../../../usr/lib/systemd/system/mosquitto.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mosquitto.service
 endef
+endif
 
 define MOSQUITTO_USERS
 	mosquitto -1 nogroup -1 * - - - Mosquitto user
-- 
2.18.1
