From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  7 Nov 2014 17:03:26 +0100
Subject: [Buildroot] [PATCH 6/7] libz160: Use self-extractible helper
In-Reply-To: <1415376207-23292-1-git-send-email-jezz@sysmic.org>
References: <1415376207-23292-1-git-send-email-jezz@sysmic.org>
Message-ID: <1415376207-23292-7-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/freescale-imx/libz160/libz160.mk | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/package/freescale-imx/libz160/libz160.mk b/package/freescale-imx/libz160/libz160.mk
index d083d81..6d5d889 100644
--- a/package/freescale-imx/libz160/libz160.mk
+++ b/package/freescale-imx/libz160/libz160.mk
@@ -7,25 +7,14 @@ LIBZ160_VERSION = 11.09.01
 LIBZ160_SOURCE = libz160-bin-$(LIBZ160_VERSION).bin
 LIBZ160_SITE = $(FREESCALE_IMX_SITE)
 LIBZ160_INSTALL_STAGING = YES
-LIBZ160_LICENSE = Freescale Semiconductor Software License Agreement
 
-# No license file is included in the archive; we could extract it from
-# the self-extractor, but that's just too much effort.
-# This is a legal minefield: the EULA specifies that
-# the Board Support Package includes software and hardware (sic!)
-# for which a separate license is needed...
+# See freescale-imx
+LIBZ160_LICENSE = Freescale Semiconductor Software License Agreement
+LIBZ160_LICENSE_FILES = EULA
 LIBZ160_REDISTRIBUTE = NO
 
-# The archive is a shell-self-extractor of a bzipped tar. Output directory 
-# depends of version of source.
-# The --force makes sure it doesn't fail if the source dir already exists.
-# The --auto-accept skips the license check - not needed for us
-# because we have legal-info.
 define LIBZ160_EXTRACT_CMDS
-	(cd $(@D); \
-		sh $(DL_DIR)/$(LIBZ160_SOURCE) --force --auto-accept)
-	mv $(@D)/libz160-bin-$(LIBZ160_VERSION)/* $(@D)
-	rmdir $(@D)/libz160-bin-$(LIBZ160_VERSION)
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(LIBZ160_SOURCE))
 endef
 
 define LIBZ160_INSTALL_STAGING_CMDS
-- 
1.9.1
