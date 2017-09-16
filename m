From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Sep 2017 17:15:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/openobex: bump version to 1.7.2
Message-ID: <20170916151535.2948-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package switched to cmake without providing most of the autoconf
options previously available. Therefore we move all suboptions to
Config.in.legacy.

All patches are removed, the files to be patched do not exist anymore.

OPENOBEX_EXTRACT_CMDS is not needed anymore, upstream provides the
source as .tar.gz now.

Version 1.6 added support for libusb-1.x and udev. The current version
also supports bluez5_utils, not only bluez_utils.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                                   | 22 ++++++++++++
 .../0001-libusb_check_when_cross-compiling.patch   | 18 ----------
 .../0002-replace_deprecated_functions.patch        | 30 ----------------
 package/openobex/Config.in                         | 36 -------------------
 package/openobex/openobex.hash                     |  6 ++--
 package/openobex/openobex.mk                       | 40 ++++++++--------------
 6 files changed, 39 insertions(+), 113 deletions(-)
 delete mode 100644 package/openobex/0001-libusb_check_when_cross-compiling.patch
 delete mode 100644 package/openobex/0002-replace_deprecated_functions.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index 73c01217a6..181cb8098a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,28 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.11"
 
+config BR2_PACKAGE_OPENOBEX_BLUEZ
+	bool "openobex bluez option removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_BLUEZ_UTILS
+
+config BR2_PACKAGE_OPENOBEX_LIBUSB
+	bool "openobex libusb option removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LIBUSB
+
+config BR2_PACKAGE_OPENOBEX_APPS
+	bool "openobex apps option removed"
+	select BR2_LEGACY
+
+config BR2_PACKAGE_OPENOBEX_SYSLOG
+	bool "openobex syslog option removed"
+	select BR2_LEGACY
+
+config BR2_PACKAGE_OPENOBEX_DUMP
+	bool "openobex dump option removed"
+	select BR2_LEGACY
+
 config BR2_PACKAGE_AICCU
 	bool "aiccu utility removed"
 	select BR2_LEGACY
