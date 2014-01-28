From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2014 22:46:37 +0100
Subject: [Buildroot] [git commit] Revert "package/tzdata: install a default
	localtime"
Message-ID: <20140128214755.7D7F89C650@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=167ca173f6f80670ffd4459aa996d4f421aed296
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit f96e4d7f348ce1b7b53763f102bbedb1ef6a1991.

As suggested by Thomas, we need to find a single solution that is
valid for both (e)glibc and uClibc.

There is work on-going by Alexandre, so just revert this for now.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdata/Config.in |   10 ----------
 package/tzdata/tzdata.mk |    8 +-------
 2 files changed, 1 insertions(+), 17 deletions(-)

diff --git a/package/tzdata/Config.in b/package/tzdata/Config.in
index c0ede1f..1be6814 100644
--- a/package/tzdata/Config.in
+++ b/package/tzdata/Config.in
@@ -23,14 +23,4 @@ config BR2_PACKAGE_TZDATA_ZONELIST
 	  The full list is the list of files in the time zone database source,
 	  not including the build and .tab files.
 
-config BR2_PACKAGE_TZDATA_LOCALTIME
-	string "default local time"
-	help
-	  The time zone to install as the default local time, expressed as a
-	  tzdata location, such as:
-	    GMT, Europe/Paris, America/New_York, Pacific/Wallis...
-
-	  If empty, no local time will be set, and the dates will be
-	  expressed in UTC.
-
 endif
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 74263e1..1cb5b3f 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -39,14 +39,8 @@ define TZDATA_INSTALL_TARGET_CMDS
 	cp -a $(@D)/_output/* $(TARGET_DIR)/usr/share/zoneinfo
 	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
 	for zone in posix/*; do                 \
-	    ln -sfn "$${zone}" "$${zone##*/}";  \
+	    ln -sfn "$${zone}" "$${zone##*/}";    \
 	done
-	if [ -n "$(BR2_PACKAGE_TZDATA_LOCALTIME)" ]; then                   \
-	    cd $(TARGET_DIR)/etc;                                           \
-	    ln -sf ../usr/share/zoneinfo/$(BR2_PACKAGE_TZDATA_LOCALTIME)    \
-	           localtime;                                               \
-	    echo "$(BR2_PACKAGE_TZDATA_LOCALTIME)" >timezone;               \
-	fi
 endef
 
 $(eval $(generic-package))
