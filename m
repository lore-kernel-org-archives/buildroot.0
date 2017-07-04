From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  4 Jul 2017 08:56:39 +0200
Subject: [Buildroot] [PATCH 2/2 v2] system: use Etc/UTC as default timezone
In-Reply-To: <cover.1499151384.git.yann.morin.1998@free.fr>
References: <cover.1499151384.git.yann.morin.1998@free.fr>
Message-ID: <4928890759713fe0a785e193fa843dcff9805ed6.1499151384.git.yann.morin.1998@free.fr>
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

We fix that by requiring that the timezone is actually set. The check is
done by verifying that the timezone file is an actual file; if not set,
the test would find a directory and would thus fail.

Update the help entry accordingly.

Also fix indentation in tzdata.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Richard Braun <rbraun@sceen.net>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Martin Bark <martin@barkynet.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

---
Changes v1 -> v2:
  - don't accept an empty value as meaning the default; enforce that
    (Arnout)
  - comit log mentions indentation cleanups  (Arnout)

Note: our packaging of systemd currently does not support running on a
RO filesystem. This patch is part of the on-going effort to make it so.
---
 package/tz/tz.mk         | 13 +++++--------
 package/tzdata/tzdata.mk | 15 ++++++---------
 system/Config.in         |  4 +---
 3 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/package/tz/tz.mk b/package/tz/tz.mk
index 6b1f9f4d24..7386361088 100644
--- a/package/tz/tz.mk
+++ b/package/tz/tz.mk
@@ -25,15 +25,12 @@ define TZ_INSTALL_TARGET_CMDS
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
index 802d8479a3..8c8d224e4f 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -36,16 +36,13 @@ define TZDATA_INSTALL_TARGET_CMDS
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
index b47ae43844..858883955e 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -448,15 +448,13 @@ config BR2_TARGET_LOCALTIME
 	help
 	  The time zone to install as the default local time, expressed as a
 	  tzdata location, such as:
+	    Etc/UTC             (the default)
 	    GMT
 	    Europe/Paris
 	    America/New_York
 	    Pacific/Wallis
 	    ...
 
-	  If empty, no local time will be set, and the dates will be
-	  expressed in UTC.
-
 endif # BR2_TARGET_TZ_INFO
 
 config BR2_ROOTFS_USERS_TABLES
-- 
2.11.0
