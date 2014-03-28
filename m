From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Mar 2014 01:00:21 +0100
Subject: [Buildroot] [PATCH 04/10] package/dvb-apps: rely on dtv-scan-tables
	to provide transponder data
In-Reply-To: <cover.1395964430.git.yann.morin.1998@free.fr>
References: <cover.1395964430.git.yann.morin.1998@free.fr>
Message-ID: <d89014f28135fbdc30d5e56f4ef25a7d71720039.1395964430.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This is a transitioning solution before switching packages that need the
transponders data, to use dtv-scan-tables instead of dvb-apps.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/dtv-scan-tables/Config.in |  2 --
 package/dvb-apps/Config.in        |  1 +
 package/dvb-apps/dvb-apps.mk      | 23 +++++------------------
 3 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/package/dtv-scan-tables/Config.in b/package/dtv-scan-tables/Config.in
index 05a3b1c..e102ca7 100644
--- a/package/dtv-scan-tables/Config.in
+++ b/package/dtv-scan-tables/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_DTV_SCAN_TABLES
 	bool "dtv-scan-tables"
-	# dvb-apps installs its own set of transponder data
-	depends on !BR2_PACKAGE_DVB_APPS
 	help
 	  The Digital TV scan tables.
 
diff --git a/package/dvb-apps/Config.in b/package/dvb-apps/Config.in
index ea0a12f..76b33aa 100644
--- a/package/dvb-apps/Config.in
+++ b/package/dvb-apps/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DVB_APPS
 	bool "dvb-apps (transponders data)"
+	select BR2_PACKAGE_DTV_SCAN_TABLES
 	help
 	  Install the DVB-C, DVB-S, DVB-T and ATSC transponders data.
 
diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index e351258..5f576e0 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -8,21 +8,13 @@ DVB_APPS_VERSION        = be76da69f250
 DVB_APPS_SITE           = http://linuxtv.org/hg/dvb-apps
 DVB_APPS_SITE_METHOD    = hg
 
-# We just install the transponders data. As this is not a 'work' as per
-# traditional copyright, but just a collection of 'facts', there's probably
-# no license to apply to these data files.
-# To be noted however, is that the dvb-apps package bundles a copy of the
-# GPLv2 and a copy of the LGPLv2.1, and that some of the source files refer
-# to either the GPLv2+ or the LGPLv2.1+.
-# But since we do not use any of those source files, their license do not
-# apply to us.
-DVB_APPS_LICENSE        = unknown (probably public domain)
+DVB_APPS_DEPENDENCIES   = dtv-scan-tables
 
 ifeq ($(BR2_PACKAGE_DVB_APPS_UTILS),y)
 # Utilitiess are selected, build and install everything
 
-DVB_APPS_LICENSE       += GPLv2 GPLv2+ LGPLv2.1+
-DVB_APPS_LICENSE_FILES += COPYING COPYING.LGPL
+DVB_APPS_LICENSE        = GPLv2 GPLv2+ LGPLv2.1+
+DVB_APPS_LICENSE_FILES  = COPYING COPYING.LGPL
 
 DVB_APPS_LDFLAGS = $(TARGET_LDFLAGS)
 
@@ -47,13 +39,8 @@ define DVB_APPS_INSTALL_TARGET_CMDS
 endef
 
 else
-# Utilities are not selected, just install the scan files
-define DVB_APPS_INSTALL_TARGET_CMDS
-	for i in atsc dvb-c dvb-s dvb-t; do \
-		mkdir -p $(TARGET_DIR)/usr/share/dvb/$$i; \
-		$(INSTALL) $(@D)/util/scan/$$i/* $(TARGET_DIR)/usr/share/dvb/$$i; \
-	done
-endef
+# We do not really install anything, so there's no license
+DVB_APPS_LICENSE        = none
 endif
 
 $(eval $(generic-package))
-- 
1.8.3.2
