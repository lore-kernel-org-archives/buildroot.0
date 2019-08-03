From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 18:51:37 +0200
Subject: [Buildroot] [git commit] package/bitcoin: new package
Message-ID: <20190803164850.3FD4281838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=656fc50b51c03891d34471fd39003355678f7fde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bitcoin Core is an open source project which maintains and releases
Bitcoin client software called ???Bitcoin Core???.

Signed-off-by: Fabio Urquiza <fabiorush@gmail.com>
[Thomas:
 - Don't create a new blockchain applications sub-menu for now, put
   this package in "Miscellaneous applications"
 - Do not select BR2_INSTALL_LIBSTDCPP, use depends on instead, and
   add the corresponding comment.
 - Do not select BR2_TOOLCHAIN_BUILDROOT_USE_SSP. Instead pass
   --disable-hardening, and let Buildroot pass the appropriate CFLAGS
   when hardening features are enabled system-wide.
 - Add missing BR2_TOOLCHAIN_HAS_ATOMIC dependency
 - Add quirky !(BR2_arm || BR2_armeb) || BR2_USE_MMU because the
   Cortex-M toolchains don't provide 8-byte __atomic intrinsics, but
   we don't have a good way to express that today
 - Add missing BR2_TOOLCHAIN_HAS_GCC_BUG_64735 due to the use of
   std::future
 - Use only one BITCOIN_CONF_OPTS assignment to pass all options]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/bitcoin/Config.in    | 45 ++++++++++++++++++++++++++++++++++++++++++++
 package/bitcoin/bitcoin.hash |  3 +++
 package/bitcoin/bitcoin.mk   | 19 +++++++++++++++++++
 5 files changed, 71 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c5175155be..5073541a97 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -774,6 +774,9 @@ F:	package/kmscube/
 N:	Fabio Porcedda <fabio.porcedda@gmail.com>
 F:	package/netsurf-buildsystem/
 
+N:	Fabio Urquiza <fabiorush@gmail.com>
+F:	package/bitcoin/
+
 N:	Fabrice Fontaine <fabrice.fontaine@orange.com>
 F:	package/domoticz/
 F:	package/libmediaart/
diff --git a/package/Config.in b/package/Config.in
index 9c07ae5874..763616e70c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1823,6 +1823,7 @@ endmenu
 menu "Miscellaneous"
 	source "package/aespipe/Config.in"
 	source "package/bc/Config.in"
+	source "package/bitcoin/Config.in"
 	source "package/clamav/Config.in"
 	source "package/collectd/Config.in"
 	source "package/domoticz/Config.in"
diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
new file mode 100644
index 0000000000..03e040d8f5
--- /dev/null
+++ b/package/bitcoin/Config.in
@@ -0,0 +1,45 @@
+config BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
+	bool
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	# bitcoin uses 8-byte __atomic intrinsics, which are not
+	# available on ARM noMMU platforms that we
+	# support. BR2_TOOLCHAIN_HAS_ATOMIC does not provide a
+	# size-level granularity to express this dependency.
+	depends on !(BR2_arm || BR2_armeb) || BR2_USE_MMU
+
+config BR2_PACKAGE_BITCOIN
+	bool "bitcoin"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
+	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
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
+	  releases Bitcoin client software called ???Bitcoin Core???.
+
+	  It is a direct descendant of the original Bitcoin software
+	  client released by Satoshi Nakamoto after he published the
+	  famous Bitcoin whitepaper.
+
+	  Bitcoin Core consists of both "full-node" software for fully
+	  validating the blockchain as well as a bitcoin wallet. The
+	  project also currently maintains related software such as
+	  the cryptography library libsecp256k1 and others located at
+	  GitHub.
+
+	  https://bitcoincore.org
+
+comment "bitcoin needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+comment "bitcoin needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
new file mode 100644
index 0000000000..96edd22959
--- /dev/null
+++ b/package/bitcoin/bitcoin.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 c8557b6df5f5cdf67b3ddf6fe501cfc6e0be698f175f16927dd08d6040df7d9f  bitcoin-v0.16.3.tar.gz
+sha256 70223369f70e8cb550e75aa74eb86bfa5220fb09c0ba0549d91c36587d15d1a0  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
new file mode 100644
index 0000000000..78170abcc7
--- /dev/null
+++ b/package/bitcoin/bitcoin.mk
@@ -0,0 +1,19 @@
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
+BITCOIN_DEPENDENCIES = boost openssl libevent
+BITCOIN_CONF_OPTS = \
+	--disable-wallet \
+	--disable-tests \
+	--with-boost-libdir=$(STAGING_DIR)/usr/lib/ \
+	--disable-hardening
+
+$(eval $(autotools-package))
