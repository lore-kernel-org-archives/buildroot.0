From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Dec 2014 21:41:17 +0100
Subject: [Buildroot] [git commit] jasper: add patches to fix CVE-2014-8137
	and CVE-2014-8138
Message-ID: <20141219210206.62A9E7FD99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6e4e9de41c52cafbb7fe708333731ca0ddecaa4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2014-8137 - double-free in jas_iccattrval_destroy()
CVE-2014-8138 - heap overflow in jp2_decode()

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jasper/0002-fix-CVE-2014-8138.patch   |   18 +++++++++
 package/jasper/0003-fix-CVE-2014-8137-1.patch |   47 +++++++++++++++++++++++++
 package/jasper/0004-fix-CVE-2014-8137-2.patch |   18 +++++++++
 3 files changed, 83 insertions(+), 0 deletions(-)

diff --git a/package/jasper/0002-fix-CVE-2014-8138.patch b/package/jasper/0002-fix-CVE-2014-8138.patch
new file mode 100644
index 0000000..e107123
--- /dev/null
+++ b/package/jasper/0002-fix-CVE-2014-8138.patch
@@ -0,0 +1,18 @@
+See https://bugzilla.redhat.com/show_bug.cgi?id=1173162
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- jasper-1.900.1.orig/src/libjasper/jp2/jp2_dec.c	2014-12-11 14:06:44.000000000 +0100
++++ jasper-1.900.1/src/libjasper/jp2/jp2_dec.c	2014-12-11 14:06:26.000000000 +0100
+@@ -386,6 +386,11 @@ jas_image_t *jp2_decode(jas_stream_t *in
+ 	/* Determine the type of each component. */
+ 	if (dec->cdef) {
+ 		for (i = 0; i < dec->numchans; ++i) {
++			/* Is the channel number reasonable? */
++			if (dec->cdef->data.cdef.ents[i].channo >= dec->numchans) {
++				jas_eprintf("error: invalid channel number in CDEF box\n");
++				goto error;
++			}
+ 			jas_image_setcmpttype(dec->image,
+ 			  dec->chantocmptlut[dec->cdef->data.cdef.ents[i].channo],
+ 			  jp2_getct(jas_image_clrspc(dec->image),
diff --git a/package/jasper/0003-fix-CVE-2014-8137-1.patch b/package/jasper/0003-fix-CVE-2014-8137-1.patch
new file mode 100644
index 0000000..0253c62
--- /dev/null
+++ b/package/jasper/0003-fix-CVE-2014-8137-1.patch
@@ -0,0 +1,47 @@
+See https://bugzilla.redhat.com/show_bug.cgi?id=1173157
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- jasper-1.900.1.orig/src/libjasper/base/jas_icc.c	2014-12-11 14:06:44.000000000 +0100
++++ jasper-1.900.1/src/libjasper/base/jas_icc.c	2014-12-11 15:16:37.971272386 +0100
+@@ -1009,7 +1009,6 @@ static int jas_icccurv_input(jas_iccattr
+ 	return 0;
+ 
+ error:
+-	jas_icccurv_destroy(attrval);
+ 	return -1;
+ }
+ 
+@@ -1127,7 +1126,6 @@ static int jas_icctxtdesc_input(jas_icca
+ #endif
+ 	return 0;
+ error:
+-	jas_icctxtdesc_destroy(attrval);
+ 	return -1;
+ }
+ 
+@@ -1206,8 +1204,6 @@ static int jas_icctxt_input(jas_iccattrv
+ 		goto error;
+ 	return 0;
+ error:
+-	if (txt->string)
+-		jas_free(txt->string);
+ 	return -1;
+ }
+ 
+@@ -1328,7 +1324,6 @@ static int jas_icclut8_input(jas_iccattr
+ 		goto error;
+ 	return 0;
+ error:
+-	jas_icclut8_destroy(attrval);
+ 	return -1;
+ }
+ 
+@@ -1497,7 +1492,6 @@ static int jas_icclut16_input(jas_iccatt
+ 		goto error;
+ 	return 0;
+ error:
+-	jas_icclut16_destroy(attrval);
+ 	return -1;
+ }
+ 
diff --git a/package/jasper/0004-fix-CVE-2014-8137-2.patch b/package/jasper/0004-fix-CVE-2014-8137-2.patch
new file mode 100644
index 0000000..e052709
--- /dev/null
+++ b/package/jasper/0004-fix-CVE-2014-8137-2.patch
@@ -0,0 +1,18 @@
+See https://bugzilla.redhat.com/show_bug.cgi?id=1173157
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- jasper-1.900.1.orig/src/libjasper/jp2/jp2_dec.c	2014-12-11 14:30:54.193209780 +0100
++++ jasper-1.900.1/src/libjasper/jp2/jp2_dec.c	2014-12-11 14:36:46.313217814 +0100
+@@ -291,7 +291,10 @@ jas_image_t *jp2_decode(jas_stream_t *in
+ 	case JP2_COLR_ICC:
+ 		iccprof = jas_iccprof_createfrombuf(dec->colr->data.colr.iccp,
+ 		  dec->colr->data.colr.iccplen);
+-		assert(iccprof);
++		if (!iccprof) {
++			jas_eprintf("error: failed to parse ICC profile\n");
++			goto error;
++		}
+ 		jas_iccprof_gethdr(iccprof, &icchdr);
+ 		jas_eprintf("ICC Profile CS %08x\n", icchdr.colorspc);
+ 		jas_image_setclrspc(dec->image, fromiccpcs(icchdr.colorspc));
