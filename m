From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Dec 2018 09:40:51 +0100
Subject: [Buildroot] [git commit] package/mosquitto: make broker optional
Message-ID: <20181215084256.17FC48B80E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fc62e1eb6b3adbfc3d3eb7f841275ae8cd1b424
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mosquitto package provides both the MQTT client library and
a broker, and the latter may be not needed (when connecting to
a remote broker). It should be therefore possible to not install and
start it on the target

Also remove the dependency on BR2_TOOLCHAIN_HAS_SYNC_4, as it does not seem
to be needed.  Verified with:

 * br-m68k-68040-full.config  [OK]
 * br-sparc-uclibc.config     [OK]

The original issue adding the dependency in commit 874d0784bb23d
(package/mosquito: needs sync_4) unfortunately refers to autobuilder results
that are no longer available.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
[Peter: extend commit message, fix comment line, remove indentation in .mk]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/Config.in    | 15 +++++++++++----
 package/mosquitto/mosquitto.mk | 13 ++++++++++---
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 1e6418a4de..9052b3059b 100644
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
+comment "mosquitto broker needs a system with MMU"
+	depends on !BR2_USE_MMU
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index fcce0535cb..9f3e1d3d5a 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -67,24 +67,30 @@ endef
 MOSQUITTO_POST_PATCH_HOOKS += MOSQUITTO_DISABLE_CPP
 endif
 
+MOSQUITTO_MAKE_DIRS = lib client
+ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER),y)
+MOSQUITTO_MAKE_DIRS += src
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
