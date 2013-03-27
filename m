From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 27 Mar 2013 13:58:48 +0000
Subject: [Buildroot] [PATCH] filemq: new package
Message-ID: <1364392728-2226-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in        |    1 +
 package/filemq/Config.in |   16 ++++++++++++++++
 package/filemq/filemq.mk |   22 ++++++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 package/filemq/Config.in
 create mode 100644 package/filemq/filemq.mk

diff --git a/package/Config.in b/package/Config.in
index 77dc0d3..319d18f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -498,6 +498,7 @@ endmenu
 menu "Networking"
 source "package/czmq/Config.in"
 source "package/cppzmq/Config.in"
+source "package/filemq/Config.in"
 source "package/glib-networking/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
diff --git a/package/filemq/Config.in b/package/filemq/Config.in
new file mode 100644
index 0000000..b8eb8bd
--- /dev/null
+++ b/package/filemq/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_FILEMQ
+	bool "filemq"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_CZMQ
+	select BR2_PACKAGE_ZEROMQ
+	depends on BR2_INSTALL_LIBSTDCPP # zeromq
+	depends on BR2_INET_IPV6 # zeromq
+	depends on BR2_LARGEFILE # util-linux
+	depends on BR2_USE_WCHAR # util-linux
+	help
+	  FileMQ is a publish-subscribe file service based on 0MQ.
+
+	  http://github.com/zeromq/filemq
+
+comment "filemq requires a toolchain with C++, IPv6, LARGEFILE and WCHAR support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
new file mode 100644
index 0000000..0ea7a9d
--- /dev/null
+++ b/package/filemq/filemq.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# filemq
+#
+#############################################################
+
+FILEMQ_VERSION = 8fac5140dd
+FILEMQ_SITE = git://github.com/zeromq/filemq.git
+
+FILEMQ_AUTORECONF = YES
+FILEMQ_INSTALL_STAGING = YES
+FILEMQ_DEPENDENCIES = czmq openssl zeromq
+FILEMQ_LICENSE = LGPLv3+ with exceptions
+FILEMQ_LICENSE_FILES = COPYING COPYING.LESSER
+
+define FILEMQ_CREATE_CONFIG_DIR
+	mkdir -p $(@D)/config
+endef
+
+FILEMQ_POST_PATCH_HOOKS += FILEMQ_CREATE_CONFIG_DIR
+
+$(eval $(autotools-package))
-- 
1.7.10.4
