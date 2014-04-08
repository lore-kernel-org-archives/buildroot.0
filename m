From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Apr 2014 23:56:19 +0200
Subject: [Buildroot] [git commit] system: add selection of a default
	localtime
Message-ID: <20140408224018.B84869C3B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f595cde97cdc4b08f979407c9754f75970257d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: strip quotes/use local TZDATA_LOCALTIME variable]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[alexandre.belloni: move from "tzdata" to "system configuration"]
Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
[yann.morin.1998 at free.fr: move into the BR2_TARGET_TZ_INFO conditionnal block]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdata/tzdata.mk |    9 ++++++++-
 system/Config.in         |   14 ++++++++++++++
 2 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 5900473..c9824dc 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -19,6 +19,8 @@ else
 TZDATA_ZONELIST = $(call qstrip,$(BR2_TARGET_TZ_ZONELIST))
 endif
 
+TZDATA_LOCALTIME = $(call qstrip,$(BR2_TARGET_LOCALTIME))
+
 # Don't strip any path components during extraction.
 define TZDATA_EXTRACT_CMDS
 	gzip -d -c $(DL_DIR)/$(TZDATA_SOURCE) \
@@ -39,8 +41,13 @@ define TZDATA_INSTALL_TARGET_CMDS
 	cp -a $(@D)/_output/* $(TARGET_DIR)/usr/share/zoneinfo
 	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
 	for zone in posix/*; do                 \
-	    ln -sfn "$${zone}" "$${zone##*/}";    \
+	    ln -sfn "$${zone}" "$${zone##*/}";  \
 	done
+	if [ -n "$(TZDATA_LOCALTIME)" ]; then                           \
+	    cd $(TARGET_DIR)/etc;                                       \
+	    ln -sf ../usr/share/zoneinfo/$(TZDATA_LOCALTIME) localtime; \
+	    echo "$(TZDATA_LOCALTIME)" >timezone;                       \
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
