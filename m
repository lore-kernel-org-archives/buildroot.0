From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 14 Apr 2013 21:33:01 +0100
Subject: [Buildroot] [PATCH] zyre: new package
Message-ID: <1365971582-19802-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in      |    1 +
 package/zyre/Config.in |   13 +++++++++++++
 package/zyre/zyre.mk   |   22 ++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/zyre/Config.in
 create mode 100644 package/zyre/zyre.mk

diff --git a/package/Config.in b/package/Config.in
index 322e005..342e92e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -543,6 +543,7 @@ source "package/slirp/Config.in"
 source "package/usbredir/Config.in"
 source "package/zeromq/Config.in"
 source "package/zmqpp/Config.in"
+source "package/zyre/Config.in"
 endmenu
 
 menu "Other"
diff --git a/package/zyre/Config.in b/package/zyre/Config.in
new file mode 100644
index 0000000..f839a5d
--- /dev/null
+++ b/package/zyre/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_ZYRE
+	bool "zyre"
+	depends on BR2_INSTALL_LIBSTDCPP # filemq
+	depends on BR2_INET_IPV6 # filemq
+	depends on BR2_LARGEFILE # filemq
+	depends on BR2_USE_WCHAR # filemq
+	depends on BR2_TOOLCHAIN_HAS_THREADS # filemq
+	select BR2_PACKAGE_FILEMQ
+	help
+	  An open-source framework for proximity-based peer-to-peer
+	  applications.
+
+	  http://zyre.org
diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
new file mode 100644
index 0000000..6e295df
--- /dev/null
+++ b/package/zyre/zyre.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# zyre
+#
+#############################################################
+
+ZYRE_VERSION = 44a57a449a
+ZYRE_SITE = git://github.com/zeromq/zyre.git
+ZYRE_LICENSE = LGPLv3
+ZYRE_LICENSE_FILES = COPYING COPYING.LESSER
+ZYRE_INSTALL_STAGING = YES
+ZYRE_DEPENDENCIES = filemq
+ZYRE_AUTORECONF = YES
+ZYRE_AUTORECONF_OPT = --install --force --verbose
+
+define ZYRE_CREATE_CONFIG_DIR
+	mkdir -p $(@D)/config
+endef
+
+ZYRE_POST_PATCH_HOOKS += ZYRE_CREATE_CONFIG_DIR
+
+$(eval $(autotools-package))
-- 
1.7.10.4
