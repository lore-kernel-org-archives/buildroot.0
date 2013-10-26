From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 27 Oct 2013 00:44:54 +0200
Subject: [Buildroot] [PATCH] freetype: explicitly en/disable dependencies
Message-ID: <1382827494-14057-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the target, add --with/out to configure options as needed.

For the host, disable everything.

This was triggered by a failing build of the host package because it tried to
link the shared library with libbz.a, which isn't compiled with -fPIC.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/freetype/freetype.mk | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 93fb3db..cc5fbf8 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -13,13 +13,25 @@ FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
 FREETYPE_LICENSE = Dual FTL/GPLv2+
 FREETYPE_LICENSE_FILES = docs/FTL.TXT docs/GPLv2.TXT
-FREETYPE_DEPENDENCIES = host-pkgconf \
-	$(if $(BR2_PACKAGE_ZLIB),zlib) \
-	$(if $(BR2_PACKAGE_BZIP2),bzip2)
+FREETYPE_DEPENDENCIES = host-pkgconf
 FREETYPE_CONFIG_SCRIPTS = freetype-config
 
 HOST_FREETYPE_DEPENDENCIES = host-pkgconf
-HOST_FREETYPE_CONF_OPT = --without-png
+HOST_FREETYPE_CONF_OPT = --without-zlib --without-bzip2 --without-png
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+FREETYPE_DEPENDENCIES += zlib
+FREETYPE_CONF_OPT += --with-zlib
+else
+FREETYPE_CONF_OPT += --without-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+FREETYPE_DEPENDENCIES += bzip2
+FREETYPE_CONF_OPT += --with-bzip2
+else
+FREETYPE_CONF_OPT += --without-bzip2
+endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 FREETYPE_DEPENDENCIES += libpng
-- 
1.8.4.rc3
