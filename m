From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 May 2014 22:40:59 +0200
Subject: [Buildroot] [PATCH] system/timezone: check localtime exists
Message-ID: <1400791259-2017-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

When installing a localtime, check it is a valid timezone.

Reported-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tz/tz.mk         | 5 +++++
 package/tzdata/tzdata.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/tz/tz.mk b/package/tz/tz.mk
index 865ba3b..3198db7 100644
--- a/package/tz/tz.mk
+++ b/package/tz/tz.mk
@@ -27,6 +27,11 @@ define TZ_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 	cp -a $(@D)/output/* $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 	if [ -n "$(TZ_LOCALTIME)" ]; then                               \
+	    if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) ]; then \
+	        printf "'%s' is not a valid timezone\n"                 \
+	               "$(TZDATA_LOCALTIME)";                           \
+	        exit 1;                                                 \
+	    fi;                                                         \
 	    cd $(TARGET_DIR)/etc;                                       \
 	    ln -sf ../usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) TZ; \
 	fi
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index a498d10..c394dd2 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -44,6 +44,11 @@ define TZDATA_INSTALL_TARGET_CMDS
 	    ln -sfn "$${zone}" "$${zone##*/}";  \
 	done
 	if [ -n "$(TZDATA_LOCALTIME)" ]; then                           \
+	    if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/$(TZDATA_LOCALTIME) ]; then \
+	        printf "'%s' is not a valid timezone\n"                 \
+	               "$(TZDATA_LOCALTIME)";                           \
+	        exit 1;                                                 \
+	    fi;                                                         \
 	    cd $(TARGET_DIR)/etc;                                       \
 	    ln -sf ../usr/share/zoneinfo/$(TZDATA_LOCALTIME) localtime; \
 	    echo "$(TZDATA_LOCALTIME)" >timezone;                       \
-- 
1.8.3.2
