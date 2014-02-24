From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 24 Feb 2014 10:25:41 +0100
Subject: [Buildroot] [PATCH v2 1/2] udev: update udev to new virtual package
	infra.
In-Reply-To: <1393233942-11638-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1393233942-11638-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1393233942-11638-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The udev virtual package and its current providers (eudev and systemd)
have been updated to use the latest version of virtual package
infrastructure.

A provider should now select BR2_PACKAGE_HAS_UDEV and well as set a
value for BR2_PACKAGE_PROVIDES_UDEV.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/eudev/Config.in   |    3 +++
 package/systemd/Config.in |    3 +++
 package/udev/Config.in    |    8 ++++----
 package/udev/udev.mk      |   16 ++++------------
 4 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index bfad99a..40ff721 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -21,6 +21,9 @@ config BR2_PACKAGE_EUDEV
 
 if BR2_PACKAGE_EUDEV
 
+config BR2_PACKAGE_PROVIDES_UDEV
+	default "eudev"
+
 config BR2_PACKAGE_EUDEV_RULES_GEN
 	bool "enable rules generator"
 	help
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index e3ea433..eacc23c 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -40,6 +40,9 @@ config BR2_PACKAGE_SYSTEMD
 
 if BR2_PACKAGE_SYSTEMD
 
+config BR2_PACKAGE_PROVIDES_UDEV
+	default "systemd"
+
 config BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
 	bool "enable all extras"
 	select BR2_PACKAGE_XZ
diff --git a/package/udev/Config.in b/package/udev/Config.in
index 5cd4051..941a515 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HAS_UDEV
 	bool
-	help
-	  udev is now a virtual package.
-	  Packages requiring udevd at run time or libudev/gudev at build time
-	  should select it.
+
+config BR2_PACKAGE_PROVIDES_UDEV
+	depends on BR2_PACKAGE_HAS_UDEV
+	string
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index a5d0f80..f5eeeb4 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -5,20 +5,12 @@
 ################################################################################
 
 UDEV_SOURCE =
+UDEV_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_UDEV))
 
-ifeq ($(BR2_PACKAGE_EUDEV),y)
-UDEV_DEPENDENCIES += eudev
-endif
-
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-UDEV_DEPENDENCIES += systemd
-endif
-
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 ifeq ($(UDEV_DEPENDENCIES),)
-define UDEV_CONFIGURE_CMDS
-	echo "No Udev implementation selected. Configuration error."
-	exit 1
-endef
+$(error No Udev implementation selected. Configuration error)
+endif
 endif
 
 $(eval $(generic-package))
-- 
1.7.9.5
