From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 23:06:09 +0100
Subject: [Buildroot] [git commit] package/shairport-sync: make libdaemon an
 optional dependency
Message-ID: <20191208221346.4AF1288F27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be8f4a73abbf6a4648254cc8d52672d8a213e341
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 3.3 libdaemon is an optional dependency.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shairport-sync/Config.in         | 2 --
 package/shairport-sync/shairport-sync.mk | 7 ++++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index 5df4c194c0..085a9ec77d 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -1,12 +1,10 @@
 config BR2_PACKAGE_SHAIRPORT_SYNC
 	bool "shairport-sync"
-	depends on BR2_USE_MMU # libdaemon
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_LIBCONFIG
-	select BR2_PACKAGE_LIBDAEMON
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
 	select BR2_PACKAGE_POPT
 	help
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index d7c8baa30c..3d9e909879 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -9,7 +9,7 @@ SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VE
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
 SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
-SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig libdaemon popt host-pkgconf
+SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig popt host-pkgconf
 
 # git clone, no configure
 SHAIRPORT_SYNC_AUTORECONF = YES
@@ -33,6 +33,11 @@ else
 SHAIRPORT_SYNC_CONF_OPTS += --with-tinysvcmdns
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDAEMON),y)
+SHAIRPORT_SYNC_DEPENDENCIES += libdaemon
+SHAIRPORT_SYNC_CONF_OPTS += --with-libdaemon
+endif
+
 # OpenSSL or mbedTLS
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SHAIRPORT_SYNC_DEPENDENCIES += openssl
