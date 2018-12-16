From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 19:28:57 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] package/php: bump version
 to 7.2.11
Message-ID: <20181216185627.542FB8D6AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dabe63e7fbb4b4c502caead55f34a3c383ac3c6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Changelog: http://www.php.net/ChangeLog-7.php#7.2.11

Removed patch 0007, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8dc3d02bacc65aa6eb5660a7331e594651c4e7fd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-expat_compat.h-add-missing-php.h-include.patch | 71 ----------------------
 package/php/php.hash                               |  2 +-
 package/php/php.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 73 deletions(-)

diff --git a/package/php/0007-ext-xml-expat_compat.h-add-missing-php.h-include.patch b/package/php/0007-ext-xml-expat_compat.h-add-missing-php.h-include.patch
deleted file mode 100644
index daf004dcf7..0000000000
--- a/package/php/0007-ext-xml-expat_compat.h-add-missing-php.h-include.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From fb1f0e17eed729204a6d5caf590715d6257dceb3 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 5 Apr 2018 22:50:00 +0200
-Subject: [PATCH] ext/xml/expat_compat.h: add missing php.h include
-
-When expat support is disabled and libxml support is enabled, the
-following part of the code in expat_compat.h gets used:
-
-and therefore "php".h" is included. However, when libexpat support is
-enabled, HAVE_LIBEXPAT is defined, and therefore the following part of
-the code is used:
-
-In this case, "php.h" is not included. Due to this, zend_alloc.h is
-never included when building the ext/xmlrpc/libxmlrpc/xml_element.c
-file, and therefore the estrdup -> _estrdup macros are never defined,
-causing the following link time failure:
-
-ext/xmlrpc/libxmlrpc/xml_element.o: In function `xml_element_serialize':
-/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:462: undefined reference to `efree'
-ext/xmlrpc/libxmlrpc/xml_element.o: In function `xml_elem_entity_escape':
-/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:347: undefined reference to `emalloc'
-ext/xmlrpc/libxmlrpc/xml_element.o: In function `_xmlrpc_charHandler':
-/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:646: undefined reference to `efree'
-ext/xmlrpc/libxmlrpc/xml_element.o: In function `xml_elem_free_non_recurse':
-/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:198: undefined reference to `efree'
-/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:199: undefined reference to `efree'
-/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:200: undefined reference to `efree'
-/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:207: undefined reference to `efree'
-ext/xmlrpc/libxmlrpc/xml_element.o: In function `xml_elem_new':
-/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:263: undefined reference to `ecalloc'
-ext/xmlrpc/libxmlrpc/xml_element.o: In function `_xmlrpc_startElement':
-/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:602: undefined reference to `estrdup'
-/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:607: undefined reference to `emalloc'
-/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:609: undefined reference to `estrdup'
-/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:610: undefined reference to `estrdup'
-ext/xmlrpc/libxmlrpc/xml_element.o: In function `xml_elem_free_non_recurse':
-/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:211: undefined reference to `efree'
-collect2: error: ld returned 1 exit status
-make: *** [Makefile:248: sapi/cgi/php-cgi] Error 1
-
-This link time failure can be produced with:
-
-./configure --prefix=/usr --with-libdir=/usr/lib64 --disable-all \
-	    --without-pear --with-config-file-path=/etc --disable-phpdbg \
-	    --disable-cli --enable-cgi --disable-fpm --enable-xmlreader \
-	    --enable-xmlwriter --enable-libxml --enable-wddx --with-xmlrpc \
-	    --with-libexpat-dir=/
-
-We fix it by including "php.h" in the HAVE_LIBEXPAT case.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream-status: https://github.com/php/php-src/pull/3212
----
- ext/xml/expat_compat.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/ext/xml/expat_compat.h b/ext/xml/expat_compat.h
-index ed621ab53d..29fe48a7dd 100644
---- a/ext/xml/expat_compat.h
-+++ b/ext/xml/expat_compat.h
-@@ -154,6 +154,7 @@ PHP_XML_API const XML_Char *XML_ExpatVersion(void);
- PHP_XML_API void XML_ParserFree(XML_Parser);
- 
- #elif defined(HAVE_LIBEXPAT)
-+#include "php.h"
- #include <expat.h>
- #endif /* HAVE_LIBEXPAT */
- 
--- 
-2.14.3
-
diff --git a/package/php/php.hash b/package/php/php.hash
index 2774c44d6d..59532771a9 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 01c2154a3a8e3c0818acbdbc1a956832c828a0380ce6d1d14fea495ea21804f0  php-7.2.10.tar.xz
+sha256 da1a705c0bc46410e330fc6baa967666c8cd2985378fb9707c01a8e33b01d985  php-7.2.11.tar.xz
 
 # License file
 sha256 00e567a8d50359d93ee1f9afdd9511277660c1e70a0cbf3229f84403aa9aebb1  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index f92e9b6565..4365847733 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.2.10
+PHP_VERSION = 7.2.11
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
