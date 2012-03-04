From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  4 Mar 2012 14:03:15 +0100
Subject: [Buildroot] [PATCH v2 2/3] config: make it possible to specify
	which config file to use for 'make defconfig'
In-Reply-To: <1330866196-5360-1-git-send-email-arnout@mind.be>
References: <1330866196-5360-1-git-send-email-arnout@mind.be>
Message-ID: <1330866196-5360-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

So that this works:

 % make defconfig DEFCONFIG=~/busybox-defconfig

Right now we have to do:

 % cp ~/busybox-defconfig configs/busybox_defconfig
 % make busybox_defconfig

That would dirty the buildroot tree and requires it to be writable.

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 30099d9..b450b8f 100644
--- a/Makefile
+++ b/Makefile
@@ -602,7 +602,7 @@ silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --defconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --defconfig$(patsubst %,=%,$(BR2_DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-- 
1.7.9.1
