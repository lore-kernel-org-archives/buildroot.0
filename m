From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Sat, 11 Feb 2012 02:03:16 +0200
Subject: [Buildroot] [PATCH] build: add 'file' option for 'make defconfig'
Message-ID: <1328918596-19369-1-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So that this works:

 % make defconfig file=~/busybox-defconfig

Right now we have to do:

 % make $PWD/output/build/buildroot-config/conf
 % $PWD/output/build/buildroot-config/conf --defconfig=~/busybox-defconfig Config.in

And the first command would through an error. Not nice.

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 25da853..5a26961 100644
--- a/Makefile
+++ b/Makefile
@@ -594,7 +594,7 @@ silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --defconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --defconfig$(addprefix =,$(file)) $(CONFIG_CONFIG_IN)
 
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-- 
1.7.9.1.g97f7d
