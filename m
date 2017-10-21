From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:28:13 +0200
Subject: [Buildroot] [git commit] softether: require libopenssl
Message-ID: <20171021192125.6DA3981110@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae1cf0f3b850f785b86690bcf102db4703108593
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

softether tries to use SSLv3 functionality as a fallback. LibreSSL
doesn't support SSLv3 anymore. Two main issues prevent a patch:

- Trying to wrap the sslv3 functionality from the source with a guard
  clause results in linking errors after compiling is done.
- There are multiple security vulnerabilities with using sslv3.
- There are multiple security issues in github pertaining to using
  sslv3.
- This project seems to not be updated very often, and the security
  issues are being ignored it seems.

For people who still want to use softether, they will have to use
libopenssl.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/softether/Config.in    | 1 +
 package/softether/softether.mk | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/softether/Config.in b/package/softether/Config.in
index 55e5426..8fda315 100644
--- a/package/softether/Config.in
+++ b/package/softether/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_SOFTETHER
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_READLINE
 	help
 	  The SoftEther Server is a fully integrated implementation of the SSTP,
diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 77ce408..05d2f20 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -8,7 +8,7 @@ SOFTETHER_VERSION = v4.22-9634-beta
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
