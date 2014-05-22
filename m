From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 May 2014 23:52:18 +0200
Subject: [Buildroot] [git commit] system/timezone: check localtime exists
Message-ID: <20140522215335.9271B9C8DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f017a8961e071ceda5350e2d12b58d969b439dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When installing a localtime, check it is a valid timezone.

[Peter: extend error message to make it clear to the user what to change]
Reported-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tz/tz.mk         |    5 +++++
 package/tzdata/tzdata.mk |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/tz/tz.mk b/package/tz/tz.mk
index 865ba3b..770cc46 100644
--- a/package/tz/tz.mk
+++ b/package/tz/tz.mk
@@ -27,6 +27,11 @@ define TZ_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 	cp -a $(@D)/output/* $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 	if [ -n "$(TZ_LOCALTIME)" ]; then                               \
+	    if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) ]; then \
+	        printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
+	               "$(TZDATA_LOCALTIME)";                           \
+	        exit 1;                                                 \
+	    fi;                                                         \
 	    cd $(TARGET_DIR)/etc;                                       \
 	    ln -sf ../usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) TZ; \
 	fi
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index a498d10..58b5f13 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -44,6 +44,11 @@ define TZDATA_INSTALL_TARGET_CMDS
 	    ln -sfn "$${zone}" "$${zone##*/}";  \
 	done
 	if [ -n "$(TZDATA_LOCALTIME)" ]; then                           \
+	    if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/$(TZDATA_LOCALTIME) ]; then \
+	        printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
+	               "$(TZDATA_LOCALTIME)";                           \
+	        exit 1;                                                 \
+	    fi;                                                         \
 	    cd $(TARGET_DIR)/etc;                                       \
 	    ln -sf ../usr/share/zoneinfo/$(TZDATA_LOCALTIME) localtime; \
 	    echo "$(TZDATA_LOCALTIME)" >timezone;                       \
