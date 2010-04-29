From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 29 Apr 2010 22:50:46 +0300
Subject: [Buildroot] [PATCH] Fix build of matchbox-keyboard and matchbox-wm
Message-ID: <20100429195046.6772.8942.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Darius Augulis <augulis.darius@gmail.com>

These packages have buggy configure script. It adds -L/lib flag
for linker and thus wrong libraries are linked in.
Workaround this issue by setting expat=yes in configure
environment.

Signed-off-by: Darius Augulis <augulis.darius@gmail.com>
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 .../matchbox-keyboard/matchbox-keyboard.mk         |    4 +++-
 package/matchbox/matchbox-wm/matchbox-wm.mk        |    3 +++
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index 7c6d455..3d7178d 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -8,7 +8,9 @@ MATCHBOX_KEYBOARD_VERSION = 0.1
 MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.bz2
 MATCHBOX_KEYBOARD_SITE = http://matchbox-project.org/sources/matchbox-keyboard/$(MATCHBOX_KEYBOARD_VERSION)
 MATCHBOX_KEYBOARD_DEPENDENCIES = matchbox-lib matchbox-fakekey
-MATCHBOX_KEYBOARD_CONF_OPT = --enable-expat
+
+# Workaround bug in configure script
+MATCHBOX_KEYBOARD_CONF_ENV = expat=yes
 
 define MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
  cp -dpf ./package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/
diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
index fbf3456..0334d0f 100644
--- a/package/matchbox/matchbox-wm/matchbox-wm.mk
+++ b/package/matchbox/matchbox-wm/matchbox-wm.mk
@@ -10,6 +10,9 @@ MATCHBOX_WM_SITE = http://matchbox-project.org/sources/matchbox-window-manager/$
 MATCHBOX_WM_DEPENDENCIES = matchbox-lib
 MATCHBOX_WM_CONF_OPT = --enable-expat
 
+# Workaround bug in configure script
+MATCHBOX_WM_CONF_ENV = expat=yes
+
 #############################################################
 
 ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
