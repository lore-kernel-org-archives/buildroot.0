From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Mar 2013 22:12:19 +0100
Subject: [Buildroot] [git commit] gptfdisk: ensure that the package always
	builds/installs something
Message-ID: <20130310213207.775FC9AF81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a86ea7fc968f297e5b8c6679770d6b5b8fd4646
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, selecting just the gptfdisk package wouldn't do anything.
It wouldn't build anything at all, and wouldn't install anything.
This is rather odd.

So now, we ensure that at least one of the two tools that gptfdisk can
build and install is selected. This allows use to factorize a bit the
select of util-linux in Config.in, and remove the if condition in the
makefile that was preventing the package from being built if no tools
was selected.

[Peter: Reword commit text]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
