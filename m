From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:28:45 +0200
Subject: [Buildroot] [git commit] mcrypt: use the new gettext logic
Message-ID: <20170704233517.96EAB7FB2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fe1b6372697bac48bf549e543d486c54284d027
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mcrypt/Config.in | 1 -
 package/mcrypt/mcrypt.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/mcrypt/Config.in b/package/mcrypt/Config.in
index 58567cd..ab2888b 100644
--- a/package/mcrypt/Config.in
+++ b/package/mcrypt/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_MCRYPT
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBMCRYPT
 	select BR2_PACKAGE_LIBMHASH
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  MCrypt is a replacement for the old crypt() package and crypt(1)
 	  command, with extensions.
diff --git a/package/mcrypt/mcrypt.mk b/package/mcrypt/mcrypt.mk
index 03a1719..f98895f 100644
--- a/package/mcrypt/mcrypt.mk
+++ b/package/mcrypt/mcrypt.mk
@@ -9,7 +9,7 @@ MCRYPT_SITE = http://downloads.sourceforge.net/project/mcrypt/MCrypt/$(MCRYPT_VE
 MCRYPT_DEPENDENCIES = libmcrypt libmhash \
 	$(if $(BR2_PACKAGE_ZLIB),zlib) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+	$(TARGET_NLS_DEPENDENCIES)
 MCRYPT_CONF_OPTS = --with-libmcrypt-prefix=$(STAGING_DIR)/usr
 MCRYPT_LICENSE = GPL-3.0
 MCRYPT_LICENSE_FILES = COPYING
