From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 May 2014 17:58:35 +0200
Subject: [Buildroot] [PATCH 1/1] matchbox-keyboard: Fix dependencies
Message-ID: <1400601515-29764-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Always depend on xlib_libXft, pango is not used by the package

Fixes
http://autobuild.buildroot.net/results/473/47380d57e507ec395a1132dfd7b32d35459c1c7a//
http://autobuild.buildroot.net/results/d9a/d9aa2b6ddce920ea45fbd7093addfc0ee6b94467//
http://autobuild.buildroot.net/results/aad/aad393a81812df28cbc296f556de2acb4e6d114b//
http://autobuild.buildroot.net/results/124/124b28336ed61822fa6d5d2591b4e70d83b8a213//
and 17 other build errors, dating back to 2013-07-03

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/matchbox/Config.in                              |    3 ++-
 package/matchbox/matchbox-keyboard/matchbox-keyboard.mk |   12 +-----------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 67c9716..e1f6db9 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -35,7 +35,8 @@ config BR2_PACKAGE_MATCHBOX_COMMON_PDA
 
 config BR2_PACKAGE_MATCHBOX_KEYBOARD
 	bool "Matchbox Virtual Keyboard"
-	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_XLIB_LIBXTST # matchbox-fakekey
+	select BR2_PACKAGE_XLIB_LIBXFT
 	help
 	  Virtual Keyboard
 
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index ff85370..d8109ad 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -9,7 +9,7 @@ MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.bz
 MATCHBOX_KEYBOARD_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-keyboard/$(MATCHBOX_KEYBOARD_VERSION)
 MATCHBOX_KEYBOARD_LICENSE = GPLv2+
 MATCHBOX_KEYBOARD_LICENSE_FILES = COPYING
-MATCHBOX_KEYBOARD_DEPENDENCIES = matchbox-lib matchbox-fakekey
+MATCHBOX_KEYBOARD_DEPENDENCIES = matchbox-lib matchbox-fakekey xlib_libXft
 
 # Workaround bug in configure script
 MATCHBOX_KEYBOARD_CONF_ENV = expat=yes
@@ -20,14 +20,4 @@ endef
 
 MATCHBOX_KEYBOARD_POST_INSTALL_TARGET_HOOKS += MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
 
-################################################################################
-
-ifeq ($(BR2_PACKAGE_PANGO),y)
-  MATCHBOX_PKEYBOARD_CONF_OPT += --enable-pango
-else
-  MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
-endif
-
-################################################################################
-
 $(eval $(autotools-package))
-- 
1.7.10.4
