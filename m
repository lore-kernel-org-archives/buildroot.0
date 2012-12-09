From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 10 Dec 2012 00:06:24 +0100
Subject: [Buildroot] [PATCH] urg: new package
In-Reply-To: <1355094387-22886-1-git-send-email-s.martin49@gmail.com>
References: <1355094387-22886-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1355094387-22886-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Eric Jarrige <eric.jarrige@armadeus.org>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/Config.in     |  1 +
 package/urg/Config.in |  9 +++++++++
 package/urg/urg.mk    | 26 ++++++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/urg/Config.in
 create mode 100644 package/urg/urg.mk

diff --git a/package/Config.in b/package/Config.in
index c530305..45ccbcf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -426,6 +426,7 @@ source "package/libv4l/Config.in"
 source "package/mtdev/Config.in"
 source "package/neardal/Config.in"
 source "package/pcsc-lite/Config.in"
+source "package/urg/Config.in"
 endmenu
 
 menu "Javascript"
diff --git a/package/urg/Config.in b/package/urg/Config.in
new file mode 100644
index 0000000..9dd13bf
--- /dev/null
+++ b/package/urg/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_URG
+	bool "urg library"
+	select BR2_PACKAGE_SDL
+	select BR2_PACKAGE_SDL_NET
+	help
+	  Library to control Hokuyo's URG series sensors.
+	  Requires SDL & SDL_net.
+
+	  http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en/
diff --git a/package/urg/urg.mk b/package/urg/urg.mk
new file mode 100644
index 0000000..d5b752a
--- /dev/null
+++ b/package/urg/urg.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# urg library
+#
+#############################################################
+URG_VERSION = 0.8.18
+URG_SITE = http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en/
+URG_SOURCE = urg-$(URG_VERSION).zip
+URG_LICENSE = LGPLv3
+URG_LICENSE_FILES = COPYING
+
+URG_INSTALL_STAGING = YES
+
+URG_DEPENDENCIES = sdl sdl_net
+
+URG_CONF_OPT = --with-sdl-prefix=$(STAGING_DIR)/usr \
+		--with-sdl-exec-prefix=$(STAGING_DIR)/usr
+
+define URG_EXTRACT_CMDS
+	$(RM) -rf $(URG_DIR)
+	unzip -q -d $(BUILD_DIR)/ $(DL_DIR)/$(URG_SOURCE)
+	test -d $(URG_DIR) || \
+		mv $(BUILD_DIR)/$(subst .zip,,$(URG_SOURCE)) $(URG_DIR)
+endef
+
+$(eval $(autotools-package))
-- 
1.8.0.1
