From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 17:07:27 +0100
Subject: [Buildroot] [git commit] avrdude: new package
Message-ID: <20131228160804.3976B9C228@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc776f0d0546900b22d1552f3e522be2080016c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - remove empty newline at the end of Config.in
 - use lowercase for the package name in the comment header
 - reword the comment explaining why autoreconf is needed
 - add optional dependency on libftdi, which avrdude can use
 - remove avrdude.conf.bak file from /etc]

Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/avrdude/Config.in  |   15 +++++++++++++++
 package/avrdude/avrdude.mk |   30 ++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c4b6ec1..43a8ed5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -259,6 +259,7 @@ source "package/zd1211-firmware/Config.in"
 endmenu
 source "package/a10disp/Config.in"
 source "package/acpid/Config.in"
+source "package/avrdude/Config.in"
 source "package/cdrkit/Config.in"
 source "package/cryptsetup/Config.in"
 source "package/dbus/Config.in"
diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
new file mode 100644
index 0000000..8eac014
--- /dev/null
+++ b/package/avrdude/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_AVRDUDE
+	bool "avrdude"
+	select BR2_PACKAGE_LIBELF
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	select BR2_PACKAGE_NCURSES
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  avrdude is a programmer for Atmel AVR microcontrollers
+	  this package provides a version with new linuxspi driver
+
+	  https://github.com/kcuzner/avrdude
+
+comment "avrdude needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
new file mode 100644
index 0000000..338d61c
--- /dev/null
+++ b/package/avrdude/avrdude.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# avrdude
+#
+################################################################################
+
+AVRDUDE_VERSION = eabe067c4527bc2eedc5db9288ef5cf1818ec720
+AVRDUDE_SITE = $(call github,kcuzner,avrdude,$(AVRDUDE_VERSION))
+AVRDUDE_LICENSE = GPLv2+
+AVRDUDR_LICENSE_FILES = avrdude/COPYING
+AVRDUDE_SUBDIR = avrdude
+# Sources coming from git, without generated configure and Makefile.in
+# files.
+AVRDUDE_AUTORECONF = YES
+AVRDUDE_DEPENDENCIES = libelf libusb libusb-compat ncurses
+
+ifeq ($(BR2_PACKAGE_LIBFTDI),y)
+AVRDUDE_DEPENDENCIES += libftdi
+endif
+
+# if /etc/avrdude.conf exists, the installation process creates a
+# backup file, which we do not want in the context of Buildroot.
+define AVRDUDE_REMOVE_BACKUP_FILE
+	$(RM) -f $(TARGET_DIR)/etc/avrdude.conf.bak
+endef
+
+AVRDUDE_POST_INSTALL_TARGET_HOOKS += AVRDUDE_REMOVE_BACKUP_FILE
+
+$(eval $(autotools-package))
+
