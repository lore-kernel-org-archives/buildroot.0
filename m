From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Sep 2012 18:14:28 -0300
Subject: [Buildroot] [PATCH 1/2] libxslt: bump to version 1.1.27
Message-ID: <1348780469-23859-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libxslt/libxslt-1.1.26-id-generation.patch |   56 --------------------
 ...libxslt-1.1.26-pattern-out-of-bounds-read.patch |   27 ---------
 ....26-configure.patch => libxslt-configure.patch} |    0
 package/libxslt/libxslt.mk                         |    4 +-
 4 files changed, 3 insertions(+), 84 deletions(-)
 delete mode 100644 package/libxslt/libxslt-1.1.26-id-generation.patch
 delete mode 100644 package/libxslt/libxslt-1.1.26-pattern-out-of-bounds-read.patch
 rename package/libxslt/{libxslt-1.1.26-configure.patch => libxslt-configure.patch} (100%)

diff --git a/package/libxslt/libxslt-1.1.26-id-generation.patch b/package/libxslt/libxslt-1.1.26-id-generation.patch
deleted file mode 100644
index f8f4c2a..0000000
--- a/package/libxslt/libxslt-1.1.26-id-generation.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From ecb6bcb8d1b7e44842edde3929f412d46b40c89f Mon Sep 17 00:00:00 2001
-From: Daniel Veillard <veillard@redhat.com>
-Date: Tue, 22 Feb 2011 02:14:23 +0000
-Subject: Fix generate-id() to not expose object addresses
-
-As pointed out by Chris Evans <scarybeasts@gmail.com> it's better
-security wise to not expose object addresses directly, use a diff
-w.r.t. the document root own address to avoid this
-* libxslt/functions.c: fix IDs generation code
----
-diff --git a/libxslt/functions.c b/libxslt/functions.c
-index 4720c7a..de962f4 100644
---- a/libxslt/functions.c
-+++ b/libxslt/functions.c
-@@ -654,8 +654,9 @@ xsltFormatNumberFunction(xmlXPathParserContextPtr ctxt, int nargs)
- void
- xsltGenerateIdFunction(xmlXPathParserContextPtr ctxt, int nargs){
-     xmlNodePtr cur = NULL;
--    unsigned long val;
--    xmlChar str[20];
-+    long val;
-+    xmlChar str[30];
-+    xmlDocPtr doc;
- 
-     if (nargs == 0) {
- 	cur = ctxt->context->node;
-@@ -694,9 +695,24 @@ xsltGenerateIdFunction(xmlXPathParserContextPtr ctxt, int nargs){
-      * Okay this is ugly but should work, use the NodePtr address
-      * to forge the ID
-      */
--    val = (unsigned long)((char *)cur - (char *)0);
--    val /= sizeof(xmlNode);
--    sprintf((char *)str, "id%ld", val);
-+    if (cur->type != XML_NAMESPACE_DECL)
-+        doc = cur->doc;
-+    else {
-+        xmlNsPtr ns = (xmlNsPtr) cur;
-+
-+        if (ns->context != NULL)
-+            doc = ns->context;
-+        else
-+            doc = ctxt->context->doc;
-+
-+    }
-+
-+    val = (long)((char *)cur - (char *)doc);
-+    if (val >= 0) {
-+      sprintf((char *)str, "idp%ld", val);
-+    } else {
-+      sprintf((char *)str, "idm%ld", -val);
-+    }
-     valuePush(ctxt, xmlXPathNewString(str));
- }
- 
---
-cgit v0.8.3.4
diff --git a/package/libxslt/libxslt-1.1.26-pattern-out-of-bounds-read.patch b/package/libxslt/libxslt-1.1.26-pattern-out-of-bounds-read.patch
deleted file mode 100644
index cd2e292..0000000
--- a/package/libxslt/libxslt-1.1.26-pattern-out-of-bounds-read.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From fe5a4fa33eb85bce3253ed3742b1ea6c4b59b41b Mon Sep 17 00:00:00 2001
-From: Abhishek Arya <inferno@chromium.org>
-Date: Sun, 22 Jan 2012 17:47:50 +0800
-Subject: [PATCH] Fix some case of pattern parsing errors
-
-We could accidentally hit an off by one string array access
-due to improper loop exit when parsing patterns
----
- libxslt/pattern.c |    2 ++
- 1 files changed, 2 insertions(+), 0 deletions(-)
-
-diff --git a/libxslt/pattern.c b/libxslt/pattern.c
-index 6161376..1155b54 100644
---- a/libxslt/pattern.c
-+++ b/libxslt/pattern.c
-@@ -1867,6 +1867,8 @@ xsltCompilePatternInternal(const xmlChar *pattern, xmlDocPtr doc,
- 		while ((pattern[end] != 0) && (pattern[end] != '"'))
- 		    end++;
- 	    }
-+	    if (pattern[end] == 0)
-+	        break;
- 	    end++;
- 	}
- 	if (current == end) {
--- 
-1.7.8.4
-
diff --git a/package/libxslt/libxslt-1.1.26-configure.patch b/package/libxslt/libxslt-configure.patch
similarity index 100%
rename from package/libxslt/libxslt-1.1.26-configure.patch
rename to package/libxslt/libxslt-configure.patch
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 6dd702c..aa594c2 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-LIBXSLT_VERSION = 1.1.26
+LIBXSLT_VERSION = 1.1.27
 LIBXSLT_SITE = ftp://xmlsoft.org/libxslt
 LIBXSLT_INSTALL_STAGING = YES
+LIBXSLT_LICENSE = MIT
+LIBXSLT_LICENSE_FILES = COPYING
 
 LIBXSLT_CONF_OPT = --with-gnu-ld --without-debug \
 		--without-python --with-libxml-prefix=$(STAGING_DIR)/usr/
-- 
1.7.8.6
