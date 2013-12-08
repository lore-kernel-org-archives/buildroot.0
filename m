From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Sun,  8 Dec 2013 10:30:41 +0100
Subject: [Buildroot] [PATCH] ti-wpan: Add new package
Message-ID: <1386495041-17629-1-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 package/ti-wpan/0001-Fix-build-on-uclibc.patch     | 30 ++++++++++++++++++++
 ...ine-message-macros-for-non-android-builds.patch | 32 ++++++++++++++++++++++
 package/ti-wpan/Config.in                          |  7 +++++
 package/ti-wpan/ti-wpan.mk                         | 25 +++++++++++++++++
 5 files changed, 95 insertions(+)
 create mode 100644 package/ti-wpan/0001-Fix-build-on-uclibc.patch
 create mode 100644 package/ti-wpan/0002-Define-message-macros-for-non-android-builds.patch
 create mode 100644 package/ti-wpan/Config.in
 create mode 100644 package/ti-wpan/ti-wpan.mk

diff --git a/package/Config.in b/package/Config.in
index a7ab4ea9d535..ad32dca9890d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -330,6 +330,7 @@ source "package/sunxi-mali-prop/Config.in"
 source "package/sysstat/Config.in"
 source "package/ti-gfx/Config.in"
 source "package/ti-utils/Config.in"
+source "package/ti-wpan/Config.in"
 source "package/uboot-tools/Config.in"
 source "package/udev/Config.in"
 source "package/udisks/Config.in"
diff --git a/package/ti-wpan/0001-Fix-build-on-uclibc.patch b/package/ti-wpan/0001-Fix-build-on-uclibc.patch
new file mode 100644
index 000000000000..570b094954b8
--- /dev/null
+++ b/package/ti-wpan/0001-Fix-build-on-uclibc.patch
@@ -0,0 +1,30 @@
+From b02b318cdd0f97351f5414e5c6591d0e40131674 Mon Sep 17 00:00:00 2001
+From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
+Date: Sun, 8 Dec 2013 08:53:46 +0100
+Subject: [PATCH 1/2] Fix build on uclibc
+
+uclibc doesn't define struct termios2, it is necessary to get it from
+the linux headers.
+
+Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
+---
+ ti_st/uim-sysfs/uim.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/ti_st/uim-sysfs/uim.c b/ti_st/uim-sysfs/uim.c
+index 60e34001f114..c927a3a24ca5 100644
+--- a/ti_st/uim-sysfs/uim.c
++++ b/ti_st/uim-sysfs/uim.c
+@@ -20,8 +20,7 @@
+ #include <fcntl.h>
+ #include <string.h>
+ #include <signal.h>
+-#include <sys/ioctl.h>
+-#include <termios.h>
++#include <linux/termios.h>
+ #include <poll.h>
+ #include <stdint.h>
+ #include <stdlib.h>
+-- 
+1.8.3.2
+
diff --git a/package/ti-wpan/0002-Define-message-macros-for-non-android-builds.patch b/package/ti-wpan/0002-Define-message-macros-for-non-android-builds.patch
new file mode 100644
index 000000000000..2d1ea88587dc
--- /dev/null
+++ b/package/ti-wpan/0002-Define-message-macros-for-non-android-builds.patch
@@ -0,0 +1,32 @@
+From 17360cbf9f74885c7385b87430e9f77776a163ce Mon Sep 17 00:00:00 2001
+From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
+Date: Sun, 8 Dec 2013 08:57:13 +0100
+Subject: [PATCH 2/2] Define message macros for non android builds
+
+Trying to build uim-sysfs for linux (as opposed to android) will fail
+because the debug/message macros are not defined.
+
+Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
+---
+ ti_st/uim-sysfs/uim.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/ti_st/uim-sysfs/uim.h b/ti_st/uim-sysfs/uim.h
+index 5accf09aa0b9..199527eb9e4f 100644
+--- a/ti_st/uim-sysfs/uim.h
++++ b/ti_st/uim-sysfs/uim.h
+@@ -75,6 +75,11 @@
+ #define UIM_DBG(fmt, arg...)
+ #define UIM_VER(fmt, arg...)
+ #endif
++#else
++#define UIM_START_FUNC()
++#define UIM_DBG(fmt, arg...)
++#define UIM_VER(fmt, arg...)
++#define UIM_ERR(fmt, arg...) printf("uim: err:"fmt"\n" , ## arg)
+ #endif  /* ANDROID */
+ 
+ /*Termios2 structure for setting the Custom baud rate*/
+-- 
+1.8.3.2
+
diff --git a/package/ti-wpan/Config.in b/package/ti-wpan/Config.in
new file mode 100644
index 000000000000..2352c9ae6168
--- /dev/null
+++ b/package/ti-wpan/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_TI_WPAN
+	bool "ti-wpan"
+	help
+	  UIM daemon for the TI_ST driver. This daemon is needed to get the btwilink
+	  driver to work.
+
+	  http://omappedia.org/wiki/Device_Driver_Interface_of_WiLink_Solution
diff --git a/package/ti-wpan/ti-wpan.mk b/package/ti-wpan/ti-wpan.mk
new file mode 100644
index 000000000000..ef70495e3342
--- /dev/null
+++ b/package/ti-wpan/ti-wpan.mk
@@ -0,0 +1,25 @@
+#############################################################
+#
+# ti-wpan
+#
+#############################################################
+
+TI_WPAN_VERSION = 5beae4748cd36f4464a43e0a870c881a3f8f1b5b
+TI_WPAN_SITE = git://git.omapzoom.org/platform/hardware/ti/wpan.git
+TI_WPAN_LICENSE = GPLv2+
+TI_WPAN_LICENSE_FILES = ti_st/uim-sysfs/uim.c
+
+define TI_WPAN_BUILD_CMDS
+    cd $(@D)/ti_st/uim-sysfs && $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o uim-sysfs uim.c 
+endef
+
+define TI_WPAN_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/ti_st/uim-sysfs/uim-sysfs \
+		$(TARGET_DIR)/usr/sbin/uim-sysfs
+endef
+
+define TI_WPAN_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/uim-sysfs
+endef
+
+$(eval $(generic-package))
-- 
1.8.3.2
