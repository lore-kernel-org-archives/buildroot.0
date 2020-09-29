From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 16:19:42 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libxml2: fix
 CVE-2020-24977
Message-ID: <20200929140956.44BEF81983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8272016dfae941cd0b7817dcc5ee4ce86c23869
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

GNOME project libxml2 v2.9.10 and earlier have a global Buffer Overflow
vulnerability in xmlEncodeEntitiesInternal at libxml2/entities.c.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a530ca6bd9039ae3d021e32e12ea5f3b3e23ff11)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-out-of-bounds-read-with-xmllint--htmlout.patch | 40 ++++++++++++++++++++++
 package/libxml2/libxml2.mk                         |  2 ++
 2 files changed, 42 insertions(+)

diff --git a/package/libxml2/0003-Fix-out-of-bounds-read-with-xmllint--htmlout.patch b/package/libxml2/0003-Fix-out-of-bounds-read-with-xmllint--htmlout.patch
new file mode 100644
index 0000000000..460f2a3ae6
--- /dev/null
+++ b/package/libxml2/0003-Fix-out-of-bounds-read-with-xmllint--htmlout.patch
@@ -0,0 +1,40 @@
+From 50f06b3efb638efb0abd95dc62dca05ae67882c2 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Fri, 7 Aug 2020 21:54:27 +0200
+Subject: [PATCH] Fix out-of-bounds read with 'xmllint --htmlout'
+
+Make sure that truncated UTF-8 sequences don't cause an out-of-bounds
+array access.
+
+Thanks to @SuhwanSong and the Agency for Defense Development (ADD) for
+the report.
+
+Fixes #178.
+
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/libxml2/-/commit/50f06b3efb638efb0abd95dc62dca05ae67882c2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ xmllint.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/xmllint.c b/xmllint.c
+index f6a8e4636..c647486f3 100644
+--- a/xmllint.c
++++ b/xmllint.c
+@@ -528,6 +528,12 @@ static void
+ xmlHTMLEncodeSend(void) {
+     char *result;
+ 
++    /*
++     * xmlEncodeEntitiesReentrant assumes valid UTF-8, but the buffer might
++     * end with a truncated UTF-8 sequence. This is a hack to at least avoid
++     * an out-of-bounds read.
++     */
++    memset(&buffer[sizeof(buffer)-4], 0, 4);
+     result = (char *) xmlEncodeEntitiesReentrant(NULL, BAD_CAST buffer);
+     if (result) {
+ 	xmlGenericError(xmlGenericErrorContext, "%s", result);
+-- 
+GitLab
+
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index acbdfb7728..e9379b05ae 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -13,6 +13,8 @@ LIBXML2_LICENSE_FILES = COPYING
 LIBXML2_IGNORE_CVES += CVE-2020-7595
 # 0002-Fix-memory-leak-in-xmlSchemaValidateStream.patch
 LIBXML2_IGNORE_CVES += CVE-2019-20388
+# 0003-Fix-out-of-bounds-read-with-xmllint--htmlout.patch
+LIBXML2_IGNORE_CVES += CVE-2020-24977
 LIBXML2_CONFIG_SCRIPTS = xml2-config
 
 # relocation truncated to fit: R_68K_GOT16O
