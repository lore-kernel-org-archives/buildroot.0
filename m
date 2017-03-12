From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 11:36:58 +0100
Subject: [Buildroot] [git commit] shairport-sync: bump to version 3.0.1
Message-ID: <20170312103705.B7D1882207@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=666b95b28eb103e9f36f36e8130f56252ab9af03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for PolarSSL is deprecated and the usage of mbedTLS is
recommended, if not OpenSSL is used as crypto backend.

Also change the direction of the OpenSSL/mbedTLS package selection to
be the same as in ustream-ssl to prevent a circular dependency.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shairport-sync/Config.in           | 2 +-
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index c558a64..d70121b 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_SHAIRPORT_SYNC
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_LIBCONFIG
 	select BR2_PACKAGE_LIBDAEMON
-	select BR2_PACKAGE_POLARSSL if !BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
 	select BR2_PACKAGE_POPT
 	help
 	  Shairport Sync emulates an AirPort Express for the purpose of
diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index 45bce10..9e305da 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2e73416ac8fdda1657034afaa143f1710852ebed06e0aa43dafc2b7dc5eb653d  shairport-sync-2.8.6.tar.gz
+sha256  3fbde4f6e7f5cbc7200f782bd9faca25f7e91edf7dd7a3b514cd616e556a1fee  shairport-sync-3.0.1.tar.gz
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 00d6a69..976aff6 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 2.8.6
+SHAIRPORT_SYNC_VERSION = 3.0.1
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
@@ -31,13 +31,13 @@ else
 SHAIRPORT_SYNC_CONF_OPTS += --with-tinysvcmdns
 endif
 
-# OpenSSL or PolarSSL
+# OpenSSL or mbedTLS
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SHAIRPORT_SYNC_DEPENDENCIES += openssl
 SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=openssl
 else
-SHAIRPORT_SYNC_DEPENDENCIES += polarssl
-SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=polarssl
+SHAIRPORT_SYNC_DEPENDENCIES += mbedtls
+SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=mbedtls
 endif
 
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR),y)
