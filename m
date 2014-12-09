From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue,  9 Dec 2014 14:46:40 +0100
Subject: [Buildroot] [PATCH v5 02/15] gpu-viv-bin-mx6q: use self-extractible
	helper
In-Reply-To: <1418132813-32642-1-git-send-email-jezz@sysmic.org>
References: <1418132813-32642-1-git-send-email-jezz@sysmic.org>
Message-ID: <1418132813-32642-3-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 .../freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk    | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index aef16a3..bc44e38 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -15,12 +15,7 @@ GPU_VIV_BIN_MX6Q_SOURCE = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
 GPU_VIV_BIN_MX6Q_INSTALL_STAGING = YES
 
 GPU_VIV_BIN_MX6Q_LICENSE = Freescale Semiconductor Software License Agreement
-
-# No license file is included in the archive; we could extract it from
-# the self-extractor, but that's just too much effort.
-# This is a legal minefield: the EULA specifies that
-# the Board Support Package includes software and hardware (sic!)
-# for which a separate license is needed...
+GPU_VIV_BIN_MX6Q_LICENSE_FILES = EULA
 GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
 
 GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles libopenvg
@@ -33,14 +28,8 @@ else
 GPU_VIV_BIN_MX6Q_LIB_TARGET = fb
 endif
 
-# The archive is a shell-self-extractor of a bzipped tar. It happens
-# to extract in the correct directory (gpu-viv-bin-mx6q-x.y.z)
-# The --force makes sure it doesn't fail if the source dir already exists.
-# The --auto-accept skips the license check - not needed for us
-# because we have legal-info.
 define GPU_VIV_BIN_MX6Q_EXTRACT_CMDS
-	(cd $(BUILD_DIR); \
-		sh $(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE) --force --auto-accept)
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE))
 endef
 
 # Instead of building, we fix up the inconsistencies that exist
-- 
1.9.1
