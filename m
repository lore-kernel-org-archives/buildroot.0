From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Mar 2016 08:48:43 +0100
Subject: [Buildroot] [git commit] expat: bump to version 2.1.1
Message-ID: <20160314075251.6ADA5817D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63b9681d64fc00414b3bf28306d4059239daf7db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop 0001-fix-CVE-2015-1283.patch since it's upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/0001-fix-CVE-2015-1283.patch | 76 ------------------------------
 package/expat/expat.hash                   |  7 ++-
 package/expat/expat.mk                     |  3 +-
 3 files changed, 7 insertions(+), 79 deletions(-)

diff --git a/package/expat/0001-fix-CVE-2015-1283.patch b/package/expat/0001-fix-CVE-2015-1283.patch
deleted file mode 100644
index cdebaa0..0000000
--- a/package/expat/0001-fix-CVE-2015-1283.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff --git a/lib/xmlparse.c b/lib/xmlparse.c
---- a/lib/xmlparse.c
-+++ b/lib/xmlparse.c
-@@ -1648,29 +1648,40 @@ XML_ParseBuffer(XML_Parser parser, int l
-   XmlUpdatePosition(encoding, positionPtr, bufferPtr, &position);
-   positionPtr = bufferPtr;
-   return result;
- }
- 
- void * XMLCALL
- XML_GetBuffer(XML_Parser parser, int len)
- {
-+/* BEGIN MOZILLA CHANGE (sanity check len) */
-+  if (len < 0) {
-+    errorCode = XML_ERROR_NO_MEMORY;
-+    return NULL;
-+  }
-+/* END MOZILLA CHANGE */
-   switch (ps_parsing) {
-   case XML_SUSPENDED:
-     errorCode = XML_ERROR_SUSPENDED;
-     return NULL;
-   case XML_FINISHED:
-     errorCode = XML_ERROR_FINISHED;
-     return NULL;
-   default: ;
-   }
- 
-   if (len > bufferLim - bufferEnd) {
--    /* FIXME avoid integer overflow */
-     int neededSize = len + (int)(bufferEnd - bufferPtr);
-+/* BEGIN MOZILLA CHANGE (sanity check neededSize) */
-+    if (neededSize < 0) {
-+      errorCode = XML_ERROR_NO_MEMORY;
-+      return NULL;
-+    }
-+/* END MOZILLA CHANGE */
- #ifdef XML_CONTEXT_BYTES
-     int keep = (int)(bufferPtr - buffer);
- 
-     if (keep > XML_CONTEXT_BYTES)
-       keep = XML_CONTEXT_BYTES;
-     neededSize += keep;
- #endif  /* defined XML_CONTEXT_BYTES */
-     if (neededSize  <= bufferLim - buffer) {
-@@ -1689,17 +1700,25 @@ XML_GetBuffer(XML_Parser parser, int len
-     }
-     else {
-       char *newBuf;
-       int bufferSize = (int)(bufferLim - bufferPtr);
-       if (bufferSize == 0)
-         bufferSize = INIT_BUFFER_SIZE;
-       do {
-         bufferSize *= 2;
--      } while (bufferSize < neededSize);
-+/* BEGIN MOZILLA CHANGE (prevent infinite loop on overflow) */
-+      } while (bufferSize < neededSize && bufferSize > 0);
-+/* END MOZILLA CHANGE */
-+/* BEGIN MOZILLA CHANGE (sanity check bufferSize) */
-+      if (bufferSize <= 0) {
-+        errorCode = XML_ERROR_NO_MEMORY;
-+        return NULL;
-+      }
-+/* END MOZILLA CHANGE */
-       newBuf = (char *)MALLOC(bufferSize);
-       if (newBuf == 0) {
-         errorCode = XML_ERROR_NO_MEMORY;
-         return NULL;
-       }
-       bufferLim = newBuf + bufferSize;
- #ifdef XML_CONTEXT_BYTES
-       if (bufferPtr) {
-
diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 30595cd..cfb3a6c 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,2 +1,5 @@
-# Locally computed:
-sha256  823705472f816df21c8f6aa026dd162b280806838bb55b3432b0fb1fcca7eb86  expat-2.1.0.tar.gz
+# From https://sourceforge.net/projects/expat/files/expat/2.1.1/
+md5	7380a64a8e3a9d66a9887b01d0d7ea81	expat-2.1.1.tar.bz2
+sha1	ff91419882ac52151050dad0ee8190645fbeee08	expat-2.1.1.tar.bz2
+# Calculated based on the hashes above
+sha256	aff584e5a2f759dcfc6d48671e9529f6afe1e30b0cd6a4cec200cbe3f793de67	expat-2.1.1.tar.bz2
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index cbbba8f..f00cbdc 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.1.0
+EXPAT_VERSION = 2.1.1
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
+EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.bz2
 EXPAT_INSTALL_STAGING = YES
 EXPAT_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) installlib
 EXPAT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) installlib
