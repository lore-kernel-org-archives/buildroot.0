From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 13:56:00 +0200
Subject: [Buildroot] [git commit] board/stmicroelectronics/stm32f469-disco:
	remove OpenOCD patches
Message-ID: <20170507115818.8AB8182765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c383e8fc8be95deb16032fecd1de00792e2cddb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of OpenOCD from 0.9.0 to 0.10.0 in commit
3b6c74d708252a32fe172be944951396d419ba88, stm32f469_disco_defconfig
fails to build:

 - 0001-add-config.patch was merged in upstream OpenOCD (commit
   26045588f462476cee356d15a24944d6c26befb4).

 - 0002-flash-nor.patch was merged in upstream OpenOCD (commit
   3e219648c80a27f0519003f3b088cbb846e255d8)

Therefore, this commit removes the two patches that are no longer
necessary.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/builds/15762279

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../patches/openocd/0001-add-config.patch          | 37 ----------------------
 .../patches/openocd/0002-flash-nor.patch           | 37 ----------------------
 2 files changed, 74 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/patches/openocd/0001-add-config.patch b/board/stmicroelectronics/stm32f469-disco/patches/openocd/0001-add-config.patch
deleted file mode 100644
index 036c4f6..0000000
--- a/board/stmicroelectronics/stm32f469-disco/patches/openocd/0001-add-config.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 26045588f462476cee356d15a24944d6c26befb4 Mon Sep 17 00:00:00 2001
-From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
-Date: Sat, 24 Oct 2015 00:13:38 +0200
-Subject: [PATCH] tcl: add STM32F469 discovery board config
-
-Change-Id: Iad7ee06330b3259ea0ce0d174dfdade6785913eb
-Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
-Reviewed-on: http://openocd.zylin.com/3043
-Tested-by: jenkins
-Reviewed-by: Antonio Borneo <borneo.antonio@gmail.com>
-Reviewed-by: Freddie Chopin <freddie.chopin@gmail.com>
----
- tcl/board/stm32f469discovery.cfg | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
- create mode 100644 tcl/board/stm32f469discovery.cfg
-
-diff --git a/tcl/board/stm32f469discovery.cfg b/tcl/board/stm32f469discovery.cfg
-new file mode 100644
-index 0000000..eecfe33
---- /dev/null
-+++ b/tcl/board/stm32f469discovery.cfg
-@@ -0,0 +1,12 @@
-+#
-+# This is an STM32F469 discovery board with a single STM32F469NI chip.
-+# http://www.st.com/web/catalog/tools/FM116/CL1620/SC959/SS1532/LN1848/PF262395
-+#
-+
-+source [find interface/stlink-v2-1.cfg]
-+
-+transport select hla_swd
-+
-+source [find target/stm32f4x.cfg]
-+
-+reset_config srst_only
--- 
-1.9.1
-
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/openocd/0002-flash-nor.patch b/board/stmicroelectronics/stm32f469-disco/patches/openocd/0002-flash-nor.patch
deleted file mode 100644
index bfec983..0000000
--- a/board/stmicroelectronics/stm32f469-disco/patches/openocd/0002-flash-nor.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 3e219648c80a27f0519003f3b088cbb846e255d8 Mon Sep 17 00:00:00 2001
-From: Maxime Coquelin <maxime.coquelin@st.com>
-Date: Sat, 24 Oct 2015 00:03:54 +0200
-Subject: [PATCH] flash/nor/stm32f2x: Add STM32F469 part
-
-Change-Id: I4e13ceb0ba954dc2fea059ddeef10109be938c9c
-Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
-Reviewed-on: http://openocd.zylin.com/3042
-Tested-by: jenkins
-Reviewed-by: Freddie Chopin <freddie.chopin@gmail.com>
----
- src/flash/nor/stm32f2x.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/flash/nor/stm32f2x.c b/src/flash/nor/stm32f2x.c
-index 2130444..89fc75d 100644
---- a/src/flash/nor/stm32f2x.c
-+++ b/src/flash/nor/stm32f2x.c
-@@ -790,6 +790,7 @@ static int stm32x_probe(struct flash_bank *bank)
- 		max_flash_size_in_kb = 1024;
- 		break;
- 	case 0x419:
-+	case 0x434:
- 		max_flash_size_in_kb = 2048;
- 		break;
- 	case 0x423:
-@@ -952,6 +953,7 @@ static int get_stm32x_info(struct flash_bank *bank, char *buf, int buf_size)
- 
- 	case 0x413:
- 	case 0x419:
-+	case 0x434:
- 		device_str = "STM32F4xx";
- 
- 		switch (rev_id) {
--- 
-1.9.1
-
