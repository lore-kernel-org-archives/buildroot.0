From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 18 Mar 2013 14:56:57 +0000
Subject: [Buildroot] [PATCH] zeromq: add C++ bindings
Message-ID: <1363618617-2969-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Now that zeromq has been bumped to version 3.2.2, we need to provide the
C++ bindings using separate packages. Two C++ bindings are provided by this
patch:

  * cppzmq is a very simple single-header binding
  * zmqpp is a high-level binding, implemented in C++ as a separate library

When the new "C++ bindings" option for zeromq is selected, both of these
C++ bindings are built and installed.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in        |    2 ++
 package/cppzmq/Config.in |    2 ++
 package/cppzmq/cppzmq.mk |   23 ++++++++++++++++++++++
 package/zeromq/Config.in |   17 +++++++++++++---
 package/zmqpp/Config.in  |    2 ++
 package/zmqpp/zmqpp.mk   |   48 ++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 91 insertions(+), 3 deletions(-)
 create mode 100644 package/cppzmq/Config.in
 create mode 100644 package/cppzmq/cppzmq.mk
 create mode 100644 package/zmqpp/Config.in
 create mode 100644 package/zmqpp/zmqpp.mk

diff --git a/package/Config.in b/package/Config.in
index 9853b06..9519852 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -495,6 +495,7 @@ source "package/mediastreamer/Config.in"
 endmenu
 
 menu "Networking"
+source "package/cppzmq/Config.in"
 source "package/glib-networking/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
@@ -535,6 +536,7 @@ source "package/ortp/Config.in"
 source "package/slirp/Config.in"
 source "package/usbredir/Config.in"
 source "package/zeromq/Config.in"
+source "package/zmqpp/Config.in"
 endmenu
 
 menu "Other"
diff --git a/package/cppzmq/Config.in b/package/cppzmq/Config.in
new file mode 100644
index 0000000..6ec168e
--- /dev/null
+++ b/package/cppzmq/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_CPPZMQ
+	bool
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
new file mode 100644
index 0000000..b4540ca
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
+CPPZMQ_INSTALL_TARGET = NO
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
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index b7dc8a6..db2384e 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -1,9 +1,8 @@
-comment "zeromq requires a toolchain with C++, LARGEFILE + WCHAR support"
-	depends on !(BR2_INSTALL_LIBSTDCPP &&  BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "zeromq requires a toolchain with LARGEFILE and WCHAR support"
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
 
 config BR2_PACKAGE_ZEROMQ
 	bool "zeromq"
-	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
@@ -32,3 +31,15 @@ config BR2_PACKAGE_ZEROMQ_PGM
 	  Add support for Pragmatic General Multicast protocol (RFC 3208)
 	  implemented either over raw IP packets or UDP datagrams
 	  (encapsulated PGM). This requires OpenPGM library.
+
+comment "zeromq C++ bindings require a toolchain with C++ support"
+	depends on BR2_PACKAGE_ZEROMQ && !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_ZEROMQ_CPP
+	bool "C++ bindings"
+	depends on BR2_PACKAGE_ZEROMQ
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_CPPZMQ
+	select BR2_PACKAGE_ZMQPP
+	help
+	  C++ bindings.
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
new file mode 100644
index 0000000..954cf29
--- /dev/null
+++ b/package/zmqpp/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_ZMQPP
+	bool
diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
new file mode 100644
index 0000000..639ab2f
--- /dev/null
+++ b/package/zmqpp/zmqpp.mk
@@ -0,0 +1,48 @@
+#############################################################
+#
+# zmqpp
+#
+#############################################################
+
+ZMQPP_VERSION = 31220ca
+ZMQPP_SITE = git://github.com/benjamg/zmqpp.git
+ZMQPP_INSTALL_STAGING = YES
+ZMQPP_DEPENDENCIES = zeromq
+ZMQPP_LICENSE = MIT
+ZMQPP_LICENSE_FILES = LICENSE
+
+ZMQPP_MAKE_OPT = $(if $(BR2_PACKAGE_ZMQPP_CLIENT),all)
+
+define ZMQPP_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(ZMQPP_MAKE_ENV) $(MAKE) $(ZMQPP_MAKE_OPT) -C $(@D)
+endef
+
+define ZMQPP_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/include/zmqpp
+	$(TARGET_MAKE_ENV) $(ZMQPP_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) \
+		PREFIX=/usr install -C $(@D)
+endef
+
+define ZMQPP_UNINSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(ZMQPP_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) \
+		PREFIX=/usr uninstall -C $(@D)
+	$(RM) $(TARGET_DIR)/usr/include/zmqpp
+endef
+
+define ZMQPP_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/zmqpp
+	$(TARGET_MAKE_ENV) $(ZMQPP_MAKE_ENV) $(MAKE) DESTDIR=$(STAGING_DIR) \
+		PREFIX=/usr install -C $(@D)
+endef
+
+define ZMQPP_UNINSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(ZMQPP_MAKE_ENV) $(MAKE) DESTDIR=$(STAGING_DIR) \
+		PREFIX=/usr uninstall -C $(@D)
+	$(RM) $(STAGING_DIR)/usr/include/zmqpp
+endef
+
+define ZMQPP_CLEAN_CMDS
+	$(TARGET_MAKE_ENV) $(ZMQPP_MAKE_ENV) $(MAKE) clean -C $(@D)
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
