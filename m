From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Jul 2015 23:48:13 +0200
Subject: [Buildroot] [git commit] stm32flash: new package
Message-ID: <20150708215408.6626581913@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d503a13a7c4ec8e61f17610cc0768090fef079f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                |    1 +
 package/stm32flash/Config.in     |    8 ++++++++
 package/stm32flash/stm32flash.mk |   21 +++++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 23858ca..d9b0794 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -411,6 +411,7 @@ endif
 	source "package/snowball-hdmiservice/Config.in"
 	source "package/sredird/Config.in"
 	source "package/statserial/Config.in"
+	source "package/stm32flash/Config.in"
 	source "package/sunxi-cedarx/Config.in"
 	source "package/sunxi-mali/Config.in"
 	source "package/sunxi-mali-prop/Config.in"
diff --git a/package/stm32flash/Config.in b/package/stm32flash/Config.in
new file mode 100644
index 0000000..cb6f480
--- /dev/null
+++ b/package/stm32flash/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_STM32FLASH
+	bool "stm32flash"
+	help
+	  Open source cross platform flash program for the STM32 ARM
+	  microcontrollers using the built-in ST serial bootloader over UART
+	  or I2C.
+
+	  http://sourceforge.net/projects/stm32flash/
diff --git a/package/stm32flash/stm32flash.mk b/package/stm32flash/stm32flash.mk
new file mode 100644
index 0000000..2c0fa56
--- /dev/null
+++ b/package/stm32flash/stm32flash.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# stm32flash
+#
+################################################################################
+
+STM32FLASH_VERSION = 4ac0566f188f39eace0223d966d349cd2f2c5895
+STM32FLASH_SITE = git://git.code.sf.net/p/stm32flash/code
+STM32FLASH_LICENSE = GPLv2+
+STM32FLASH_LICENSE_FILES = gpl-2.0.txt
+
+define STM32FLASH_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define STM32FLASH_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" PREFIX="/usr" \
+		-C $(@D) install
+endef
+
+$(eval $(generic-package))
