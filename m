From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:00:17 +0100
Subject: [Buildroot] [git commit] libfslparser: Use self-extractible helper
Message-ID: <20141201104839.58A677FB2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90a40b6bdf8af5922197d757c7b4b4422263cbef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: remove unneeded comment.]

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfslparser/libfslparser.mk |   22 +++-------------------
 1 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index d52b151..706a10e 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -7,30 +7,14 @@
 LIBFSLPARSER_VERSION = 3.0.11
 LIBFSLPARSER_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
+LIBFSLPARSER_INSTALL_STAGING = YES
+
 LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
 LIBFSLPARSER_LICENSE_FILES = EULA EULA.txt
-# This is a legal minefield: the EULA in the bin file specifies that
-# the Board Support Package includes software and hardware (sic!)
-# for which a separate license is needed...
 LIBFSLPARSER_REDISTRIBUTE = NO
 
-LIBFSLPARSER_INSTALL_STAGING = YES
-
-# The archive is a shell-self-extractor of a bzipped tar. It happens
-# to extract in the correct directory (libfslparser-x.y.z)
-# The --force makes sure it doesn't fail if the source dir already exists.
-# The --auto-accept skips the license check - not needed for us
-# because we have legal-info
-# Since the EULA in the bin file differs from the one in the tar file,
-# extract the one from the bin file as well.
 define LIBFSLPARSER_EXTRACT_CMDS
-	awk 'BEGIN      { start=0; } \
-	     /^EOEULA/  { start = 0; } \
-	                { if (start) print; } \
-	     /<<EOEULA/ { start=1; }'\
-	    $(DL_DIR)/$(LIBFSLPARSER_SOURCE) > $(@D)/EULA
-	cd $(BUILD_DIR); \
-	sh $(DL_DIR)/$(LIBFSLPARSER_SOURCE) --force --auto-accept
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(LIBFSLPARSER_SOURCE))
 endef
 
 # The Makefile installs several versions of the libraries, but we only
