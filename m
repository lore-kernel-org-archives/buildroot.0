From: Paul Cercueil <paul@crapouillou.net>
Date: Thu,  7 Nov 2019 17:45:13 +0100
Subject: [Buildroot] [PATCH] umtprd: Add package
Message-ID: <20191107164513.5760-1-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uMTP-Responder is a lightweight USB Media Transfer Protocol (MTP)
responder daemon for GNU/Linux.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/Config.in                             |  1 +
 ...thread.h-include-in-inc-mtp.h-header.patch | 28 +++++++++++++++++++
 package/umtprd/Config.in                      |  6 ++++
 package/umtprd/umtprd.hash                    |  2 ++
 package/umtprd/umtprd.mk                      | 20 +++++++++++++
 5 files changed, 57 insertions(+)
 create mode 100644 package/umtprd/0001-Add-missing-pthread.h-include-in-inc-mtp.h-header.patch
 create mode 100644 package/umtprd/Config.in
 create mode 100644 package/umtprd/umtprd.hash
 create mode 100644 package/umtprd/umtprd.mk

diff --git a/package/Config.in b/package/Config.in
index f72c77b416..4d945e0b04 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -550,6 +550,7 @@ endmenu
 	source "package/udev/Config.in"
 	source "package/udisks/Config.in"
 	source "package/uhubctl/Config.in"
+	source "package/umtprd/Config.in"
 	source "package/upower/Config.in"
 	source "package/usb_modeswitch/Config.in"
 	source "package/usb_modeswitch_data/Config.in"
diff --git a/package/umtprd/0001-Add-missing-pthread.h-include-in-inc-mtp.h-header.patch b/package/umtprd/0001-Add-missing-pthread.h-include-in-inc-mtp.h-header.patch
new file mode 100644
index 0000000000..ea0b31d052
--- /dev/null
+++ b/package/umtprd/0001-Add-missing-pthread.h-include-in-inc-mtp.h-header.patch
@@ -0,0 +1,28 @@
+From 6572d07a68466aaa3a7efcb4a55cc61ff31cfde3 Mon Sep 17 00:00:00 2001
+From: Paul Cercueil <paul@crapouillou.net>
+Date: Thu, 30 May 2019 00:23:11 +0200
+Subject: [PATCH] Add missing <pthread.h> include in inc/mtp.h header
+
+This fixes the build under GCC 8 with the musl C library.
+
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+---
+ inc/mtp.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/inc/mtp.h b/inc/mtp.h
+index 238de68..5f5b804 100644
+--- a/inc/mtp.h
++++ b/inc/mtp.h
+@@ -26,6 +26,8 @@
+ #ifndef _INC_MTP_H_
+ #define _INC_MTP_H_
+ 
++#include <pthread.h>
++
+ #define MAX_STORAGE_NB 16
+ #define MAX_CFG_STRING_SIZE 512
+ 
+-- 
+2.21.0.593.g511ec345e18
+
diff --git a/package/umtprd/Config.in b/package/umtprd/Config.in
new file mode 100644
index 0000000000..28c08ce5bd
--- /dev/null
+++ b/package/umtprd/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_UMTPRD
+	bool "umtprd"
+	help
+	  Lightweight USB MTP responder daemon for GNU/Linux
+
+	  https://github.com/viveris/uMTP-Responder
diff --git a/package/umtprd/umtprd.hash b/package/umtprd/umtprd.hash
new file mode 100644
index 0000000000..aa91696613
--- /dev/null
+++ b/package/umtprd/umtprd.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	e1301bdd89170cc2c679446c1cc5873feaacd061bf0ab547fc0a11670bae9163	umtprd-1.0.0.tar.gz
diff --git a/package/umtprd/umtprd.mk b/package/umtprd/umtprd.mk
new file mode 100644
index 0000000000..8460f82b7d
--- /dev/null
+++ b/package/umtprd/umtprd.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# umtprd
+#
+################################################################################
+
+UMTPRD_VERSION = 1.0.0
+UMTPRD_SITE = https://github.com/viveris/uMTP-Responder/archive
+UMTPRD_LICENSE = GPL-3.0
+UMTPRD_LICENSE_FILES = LICENSE
+
+define UMTPRD_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define UMTPRD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/umtprd $(TARGET_DIR)/usr/sbin/umtprd
+endef
+
+$(eval $(generic-package))
-- 
2.24.0.rc1
