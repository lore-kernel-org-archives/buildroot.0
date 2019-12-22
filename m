From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 22 Dec 2019 12:06:45 +0100
Subject: [Buildroot] [PATCH 2/3] package/usb_modeswitch: bump to version
 2.6.0
In-Reply-To: <20191222110646.2201048-1-fontaine.fabrice@gmail.com>
References: <20191222110646.2201048-1-fontaine.fabrice@gmail.com>
Message-ID: <20191222110646.2201048-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop first patch (not needed anymore) and all jimtcl related
  workarounds as embedded jimtcl has been removed
- Parallel build issue has been fixed
- Update hash of COPYING as this file has been updated to reflect that
  dispatcher.c is under BSD-2-Clause
- Drop dispatcher.c from license files as COPYING has been updated

Full ChangeLog: http://www.draisberghof.de/usb_modeswitch/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...xtra-configure-flags-to-be-passed-to.patch | 29 -------------------
 package/usb_modeswitch/Config.in              |  1 +
 package/usb_modeswitch/usb_modeswitch.hash    |  5 ++--
 package/usb_modeswitch/usb_modeswitch.mk      | 27 +++++++----------
 4 files changed, 14 insertions(+), 48 deletions(-)
 delete mode 100644 package/usb_modeswitch/0001-Makefile-allow-extra-configure-flags-to-be-passed-to.patch

diff --git a/package/usb_modeswitch/0001-Makefile-allow-extra-configure-flags-to-be-passed-to.patch b/package/usb_modeswitch/0001-Makefile-allow-extra-configure-flags-to-be-passed-to.patch
deleted file mode 100644
index 9e1e681fa5..0000000000
--- a/package/usb_modeswitch/0001-Makefile-allow-extra-configure-flags-to-be-passed-to.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1309df373c882f27f476130b06746a6d1e1a0f85 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Fri, 3 Nov 2017 23:21:44 +0100
-Subject: [PATCH] Makefile: allow extra configure flags to be passed to jimtcl
- on the make command line
-
-E.G. to pass --host / --build for cross compilation.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index a151e2a..94dabd9 100644
---- a/Makefile
-+++ b/Makefile
-@@ -19,7 +19,7 @@ TCL        ?= $(HOST_TCL)
- else
- TCL        ?= /usr/bin/tclsh
- endif
--JIM_CONFIGURE_OPTS = --disable-lineedit \
-+override JIM_CONFIGURE_OPTS += --disable-lineedit \
- 	--with-out-jim-ext="stdlib posix load signal syslog" --prefix=/usr
- 
- .PHONY: clean install install-common uninstall \
--- 
-2.11.0
-
diff --git a/package/usb_modeswitch/Config.in b/package/usb_modeswitch/Config.in
index f709a550c1..579761c040 100644
--- a/package/usb_modeswitch/Config.in
+++ b/package/usb_modeswitch/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_USB_MODESWITCH
 	bool "usb_modeswitch"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_JIMTCL if !BR2_PACKAGE_TCL || BR2_PACKAGE_TCL_SHLIB_ONLY
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Some USB devices such as 3G/4G broadband modems power-up
diff --git a/package/usb_modeswitch/usb_modeswitch.hash b/package/usb_modeswitch/usb_modeswitch.hash
index 0b180f9789..049c40468e 100644
--- a/package/usb_modeswitch/usb_modeswitch.hash
+++ b/package/usb_modeswitch/usb_modeswitch.hash
@@ -1,4 +1,3 @@
 # Locally calculated
-sha256	abffac09c87eacd78e101545967dc25af7e989745b4276756d45dbf4008a2ea6  usb-modeswitch-2.5.2.tar.bz2
-sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
-sha256	929bfd332292f8cd33e4401b5cedea3e93ebe6efa99e1d3626884cacb59ff208  dispatcher.c
+sha256	c215236e6bada6e659fc195a31d611ea298a4bdb4d57a0d68c553b56585f8ba3  usb-modeswitch-2.6.0.tar.bz2
+sha256	6195429209313925c0eba6c0da4ee7a6cb4277b99e35c886913f80f91ec20b94  COPYING
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 5b60a3c5dc..0825cff938 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,35 +4,30 @@
 #
 ################################################################################
 
-USB_MODESWITCH_VERSION = 2.5.2
+USB_MODESWITCH_VERSION = 2.6.0
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
 USB_MODESWITCH_LICENSE = BSD-2-Clause (dispatcher.c), GPL-2.0+ (usb_modeswitch{.c,.h,.sh,_dispatcher.tcl})
-USB_MODESWITCH_LICENSE_FILES = COPYING dispatcher.c
-# Package does not build in parallel due to improper make rules
-USB_MODESWITCH_MAKE = $(MAKE1)
+USB_MODESWITCH_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_TCL)$(BR2_PACKAGE_TCL_SHLIB_ONLY),y)
 USB_MODESWITCH_DEPENDENCIES += tcl
-USB_MODESWITCH_BUILD_TARGETS = script
+USB_MODESWITCH_BUILD_TARGETS = all
 USB_MODESWITCH_INSTALL_TARGETS = install-script
 else
-USB_MODESWITCH_BUILD_TARGETS = static
-USB_MODESWITCH_INSTALL_TARGETS = install-static
+USB_MODESWITCH_DEPENDENCIES += jimtcl
+ifeq ($(BR2_STATIC_LIBS),y)
+USB_MODESWITCH_BUILD_TARGETS = all-with-statlink-dispatcher
+USB_MODESWITCH_INSTALL_TARGETS = install-statlink
+else
+USB_MODESWITCH_BUILD_TARGETS = all-with-dynlink-dispatcher
+USB_MODESWITCH_INSTALL_TARGETS = install-dynlink
+endif
 endif
-
-# build system of embedded jimtcl doesn't use autotools, but does use
-# an old version of gnuconfig which doesn't know all the architectures
-# supported by Buildroot, so update config.guess / config.sub like we
-# do in pkg-autotools.mk
-USB_MODESWITCH_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
 define USB_MODESWITCH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		$(if $(BR2_INSTALL_LIBSTDCPP),,CXX=false) \
-		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE -Wall -I." \
-		JIM_CONFIGURE_OPTS="--host=$(GNU_TARGET_NAME) --build=$(GNU_HOST_NAME)" \
 		-C $(@D) $(USB_MODESWITCH_BUILD_TARGETS)
 endef
 
-- 
2.24.0
