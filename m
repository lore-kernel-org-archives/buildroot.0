From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Apr 2014 21:58:04 +0200
Subject: [Buildroot] [PATCH 2/6] system: add selection of a default localtime
In-Reply-To: <cover.1396900553.git.yann.morin.1998@free.fr>
References: <cover.1396900553.git.yann.morin.1998@free.fr>
Message-ID: <a4e40e88137b1d959e165e9720fcbef7286b2b06.1396900553.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[alexandre.belloni: move from "tzdata" to "system configuration"]
Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
[yann.morin.1998 at free.fr: move into the BR2_TARGET_TZ_INFO conditionnal block]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tzdata/tzdata.mk |  7 ++++++-
 system/Config.in         | 14 ++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 5900473..762a31e 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -39,8 +39,13 @@ define TZDATA_INSTALL_TARGET_CMDS
 	cp -a $(@D)/_output/* $(TARGET_DIR)/usr/share/zoneinfo
 	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
 	for zone in posix/*; do                 \
-	    ln -sfn "$${zone}" "$${zone##*/}";    \
+	    ln -sfn "$${zone}" "$${zone##*/}";  \
 	done
+	if [ -n "$(BR2_TARGET_LOCALTIME)" ]; then                           \
+	    cd $(TARGET_DIR)/etc;                                           \
+	    ln -sf ../usr/share/zoneinfo/$(BR2_TARGET_LOCALTIME) localtime; \
+	    echo "$(BR2_TARGET_LOCALTIME)" >timezone;                       \
+	fi
 endef
 
 $(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index d69e880..c700729 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -288,6 +288,20 @@ config BR2_TARGET_TZ_ZONELIST
 	  The full list is the list of files in the time zone database source,
 	  not including the build and .tab files.
 
+config BR2_TARGET_LOCALTIME
+	string "default local time"
+	help
+	  The time zone to install as the default local time, expressed as a
+	  tzdata location, such as:
+	    GMT
+	    Europe/Paris
+	    America/New_York
+	    Pacific/Wallis
+	    ...
+
+	  If empty, no local time will be set, and the dates will be
+	  expressed in UTC.
+
 endif # BR2_TARGET_TZ_INFO
 
 config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
-- 
1.8.3.2
