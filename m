From: Carlos Santos <casantos@datacom.ind.br>
Date: Sat, 21 Oct 2017 20:30:18 -0200
Subject: [Buildroot] [PATCH 2/2] rfkill: remove package
In-Reply-To: <20171021223018.8858-1-casantos@datacom.ind.br>
References: <20171021223018.8858-1-casantos@datacom.ind.br>
Message-ID: <20171021223018.8858-2-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The rfkill program has been incorporated to the util-linux package.

The new implementation is based upon, and backward compatible with, the
original rfkill from Johannes Berg and Marcel Holtmann.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 Config.in.legacy              |  8 ++++++++
 DEVELOPERS                    |  1 -
 package/Config.in             |  1 -
 package/aircrack-ng/Config.in |  4 ++--
 package/rfkill/Config.in      |  7 -------
 package/rfkill/rfkill.hash    |  2 --
 package/rfkill/rfkill.mk      | 22 ----------------------
 7 files changed, 10 insertions(+), 35 deletions(-)
 delete mode 100644 package/rfkill/Config.in
 delete mode 100644 package/rfkill/rfkill.hash
 delete mode 100644 package/rfkill/rfkill.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index a9c8ec8318..b1e991267b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.11"
 
+config BR2_PACKAGE_RFKILL
+	bool "rfkill package removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_RFKILL
+	help
+	  The rfkill program is now provided by the util-linux package.
+
 config BR2_PACKAGE_UTIL_LINUX_RESET
 	bool "util-linux reset removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index f35d6f3688..b68b6d2a3f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1769,7 +1769,6 @@ N:	Vinicius Tinti <viniciustinti@gmail.com>
 F:	package/python-thrift/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
-F:	package/rfkill/
 F:	package/v4l2grab/
 F:	package/zbar/
 
diff --git a/package/Config.in b/package/Config.in
index aa0f2d7f8e..07a87161f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -474,7 +474,6 @@ endmenu
 	source "package/pru-software-support/Config.in"
 	source "package/pulseview/Config.in"
 	source "package/read-edid/Config.in"
-	source "package/rfkill/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rpi-userland/Config.in"
 	source "package/rs485conf/Config.in"
diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index 2164ad4070..12fda1cbf2 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -11,8 +11,8 @@ config BR2_PACKAGE_AIRCRACK_NG
 	help
 	  A set of tools for auditing wireless networks
 
-	  For complete functionality, also select ethtool, iw, rfkill,
-	  util-linux utilities, and wireless_tools.
+	  For complete functionality, also select ethtool, iw,
+	  util-linux (utilities and rfkill), and wireless_tools.
 
 	  http://www.aircrack-ng.org/
 
diff --git a/package/rfkill/Config.in b/package/rfkill/Config.in
deleted file mode 100644
index 0d079138b8..0000000000
--- a/package/rfkill/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_RFKILL
-	bool "rfkill"
-	help
-	  rfkill is a small userspace tool to query the state of the
-	  rfkill switches.
-
-	  https://wireless.wiki.kernel.org/en/users/documentation/rfkill
diff --git a/package/rfkill/rfkill.hash b/package/rfkill/rfkill.hash
deleted file mode 100644
index 21be0a2074..0000000000
--- a/package/rfkill/rfkill.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From: https://www.kernel.org/pub/software/network/rfkill/sha256sums.asc
-sha256	e0ae3004215e39a6c5c36e0726558740728d16f67ebdb8bea621250f6091d86a  rfkill-0.5.tar.xz
diff --git a/package/rfkill/rfkill.mk b/package/rfkill/rfkill.mk
deleted file mode 100644
index 2f9fe9f9a1..0000000000
--- a/package/rfkill/rfkill.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# rfkill
-#
-################################################################################
-
-RFKILL_VERSION = 0.5
-RFKILL_SOURCE = rfkill-$(RFKILL_VERSION).tar.xz
-RFKILL_SITE = https://www.kernel.org/pub/software/network/rfkill
-RFKILL_LICENSE = ISC
-RFKILL_LICENSE_FILES = COPYING
-
-define RFKILL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		VERSION_SUFFIX="br"
-endef
-
-define RFKILL_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
-- 
2.13.6
