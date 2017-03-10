From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 22:52:30 +0100
Subject: [Buildroot] [git commit] Revert "shairport-sync: bump to version
	3.0"
Message-ID: <20170310215303.BBAC282555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06f847de63f5da90a8c501e70142ed5f44826c28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 7670dcc43e3b023b9bd613fa464533ecde7aca70, which
causes a Config.in circular dependency:

package/openssl/Config.in:1:error: recursive dependency detected!
package/openssl/Config.in:1:	symbol BR2_PACKAGE_OPENSSL is selected by BR2_PACKAGE_MBEDTLS
package/mbedtls/Config.in:1:	symbol BR2_PACKAGE_MBEDTLS is selected by BR2_PACKAGE_OPENSSL

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shairport-sync/Config.in           | 2 +-
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index 2213a96..c558a64 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_SHAIRPORT_SYNC
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_LIBCONFIG
 	select BR2_PACKAGE_LIBDAEMON
-	select BR2_PACKAGE_MBEDTLS if !BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_POLARSSL if !BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_POPT
 	help
 	  Shairport Sync emulates an AirPort Express for the purpose of
diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index fb837a4..45bce10 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d02697810da0a2c10d3b39e8c9e0795af1e81fff065db1e27514cdb5da696108  shairport-sync-3.0.tar.gz
+sha256  2e73416ac8fdda1657034afaa143f1710852ebed06e0aa43dafc2b7dc5eb653d  shairport-sync-2.8.6.tar.gz
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index ab4fdae..00d6a69 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 3.0
+SHAIRPORT_SYNC_VERSION = 2.8.6
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
@@ -36,8 +36,8 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SHAIRPORT_SYNC_DEPENDENCIES += openssl
 SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=openssl
 else
-SHAIRPORT_SYNC_DEPENDENCIES += mbedtls
-SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=mbedtls
+SHAIRPORT_SYNC_DEPENDENCIES += polarssl
+SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=polarssl
 endif
 
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR),y)
