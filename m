From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 May 2014 23:43:58 +0200
Subject: [Buildroot] [git commit] matchbox-keyboard: fix dependencies
Message-ID: <20140520214434.7A1A29CCC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39b926d968647e1a6e5c5556e9e4175806dc9c5a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Correct a number of issues with matchbox-keyboard:
 - Missing dependencies on host-pkgconf and expat
 - Missing kconfig select on xlib_libXft
 - pango/cairo confusion, ensure cairo is built before if enabled
 - _CONF_OPT variable typo

Fixes:
http://autobuild.buildroot.net/results/473/47380d57e507ec395a1132dfd7b32d35459c1c7a//
http://autobuild.buildroot.net/results/d9a/d9aa2b6ddce920ea45fbd7093addfc0ee6b94467//
http://autobuild.buildroot.net/results/aad/aad393a81812df28cbc296f556de2acb4e6d114b//
http://autobuild.buildroot.net/results/124/124b28336ed61822fa6d5d2591b4e70d83b8a213//
and 17 other build errors, dating back to 2013-07-03

Reported-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matchbox/Config.in                         |    1 +
 .../matchbox-keyboard/matchbox-keyboard.mk         |    7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 67c9716..da02df3 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -36,6 +36,7 @@ config BR2_PACKAGE_MATCHBOX_COMMON_PDA
 config BR2_PACKAGE_MATCHBOX_KEYBOARD
 	bool "Matchbox Virtual Keyboard"
 	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_XLIB_LIBXFT if !BR2_PACKAGE_CAIRO
 	help
 	  Virtual Keyboard
 
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index ff85370..f8bf19a 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -9,7 +9,7 @@ MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.bz
 MATCHBOX_KEYBOARD_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-keyboard/$(MATCHBOX_KEYBOARD_VERSION)
 MATCHBOX_KEYBOARD_LICENSE = GPLv2+
 MATCHBOX_KEYBOARD_LICENSE_FILES = COPYING
-MATCHBOX_KEYBOARD_DEPENDENCIES = matchbox-lib matchbox-fakekey
+MATCHBOX_KEYBOARD_DEPENDENCIES = host-pkgconf matchbox-lib matchbox-fakekey expat
 
 # Workaround bug in configure script
 MATCHBOX_KEYBOARD_CONF_ENV = expat=yes
@@ -22,8 +22,9 @@ MATCHBOX_KEYBOARD_POST_INSTALL_TARGET_HOOKS += MATCHBOX_KEYBOARD_POST_INSTALL_FI
 
 ################################################################################
 
-ifeq ($(BR2_PACKAGE_PANGO),y)
-  MATCHBOX_PKEYBOARD_CONF_OPT += --enable-pango
+ifeq ($(BR2_PACKAGE_CAIRO),y)
+  MATCHBOX_KEYBOARD_CONF_OPT += --enable-cairo
+  MATCHBOX_KEYBOARD_DEPENDENCIES += cairo
 else
   MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
 endif
