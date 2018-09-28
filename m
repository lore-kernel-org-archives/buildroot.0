From: Fabio Urquiza <fabiorush@gmail.com>
Date: Fri, 28 Sep 2018 10:59:21 -0300
Subject: [Buildroot] [PATCH 2/4] bitcoin: new package
In-Reply-To: <1538143163-20596-1-git-send-email-fabiorush@gmail.com>
References: <1538143163-20596-1-git-send-email-fabiorush@gmail.com>
Message-ID: <1538143163-20596-3-git-send-email-fabiorush@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bitcoin Core is an open source project which maintains and releases Bitcoin
client software called ?Bitcoin Core?.

Signed-off-by: Fabio Urquiza <fabiorush@gmail.com>
---
 package/Config.in            |  4 ++++
 package/bitcoin/Config.in    | 26 ++++++++++++++++++++++++++
 package/bitcoin/bitcoin.hash |  3 +++
 package/bitcoin/bitcoin.mk   | 17 +++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 package/bitcoin/Config.in
 create mode 100644 package/bitcoin/bitcoin.hash
 create mode 100644 package/bitcoin/bitcoin.mk

diff --git a/package/Config.in b/package/Config.in
index 2810d04..796383a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1971,6 +1971,10 @@ endif
 	source "package/xtables-addons/Config.in"
 	source "package/znc/Config.in"
 
+menu "Blockchain Applications"
+	source "package/bitcoin/Config.in"
+endmenu
+
 endmenu
 
 menu "Package managers"
diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
new file mode 100644
index 0000000..cef0e73
--- /dev/null
+++ b/package/bitcoin/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_BITCOIN
+	bool "bitcoin"
+	select BR2_TOOLCHAIN_BUILDROOT_USE_SSP
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBEVENT
+	help
+	  Bitcoin Core is an open source project which maintains and
+	  releases Bitcoin client software called ?Bitcoin Core?.
+
+	  It is a direct descendant of the original Bitcoin software
+	  client released by Satoshi Nakamoto after he published the
+	  famous Bitcoin whitepaper.
+
+	  Bitcoin Core consists of both ?full-node? software for fully
+	  validating the blockchain as well as a bitcoin wallet. The
+	  project also currently maintains related software such as the
+	  cryptography library libsecp256k1 and others located at GitHub.
+
+	  https://bitcoincore.org
diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
new file mode 100644
index 0000000..96edd22
--- /dev/null
+++ b/package/bitcoin/bitcoin.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 c8557b6df5f5cdf67b3ddf6fe501cfc6e0be698f175f16927dd08d6040df7d9f  bitcoin-v0.16.3.tar.gz
+sha256 70223369f70e8cb550e75aa74eb86bfa5220fb09c0ba0549d91c36587d15d1a0  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
new file mode 100644
index 0000000..58ed17b
--- /dev/null
+++ b/package/bitcoin/bitcoin.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# bitcoin
+#
+################################################################################
+
+BITCOIN_VERSION = v0.16.3
+BITCOIN_SITE = $(call github,bitcoin,bitcoin,$(BITCOIN_VERSION))
+BITCOIN_AUTORECONF = YES
+BITCOIN_LICENSE = MIT
+BITCOIN_LICENSE_FILES = COPYING
+BITCOIN_CONF_OPTS = --disable-wallet --disable-tests
+BITCOIN_CONF_OPTS += --with-sysroot=$(STAGING_DIR)
+BITCOIN_CONF_OPTS += --with-boost-libdir=$(STAGING_DIR)/usr/lib/
+BITCOIN_DEPENDENCIES = boost openssl libevent
+
+$(eval $(autotools-package))
-- 
2.7.4
