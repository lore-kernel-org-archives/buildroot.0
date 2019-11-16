From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Nov 2019 10:10:04 +0100
Subject: [Buildroot] [PATCH] system: allow not setting a default,
 system-wide time zone
Message-ID: <20191116091004.23726-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is valid that there is no system-wide default time zone defined, in
which case Etc/UTC is assumed.

Fixes: #12316

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Martin Bark <martin@barkynet.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Braun <rbraun@sceen.net>
Cc: Andrew Trapani <andrew.trapani@ontera.bio>
---
 package/tz/tz.mk         | 17 +++++++++++------
 package/tzdata/tzdata.mk | 19 ++++++++++++-------
 system/Config.in         |  2 ++
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/package/tz/tz.mk b/package/tz/tz.mk
index 1e797046d2..135726c2ce 100644
--- a/package/tz/tz.mk
+++ b/package/tz/tz.mk
@@ -8,6 +8,16 @@ TZ_DEPENDENCIES = host-tzdata host-tzdump
 TZ_LICENSE = Public domain
 
 TZ_LOCALTIME = $(call qstrip,$(BR2_TARGET_LOCALTIME))
+ifneq ($(TZ_LOCALTIME),)
+define TZ_SET_LOCALTIME
+	if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/uclibc/$(TZ_LOCALTIME) ]; then \
+		printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
+			"$(TZ_LOCALTIME)"; \
+		exit 1; \
+	fi
+	ln -sf ../usr/share/zoneinfo/uclibc/$(TZ_LOCALTIME) $(TARGET_DIR)/etc/TZ
+endef
+endif
 
 define TZ_BUILD_CMDS
 	(cd $(HOST_DIR)/share/zoneinfo/posix/; \
@@ -25,12 +35,7 @@ define TZ_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/zoneinfo/iso3166.tab
 	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 	cp -a $(@D)/output/* $(TARGET_DIR)/usr/share/zoneinfo/uclibc
-	if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/uclibc/$(TZ_LOCALTIME) ]; then \
-		printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
-			"$(TZ_LOCALTIME)"; \
-		exit 1; \
-	fi
-	ln -sf ../usr/share/zoneinfo/uclibc/$(TZ_LOCALTIME) $(TARGET_DIR)/etc/TZ
+	$(TZ_SET_LOCALTIME)
 endef
 
 $(eval $(generic-package))
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 4d097dbee9..b656bc7f7f 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -26,6 +26,17 @@ TZDATA_ZONELIST = $(call qstrip,$(BR2_TARGET_TZ_ZONELIST))
 endif
 
 TZDATA_LOCALTIME = $(call qstrip,$(BR2_TARGET_LOCALTIME))
+ifneq ($(TZDATA_LOCALTIME),)
+define TZDATA_SET_LOCALTIME
+	if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/$(TZDATA_LOCALTIME) ]; then \
+		printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
+			"$(TZDATA_LOCALTIME)"; \
+		exit 1; \
+	fi
+	ln -sf ../usr/share/zoneinfo/$(TZDATA_LOCALTIME) $(TARGET_DIR)/etc/localtime
+	echo "$(TZDATA_LOCALTIME)" >$(TARGET_DIR)/etc/timezone
+endef
+endif
 
 # No need to extract for target, we're using the host-installed files
 TZDATA_EXTRACT_CMDS =
@@ -37,13 +48,7 @@ define TZDATA_INSTALL_TARGET_CMDS
 	for zone in posix/*; do \
 	    ln -sfn "$${zone}" "$${zone##*/}"; \
 	done
-	if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/$(TZDATA_LOCALTIME) ]; then \
-		printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
-			"$(TZDATA_LOCALTIME)"; \
-		exit 1; \
-	fi
-	ln -sf ../usr/share/zoneinfo/$(TZDATA_LOCALTIME) $(TARGET_DIR)/etc/localtime
-	echo "$(TZDATA_LOCALTIME)" >$(TARGET_DIR)/etc/timezone
+	$(TZDATA_SET_LOCALTIME)
 endef
 
 define HOST_TZDATA_BUILD_CMDS
diff --git a/system/Config.in b/system/Config.in
index c87266f431..c8c5be40e0 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -494,6 +494,8 @@ config BR2_TARGET_LOCALTIME
 	    Pacific/Wallis
 	    ...
 
+	  Set to empty to not install a default time zone.
+
 endif # BR2_TARGET_TZ_INFO
 
 config BR2_ROOTFS_USERS_TABLES
-- 
2.20.1
