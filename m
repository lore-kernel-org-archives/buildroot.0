From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 18 Jul 2020 01:42:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: pre-create directories for
 services
Message-ID: <20200717234235.17829-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this adds a new hook and a corresponding variable to add
addirectories and files after installation.

various services need directories in /var when they are started,
and create them if necessary. Creating those before, allows
those services to start even if /var is read-only.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c202f5be02..b57365872e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -317,6 +317,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
 SYSTEMD_CONF_OPTS += -Dlogind=true
+SYSTEMD_POST_INSTALL_ENTRIES += var/lib/systemd/linger/
 else
 SYSTEMD_CONF_OPTS += -Dlogind=false
 endif
@@ -336,6 +337,7 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_HOMED),y)
 SYSTEMD_CONF_OPTS += -Dhomed=true
 SYSTEMD_DEPENDENCIES += cryptsetup openssl
+SYSTEMD_POST_INSTALL_ENTRIES += var/lib/systemd/home/
 else
 SYSTEMD_CONF_OPTS += -Dhomed=false
 endif
@@ -380,12 +382,14 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_COREDUMP),y)
 SYSTEMD_CONF_OPTS += -Dcoredump=true
 SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * - - - systemd core dump processing
+SYSTEMD_POST_INSTALL_ENTRIES += var/lib/systemd/coredump/
 else
 SYSTEMD_CONF_OPTS += -Dcoredump=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_PSTORE),y)
 SYSTEMD_CONF_OPTS += -Dpstore=true
+SYSTEMD_POST_INSTALL_ENTRIES += var/lib/systemd/pstore/
 else
 SYSTEMD_CONF_OPTS += -Dpstore=false
 endif
@@ -436,6 +440,7 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
 SYSTEMD_CONF_OPTS += -Dtimesyncd=true
 SYSTEMD_TIMESYNCD_USER = systemd-timesync -1 systemd-timesync -1 * - - - systemd Time Synchronization
+SYSTEMD_POST_INSTALL_ENTRIES += var/lib/systemd/timesync/
 else
 SYSTEMD_CONF_OPTS += -Dtimesyncd=false
 endif
@@ -485,18 +490,23 @@ ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
 SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
 endif
 
+define SYSTEMD_INSTALL_ENTRY_HOOK
+	mkdir -p -m700 $(TARGET_DIR)/var/lib/private $(TARGET_DIR)/var/log/private \
+		$(TARGET_DIR)/var/cache/private
+	mkdir -p -m1777 $(TARGET_DIR)/var/tmp
+	$(if $(BR2_PACKAGE_SYSTEMD_MACHINED),mkdir -p -m700 $(TARGET_DIR)/var/lib/machines)
+	mkdir -p $(addprefix $(TARGET_DIR)/,var/lib $(filter %/,$(SYSTEMD_POST_INSTALL_ENTRIES)))
+	touch $(addprefix $(TARGET_DIR)/,etc/machine-id $(filter-out %/,$(SYSTEMD_POST_INSTALL_ENTRIES)))
+endef
+
 define SYSTEMD_INSTALL_INIT_HOOK
 	ln -fs multi-user.target \
 		$(TARGET_DIR)/usr/lib/systemd/system/default.target
 endef
 
-define SYSTEMD_INSTALL_MACHINEID_HOOK
-	touch $(TARGET_DIR)/etc/machine-id
-endef
-
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
+	SYSTEMD_INSTALL_ENTRY_HOOK \
 	SYSTEMD_INSTALL_INIT_HOOK \
-	SYSTEMD_INSTALL_MACHINEID_HOOK \
 	SYSTEMD_INSTALL_RESOLVCONF_HOOK
 
 define SYSTEMD_INSTALL_IMAGES_CMDS
@@ -532,6 +542,10 @@ endef
 
 SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_INSTALL_NSSCONFIG_HOOK
 
+define SYSTEMD_PERMISSIONS
+	$(if $(SYSTEMD_TIMESYNCD_USER),/var/lib/systemd/timesync d 755 systemd-timesync systemd-timesync - - - - -)
+endef
+
 ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # systemd provides multiple units to autospawn getty as neede
 # * getty at .service to start a getty on normal TTY
-- 
2.27.0
