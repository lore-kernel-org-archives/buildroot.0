From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 23 May 2014 00:21:47 +0200
Subject: [Buildroot] [PATCH for next] package/tzdata: only compile the
	zoneinfo once
Message-ID: <1400797307-6741-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

We already compile the zoneinfo once for the host, so there is
no need to recompile it for the target, we can just re-use the
host files.

This has no impact on tz (the uClibc counterpart of tzdata), since
it already made use of the host files anyway.

This means we no longer need to extract the target variant of
tzdata, too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tzdata/tzdata.mk | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 58b5f13..b619851 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -7,7 +7,8 @@
 TZDATA_VERSION = 2014a
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = ftp://ftp.iana.org/tz/releases
-TZDATA_DEPENDENCIES = host-zic
+TZDATA_DEPENDENCIES = host-tzdata
+HOST_TZDATA_DEPENDENCIES = host-zic
 TZDATA_LICENSE = Public domain
 
 TZDATA_DEFAULT_ZONELIST = africa antarctica asia australasia backward etcetera \
@@ -21,24 +22,12 @@ endif
 
 TZDATA_LOCALTIME = $(call qstrip,$(BR2_TARGET_LOCALTIME))
 
-# Don't strip any path components during extraction.
-define TZDATA_EXTRACT_CMDS
-	gzip -d -c $(DL_DIR)/$(TZDATA_SOURCE) \
-		| $(TAR) --strip-components=0 -C $(@D) -xf -
-endef
-
-define TZDATA_BUILD_CMDS
-	(cd $(@D); \
-		for zone in $(TZDATA_ZONELIST); do \
-			$(ZIC) -d _output/posix -y yearistype.sh $$zone; \
-			$(ZIC) -d _output/right -L leapseconds -y yearistype.sh $$zone; \
-		done; \
-	)
-endef
+# No need to extract for target, we're using the host-installed files
+TZDATA_EXTRACT_CMDS =
 
 define TZDATA_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo
-	cp -a $(@D)/_output/* $(@D)/*.tab $(TARGET_DIR)/usr/share/zoneinfo
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share
+	cp -a $(HOST_DIR)/usr/share/zoneinfo $(TARGET_DIR)/usr/share/zoneinfo
 	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
 	for zone in posix/*; do                 \
 	    ln -sfn "$${zone}" "$${zone##*/}";  \
-- 
1.8.3.2
