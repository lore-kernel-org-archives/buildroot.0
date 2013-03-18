From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 18 Mar 2013 21:13:35 +0000
Subject: [Buildroot] [PATCH] zmqpp: new package
Message-ID: <1363641215-7058-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Now that zeromq has been bumped to version 3.2.2, we need to provide the
C++ binding using a separate package. The zmqpp package provides a high-level
C++ wrapper library around the zeromq C API.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in                           |    1 +
 package/zmqpp/Config.in                     |   32 ++++++++++++++++
 package/zmqpp/zmqpp-fix-typos-in-code.patch |   46 +++++++++++++++++++++++
 package/zmqpp/zmqpp.mk                      |   54 +++++++++++++++++++++++++++
 4 files changed, 133 insertions(+)
 create mode 100644 package/zmqpp/Config.in
 create mode 100644 package/zmqpp/zmqpp-fix-typos-in-code.patch
 create mode 100644 package/zmqpp/zmqpp.mk

diff --git a/package/Config.in b/package/Config.in
index 9853b06..d5518fa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -535,6 +535,7 @@ source "package/ortp/Config.in"
 source "package/slirp/Config.in"
 source "package/usbredir/Config.in"
 source "package/zeromq/Config.in"
+source "package/zmqpp/Config.in"
 endmenu
 
 menu "Other"
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
new file mode 100644
index 0000000..7a12462
--- /dev/null
+++ b/package/zmqpp/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_ZMQPP
+	bool "zmqpp"
+	depends on !BR2_avr32 # compiler needs c++0x support
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INET_IPV6 # zeromq
+	depends on BR2_LARGEFILE # util-linux
+	depends on BR2_USE_WCHAR # util-linux
+	select BR2_PACKAGE_ZEROMQ
+	help
+	  C++ binding for zeromq (ZeroMQ, 0MQ, zmq).
+
+	  This C++ binding is a 'high-level' library that hides most of the
+	  C-style interface core zeromq provides.
+
+	  http://github.com/benjamg/zmqpp
+
+comment "zmqpp requires a toolchain with C++, IPV6, LARGEFILE and WCHAR support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
+		&& BR2_USE_WCHAR)
+
+config BR2_PACKAGE_ZMQPP_CLIENT
+	bool "zmqpp client"
+	depends on BR2_PACKAGE_ZMQPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	help
+	  Build and install the zmqpp client, a command line tool that can be
+	  used to listen or send to zeromq sockets.
+
+comment "zmqpp client requires a toolchain with thread support"
+	depends on BR2_PACKAGE_ZMQPP && !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/zmqpp/zmqpp-fix-typos-in-code.patch b/package/zmqpp/zmqpp-fix-typos-in-code.patch
new file mode 100644
index 0000000..a873de9
--- /dev/null
+++ b/package/zmqpp/zmqpp-fix-typos-in-code.patch
@@ -0,0 +1,46 @@
+Fix a couple of typos in the zmqpp source code.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/src/zmqpp/socket.cpp b/src/zmqpp/socket.cpp
+--- a/src/zmqpp/socket.cpp	2012-12-11 11:06:23.000000000 +0000
++++ b/src/zmqpp/socket.cpp	2013-03-18 17:32:01.464761776 +0000
+@@ -587,7 +587,7 @@ void socket::get(socket_option const& op
+ 	}
+ }
+ 
+-socket::socket(socket&& source) noexcept
++socket::socket(socket& source) noexcept
+ 	: _socket(source._socket)
+ 	, _type(source._type)
+ 	, _recv_buffer()
+@@ -601,7 +601,7 @@ socket::socket(socket&& source) noexcept
+ 	source._socket = nullptr;
+ }
+ 
+-socket& socket::operator=(socket&& source) noexcept
++socket& socket::operator=(socket& source) noexcept
+ {
+ 	_socket = source._socket;
+ 	source._socket = nullptr;
+diff -Nurp a/src/zmqpp/socket.hpp b/src/zmqpp/socket.hpp
+--- a/src/zmqpp/socket.hpp	2012-12-11 11:06:23.000000000 +0000
++++ b/src/zmqpp/socket.hpp	2013-03-18 17:31:53.556790457 +0000
+@@ -400,7 +400,7 @@ public:
+ 	 *
+ 	 * \param source target socket to steal internals from
+ 	 */
+-	socket(socket&& source) noexcept;
++	socket(socket& source) noexcept;
+ 
+ 	/*!
+ 	 * Move operator
+@@ -413,7 +413,7 @@ public:
+ 	 * \param source target socket to steal internals from
+ 	 * \return socket reference to this
+ 	 */
+-	socket& operator=(socket&& source) noexcept;
++	socket& operator=(socket& source) noexcept;
+ 
+ 	/*!
+ 	 * Check the socket is still valid
diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
new file mode 100644
index 0000000..c64b256
--- /dev/null
+++ b/package/zmqpp/zmqpp.mk
@@ -0,0 +1,54 @@
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
+ZMQPP_MAKE_OPT = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
+
+ifeq ($(BR2_PACKAGE_ZMQPP_CLIENT),y)
+ZMQPP_DEPENDENCIES += boost
+endif
+
+define ZMQPP_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		$(ZMQPP_MAKE_OPT) $(if $(BR2_PACKAGE_ZMQPP_CLIENT),all) -C $(@D)
+endef
+
+define ZMQPP_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/include/zmqpp
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		$(ZMQPP_MAKE_OPT) DESTDIR=$(TARGET_DIR) install -C $(@D)
+endef
+
+define ZMQPP_UNINSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		$(ZMQPP_MAKE_OPT) DESTDIR=$(TARGET_DIR) uninstall -C $(@D)
+	$(RM) $(TARGET_DIR)/usr/include/zmqpp
+endef
+
+define ZMQPP_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/zmqpp
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		$(ZMQPP_MAKE_OPT) DESTDIR=$(STAGING_DIR) install -C $(@D)
+endef
+
+define ZMQPP_UNINSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		$(ZMQPP_MAKE_OPT) DESTDIR=$(STAGING_DIR) uninstall -C $(@D)
+	$(RM) $(STAGING_DIR)/usr/include/zmqpp
+endef
+
+define ZMQPP_CLEAN_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) $(ZMQPP_MAKE_OPT) \
+		clean -C $(@D)
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
