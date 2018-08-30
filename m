From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 30 Aug 2018 16:42:20 +0300
Subject: [Buildroot] [PATCH 1/1] libtorrent: refactor openssl optional
 dependency
Message-ID: <20180830134220.9545-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/libtorrent/libtorrent.mk | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
index 8d74addaf7..de964b45ae 100644
--- a/package/libtorrent/libtorrent.mk
+++ b/package/libtorrent/libtorrent.mk
@@ -6,15 +6,20 @@
 
 LIBTORRENT_VERSION = 0.13.7
 LIBTORRENT_SITE = http://rtorrent.net/downloads
-LIBTORRENT_DEPENDENCIES = host-pkgconf zlib \
-	$(if $(BR2_PACKAGE_OPENSSL),openssl)
+LIBTORRENT_DEPENDENCIES = host-pkgconf zlib
 LIBTORRENT_CONF_OPTS = --enable-aligned \
 	--disable-instrumentation \
-	--with-zlib=$(STAGING_DIR)/usr \
-	$(if $(BR2_PACKAGE_OPENSSL),--enable-openssl,--disable-openssl)
+	--with-zlib=$(STAGING_DIR)/usr
 LIBTORRENT_INSTALL_STAGING = YES
 LIBTORRENT_AUTORECONF = YES
 LIBTORRENT_LICENSE = GPL-2.0
 LIBTORRENT_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBTORRENT_CONF_OPTS += --enable-openssl
+LIBTORRENT_DEPENDENCIES += openssl
+else
+LIBTORRENT_CONF_OPTS += --disable-openssl
+endif
+
 $(eval $(autotools-package))
-- 
2.17.1
