From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 13:46:20 +0200
Subject: [Buildroot] [git commit] package/ngircd: make zlib an optional
	dependency
Message-ID: <20170924114002.521227FC94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ee9dbcc7546f07d34498fac69934d3095e17d8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zlib is not a hard dependency:
https://github.com/ngircd/ngircd/blob/master/configure.ng#L256

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ngircd/Config.in | 1 -
 package/ngircd/ngircd.mk | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/ngircd/Config.in b/package/ngircd/Config.in
index f1d8bea..9b3d430 100644
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
index 06318a9..9fa30da 100644
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
