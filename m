From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Mar 2019 17:24:14 +0100
Subject: [Buildroot] [git commit] package/uftp: openssl is optional,
 not mandatory
Message-ID: <20190320162104.D2FB780794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=340f89403efc50c3a6096d13282de0761ecf683e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uftp/Config.in | 1 -
 package/uftp/uftp.mk   | 8 ++++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/uftp/Config.in b/package/uftp/Config.in
index ca6e5f9a05..b88fb03ae2 100644
--- a/package/uftp/Config.in
+++ b/package/uftp/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_UFTP
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_OPENSSL
 	help
 	  Encrypted UDP based FTP with multicast.
 
diff --git a/package/uftp/uftp.mk b/package/uftp/uftp.mk
index f9f0502b49..abdb0a4def 100644
--- a/package/uftp/uftp.mk
+++ b/package/uftp/uftp.mk
@@ -6,11 +6,15 @@
 
 UFTP_VERSION = 4.9.9
 UFTP_SITE = http://sourceforge.net/projects/uftp-multicast/files/source-tar
-UFTP_DEPENDENCIES = host-pkgconf openssl
 UFTP_LICENSE = GPL-3.0+
 UFTP_LICENSE_FILES = LICENSE.txt
 
-UFTP_MAKE_OPTS = CRYPT_LIB="`$(PKG_CONFIG_HOST_BINARY) --libs libssl`"
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+UFTP_DEPENDENCIES += host-pkgconf openssl
+UFTP_MAKE_OPTS += CRYPT_LIB="`$(PKG_CONFIG_HOST_BINARY) --libs libssl`"
+else
+UFTP_MAKE_OPTS += NO_ENCRYPTION=1
+endif
 
 define UFTP_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(UFTP_MAKE_OPTS)
