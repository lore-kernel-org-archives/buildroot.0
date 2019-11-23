From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Nov 2019 21:39:12 +0100
Subject: [Buildroot] [git commit branch/next] package/libxslt: bump to
 version 1.1.34
Message-ID: <20191123203328.2F1CB8FAB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5645107c39ab0ff556d42e54e6682c12e7db0f71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-security-framework-bypass.patch       | 122 ---------------------
 package/libxslt/libxslt.hash                       |   2 +-
 package/libxslt/libxslt.mk                         |   2 +-
 3 files changed, 2 insertions(+), 124 deletions(-)

diff --git a/package/libxslt/0001-Fix-security-framework-bypass.patch b/package/libxslt/0001-Fix-security-framework-bypass.patch
deleted file mode 100644
index 16700362b3..0000000000
--- a/package/libxslt/0001-Fix-security-framework-bypass.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From e03553605b45c88f0b4b2980adfbbb8f6fca2fd6 Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Sun, 24 Mar 2019 09:51:39 +0100
-Subject: [PATCH] Fix security framework bypass
-
-xsltCheckRead and xsltCheckWrite return -1 in case of error but callers
-don't check for this condition and allow access. With a specially
-crafted URL, xsltCheckRead could be tricked into returning an error
-because of a supposedly invalid URL that would still be loaded
-succesfully later on.
-
-Fixes #12.
-
-Thanks to Felix Wilhelm for the report.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- libxslt/documents.c | 18 ++++++++++--------
- libxslt/imports.c   |  9 +++++----
- libxslt/transform.c |  9 +++++----
- libxslt/xslt.c      |  9 +++++----
- 4 files changed, 25 insertions(+), 20 deletions(-)
-
-diff --git a/libxslt/documents.c b/libxslt/documents.c
-index 3f3a7312..4aad11bb 100644
---- a/libxslt/documents.c
-+++ b/libxslt/documents.c
-@@ -296,10 +296,11 @@ xsltLoadDocument(xsltTransformContextPtr ctxt, const xmlChar *URI) {
- 	int res;
- 
- 	res = xsltCheckRead(ctxt->sec, ctxt, URI);
--	if (res == 0) {
--	    xsltTransformError(ctxt, NULL, NULL,
--		 "xsltLoadDocument: read rights for %s denied\n",
--			     URI);
-+	if (res <= 0) {
-+            if (res == 0)
-+                xsltTransformError(ctxt, NULL, NULL,
-+                     "xsltLoadDocument: read rights for %s denied\n",
-+                                 URI);
- 	    return(NULL);
- 	}
-     }
-@@ -372,10 +373,11 @@ xsltLoadStyleDocument(xsltStylesheetPtr style, const xmlChar *URI) {
- 	int res;
- 
- 	res = xsltCheckRead(sec, NULL, URI);
--	if (res == 0) {
--	    xsltTransformError(NULL, NULL, NULL,
--		 "xsltLoadStyleDocument: read rights for %s denied\n",
--			     URI);
-+	if (res <= 0) {
-+            if (res == 0)
-+                xsltTransformError(NULL, NULL, NULL,
-+                     "xsltLoadStyleDocument: read rights for %s denied\n",
-+                                 URI);
- 	    return(NULL);
- 	}
-     }
-diff --git a/libxslt/imports.c b/libxslt/imports.c
-index 874870cc..3783b247 100644
---- a/libxslt/imports.c
-+++ b/libxslt/imports.c
-@@ -130,10 +130,11 @@ xsltParseStylesheetImport(xsltStylesheetPtr style, xmlNodePtr cur) {
- 	int secres;
- 
- 	secres = xsltCheckRead(sec, NULL, URI);
--	if (secres == 0) {
--	    xsltTransformError(NULL, NULL, NULL,
--		 "xsl:import: read rights for %s denied\n",
--			     URI);
-+	if (secres <= 0) {
-+            if (secres == 0)
-+                xsltTransformError(NULL, NULL, NULL,
-+                     "xsl:import: read rights for %s denied\n",
-+                                 URI);
- 	    goto error;
- 	}
-     }
-diff --git a/libxslt/transform.c b/libxslt/transform.c
-index 13793914..0636dbd0 100644
---- a/libxslt/transform.c
-+++ b/libxslt/transform.c
-@@ -3493,10 +3493,11 @@ xsltDocumentElem(xsltTransformContextPtr ctxt, xmlNodePtr node,
-      */
-     if (ctxt->sec != NULL) {
- 	ret = xsltCheckWrite(ctxt->sec, ctxt, filename);
--	if (ret == 0) {
--	    xsltTransformError(ctxt, NULL, inst,
--		 "xsltDocumentElem: write rights for %s denied\n",
--			     filename);
-+	if (ret <= 0) {
-+            if (ret == 0)
-+                xsltTransformError(ctxt, NULL, inst,
-+                     "xsltDocumentElem: write rights for %s denied\n",
-+                                 filename);
- 	    xmlFree(URL);
- 	    xmlFree(filename);
- 	    return;
-diff --git a/libxslt/xslt.c b/libxslt/xslt.c
-index 780a5ad7..a234eb79 100644
---- a/libxslt/xslt.c
-+++ b/libxslt/xslt.c
-@@ -6763,10 +6763,11 @@ xsltParseStylesheetFile(const xmlChar* filename) {
- 	int res;
- 
- 	res = xsltCheckRead(sec, NULL, filename);
--	if (res == 0) {
--	    xsltTransformError(NULL, NULL, NULL,
--		 "xsltParseStylesheetFile: read rights for %s denied\n",
--			     filename);
-+	if (res <= 0) {
-+            if (res == 0)
-+                xsltTransformError(NULL, NULL, NULL,
-+                     "xsltParseStylesheetFile: read rights for %s denied\n",
-+                                 filename);
- 	    return(NULL);
- 	}
-     }
--- 
-2.11.0
-
diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
index 0326585959..25aa30839e 100644
--- a/package/libxslt/libxslt.hash
+++ b/package/libxslt/libxslt.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	8e36605144409df979cab43d835002f63988f3dc94d5d3537c12796db90e38c8	libxslt-1.1.33.tar.gz
+sha256	98b1bd46d6792925ad2dfe9a87452ea2adebf69dcb9919ffd55bf926a7f93f7f	libxslt-1.1.34.tar.gz
 
 # Hash for license file:
 sha256	7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819	COPYING
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index d2cef1cb04..2f37f303ac 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXSLT_VERSION = 1.1.33
+LIBXSLT_VERSION = 1.1.34
 LIBXSLT_SITE = http://xmlsoft.org/sources
 LIBXSLT_INSTALL_STAGING = YES
 LIBXSLT_LICENSE = MIT