diff --git a/package/openobex/0001-libusb_check_when_cross-compiling.patch b/package/openobex/0001-libusb_check_when_cross-compiling.patch
deleted file mode 100644
index 7b8056afcc..0000000000
--- a/package/openobex/0001-libusb_check_when_cross-compiling.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Fix libusb check when cross-compiling.
-
-Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
-Index: openobex-1.5/acinclude.m4
-===================================================================
---- openobex-1.5.orig/acinclude.m4	2010-06-16 10:32:47.000000000 +0200
-+++ openobex-1.5/acinclude.m4	2010-06-16 10:35:33.000000000 +0200
-@@ -158,7 +158,7 @@
- 		;;
- 	*)
- 		PKG_CHECK_MODULES(USB, libusb, usb_lib_found=yes, AC_MSG_RESULT(no))
--		AC_CHECK_FILE(${prefix}/lib/pkgconfig/libusb.pc, REQUIRES="libusb")
-+		REQUIRES="libusb"
- 		;;
- 	esac
- 	AC_SUBST(USB_CFLAGS)
diff --git a/package/openobex/0002-replace_deprecated_functions.patch b/package/openobex/0002-replace_deprecated_functions.patch
deleted file mode 100644
index 17274d385b..0000000000
--- a/package/openobex/0002-replace_deprecated_functions.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-obex_test_cable.c: avoid to use SuSv3 LEGACY APIs
-
-Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
-Index: openobex-1.5/apps/obex_test_cable.c
-===================================================================
---- openobex-1.5.orig/apps/obex_test_cable.c	2009-02-08 19:30:22.000000000 +0100
-+++ openobex-1.5/apps/obex_test_cable.c	2010-06-16 11:11:05.000000000 +0200
-@@ -113,9 +113,9 @@
- 			if(total == sizeof(tmpbuf))
- 				return -1;
- 
--			if( (answer = index(tmpbuf, '\n')) )	{
-+			if( (answer = strchr(tmpbuf, '\n')) )	{
- 				// Remove first line (echo)
--				if( (answer_end = index(answer+1, '\n')) )	{
-+				if( (answer_end = strchr(answer+1, '\n')) )	{
- 					// Found end of answer
- 					done = 1;
- 				}
-@@ -178,7 +178,7 @@
- 	}
- 
- 	tcgetattr(gt->ttyfd, &gt->oldtio);
--	bzero(&gt->newtio, sizeof(struct termios));
-+	memset(&gt->newtio, 0, sizeof(struct termios));
- 	gt->newtio.c_cflag = B115200 | CS8 | CREAD | CRTSCTS;
- 	gt->newtio.c_iflag = IGNPAR;
- 	gt->newtio.c_oflag = 0;
diff --git a/package/openobex/Config.in b/package/openobex/Config.in
index ed1b81fe42..e611b8d803 100644
--- a/package/openobex/Config.in
+++ b/package/openobex/Config.in
@@ -5,39 +5,3 @@ config BR2_PACKAGE_OPENOBEX
 	  protocol.
 
 	  http://sourceforge.net/projects/openobex
-
-if BR2_PACKAGE_OPENOBEX
-
-config BR2_PACKAGE_OPENOBEX_BLUEZ
-	bool "enable bluez support"
-	depends on !BR2_STATIC_LIBS # bluez_utils
-	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
-	depends on BR2_USE_MMU # dbus
-	select BR2_PACKAGE_BLUEZ_UTILS
-
-comment "bluez support needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
-config BR2_PACKAGE_OPENOBEX_LIBUSB
-	bool "enable libusb support"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_LIBUSB_COMPAT
-
-comment "libusb support needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-config BR2_PACKAGE_OPENOBEX_APPS
-	bool "install test applications"
-	help
-	  Also install the openobex test applications on target.
-
-config BR2_PACKAGE_OPENOBEX_SYSLOG
-	bool "enable debugging to the system logger"
-
-config BR2_PACKAGE_OPENOBEX_DUMP
-	bool "enable protocol dumping for debugging"
-
-endif
diff --git a/package/openobex/openobex.hash b/package/openobex/openobex.hash
index 2aef98194b..dbff4f1c1f 100644
--- a/package/openobex/openobex.hash
+++ b/package/openobex/openobex.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/openobex/files/openobex/1.5/
-sha1	5332ef95bc8b321bda675cdb74379804c6c1a83f	openobex-1.5.0-Source.zip
-md5	f6d87af55a1d702d582173c81619176e		openobex-1.5.0-Source.zip
+# From http://sourceforge.net/projects/openobex/files/openobex/1.7.2/
+sha1 4a5098a62889134cbd2b54997e7ff3e959e601e6  openobex-1.7.2-Source.tar.gz
+md5 f6e0b6cb7dcfd731460a7e9a91429a3a  openobex-1.7.2-Source.tar.gz
diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
index 8337990eb8..d9d4db5609 100644
--- a/package/openobex/openobex.mk
+++ b/package/openobex/openobex.mk
@@ -4,42 +4,30 @@
 #
 ################################################################################
 
-OPENOBEX_VERSION_MAJOR = 1.5
-OPENOBEX_VERSION = $(OPENOBEX_VERSION_MAJOR).0
-OPENOBEX_SITE = http://downloads.sourceforge.net/project/openobex/openobex/$(OPENOBEX_VERSION_MAJOR)
-OPENOBEX_SOURCE = openobex-$(OPENOBEX_VERSION)-Source.zip
+OPENOBEX_VERSION = 1.7.2
+OPENOBEX_SITE = http://downloads.sourceforge.net/project/openobex/openobex/$(OPENOBEX_VERSION)
+OPENOBEX_SOURCE = openobex-$(OPENOBEX_VERSION)-Source.tar.gz
 # Libraries seems to be released under LGPL-2.1+,
 # while other material is under GPL-2.0+.
 OPENOBEX_LICENSE = GPL-2.0+/LGPL-2.1+
 OPENOBEX_LICENSE_FILES = COPYING COPYING.LIB
-
 OPENOBEX_DEPENDENCIES = host-pkgconf
-OPENOBEX_AUTORECONF = YES
 OPENOBEX_INSTALL_STAGING = YES
 
-define OPENOBEX_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(DL_DIR)/$(OPENOBEX_SOURCE)
-	mv $(@D)/openobex-$(OPENOBEX_VERSION)-Source/* $(@D)
-	$(RM) -r $(@D)/openobex-$(OPENOBEX_VERSION)-Source
-endef
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
+OPENOBEX_DEPENDENCIES += bluez_utils
+endif
 
-OPENOBEX_CONF_OPTS += \
-	$(if $(BR2_PACKAGE_OPENOBEX_APPS),--enable-apps) \
-	$(if $(BR2_PACKAGE_OPENOBEX_SYSLOG),--enable-syslog) \
-	$(if $(BR2_PACKAGE_OPENOBEX_DUMP),--enable-dump)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+OPENOBEX_DEPENDENCIES += bluez5_utils
+endif
 
-ifeq ($(BR2_PACKAGE_OPENOBEX_BLUEZ),y)
-OPENOBEX_DEPENDENCIES += bluez_utils
-OPENOBEX_CONF_OPTS += --with-bluez=$(STAGING_DIR)
-else
-OPENOBEX_CONF_OPTS += --disable-bluetooth
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+OPENOBEX_DEPENDENCIES += libusb
 endif
 
-ifeq ($(BR2_PACKAGE_OPENOBEX_LIBUSB),y)
-OPENOBEX_DEPENDENCIES += libusb-compat
-OPENOBEX_CONF_OPTS += --with-usb=$(STAGING_DIR)
-else
-OPENOBEX_CONF_OPTS += --disable-usb
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+OPENOBEX_DEPENDENCIES += udev
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.11.0
