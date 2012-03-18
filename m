From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Mar 2012 22:53:24 +0100
Subject: [Buildroot] [git commit] Microblaze: added external toolchain from
	Xilinx
Message-ID: <20120318220025.B8A0E90E97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb7788fd861026e7772bb4f6c096e0c955a4e28e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
Tested-by: Stephan Hoffmann <sho@relinux.de>
Downloading Microblaze LE toolchain works on a clean install
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in   |   21 +++++++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    6 ++++++
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 24cad9c..014bfc5 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -432,6 +432,25 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
 
+config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
+	bool "Xilinx Little Endian Microblaze GNU Tools"
+	depends on BR2_microblazeel
+	select BR2_LARGEFILE
+	select BR2_INET_IPV6
+	select BR2_INET_RPC
+	select BR2_ENABLE_LOCALE
+	select BR2_USE_WCHAR
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
@@ -470,6 +489,8 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
+	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
+	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 3c97de1..51bce91 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -239,6 +239,12 @@ TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2011R1-RC4.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_SITE_2   = http://blackfin.uclinux.org/gf/download/frsrelease/531/9517/
 TOOLCHAIN_EXTERNAL_SOURCE_2 = blackfin-toolchain-uclibc-full-2011R1-RC4.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_SOURCE   = $(TOOLCHAIN_EXTERNAL_SOURCE_1) $(TOOLCHAIN_EXTERNAL_SOURCE_2)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2),y)
+TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0_le.git;a=blob;h=d7b493c5dbcc24ba9cc3be2e4c14d6d9701e6805;hb=00163583b771bb4e937632765dd0c5516b3e31c4;f=
+TOOLCHAIN_EXTERNAL_SOURCE=microblazeel-unknown-linux-gnu.tgz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
+TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0.git;a=blob;h=71e031ae990e063a5718f90d30cf97ad85e2f565;hb=569081301f0f1d8d3b24335a364e8ff1774190d4;f=
+TOOLCHAIN_EXTERNAL_SOURCE=microblaze-unknown-linux-gnu.tgz
 else
 # A value must be set (even if unused), otherwise the
 # $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) rule would override the main
