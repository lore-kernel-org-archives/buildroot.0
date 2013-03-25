From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Mar 2013 00:28:01 +0100
Subject: [Buildroot] [PATCH 06/15] czmq: new package
In-Reply-To: <cover.1364253936.git.yann.morin.1998@free.fr>
References: <cover.1364253936.git.yann.morin.1998@free.fr>
Message-ID: <0d8cd9499a99514dc2105bbf0d8abf6f7f82edfd.1364253936.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
[yann.morin.1998 at free.fr: create dir as post-patch, not pre-configure]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in      |    1 +
 package/czmq/Config.in |   14 ++++++++++++++
 package/czmq/czmq.mk   |   23 +++++++++++++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 package/czmq/Config.in
 create mode 100644 package/czmq/czmq.mk

diff --git a/package/Config.in b/package/Config.in
index 5d8f4f6..d3901b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -496,6 +496,7 @@ source "package/mediastreamer/Config.in"
 endmenu
 
 menu "Networking"
+source "package/czmq/Config.in"
 source "package/glib-networking/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
diff --git a/package/czmq/Config.in b/package/czmq/Config.in
new file mode 100644
index 0000000..9fd8e86
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
+comment "czmq requires a toolchain with C++, IPV6, LARGEFILE and WCHAR support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
new file mode 100644
index 0000000..2b34654
--- /dev/null
+++ b/package/czmq/czmq.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# czmq
+#
+#############################################################
+
+CZMQ_VERSION = cb9839cf90
+CZMQ_SITE = git://github.com/zeromq/czmq.git
+
+# Autoreconf required as we use the git tree
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
+CZMQ_POST_PATCH_HOOKS += CZMQ_CREATE_CONFIG_DIR
+
+$(eval $(autotools-package))
-- 
1.7.2.5
