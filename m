From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 21:45:25 +0100
Subject: [Buildroot] [PATCH v2 3/8] gptfdisk: ensure that the package always
	builds/installs something
In-Reply-To: <1362689131-1479-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362689131-1479-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362689131-1479-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, selecting just the gptfdisk package would do something. If
wouldn't build anything at all, and wouldn't install anything. This is
rather odd.

So now, we ensure that at least one of the two tools that gptfdisk can
build and install is selected. This allows use to factorize a bit the
select of util-linux in Config.in, and remove the if condition in the
makefile that was preventing the package from being built if no tools
was selected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gptfdisk/Config.in   |    7 +++----
 package/gptfdisk/gptfdisk.mk |    4 ----
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
index 7851dc3..0d7e358 100644
--- a/package/gptfdisk/Config.in
+++ b/package/gptfdisk/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_GPTFDISK
 	depends on BR2_LARGEFILE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # util-linux
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_GPTFDISK_GDISK if !BR2_PACKAGE_GPTFDISK_SGDISK
 	help
 	  GPT fdisk (consisting of the gdisk and sgdisk programs) is a
 	  text-mode partitioning tool that works on Globally Unique Identifier
@@ -14,8 +17,6 @@ config BR2_PACKAGE_GPTFDISK
 config BR2_PACKAGE_GPTFDISK_GDISK
 	bool "interactive gdisk"
 	depends on BR2_PACKAGE_GPTFDISK
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Install the interactive GUID partition table (GPT) manipulator
 	  /usr/sbin/gdisk which is modelled after and quite similar in use
@@ -24,8 +25,6 @@ config BR2_PACKAGE_GPTFDISK_GDISK
 config BR2_PACKAGE_GPTFDISK_SGDISK
 	bool "command line sgdisk"
 	depends on BR2_PACKAGE_GPTFDISK
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_POPT
 	help
 	  Install the command-line GUID partition table (GPT) manipulator
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 7755a30..2d3cb1a 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -10,8 +10,6 @@ GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
 GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_GDISK) += gdisk
 GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_SGDISK) += sgdisk
 
-ifneq ($(GPTFDISK_TARGETS_y),)
-
 GPTFDISK_DEPENDENCIES += util-linux
 ifeq ($(BR2_PACKAGE_GPTFDISK_SGDISK),y)
     GPTFDISK_DEPENDENCIES += popt
@@ -33,6 +31,4 @@ define GPTFDISK_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(GPTFDISK_TARGETS_y))
 endef
 
-endif
-
 $(eval $(generic-package))
-- 
1.7.9.5
