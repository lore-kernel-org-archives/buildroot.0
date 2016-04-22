From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Fri, 22 Apr 2016 16:57:07 -0400
Subject: [Buildroot] [PATCH v1 3/4] openDHT: new package
In-Reply-To: <1461358628-9352-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
References: <1461358628-9352-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <1461358628-9352-4-git-send-email-patrick.keroulas@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A lightweight C++11 Distributed Hash Table implementation originally
based on https://github.com/jech/dht by Juliusz Chroboczek.
---
 package/Config.in            |  1 +
 package/opendht/Config.in    | 21 +++++++++++++++++++++
 package/opendht/opendht.hash |  2 ++
 package/opendht/opendht.mk   | 26 ++++++++++++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 package/opendht/Config.in
 create mode 100644 package/opendht/opendht.hash
 create mode 100644 package/opendht/opendht.mk

diff --git a/package/Config.in b/package/Config.in
index 5103621..3796147 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1169,6 +1169,7 @@ menu "Networking"
 	source "package/nss-mdns/Config.in"
 	source "package/nss-pam-ldapd/Config.in"
 	source "package/omniorb/Config.in"
+	source "package/opendht/Config.in"
 	source "package/openldap/Config.in"
 	source "package/openpgm/Config.in"
 	source "package/ortp/Config.in"
diff --git a/package/opendht/Config.in b/package/opendht/Config.in
new file mode 100644
index 0000000..10bfd23
--- /dev/null
+++ b/package/opendht/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_OPENDHT
+	bool "opendht"
+	depends on BR2_USE_WCHAR #gnutls
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 #msgpack
+	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_MSGPACK
+	help
+		OpenDHT is lightweight C++11 Distributed Hash Table implementation.
+
+		https://github.com/savoirfairelinux/opendht
+
+comment "opendht needs a toolchain w/ C++, thread, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP         \
+				|| !BR2_USE_WCHAR             \
+				|| !BR2_TOOLCHAIN_HAS_THREADS \
+				|| !BR2_TOOLCHAIN_HAS_SYNC_4  \
+				|| BR2_STATIC_LIBS
diff --git a/package/opendht/opendht.hash b/package/opendht/opendht.hash
new file mode 100644
index 0000000..683957c
--- /dev/null
+++ b/package/opendht/opendht.hash
@@ -0,0 +1,2 @@
+# from local calculation
+sha256 74ce5a5fc449509cf85912120d4243f93a006465e43ff3100c9c4fbd3001dc41 opendht-468331093345e718b5d269a71b3c52a2eea4797e.tar.gz
diff --git a/package/opendht/opendht.mk b/package/opendht/opendht.mk
new file mode 100644
index 0000000..5bab245
--- /dev/null
+++ b/package/opendht/opendht.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# opendht
+#
+################################################################################
+
+OPENDHT_VERSION = 468331093345e718b5d269a71b3c52a2eea4797e
+OPENDHT_SITE_METHOD = git
+#OPENDHT_SITE = $(call github,savoirfairelinux,opendht,$(OPENDHT_VERSION))
+OPENDHT_SITE = https://github.com/savoirfairelinux/opendht.git
+OPENDHT_LICENSE = GPLv3, X11
+OPENDHT_LICENSE_FILES = COPYING
+OPENDHT_AUTORECONF = YES
+OPENDHT_INSTALL_STAGING = YES
+OPENDHT_INSTALL_TARGET = YES
+OPENDHT_CONF_OPTS = --disable-static
+OPENDHT_CONF_ENV = \
+	GNUTLS_CFLAGS="-I$(STAGING_DIR)/usr/include" \
+	GNUTLS_LIBS="-I$(STAGING_DIR)/usr/lib -lgnutls -lnettle -lhogweed"
+OPENDHT_DEPENDENCIES = \
+	host-pkgconf       \
+	gnutls             \
+	readline           \
+	msgpack
+
+$(eval $(autotools-package))
-- 
1.9.1
