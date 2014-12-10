From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 10 Dec 2014 20:57:23 +0200
Subject: [Buildroot] [PATCH] jasper: add a patch fixing CVE-2014-9029
Message-ID: <a441c888e8a3be335e70d5b307eda34afe16012c.1418237843.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See http://www.ocert.org/advisories/ocert-2014-009.html for the details.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/jasper/0001-fix-CVE-2014-9029.patch | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/jasper/0001-fix-CVE-2014-9029.patch

diff --git a/package/jasper/0001-fix-CVE-2014-9029.patch b/package/jasper/0001-fix-CVE-2014-9029.patch
new file mode 100644
index 000000000000..c2e95a8d1446
--- /dev/null
+++ b/package/jasper/0001-fix-CVE-2014-9029.patch
@@ -0,0 +1,36 @@
+Fix CVE-2014-9029
+
+Patch taken from https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-9029
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+--- jasper-1.900.1.orig/src/libjasper/jpc/jpc_dec.c	2014-11-27 12:45:44.000000000 +0100
++++ jasper-1.900.1.orig/src/libjasper/jpc/jpc_dec.c	2014-11-27 12:44:58.000000000 +0100
+@@ -1281,7 +1281,7 @@ static int jpc_dec_process_coc(jpc_dec_t
+ 	jpc_coc_t *coc = &ms->parms.coc;
+ 	jpc_dec_tile_t *tile;
+ 
+-	if (JAS_CAST(int, coc->compno) > dec->numcomps) {
++	if (JAS_CAST(int, coc->compno) >= dec->numcomps) {
+ 		jas_eprintf("invalid component number in COC marker segment\n");
+ 		return -1;
+ 	}
+@@ -1307,7 +1307,7 @@ static int jpc_dec_process_rgn(jpc_dec_t
+ 	jpc_rgn_t *rgn = &ms->parms.rgn;
+ 	jpc_dec_tile_t *tile;
+ 
+-	if (JAS_CAST(int, rgn->compno) > dec->numcomps) {
++	if (JAS_CAST(int, rgn->compno) >= dec->numcomps) {
+ 		jas_eprintf("invalid component number in RGN marker segment\n");
+ 		return -1;
+ 	}
+@@ -1356,7 +1356,7 @@ static int jpc_dec_process_qcc(jpc_dec_t
+ 	jpc_qcc_t *qcc = &ms->parms.qcc;
+ 	jpc_dec_tile_t *tile;
+ 
+-	if (JAS_CAST(int, qcc->compno) > dec->numcomps) {
++	if (JAS_CAST(int, qcc->compno) >= dec->numcomps) {
+ 		jas_eprintf("invalid component number in QCC marker segment\n");
+ 		return -1;
+ 	}
-- 
2.1.3
