From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  4 Jan 2020 19:15:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/orc: bump to version 0.4.31
Message-ID: <20200104181532.2359664-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to meson buildsystem and so drop:
 - !BR2_BINFMT_FLAT dependency
 - hooks (not needed thanks to orc-test and tools options)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/orc/Config.in |  2 --
 package/orc/orc.hash  |  4 ++--
 package/orc/orc.mk    | 24 ++++++++++--------------
 3 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/package/orc/Config.in b/package/orc/Config.in
index 7943ecfbfb..90f2b32624 100644
--- a/package/orc/Config.in
+++ b/package/orc/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_ORC
 	bool "orc"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_BINFMT_FLAT # configure doesn't know uclinux
 	help
 	  Orc is a library and set of tools for compiling and executing
 	  very simple programs that operate on arrays of data.
@@ -10,4 +9,3 @@ config BR2_PACKAGE_ORC
 
 comment "orc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_BINFMT_FLAT
diff --git a/package/orc/orc.hash b/package/orc/orc.hash
index 71dd3007ca..c30a50112c 100644
--- a/package/orc/orc.hash
+++ b/package/orc/orc.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/orc/orc-0.4.27.tar.xz.sha256sum
-sha256 4f8901f9144b5ec17dffdb33548b5f4c7f8049b0d1023be3462cdd64ec5a3ab2  orc-0.4.29.tar.xz
+# From https://gstreamer.freedesktop.org/src/orc/orc-0.4.31.tar.xz.sha256sum
+sha256 a0ab5f10a6a9ae7c3a6b4218246564c3bf00d657cbdf587e6d34ec3ef0616075  orc-0.4.31.tar.xz
 
 # Locally calculated
 sha256 4f5dabb1b44bb6fc5cd53820b1f103147ad61b395a57903991325bd1b85d97bf  COPYING
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index d121266bce..51a9b78482 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -4,24 +4,20 @@
 #
 ################################################################################
 
-ORC_VERSION = 0.4.29
+ORC_VERSION = 0.4.31
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
 ORC_LICENSE = BSD-2-Clause, BSD-3-Clause
 ORC_LICENSE_FILES = COPYING
 ORC_INSTALL_STAGING = YES
 ORC_DEPENDENCIES = host-orc
+ORC_CONF_OPTS = \
+	-Dbenchmarks=disabled \
+	-Dexamples=disabled \
+	-Dgtk_doc=disabled \
+	-Dorc-test=disabled \
+	-Dtests=disabled \
+	-Dtools=disabled
 
-define ORC_REMOVE_BUGREPORT
-	rm -f $(TARGET_DIR)/usr/bin/orc-bugreport
-endef
-
-define ORC_REMOVE_DEVFILES
-	rm -f $(TARGET_DIR)/usr/bin/orcc
-endef
-
-ORC_POST_INSTALL_TARGET_HOOKS += ORC_REMOVE_BUGREPORT
-ORC_POST_INSTALL_TARGET_HOOKS += ORC_REMOVE_DEVFILES
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.24.0
