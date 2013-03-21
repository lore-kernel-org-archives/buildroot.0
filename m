From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 21 Mar 2013 13:01:25 +0000
Subject: [Buildroot] [PATCH] czmq: new package
Message-ID: <1363870885-27916-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in      |    1 +
 package/czmq/Config.in |   14 ++++++++++++++
 package/czmq/czmq.mk   |   22 ++++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/czmq/Config.in
 create mode 100644 package/czmq/czmq.mk

diff --git a/package/Config.in b/package/Config.in
index 94e279b..84bfdbf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -494,6 +494,7 @@ source "package/mediastreamer/Config.in"
 endmenu
 
 menu "Networking"
+source "package/czmq/Config.in"
 source "package/glib-networking/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
diff --git a/package/czmq/Config.in b/package/czmq/Config.in
new file mode 100644
index 0000000..20d9285
--- /dev/null
+++ b/package/czmq/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_CZMQ
+	bool "czmq"
+	select BR2_PACKAGE_ZEROMQ
+	depends on BR2_INSTALL_LIBSTDCPP # zeromq
+	depends on BR2_INET_IPV6 # zeromq
+	depends on BR2_LARGEFILE # util-linux
+	depends on BR2_USE_WCHAR # util-linux
+	help
+	  High-level C Binding for 0MQ
+
+	  http://czmq.zeromq.org/
+
+comment "czmq requires a toolchain with C++, LARGEFILE and WCHAR support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
new file mode 100644
index 0000000..98991fe
--- /dev/null
+++ b/package/czmq/czmq.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# czmq
+#
+#############################################################
+
+CZMQ_VERSION = cb9839cf90
+CZMQ_SITE = git://github.com/zeromq/czmq.git
+
+CZMQ_AUTORECONF = YES
+CZMQ_INSTALL_STAGING = YES
+CZMQ_DEPENDENCIES = zeromq
+CZMQ_LICENSE = LGPLv3+ with exceptions
+CZMQ_LICENSE_FILES = COPYING COPYING.LESSER
+
+define CZMQ_CREATE_CONFIG_DIR
+	mkdir -p $(@D)/config
+endef
+
+CZMQ_PRE_CONFIGURE_HOOKS += CZMQ_CREATE_CONFIG_DIR
+
+$(eval $(autotools-package))
-- 
1.7.10.4
