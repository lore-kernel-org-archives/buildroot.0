From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:23:44 +0200
Subject: [Buildroot] [git commit] php: fix emalloc/efree/estrdup/...
 undefined references
Message-ID: <20180409092346.4C13788155@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc4b66dbc1b71e871129ce14b289fcda6eb3ea10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zend_alloc.h defines some macros such as:

Where _estrdup is the actual function implemented by the PHP core. If
this header file is not included, and some code uses estrdup, one ends
up with an undefined reference. This happens when libexpat support is
enabled. This commit adds a PHP patch that fixes this issue. The patch
has been submitted upstream through a Github pull request.

Fixes:

  http://autobuild.buildroot.net/results/889d2c1f509c035cd506e36061939bfddc8f1500/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-expat_compat.h-add-missing-php.h-include.patch | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/package/php/0009-ext-xml-expat_compat.h-add-missing-php.h-include.patch b/package/php/0009-ext-xml-expat_compat.h-add-missing-php.h-include.patch
new file mode 100644
index 0000000000..daf004dcf7
--- /dev/null
+++ b/package/php/0009-ext-xml-expat_compat.h-add-missing-php.h-include.patch
@@ -0,0 +1,71 @@
+From fb1f0e17eed729204a6d5caf590715d6257dceb3 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 5 Apr 2018 22:50:00 +0200
+Subject: [PATCH] ext/xml/expat_compat.h: add missing php.h include
+
+When expat support is disabled and libxml support is enabled, the
+following part of the code in expat_compat.h gets used:
+
+and therefore "php".h" is included. However, when libexpat support is
+enabled, HAVE_LIBEXPAT is defined, and therefore the following part of
+the code is used:
+
+In this case, "php.h" is not included. Due to this, zend_alloc.h is
+never included when building the ext/xmlrpc/libxmlrpc/xml_element.c
+file, and therefore the estrdup -> _estrdup macros are never defined,
+causing the following link time failure:
+
+ext/xmlrpc/libxmlrpc/xml_element.o: In function `xml_element_serialize':
+/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:462: undefined reference to `efree'
+ext/xmlrpc/libxmlrpc/xml_element.o: In function `xml_elem_entity_escape':
+/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:347: undefined reference to `emalloc'
+ext/xmlrpc/libxmlrpc/xml_element.o: In function `_xmlrpc_charHandler':
+/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:646: undefined reference to `efree'
+ext/xmlrpc/libxmlrpc/xml_element.o: In function `xml_elem_free_non_recurse':
+/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:198: undefined reference to `efree'
+/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:199: undefined reference to `efree'
+/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:200: undefined reference to `efree'
+/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:207: undefined reference to `efree'
+ext/xmlrpc/libxmlrpc/xml_element.o: In function `xml_elem_new':
+/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:263: undefined reference to `ecalloc'
+ext/xmlrpc/libxmlrpc/xml_element.o: In function `_xmlrpc_startElement':
+/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:602: undefined reference to `estrdup'
+/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:607: undefined reference to `emalloc'
+/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:609: undefined reference to `estrdup'
+/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:610: undefined reference to `estrdup'
+ext/xmlrpc/libxmlrpc/xml_element.o: In function `xml_elem_free_non_recurse':
+/home/thomas/projets/php/ext/xmlrpc/libxmlrpc/xml_element.c:211: undefined reference to `efree'
+collect2: error: ld returned 1 exit status
+make: *** [Makefile:248: sapi/cgi/php-cgi] Error 1
+
+This link time failure can be produced with:
+
+./configure --prefix=/usr --with-libdir=/usr/lib64 --disable-all \
+	    --without-pear --with-config-file-path=/etc --disable-phpdbg \
+	    --disable-cli --enable-cgi --disable-fpm --enable-xmlreader \
+	    --enable-xmlwriter --enable-libxml --enable-wddx --with-xmlrpc \
+	    --with-libexpat-dir=/
+
+We fix it by including "php.h" in the HAVE_LIBEXPAT case.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream-status: https://github.com/php/php-src/pull/3212
+---
+ ext/xml/expat_compat.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ext/xml/expat_compat.h b/ext/xml/expat_compat.h
+index ed621ab53d..29fe48a7dd 100644
+--- a/ext/xml/expat_compat.h
++++ b/ext/xml/expat_compat.h
+@@ -154,6 +154,7 @@ PHP_XML_API const XML_Char *XML_ExpatVersion(void);
+ PHP_XML_API void XML_ParserFree(XML_Parser);
+ 
+ #elif defined(HAVE_LIBEXPAT)
++#include "php.h"
+ #include <expat.h>
+ #endif /* HAVE_LIBEXPAT */
+ 
+-- 
+2.14.3
+
