From: Michel (BusError) <buildroot.atmel.com@pollet.net>
Date: Tue,  8 Apr 2008 20:41:40 +0100
Subject: [Buildroot] [PATCH] NCURSES: Added config support for copying
	ncurses 'extra' libraries to the target
In-Reply-To: <1207683703-14842-1-git-send-email-buildroot.atmel.com@pollet.net>
References: <1207683703-14842-1-git-send-email-buildroot.atmel.com@pollet.net>
Message-ID: <1207683703-14842-2-git-send-email-buildroot.atmel.com@pollet.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michel <michel.git@pollet.net>

Some package use ncurses libpanel/libform/libmenu, this config allows to selectively
copy them to the target filesystem at the same time at the main library is installed.
---
 package/ncurses/Config.in  |   22 ++++++++++++++++++++++
 package/ncurses/ncurses.mk |    9 +++++++++
 2 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
index 9a50768..904b924 100644
--- a/package/ncurses/Config.in
+++ b/package/ncurses/Config.in
@@ -13,3 +13,25 @@ config BR2_PACKAGE_NCURSES_TARGET_HEADERS
 	depends on BR2_PACKAGE_NCURSES
 	help
 	  Ncurses headers in target
+
+config BR2_PACKAGE_NCURSES_TARGET_PANEL
+	bool "ncurses libpanel in target"
+	default n
+	depends on BR2_PACKAGE_NCURSES
+	help
+	  Ncurses headers in target
+	  Includes ncurses dynamic libpanel in target
+
+config BR2_PACKAGE_NCURSES_TARGET_FORM
+	bool "ncurses libform in target"
+	default n
+	depends on BR2_PACKAGE_NCURSES
+	help
+	  Includes ncurses dynamic libform in target
+
+config BR2_PACKAGE_NCURSES_TARGET_MENU
+	bool "ncurses libmenu in target"
+	default n
+	depends on BR2_PACKAGE_NCURSES
+	help
+	  Includes ncurses dynamic libmenu in target
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index ecdf00e..f65b77d 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -104,6 +104,15 @@ $(STAGING_DIR)/lib/libncurses.so.$(NCURSES_VERSION): $(NCURSES_DIR)/lib/libncurs
 
 $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION): $(STAGING_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
 	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/lib/
+ifeq ($(strip $(BR2_PACKAGE_NCURSES_TARGET_PANEL)),y)
+	cp -dpf $(NCURSES_DIR)/lib/libpanel.so* $(TARGET_DIR)/lib/
+endif
+ifeq ($(strip $(BR2_PACKAGE_NCURSES_TARGET_FORM)),y)
+	cp -dpf $(NCURSES_DIR)/lib/libform.so* $(TARGET_DIR)/lib/
+endif
+ifeq ($(strip $(BR2_PACKAGE_NCURSES_TARGET_MENU)),y)
+	cp -dpf $(NCURSES_DIR)/lib/libmenu.so* $(TARGET_DIR)/lib/
+endif
 	ln -sf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm $(TARGET_DIR)/usr/share/terminfo/x
-- 
1.5.4.3
