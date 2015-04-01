From: Jens Rosenboom <j.rosenboom@x-ion.de>
Date: Wed,  1 Apr 2015 11:08:45 +0200
Subject: [Buildroot] [PATCH 1/1] Add package sl
Message-ID: <1427879325-12015-1-git-send-email-j.rosenboom@x-ion.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SL (Steam Locomotive) runs across your terminal when you type "sl" as
you meant to type "ls". It's just a joke command, and not useful at all.

Might want to depend on BR2_PACKAGE_NCURSES_WCHAR even in order to get
terminfo for xterm-256color, but I'm not sure whether that should be
just optional.

Signed-off-by: Jens Rosenboom <j.rosenboom@x-ion.de>
---
 package/Config.in    |  1 +
 package/sl/Config.in |  9 +++++++++
 package/sl/sl.mk     | 20 ++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/sl/Config.in
 create mode 100644 package/sl/sl.mk

diff --git a/package/Config.in b/package/Config.in
index d6a5ad3..08475fe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -183,6 +183,7 @@ menu "Games"
 	source "package/opentyrian-data/Config.in"
 	source "package/prboom/Config.in"
 	source "package/rubix/Config.in"
+	source "package/sl/Config.in"
 endmenu
 
 menu "Graphic libraries and applications (graphic/text)"
diff --git a/package/sl/Config.in b/package/sl/Config.in
new file mode 100644
index 0000000..e387ea5
--- /dev/null
+++ b/package/sl/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SL
+	bool "sl"
+        # Note(JR): Still need to check proper depends
+	depends on BR2_PACKAGE_NCURSES
+	help
+	  SL (Steam Locomotive) runs across your terminal when you type "sl" 
+	  as you meant to type "ls". It's just a joke command, and not useful at all.
+
+	  https://github.com/mtoyoda/sl
diff --git a/package/sl/sl.mk b/package/sl/sl.mk
new file mode 100644
index 0000000..9ad98cb
--- /dev/null
+++ b/package/sl/sl.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# sl
+#
+################################################################################
+
+SL_VERSION = 5.02
+SL_SITE = $(call github,mtoyoda,sl,$(SL_VERSION))
+SL_LICENSE = Unclear
+SL_LICENSE_FILES = LICENSE
+
+define SL_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+endef
+
+define SL_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/sl $(TARGET_DIR)/usr/bin/sl
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
