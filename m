From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  7 Nov 2014 17:03:21 +0100
Subject: [Buildroot] [PATCH 1/7] freescale-imx: Add helper to extract
	self-extractible binaries
In-Reply-To: <1415376207-23292-1-git-send-email-jezz@sysmic.org>
References: <1415376207-23292-1-git-send-email-jezz@sysmic.org>
Message-ID: <1415376207-23292-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/freescale-imx/freescale-imx.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index c52fc11..38774ca 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -7,4 +7,25 @@
 FREESCALE_IMX_VERSION = 3.10.17-1.0.0
 FREESCALE_IMX_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO
 
+# Helper for self-extracting binaries distributed by Freescale.
+# The --force makes sure it doesn't fail if the source dir already exists.
+# The --auto-accept skips the license check - not needed for us
+# because we have legal-info
+# Since there's a EULA in the bin file, extract it
+# If you use this macro, don't forget to add "EULA" to LICENSE_FILES and set
+# REDISTRIBUTE to "NO". Indeed, this is a legal minefield:
+# the EULA specifies that the Board Support Package includes software
+# and hardware (sic!) for which a separate license is needed...
+define FREESCALE_IMX_EXTRACT_HELPER
+	awk 'BEGIN      { start = 0; } \
+	     /^EOEULA/  { start = 0; } \
+	                { if (start) print; } \
+	     /<<EOEULA/ { start = 1; }' \
+	    $(DL_DIR)/$(1) > $(@D)/EULA
+	cd $(@D) && sh $(DL_DIR)/$(1) --force --auto-accept;
+	find $(@D)/$(basename $(1)) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
+	rmdir $(@D)/$(basename $(1))
+endef
+
+
 include $(sort $(wildcard package/freescale-imx/*/*.mk))
-- 
1.9.1
