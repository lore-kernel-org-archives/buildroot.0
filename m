From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Jul 2017 21:22:10 +0200
Subject: [Buildroot] [PATCH 2/2] system: use Etc/UTC as default timezone
In-Reply-To: <cover.1499109719.git.yann.morin.1998@free.fr>
References: <cover.1499109719.git.yann.morin.1998@free.fr>
Message-ID: <8704f2d3078e10fe9df1c73b02bca452f8aab5b2.1499109719.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though no timezone implicitly means UTC, systemd is not all that
happy when it does not have a timezone set. This is all fine on a RW
filesystem because systemd will create a symlink on its own (to
Etc/UTC), but not so much on a RO filesystem, causing all kind of
issues at boot time (up to the point that the system is unusable).

We fix that by defaulting to using Etc/UTC when no timezone is set.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Richard Braun <rbraun@sceen.net>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Martin Bark <martin@barkynet.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

---
Note: our packaging of systemd currently does not support running on a
RO filesystem. This patch is part of the on-going effort to make it so.
---
 package/tz/tz.mk         | 17 +++++++++--------
 package/tzdata/tzdata.mk | 19 ++++++++++---------
 system/Config.in         |  3 +--
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/package/tz/tz.mk b/package/tz/tz.mk
index 6b1f9f4d24..8043406979 100644
--- a/package/tz/tz.mk
+++ b/package/tz/tz.mk
@@ -7,7 +7,11 @@
 TZ_DEPENDENCIES = host-tzdata host-tzdump
 TZ_LICENSE = Public domain
 
+# If local time is not set, use Etc/UTC as a default.
 TZ_LOCALTIME = $(call qstrip,$(BR2_TARGET_LOCALTIME))
+ifeq ($(TZ_LOCALTIME),)
+TZ_LOCALTIME = Etc/UTC
+endif
 
 define TZ_BUILD_CMDS
 	(cd $(HOST_DIR)/usr/share/zoneinfo/posix/; \
@@ -25,15 +29,12 @@ define TZ_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/zoneinfo/iso3166.tab
 	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 	cp -a $(@D)/output/* $(TARGET_DIR)/usr/share/zoneinfo/uclibc
-	if [ -n "$(TZ_LOCALTIME)" ]; then \
-		if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/uclibc/$(TZ_LOCALTIME) ]; then \
-			printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
-				"$(TZ_LOCALTIME)"; \
-			exit 1; \
-		fi; \
-		cd $(TARGET_DIR)/etc; \
-		ln -sf ../usr/share/zoneinfo/uclibc/$(TZ_LOCALTIME) TZ; \
+	if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/uclibc/$(TZ_LOCALTIME) ]; then \
+		printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
+			"$(TZ_LOCALTIME)"; \
+		exit 1; \
 	fi
+	ln -sf ../usr/share/zoneinfo/uclibc/$(TZ_LOCALTIME) $(TARGET_DIR)/etc/TZ
 endef
 
 $(eval $(generic-package))
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 802d8479a3..84ac564410 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -24,7 +24,11 @@ else
 TZDATA_ZONELIST = $(call qstrip,$(BR2_TARGET_TZ_ZONELIST))
 endif
 
+# If local time is not set, use Etc/UTC as a default.
 TZDATA_LOCALTIME = $(call qstrip,$(BR2_TARGET_LOCALTIME))
+ifeq ($(TZDATA_LOCALTIME),)
+TZDATA_LOCALTIME = Etc/UTC
+endif
 
 # No need to extract for target, we're using the host-installed files
 TZDATA_EXTRACT_CMDS =
@@ -36,16 +40,13 @@ define TZDATA_INSTALL_TARGET_CMDS
 	for zone in posix/*; do \
 	    ln -sfn "$${zone}" "$${zone##*/}"; \
 	done
-	if [ -n "$(TZDATA_LOCALTIME)" ]; then \
-	    if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/$(TZDATA_LOCALTIME) ]; then \
-	        printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
-	               "$(TZDATA_LOCALTIME)"; \
-	        exit 1; \
-	    fi; \
-	    cd $(TARGET_DIR)/etc; \
-	    ln -sf ../usr/share/zoneinfo/$(TZDATA_LOCALTIME) localtime; \
-	    echo "$(TZDATA_LOCALTIME)" >timezone; \
+	if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/$(TZDATA_LOCALTIME) ]; then \
+		printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
+			"$(TZDATA_LOCALTIME)"; \
+		exit 1; \
 	fi
+	ln -sf ../usr/share/zoneinfo/$(TZDATA_LOCALTIME) $(TARGET_DIR)/etc/localtime
+	echo "$(TZDATA_LOCALTIME)" >$(TARGET_DIR)/etc/timezone
 endef
 
 define HOST_TZDATA_BUILD_CMDS
diff --git a/system/Config.in b/system/Config.in
index b47ae43844..643c6f37f1 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -454,8 +454,7 @@ config BR2_TARGET_LOCALTIME
 	    Pacific/Wallis
 	    ...
 
-	  If empty, no local time will be set, and the dates will be
-	  expressed in UTC.
+	  If empty, the default is to use Etc/UTC as a localtime.
 
 endif # BR2_TARGET_TZ_INFO
 
-- 
2.11.0
