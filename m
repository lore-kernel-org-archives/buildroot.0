From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2013 01:02:43 +0100
Subject: [Buildroot] [PATCH] package/tzdata: install a default localtime
Message-ID: <1388275363-8634-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Add an option to install a default localtime.

since tzdata only makes sense for (e)glibc, we don't care
that we install timezone files that uClibc can't understand.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tzdata/Config.in | 10 ++++++++++
 package/tzdata/tzdata.mk |  8 +++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/tzdata/Config.in b/package/tzdata/Config.in
index 1be6814..c0ede1f 100644
--- a/package/tzdata/Config.in
+++ b/package/tzdata/Config.in
@@ -23,4 +23,14 @@ config BR2_PACKAGE_TZDATA_ZONELIST
 	  The full list is the list of files in the time zone database source,
 	  not including the build and .tab files.
 
+config BR2_PACKAGE_TZDATA_LOCALTIME
+	string "default local time"
+	help
+	  The time zone to install as the default local time, expressed as a
+	  tzdata location, such as:
+	    GMT, Europe/Paris, America/New_York, Pacific/Wallis...
+
+	  If empty, no local time will be set, and the dates will be
+	  expressed in UTC.
+
 endif
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 1cb5b3f..74263e1 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -39,8 +39,14 @@ define TZDATA_INSTALL_TARGET_CMDS
 	cp -a $(@D)/_output/* $(TARGET_DIR)/usr/share/zoneinfo
 	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
 	for zone in posix/*; do                 \
-	    ln -sfn "$${zone}" "$${zone##*/}";    \
+	    ln -sfn "$${zone}" "$${zone##*/}";  \
 	done
+	if [ -n "$(BR2_PACKAGE_TZDATA_LOCALTIME)" ]; then                   \
+	    cd $(TARGET_DIR)/etc;                                           \
+	    ln -sf ../usr/share/zoneinfo/$(BR2_PACKAGE_TZDATA_LOCALTIME)    \
+	           localtime;                                               \
+	    echo "$(BR2_PACKAGE_TZDATA_LOCALTIME)" >timezone;               \
+	fi
 endef
 
 $(eval $(generic-package))
-- 
1.8.1.2
