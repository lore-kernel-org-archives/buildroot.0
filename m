From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 19 Nov 2014 22:30:39 +0100
Subject: [Buildroot] [PATCH v2 6/9] libfslvpuwrap: Use self-extractible
	helper
In-Reply-To: <1416432642-26005-1-git-send-email-jezz@sysmic.org>
References: <1416432642-26005-1-git-send-email-jezz@sysmic.org>
Message-ID: <1416432642-26005-7-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/libfslvpuwrap/libfslvpuwrap.mk | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
index c3a5c1c..3bdab99 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ b/package/libfslvpuwrap/libfslvpuwrap.mk
@@ -7,30 +7,16 @@
 LIBFSLVPUWRAP_VERSION = 1.0.46
 LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-$(LIBFSLVPUWRAP_VERSION).bin
+LIBFSLVPUWRAP_DEPENDENCIES = imx-vpu
+LIBFSLVPUWRAP_INSTALL_STAGING = YES
+
+# See freescale-imx.mk
 LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
-# N.B.: the content of the two license files is different
 LIBFSLVPUWRAP_LICENSE_FILES = EULA EULA.txt
 LIBFSLVPUWRAP_REDISTRIBUTE = NO
 
-LIBFSLVPUWRAP_INSTALL_STAGING = YES
-
-LIBFSLVPUWRAP_DEPENDENCIES += imx-vpu
-
-# The archive is a shell-self-extractor of a bzipped tar. It happens
-# to extract in the correct directory (libfslvpuwrap-x.y.z)
-# The --force makes sure it doesn't fail if the source dir already exists.
-# The --auto-accept skips the license check - not needed for us
-# because we have legal-info
-# Since the EULA in the bin file differs from the one in the tar file,
-# extract the one from the bin file as well.
 define LIBFSLVPUWRAP_EXTRACT_CMDS
-	awk 'BEGIN      { start=0; } \
-	     /^EOEULA/  { start = 0; } \
-	                { if (start) print; } \
-	     /<<EOEULA/ { start=1; }'\
-	    $(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE) > $(@D)/EULA
-	cd $(BUILD_DIR); \
-	sh $(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE) --force --auto-accept
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE))
 endef
 
 $(eval $(autotools-package))
-- 
1.9.1
