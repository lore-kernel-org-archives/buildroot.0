From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:57:51 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libxslt: add
 upstream security fix for CVE-2019-11068
Message-ID: <20190426130223.B101C80163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d3c671ef8faa767ed6550a4666bb25837c0713b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issue:

- CVE-2019-11068: libxslt through 1.1.33 allows bypass of a protection
  mechanism because callers of xsltCheckRead and xsltCheckWrite permit
  access even upon receiving a -1 error code.  xsltCheckRead can return -1
  for a crafted URL that is not actually invalid and is subsequently loaded.

Upstream bugtracker issue not yet public:
https://gitlab.gnome.org/GNOME/libxslt/issues/12

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 73edd3c21c8cd8610ade16f449e7af8fd60b8aa9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-security-framework-bypass.patch       | 122 +++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/package/libxslt/0001-Fix-security-framework-bypass.patch b/package/libxslt/0001-Fix-security-framework-bypass.patch
new file mode 100644
index 0000000000..16700362b3
--- /dev/null
+++ b/package/libxslt/0001-Fix-security-framework-bypass.patch
@@ -0,0 +1,122 @@
+From e03553605b45c88f0b4b2980adfbbb8f6fca2fd6 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sun, 24 Mar 2019 09:51:39 +0100
+Subject: [PATCH] Fix security framework bypass
+
+xsltCheckRead and xsltCheckWrite return -1 in case of error but callers
+don't check for this condition and allow access. With a specially
+crafted URL, xsltCheckRead could be tricked into returning an error
+because of a supposedly invalid URL that would still be loaded
+succesfully later on.
+
+Fixes #12.
+
+Thanks to Felix Wilhelm for the report.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ libxslt/documents.c | 18 ++++++++++--------
+ libxslt/imports.c   |  9 +++++----
+ libxslt/transform.c |  9 +++++----
+ libxslt/xslt.c      |  9 +++++----
+ 4 files changed, 25 insertions(+), 20 deletions(-)
+
+diff --git a/libxslt/documents.c b/libxslt/documents.c
+index 3f3a7312..4aad11bb 100644
+--- a/libxslt/documents.c
++++ b/libxslt/documents.c
+@@ -296,10 +296,11 @@ xsltLoadDocument(xsltTransformContextPtr ctxt, const xmlChar *URI) {
+ 	int res;
+ 
+ 	res = xsltCheckRead(ctxt->sec, ctxt, URI);
+-	if (res == 0) {
+-	    xsltTransformError(ctxt, NULL, NULL,
+-		 "xsltLoadDocument: read rights for %s denied\n",
+-			     URI);
++	if (res <= 0) {
++            if (res == 0)
++                xsltTransformError(ctxt, NULL, NULL,
++                     "xsltLoadDocument: read rights for %s denied\n",
++                                 URI);
+ 	    return(NULL);
+ 	}
+     }
+@@ -372,10 +373,11 @@ xsltLoadStyleDocument(xsltStylesheetPtr style, const xmlChar *URI) {
+ 	int res;
+ 
+ 	res = xsltCheckRead(sec, NULL, URI);
+-	if (res == 0) {
+-	    xsltTransformError(NULL, NULL, NULL,
+-		 "xsltLoadStyleDocument: read rights for %s denied\n",
+-			     URI);
++	if (res <= 0) {
++            if (res == 0)
++                xsltTransformError(NULL, NULL, NULL,
++                     "xsltLoadStyleDocument: read rights for %s denied\n",
++                                 URI);
+ 	    return(NULL);
+ 	}
+     }
+diff --git a/libxslt/imports.c b/libxslt/imports.c
+index 874870cc..3783b247 100644
+--- a/libxslt/imports.c
++++ b/libxslt/imports.c
+@@ -130,10 +130,11 @@ xsltParseStylesheetImport(xsltStylesheetPtr style, xmlNodePtr cur) {
+ 	int secres;
+ 
+ 	secres = xsltCheckRead(sec, NULL, URI);
+-	if (secres == 0) {
+-	    xsltTransformError(NULL, NULL, NULL,
+-		 "xsl:import: read rights for %s denied\n",
+-			     URI);
++	if (secres <= 0) {
++            if (secres == 0)
++                xsltTransformError(NULL, NULL, NULL,
++                     "xsl:import: read rights for %s denied\n",
++                                 URI);
+ 	    goto error;
+ 	}
+     }
+diff --git a/libxslt/transform.c b/libxslt/transform.c
+index 13793914..0636dbd0 100644
+--- a/libxslt/transform.c
++++ b/libxslt/transform.c
+@@ -3493,10 +3493,11 @@ xsltDocumentElem(xsltTransformContextPtr ctxt, xmlNodePtr node,
+      */
+     if (ctxt->sec != NULL) {
+ 	ret = xsltCheckWrite(ctxt->sec, ctxt, filename);
+-	if (ret == 0) {
+-	    xsltTransformError(ctxt, NULL, inst,
+-		 "xsltDocumentElem: write rights for %s denied\n",
+-			     filename);
++	if (ret <= 0) {
++            if (ret == 0)
++                xsltTransformError(ctxt, NULL, inst,
++                     "xsltDocumentElem: write rights for %s denied\n",
++                                 filename);
+ 	    xmlFree(URL);
+ 	    xmlFree(filename);
+ 	    return;
+diff --git a/libxslt/xslt.c b/libxslt/xslt.c
+index 780a5ad7..a234eb79 100644
+--- a/libxslt/xslt.c
++++ b/libxslt/xslt.c
+@@ -6763,10 +6763,11 @@ xsltParseStylesheetFile(const xmlChar* filename) {
+ 	int res;
+ 
+ 	res = xsltCheckRead(sec, NULL, filename);
+-	if (res == 0) {
+-	    xsltTransformError(NULL, NULL, NULL,
+-		 "xsltParseStylesheetFile: read rights for %s denied\n",
+-			     filename);
++	if (res <= 0) {
++            if (res == 0)
++                xsltTransformError(NULL, NULL, NULL,
++                     "xsltParseStylesheetFile: read rights for %s denied\n",
++                                 filename);
+ 	    return(NULL);
+ 	}
+     }
+-- 
+2.11.0
+
