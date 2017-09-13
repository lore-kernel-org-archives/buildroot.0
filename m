From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 14:29:57 +0200
Subject: [Buildroot] [PATCH 4/5] package/ngircd: make zlib an optional
	dependency
In-Reply-To: <20170913122958.11805-1-bernd.kuhls@t-online.de>
References: <20170913122958.11805-1-bernd.kuhls@t-online.de>
Message-ID: <20170913122958.11805-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zlib is not a hard dependency:
https://github.com/ngircd/ngircd/blob/master/configure.ng#L256

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ngircd/Config.in | 1 -
 package/ngircd/ngircd.mk | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/ngircd/Config.in b/package/ngircd/Config.in
index f1d8bea904..9b3d430922 100644
--- a/package/ngircd/Config.in
+++ b/package/ngircd/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_NGIRCD
 	bool "ngircd"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_ZLIB
 	help
 	  Next Generation IRC server deamon.
 
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 06318a9df3..9fa30da24c 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -7,7 +7,6 @@
 NGIRCD_VERSION = 24
 NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.xz
 NGIRCD_SITE = https://arthur.barton.de/pub/ngircd
-NGIRCD_DEPENDENCIES = zlib
 NGIRCD_LICENSE = GPL-2.0+
 NGIRCD_LICENSE_FILES = COPYING
 
@@ -24,4 +23,11 @@ NGIRCD_CONF_OPTS += --without-gnutls
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+NGIRCD_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
+NGIRCD_DEPENDENCIES += zlib
+else
+NGIRCD_CONF_OPTS += --without-zlib
+endif
+
 $(eval $(autotools-package))
-- 
2.11.0
