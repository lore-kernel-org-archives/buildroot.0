From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:00:17 +0100
Subject: [Buildroot] [git commit branch/next] libfslvpuwrap: Use
	self-extractible helper
Message-ID: <20141127212615.6C5577FF41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c98a4de7b43a2efe85aabce1d597a99304fbe092
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas: remove unneeded comment.]

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfslvpuwrap/libfslvpuwrap.mk |   23 ++++-------------------
 1 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
index c3a5c1c..01b2999 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ b/package/libfslvpuwrap/libfslvpuwrap.mk
@@ -7,30 +7,15 @@
 LIBFSLVPUWRAP_VERSION = 1.0.46
 LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-$(LIBFSLVPUWRAP_VERSION).bin
+LIBFSLVPUWRAP_DEPENDENCIES = imx-vpu
+LIBFSLVPUWRAP_INSTALL_STAGING = YES
+
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
