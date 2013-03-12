From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 12 Mar 2013 05:58:41 +0100
Subject: [Buildroot] [PATCH 3/5] urg: new package
In-Reply-To: <cover.1363063832.git.s.martin49@gmail.com>
References: <cover.1363063832.git.s.martin49@gmail.com>
Message-ID: <edf55e40bfad391065a36c7b56263e0b6f1b001b.1363063832.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Eric Jarrige <eric.jarrige@armadeus.org>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
Changes since v1:
- fix dependencies
- fix license
---
 package/Config.in     |  1 +
 package/urg/Config.in | 13 +++++++++++++
 package/urg/urg.mk    | 27 +++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 package/urg/Config.in
 create mode 100644 package/urg/urg.mk

diff --git a/package/Config.in b/package/Config.in
index b8b1e60..7d66b75 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -464,6 +464,7 @@ source "package/libv4l/Config.in"
 source "package/mtdev/Config.in"
 source "package/neardal/Config.in"
 source "package/pcsc-lite/Config.in"
+source "package/urg/Config.in"
 endmenu
 
 menu "Javascript"
diff --git a/package/urg/Config.in b/package/urg/Config.in
new file mode 100644
index 0000000..c8d3b70
--- /dev/null
+++ b/package/urg/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_URG
+	bool "urg library"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_SDL
+	select BR2_PACKAGE_SDL_NET
+	help
+	  Library to control Hokuyo's URG series sensors.
+	  Requires SDL & SDL_net.
+
+	  http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en/
+
+comment "urg requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/urg/urg.mk b/package/urg/urg.mk
new file mode 100644
index 0000000..3f68bf2
--- /dev/null
+++ b/package/urg/urg.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# urg library
+#
+#############################################################
+
+URG_VERSION = 0.8.18
+URG_SITE = http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en/
+URG_SOURCE = urg-$(URG_VERSION).zip
+URG_LICENSE = LGPLv3+
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
1.8.1.5
