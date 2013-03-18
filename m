From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 18 Mar 2013 16:53:19 +0000
Subject: [Buildroot] [PATCH] cppzmq: new package
Message-ID: <1363625599-3345-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Now that zeromq has been bumped to version 3.2.2, we need to provide the
C++ binding using a separate package. The cppzmq package provides a simple
single-header C++ binding.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in        |    1 +
 package/cppzmq/Config.in |   15 +++++++++++++++
 package/cppzmq/cppzmq.mk |   22 ++++++++++++++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 package/cppzmq/Config.in
 create mode 100644 package/cppzmq/cppzmq.mk

diff --git a/package/Config.in b/package/Config.in
index 9853b06..e4b9854 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -495,6 +495,7 @@ source "package/mediastreamer/Config.in"
 endmenu
 
 menu "Networking"
+source "package/cppzmq/Config.in"
 source "package/glib-networking/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
diff --git a/package/cppzmq/Config.in b/package/cppzmq/Config.in
new file mode 100644
index 0000000..878f414
--- /dev/null
+++ b/package/cppzmq/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CPPZMQ
+	bool "cppzmq"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INET_IPV6 # zeromq
+	depends on BR2_LARGEFILE # util-linux
+	depends on BR2_USE_WCHAR # util-linux
+	select BR2_PACKAGE_ZEROMQ
+	help
+	  C++ binding for zeromq (ZeroMQ, 0MQ, zmq).
+
+	  http://github.com/zeromq/cppzmq
+
+comment "cppzmq requires a toolchain with C++, IPV6, LARGEFILE and WCHAR support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
+		&& BR2_USE_WCHAR)
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
new file mode 100644
index 0000000..11664b6
--- /dev/null
+++ b/package/cppzmq/cppzmq.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# cppzmq
+#
+#############################################################
+
+CPPZMQ_VERSION = b232978
+CPPZMQ_SITE = git://github.com/zeromq/cppzmq.git
+CPPZMQ_INSTALL_STAGING = YES
+CPPZMQ_DEPENDENCIES = zeromq
+CPPZMQ_LICENSE = MIT
+CPPZMQ_LICENSE_FILES = zmq.hpp
+
+define CPPZMQ_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/zmq.hpp $(STAGING_DIR)/usr/include/zmq.hpp
+endef
+
+define CPPZMQ_UNINSTALL_STAGING_CMDS
+	$(RM) $(STAGING_DIR)/usr/include/zmq.hpp
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
