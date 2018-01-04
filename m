From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu,  4 Jan 2018 12:39:41 +0100
Subject: [Buildroot] [PATCH v2 09/15] imx-parser: bump to version 4.2.1
In-Reply-To: <20180104113947.21235-1-gary.bisson@boundarydevices.com>
References: <20180104113947.21235-1-gary.bisson@boundarydevices.com>
Message-ID: <20180104113947.21235-10-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
1. Upgrade EULA to v18
2. Bugfixes/Optimization
 - Update HEVC PARSER 01.00.02/ APE PARSER 00.00.08/ MPEG2 PARSER 04.05.10
   1. Delete the useless label in HEVC PARSER.
   2. Fix 2 variables' not init in special case for APE PARSER.
   3. Fix one struct's not init for MPEG2 PARSER.
 - Fix one mp3 can't play on jb4.3_1.1.1-ga
   ID3V2 contains a picture larger than 3MB, need to save ID3 data size
   in self->m_dwID3V2Size to let parser skip it when starting playback.
 - Fix creating parser error
   When variable value is negative, if(bytesToRead) will return true,
   modify this condition to if(bytesToRead > 0).

Note that this package now includes AARCH64 libraries for the upcoming
i.MX8 CPU family.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Changelog v2:
- Fix imx-parser dependency to add AARCH64 (Thomas)
---
 package/freescale-imx/imx-parser/Config.in       | 2 +-
 package/freescale-imx/imx-parser/imx-parser.hash | 2 +-
 package/freescale-imx/imx-parser/imx-parser.mk   | 6 +++++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-parser/Config.in b/package/freescale-imx/imx-parser/Config.in
index 526f066387..028b2bf69b 100644
--- a/package/freescale-imx/imx-parser/Config.in
+++ b/package/freescale-imx/imx-parser/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_IMX_PARSER
 	bool "imx-parser"
-	depends on BR2_arm # Only relevant for i.MX
+	depends on BR2_arm || BR2_aarch64 # Only relevant for i.MX
 	help
 	  Binary parser libraries for the NXP i.MX SoCs.
 
diff --git a/package/freescale-imx/imx-parser/imx-parser.hash b/package/freescale-imx/imx-parser/imx-parser.hash
index f6e82338aa..3266f48110 100644
--- a/package/freescale-imx/imx-parser/imx-parser.hash
+++ b/package/freescale-imx/imx-parser/imx-parser.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	d3a03e60780bbbd0c92932f60bd34d2fe14ffecf6aa6b810723c3edf798cad1f  imx-parser-4.1.4.bin
+sha256	36d3ae7285f3a83a87abf680b8a52b3c07df869d2443de844fb5f0ff528ca862  imx-parser-4.2.1.bin
diff --git a/package/freescale-imx/imx-parser/imx-parser.mk b/package/freescale-imx/imx-parser/imx-parser.mk
index a57647c03b..d79a4444c8 100644
--- a/package/freescale-imx/imx-parser/imx-parser.mk
+++ b/package/freescale-imx/imx-parser/imx-parser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_PARSER_VERSION = 4.1.4
+IMX_PARSER_VERSION = 4.2.1
 IMX_PARSER_SITE = $(FREESCALE_IMX_SITE)
 IMX_PARSER_SOURCE = imx-parser-$(IMX_PARSER_VERSION).bin
 IMX_PARSER_INSTALL_STAGING = YES
@@ -13,6 +13,10 @@ IMX_PARSER_LICENSE = NXP Semiconductor Software License Agreement
 IMX_PARSER_LICENSE_FILES = EULA COPYING
 IMX_PARSER_REDISTRIBUTE = NO
 
+ifeq ($(BR2_aarch64),y)
+IMX_PARSER_CONF_OPTS += --enable-armv8
+endif
+
 ifeq ($(BR2_ARM_EABIHF),y)
 IMX_PARSER_CONF_OPTS += --enable-fhw
 else
-- 
2.15.1
