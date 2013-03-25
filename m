From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Mar 2013 00:28:02 +0100
Subject: [Buildroot] [PATCH 07/15] cppzmq: new package
In-Reply-To: <cover.1364253936.git.yann.morin.1998@free.fr>
References: <cover.1364253936.git.yann.morin.1998@free.fr>
Message-ID: <eb92486b58d6db6b4f600a9d355fb14be76ab7e1.1364253936.git.yann.morin.1998@free.fr>
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
[yann.morin.1998 at free.fr: add comment about no license file]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in        |    1 +
 package/cppzmq/Config.in |   15 +++++++++++++++
 package/cppzmq/cppzmq.mk |   23 +++++++++++++++++++++++
 3 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 package/cppzmq/Config.in
 create mode 100644 package/cppzmq/cppzmq.mk

diff --git a/package/Config.in b/package/Config.in
index d3901b4..23c9bb3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -497,6 +497,7 @@ endmenu
 
 menu "Networking"
 source "package/czmq/Config.in"
+source "package/cppzmq/Config.in"
 source "package/glib-networking/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
diff --git a/package/cppzmq/Config.in b/package/cppzmq/Config.in
new file mode 100644
index 0000000..ea632d1
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
index 0000000..d4609bf
--- /dev/null
+++ b/package/cppzmq/cppzmq.mk
@@ -0,0 +1,23 @@
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
+# No license file, the license is in the installed header
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
1.7.2.5
