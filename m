From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 17 Oct 2017 22:32:29 -0400
Subject: [Buildroot] [PATCH 02/13] softether: depend on libopenssl
In-Reply-To: <20171018023240.22724-1-Adamduskett@outlook.com>
References: <20171018023240.22724-1-Adamduskett@outlook.com>
Message-ID: <20171018023240.22724-3-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

softether tries to use SSLv3 functionality as a fallback.  LibreSSL doesn't
support SSLv3 anymore. Two main issues prevent a patch:

- Trying to wrap the sslv3 functionality from the source with a guard clause
results in linking errors after compiling is done.
- There are multiple security vulnerabilities with using sslv3.
- There are multiple security issues in github pertaining to using sslv3.
- This project seems to not be updated very often, and the security issues
  are being ignored it seems.

For people who still want to use softether, they will have to use libopenssl.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/softether/Config.in      | 4 +++-
 package/softether/softether.hash | 3 ++-
 package/softether/softether.mk   | 6 +++---
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/softether/Config.in b/package/softether/Config.in
index 55e5426775..191b09a650 100644
--- a/package/softether/Config.in
+++ b/package/softether/Config.in
@@ -3,8 +3,9 @@ config BR2_PACKAGE_SOFTETHER
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_OPENSSL
+
 	select BR2_PACKAGE_READLINE
 	help
 	  The SoftEther Server is a fully integrated implementation of the SSTP,
@@ -24,4 +25,5 @@ config BR2_PACKAGE_SOFTETHER
 
 comment "softether needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBOPENSSL
 	depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/softether/softether.hash b/package/softether/softether.hash
index 01de10714b..ec6e0603d7 100644
--- a/package/softether/softether.hash
+++ b/package/softether/softether.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 a34dca9bdb940f9384ae50096f6485448ca539c557e36b3a7f6f810831ee5946 softether-e9006faf0c8739147ab97e27fe11c5cdd20ed9e6.tar.gz
+sha256 8e6310d36e579ea07171ce5fcb9ebe31235d218444c4e4836ca6c32aa49c1f93 softether-v4.22-9634-beta.tar.gz
+sha256 7aeb873293fa0e44425dabf68a8e46e26c848fe58efcfd3ac7c90a3386f3edd1 LICENSE
diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 5868438db0..05d2f20fe5 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-SOFTETHER_VERSION = e9006faf0c8739147ab97e27fe11c5cdd20ed9e6
+SOFTETHER_VERSION = v4.22-9634-beta
 SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,$(SOFTETHER_VERSION))
 SOFTETHER_LICENSE = GPL-2.0
 SOFTETHER_LICENSE_FILES = LICENSE
-SOFTETHER_DEPENDENCIES = host-softether openssl readline
+SOFTETHER_DEPENDENCIES = host-softether libopenssl readline
 SOFTETHER_AUTORECONF = YES
 
 ifeq ($(BR2_ENABLE_LOCALE),)
@@ -26,7 +26,7 @@ SOFTETHER_CONF_OPTS = \
 	--with-zlib="$(STAGING_DIR)/usr"
 
 # host-libiconv does not exist, therefore we need this extra line
-HOST_SOFTETHER_DEPENDENCIES = host-pkgconf host-openssl host-readline
+HOST_SOFTETHER_DEPENDENCIES = host-pkgconf host-libopenssl host-readline
 
 # target build creates the file hamcore.se2 which needs the host variant of
 # hamcorebuilder, for details see http://www.vpnusers.com/viewtopic.php?p=5426
-- 
2.13.6
