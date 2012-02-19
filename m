From: Alvaro G. M <alvaro.gamez@hazent.com>
Date: Sun, 19 Feb 2012 13:17:10 +0100
Subject: [Buildroot] [PATCH 2/2] Microblaze: added external toolchain from
	Xilinx
In-Reply-To: <e00406c0e4c15d77b4d03badf312980cce713c06.1329651936.git.alvaro.gamez@hazent.com>
References: <e00406c0e4c15d77b4d03badf312980cce713c06.1329651936.git.alvaro.gamez@hazent.com>
Message-ID: <22621d522680079cb3b800f28a03d771a238f875.1329651936.git.alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Alvaro G. M" <alvaro.gamez@hazent.com>


Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
---
 toolchain/toolchain-external/Config.in   |   16 ++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    6 ++++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index eadfe50..b4632ae 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -231,6 +231,20 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
 
+config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
+	bool "Xilinx Little Endian Microblaze GNU Tools"
+	depends on BR2_microblazeel
+	help
+	  Toolchain for the Microblaze architecture, from
+	  http://wiki.xilinx.com/mb-gnu-tools
+
+config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
+	bool "Xilinx Big Endian Microblaze GNU Tools"
+	depends on BR2_microblazebe
+	help
+	  Toolchain for the Microblaze architecture, from
+	  http://wiki.xilinx.com/mb-gnu-tools
+
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM
        bool "Custom toolchain"
        help
@@ -267,6 +281,8 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
+	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
+	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index e0dd691..5f82da9 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -211,6 +211,12 @@ TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2010R1-RC4.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_SITE_2   = http://blackfin.uclinux.org/gf/download/frsrelease/501/8386/
 TOOLCHAIN_EXTERNAL_SOURCE_2 = blackfin-toolchain-uclibc-full-2010R1-RC4.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_SOURCE   = $(TOOLCHAIN_EXTERNAL_SOURCE_1) $(TOOLCHAIN_EXTERNAL_SOURCE_2)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2),y)
+TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0_le.git;a=blob;hb=HEAD;f=
+TOOLCHAIN_EXTERNAL_SOURCE=microblazeel-unknown-linux-gnu.tgz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
+TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0.git;a=blob;hb=HEAD;f=
+TOOLCHAIN_EXTERNAL_SOURCE=microblaze-unknown-linux-gnu.tgz
 else
 # A value must be set (even if unused), otherwise the
 # $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) rule would override the main
-- 
1.7.9
