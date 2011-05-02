From: Martin Hicks <mort@bork.org>
Date: Mon,  2 May 2011 11:28:04 -0400
Subject: [Buildroot] [PATCH] Add make targets to build u-boot symbol
	references (etags, ctags, cscope)
Message-ID: <1304350084-21608-1-git-send-email-mort@bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is handy because it calls the makefile with the correct ARCH and
target config to eliminate all of the symbols that are unrelated to your
u-boot configuration.

Signed-off-by:  Martin Hicks <mort@bork.org>
---
 boot/u-boot/u-boot.mk |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index a86819b..87ee178 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -187,6 +187,24 @@ u-boot-unpacked: $(U_BOOT_DIR)/.patched
 
 u-boot-configured: $(U_BOOT_DIR)/.header_modified
 
+u-boot-cscope: u-boot-configured
+	-$(TARGET_CONFIGURE_OPTS) \
+		$(U_BOOT_CONFIGURE_OPTS) \
+		CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" ARCH=$(U_BOOT_ARCH) \
+		$(MAKE) -C $(U_BOOT_DIR) cscope
+
+u-boot-ctags: u-boot-configured
+	-$(TARGET_CONFIGURE_OPTS) \
+		$(U_BOOT_CONFIGURE_OPTS) \
+		CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" ARCH=$(U_BOOT_ARCH) \
+		$(MAKE) -C $(U_BOOT_DIR) ctags
+
+u-boot-etags: u-boot-configured
+	-$(TARGET_CONFIGURE_OPTS) \
+		$(U_BOOT_CONFIGURE_OPTS) \
+		CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" ARCH=$(U_BOOT_ARCH) \
+		$(MAKE) -C $(U_BOOT_DIR) etags
+
 #############################################################
 #
 # Toplevel Makefile options
-- 
1.5.6.5
