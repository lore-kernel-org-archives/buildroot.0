From: Paul Cercueil <paul@crapouillou.net>
Date: Wed, 13 Nov 2019 12:21:36 +0100
Subject: [Buildroot] [PATCH v2] umtprd: Add package
Message-ID: <20191113112136.24211-1-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uMTP-Responder is a lightweight USB Media Transfer Protocol (MTP)
responder daemon for GNU/Linux.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2:
    - Remove patch. It used to be required but now I can compile the latest
      master without it, so the upstream PR was closed.
    - Require toolchain with threads and kernel headers >= 3.15
    - Add hash for license file
    - Add entry in DEVELOPERS for the package

 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/umtprd/Config.in   | 11 +++++++++++
 package/umtprd/umtprd.hash |  3 +++
 package/umtprd/umtprd.mk   | 20 ++++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/umtprd/Config.in
 create mode 100644 package/umtprd/umtprd.hash
 create mode 100644 package/umtprd/umtprd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c0863aabc6..a15a64527c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1800,6 +1800,7 @@ F:	package/yavta/
 N:	Paul Cercueil <paul@crapouillou.net>
 F:	package/libiio/
 F:	package/lightning/
+F:	package/umtprd/
 
 N:	Pedro Aguilar <paguilar@paguilar.org>
 F:	package/libunistring/
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
diff --git a/package/umtprd/Config.in b/package/umtprd/Config.in
new file mode 100644
index 0000000000..24bf119549
--- /dev/null
+++ b/package/umtprd/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_UMTPRD
+	bool "umtprd"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+	help
+	  Lightweight USB MTP responder daemon for GNU/Linux
+
+	  https://github.com/viveris/uMTP-Responder
+
+comment "umtprd needs a toolchain w/ threads, headers >= 3.15"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
diff --git a/package/umtprd/umtprd.hash b/package/umtprd/umtprd.hash
new file mode 100644
index 0000000000..168b19e951
--- /dev/null
+++ b/package/umtprd/umtprd.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256	e1301bdd89170cc2c679446c1cc5873feaacd061bf0ab547fc0a11670bae9163	umtprd-1.0.0.tar.gz
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	LICENSE
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
2.24.0
