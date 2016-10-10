From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Oct 2016 14:26:33 -0300
Subject: [Buildroot] [PATCH] polarssl: deprecate on security grounds
Message-ID: <1476120393-19918-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 1.2.x branch is no longer maintained and the latest release from the
maintained branches (2.3, 2.1, 1.3) were security releases, so more
likely than not 1.2 is affected.
In consequence switch shairport-sync to the openssl backend.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy                         | 10 ++++++++++
 package/polarssl/Config.in               |  1 +
 package/shairport-sync/Config.in         |  2 +-
 package/shairport-sync/shairport-sync.mk | 12 ++----------
 4 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2fae812..90a9cca 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,16 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_PACKAGE_POLARSSL
+	bool "polarssl is no longer supported"
+	select BR2_LEGACY
+	help
+	  Upstream isn't maintaining the 1.2 branch any more and there
+	  has been a release in the maintained branches (2.3, 2.1, 1.3)
+	  that contains security fixes, so 1.2 is likely affected to a
+	  certain degree, and even if it isn't any future security fix
+	  will likely go unnoticed.
+
 config BR2_PACKAGE_WESTON_RPI
 	bool "Weston propietary RPI support is gone"
 	select BR2_LEGACY
diff --git a/package/polarssl/Config.in b/package/polarssl/Config.in
index 17125a3..3025e06 100644
--- a/package/polarssl/Config.in
+++ b/package/polarssl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_POLARSSL
 	bool "polarssl"
+	depends on BR2_DEPRECATED_SINCE_2016_11
 	help
 	  PolarSSL is an SSL library written in ANSI C. PolarSSL makes
 	  it easy for developers to include cryptographic and SSL/TLS
diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index c558a64..6c377f5 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_SHAIRPORT_SYNC
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_LIBCONFIG
 	select BR2_PACKAGE_LIBDAEMON
-	select BR2_PACKAGE_POLARSSL if !BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_POPT
 	help
 	  Shairport Sync emulates an AirPort Express for the purpose of
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 49c6604..9f40758 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -9,7 +9,7 @@ SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VE
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
 SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
-SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig libdaemon popt host-pkgconf
+SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig libdaemon openssl popt host-pkgconf
 
 # git clone, no configure
 SHAIRPORT_SYNC_AUTORECONF = YES
@@ -17,6 +17,7 @@ SHAIRPORT_SYNC_AUTORECONF = YES
 SHAIRPORT_SYNC_CONF_OPTS = --with-alsa \
 	--with-metadata \
 	--with-pipe \
+	--with-ssl=openssl \
 	--with-stdout
 
 # Avahi or tinysvcmdns (shaiport-sync bundles its own version of tinysvcmdns).
@@ -31,15 +32,6 @@ else
 SHAIRPORT_SYNC_CONF_OPTS += --with-tinysvcmdns
 endif
 
-# OpenSSL or PolarSSL
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SHAIRPORT_SYNC_DEPENDENCIES += openssl
-SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=openssl
-else
-SHAIRPORT_SYNC_DEPENDENCIES += polarssl
-SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=polarssl
-endif
-
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libsoxr
 SHAIRPORT_SYNC_CONF_OPTS += --with-soxr
-- 
2.7.3
