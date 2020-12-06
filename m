From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Dec 2020 14:43:21 +0100
Subject: [Buildroot] [PATCH 2/2] package/bind: bump version to 9.16.9
In-Reply-To: <20201206134321.3881426-1-bernd.kuhls@t-online.de>
References: <20201206134321.3881426-1-bernd.kuhls@t-online.de>
Message-ID: <20201206134321.3881426-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added dependency to libuv:
https://gitlab.isc.org/isc-projects/bind9/-/commit/70397f9d92bed595c2bb6b0825f4f8dad26d0074

Updated license hash:
https://gitlab.isc.org/isc-projects/bind9/-/commits/v9_16_9/COPYRIGHT

Switched to .xz tarball.

Removed BIND_CONFIG_SCRIPTS:
https://gitlab.isc.org/isc-projects/bind9/-/commit/4b44351e6514cc4fd46bd0beb9adc5f3f31c481d

Change json configure option:
https://gitlab.isc.org/isc-projects/bind9/-/commit/4d2d3b49ce0e5f2bf4a796980a599b110fc2d22d#87db583be5c13c1f7b3c958b10e03d67b6a2ca06_1356_1353

Removed path from zlib configure option:
https://gitlab.isc.org/isc-projects/bind9/-/commit/2b632a232fba8f6cbb0a971acc426d26d85a1144#87db583be5c13c1f7b3c958b10e03d67b6a2ca06_1347_1297

Removed path from xml2 configure option:
https://gitlab.isc.org/isc-projects/bind9/-/commit/0771dd3be8bad18f669de978f3be5e08cf2dbd6e#87db583be5c13c1f7b3c958b10e03d67b6a2ca06_1315_1275

Fixes:
http://autobuild.buildroot.net/results/987/987e6649c8c004ee9b38c866fbd8588843f80289/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/bind/Config.in | 10 ++++++++++
 package/bind/bind.hash |  6 +++---
 package/bind/bind.mk   | 13 +++++++------
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index db10ceb304..59c4f05a54 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_BIND
 	bool "bind"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
+	depends on BR2_USE_MMU # libuv
+	depends on !BR2_STATIC_LIBS # libuv
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	select BR2_PACKAGE_LIBUV
 	help
 	  BIND (Berkeley Internet Name Domain) is an
 	  implementation of the Domain Name System (DNS) protocols
@@ -37,3 +42,8 @@ config BR2_PACKAGE_BIND_TOOLS
 	  Install tools (dig, host, nslookup, nsupdate)
 
 endif
+
+comment "bind needs a toolchain w/ NPTL, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index cbd9562b56..8eaf3393aa 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.11.24/bind-9.11.24.tar.gz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.16.9/bind-9.16.9.tar.xz.asc
 # with key 95CEDA256B1CA0A15F302FB59521A7ED5DACE918
-sha256  f261587c5d37c7f14e8393547c4556faefa701a646930f1b6408d71519a30428  bind-9.11.24.tar.gz
-sha256  e316d9d12b3cc3600985d71011d7856f5ff93d28e748155a3a18171b32d98d8b  COPYRIGHT
+sha256  bcb292c4d738a46e3cbcb8afaa25ecf54f77652fa575135da9a2a1d525304a5a  bind-9.16.9.tar.xz
+sha256  1ed1662687cadef646294f95830423da43da1daf5fa1f5a924af29d58edec1f2  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 183c42f1e8..ade9f85c65 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.24
+BIND_VERSION = 9.16.9
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
+BIND_SOURCE = bind-$(BIND_VERSION).tar.xz
 # bind does not support parallel builds.
+BIND_DEPENDENCIES = libuv
 BIND_MAKE = $(MAKE1)
 BIND_INSTALL_STAGING = YES
-BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
 BIND_LICENSE = MPL-2.0
 BIND_LICENSE_FILES = COPYRIGHT
 BIND_TARGET_SERVER_SBIN = arpaname ddns-confgen dnssec-checkds dnssec-coverage
@@ -26,14 +27,14 @@ BIND_CONF_ENV = \
 BIND_CONF_OPTS = \
 	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-threads,--disable-threads) \
 	--without-lmdb \
-	--with-libjson=no \
+	--without-json-c \
 	--with-randomdev=/dev/urandom \
 	--enable-epoll \
 	--with-gssapi=no \
 	--enable-filter-aaaa
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-BIND_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
+BIND_CONF_OPTS += --with-zlib
 BIND_DEPENDENCIES += zlib
 else
 BIND_CONF_OPTS += --without-zlib
@@ -47,10 +48,10 @@ BIND_CONF_OPTS += --disable-linux-caps
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr
+BIND_CONF_OPTS += --with-libxml2
 BIND_DEPENDENCIES += libxml2
 else
-BIND_CONF_OPTS += --with-libxml2=no
+BIND_CONF_OPTS += --without-libxml2
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.29.2
