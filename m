From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Mar 2019 21:46:42 +0100
Subject: [Buildroot] [PATCH 3/3] package/uftp: openssl is optional,
 not mandatory
In-Reply-To: <20190319204642.28920-1-fontaine.fabrice@gmail.com>
References: <20190319204642.28920-1-fontaine.fabrice@gmail.com>
Message-ID: <20190319204642.28920-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uftp/Config.in | 1 -
 package/uftp/uftp.mk   | 6 +++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

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
index 1f75a5bac8..b8d4359da3 100644
--- a/package/uftp/uftp.mk
+++ b/package/uftp/uftp.mk
@@ -6,13 +6,17 @@
 
 UFTP_VERSION = 4.9.9
 UFTP_SITE = http://sourceforge.net/projects/uftp-multicast/files/source-tar
-UFTP_DEPENDENCIES = openssl
 UFTP_LICENSE = GPL-3.0+
 UFTP_LICENSE_FILES = LICENSE.txt
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+UFTP_DEPENDENCIES += openssl
 ifeq ($(BR2_STATIC_LIBS),y)
 UFTP_MAKE_OPTS += CRYPT_LIB='-lssl -lcrypto -lz'
 endif
+else
+UFTP_MAKE_OPTS += NO_ENCRYPTION=1
+endif
 
 define UFTP_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(UFTP_MAKE_OPTS)
-- 
2.14.1
