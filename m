From: Yair Ben-Avraham <yairba@protonmail.com>
Date: Tue, 19 May 2020 08:26:30 +0000
Subject: [Buildroot] [PATCH v3 1/1] gloox: new package
Message-ID: <CslBIYDGe4BUOvGIdHlTB0sFo8pMXh3qKilRP_74vVORercVX6JU15UWVy9B4nGfUbK0qwrpyfmQTNtYJq2byWLupxAZOiZ2MzjOoDDnTHQ=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gloox is a rock-solid, full-featured Jabber/XMPP client library, written in
clean ANSI C++. It makes writing spec-compliant clients easy and allows for
hassle-free integration of Jabber/XMPP functionality into existing
applications. gloox is released under the GNU GPLv3. Commercial licensing and
support are available.

Signed-off-by: Yair Ben Avraham <yairba@protonmail.com>
---
 package/Config.in        |  1 +
 package/gloox/Config.in  | 16 ++++++++++++++
 package/gloox/gloox.hash |  3 +++
 package/gloox/gloox.mk   | 47 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 67 insertions(+)
 create mode 100644 package/gloox/Config.in
 create mode 100644 package/gloox/gloox.hash
 create mode 100644 package/gloox/gloox.mk

diff --git a/package/Config.in b/package/Config.in
index c245abbc42..637e6cbb6a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2039,6 +2039,7 @@ menu "Networking applications"
 	source "package/freeswitch-mod-bcg729/Config.in"
 	source "package/gerbera/Config.in"
 	source "package/gesftpserver/Config.in"
+	source "package/gloox/Config.in"
 	source "package/glorytun/Config.in"
 	source "package/gupnp-tools/Config.in"
 	source "package/gutenprint/Config.in"
diff --git a/package/gloox/Config.in b/package/gloox/Config.in
new file mode 100644
index 0000000000..91e9f06e34
--- /dev/null
+++ b/package/gloox/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_GLOOX
+	bool "gloox"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_MPC
+	help
+	  gloox is a portable high-level Jabber/XMPP library for C++. It
+	  is fully compliant with the XMPP RFCs, supports all of the
+	  XMPP features (including SRV lookups, TLS, SASL, roster
+	  management, and privacy lists), and implements several XEPs
+	  that make it ideal for writing any kind of Jabber/XMPP client
+	  or component.
+
+	  https://camaya.net/gloox/
+
+comment "gloox needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gloox/gloox.hash b/package/gloox/gloox.hash
new file mode 100644
index 0000000000..ee42c079b2
--- /dev/null
+++ b/package/gloox/gloox.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  97cb6a0c07e320ffa4a7c66e8ab06b2361086271dc87ed2398befef4e8435f8a  gloox-1.0.23.tar.bz2
+sha256  40a20c41c8dabb8ba61bea983fa8f2f6989e67fac56bb62c2249053807fd26af  LICENSE
diff --git a/package/gloox/gloox.mk b/package/gloox/gloox.mk
new file mode 100644
index 0000000000..a7df492566
--- /dev/null
+++ b/package/gloox/gloox.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# gloox
+#
+################################################################################
+
+GLOOX_VERSION = 1.0.23
+GLOOX_SOURCE = gloox-$(GLOOX_VERSION).tar.bz2
+GLOOX_SITE = https://camaya.net/download
+GLOOX_LICENSE = GPL-3.0 with OpenSSL exception
+GLOOX_LICENSE_FILES = LICENSE
+GLOOX_INSTALL_STAGING = YES
+
+GLOOX_DEPENDENCIES += mpc
+
+GLOOX_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+GLOOX_CXXFLAGS += -O0
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GLOOX_CONF_ENV += LIBS=-latomic
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+GLOOX_CONF_OPTS += --with-zlib
+GLOOX_DEPENDENCIES += zlib
+else
+GLOOX_CONF_OPTS += --without-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+GLOOX_CONF_OPTS += --with-openssl --without-gnutls
+GLOOX_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+GLOOX_CONF_OPTS += --with-gnutls --without-openssl
+GLOOX_DEPENDENCIES += gnutls
+else
+GLOOX_CONF_OPTS += --without-gnutls --without-openssl
+endif
+
+GLOOX_CONF_OPTS += \
+	--without-libidn \
+	--enable-getaddrinfo
+
+$(eval $(autotools-package))
--
2.20.1
