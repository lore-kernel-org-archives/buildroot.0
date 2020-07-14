From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:25:33 +0200
Subject: [Buildroot] [git commit] package/swupdate: bump version to 2020.04
Message-ID: <20200714132253.72D2086E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41684e3ff1f9776260efa05a774f9420556d8085
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See full changelog : https://github.com/sbabic/swupdate/releases/tag/2020.04

Since commit
https://github.com/sbabic/swupdate/commit/82a157e35e9d01599e3c5818caa568899c17e6d2,swupdate
only supports using libubootenv to manipulate the U-Boot environment,
and no longer directly using the U-Boot tools, so we adjust the
Config.in help text and .mk logic accordingly.

Regenarated the default .config

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swupdate/Config.in       | 4 +---
 package/swupdate/swupdate.config | 4 +++-
 package/swupdate/swupdate.hash   | 2 +-
 package/swupdate/swupdate.mk     | 9 +++------
 4 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index c0081032b6..e87f695861 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -32,14 +32,12 @@ config BR2_PACKAGE_SWUPDATE
 	    compressed archives.
 	  * Select BR2_PACKAGE_ZSTD if you want to deal with zstd
 	    compressed archives.
-	  * Select BR2_PACKAGE_UBOOT_TOOLS and BR2_PACKAGE_ZLIB to add
-	    support for setting the U-Boot environment.
 	  * Select BR2_PACKAGE_ZEROMQ to add support for using a
 	    remote handler.
 	  * Select BR2_PACKAGE_LIBRSYNC to add support for using
 	    rdiff handler.
 	  * Select BR2_PACKAGE_LIBUBOOTENV to add support for setting
-	    the U-Boot environment with the new API.
+	    the U-Boot environment.
 	  * Select BR2_PACKAGE_LIBGPIOD to add support for
 	    microcontroller firmware update.
 	  * Select BR2_PACKAGE_EFIBOOTMGR to add support for EFI Boot
diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
index 9d255c8ee4..a6b7a74948 100644
--- a/package/swupdate/swupdate.config
+++ b/package/swupdate/swupdate.config
@@ -14,6 +14,7 @@ CONFIG_HAVE_DOT_CONFIG=y
 # CONFIG_CURL is not set
 # CONFIG_CURL_SSL is not set
 # CONFIG_SYSTEMD is not set
+CONFIG_DEFAULT_CONFIG_FILE="/etc/swupdate.cfg"
 CONFIG_SCRIPTS=y
 # CONFIG_HW_COMPATIBILITY is not set
 CONFIG_SW_VERSIONS_FILE="/etc/sw-versions"
@@ -82,7 +83,7 @@ CONFIG_MONGOOSE=y
 CONFIG_MONGOOSEIPV6=y
 
 #
-# SSL support needs libcrypto, libssl
+# SSL support needs an SSL implementation
 #
 
 #
@@ -103,6 +104,7 @@ CONFIG_PARSERROOT=""
 #
 # ubivol support needs libubi
 #
+# CONFIG_DISKPART is not set
 CONFIG_RAW=y
 # CONFIG_RDIFFHANDLER is not set
 # CONFIG_SHELLSCRIPTHANDLER is not set
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 3de8d25f46..40f978d225 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  31b2561c9c91ab1e8b6f73704f9a3560816961c2cade4f5d5fc15f55c77ec819  swupdate-2019.11.tar.gz
+sha256  132df2ff1ad41c7aabd0fbef6a23d28607cbd5cad52aab050c4822977a107486  swupdate-2020.04.tar.gz
 sha256  43492b377cf2fb67942d1dd231146bd4e6578646ad13ef289297c9dd75cbc478  Licenses/Exceptions
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Licenses/lgpl-2.1.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 62bff30df1..d96a0c2e07 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2019.11
+SWUPDATE_VERSION = 2020.04
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0+ with OpenSSL exception, LGPL-2.1+, MIT
 SWUPDATE_LICENSE_FILES = Licenses/Exceptions Licenses/gpl-2.0.txt \
@@ -15,7 +15,7 @@ SWUPDATE_LICENSE_FILES = Licenses/Exceptions Licenses/gpl-2.0.txt \
 # TARGET_CC is used for both.
 SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)"
 
-# swupdate bundles its own version of mongoose (version 6.11)
+# swupdate bundles its own version of mongoose (version 6.16)
 
 ifeq ($(BR2_PACKAGE_EFIBOOTMGR),y)
 SWUPDATE_DEPENDENCIES += efibootmgr
@@ -114,10 +114,7 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 SWUPDATE_DEPENDENCIES += systemd
 endif
 
-ifeq ($(BR2_PACKAGE_UBOOT_TOOLS),y)
-SWUPDATE_DEPENDENCIES += uboot-tools
-SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=y
-else ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
+ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
 SWUPDATE_DEPENDENCIES += libubootenv
 SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=y
 else
