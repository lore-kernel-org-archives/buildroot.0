From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Mar 2013 09:42:35 +0100
Subject: [Buildroot] [git commit] czmq: new package
Message-ID: <20130327134625.E655E9B341@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34c6fc10342ffc1da2e4151b539832e17ce6c47c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
[yann.morin.1998 at free.fr: create dir as post-patch, not pre-configure]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/czmq/Config.in |   14 ++++++++++++++
 package/czmq/czmq.mk   |   23 +++++++++++++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)

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
