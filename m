From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Mar 2017 13:37:47 +0100
Subject: [Buildroot] [git commit] jasper: add upstream security fix
Message-ID: <20170315123843.E44F9817D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76da579431a78875afeaeda76e459aca69e85d36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a NULL Pointer Dereference jp2_encode:

https://github.com/mdadams/jasper/issues/120

No CVE assigned yet.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ck-in-the-JP2-encoder-to-ensure-that-the-.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/jasper/0003-Added-a-check-in-the-JP2-encoder-to-ensure-that-the-.patch b/package/jasper/0003-Added-a-check-in-the-JP2-encoder-to-ensure-that-the-.patch
new file mode 100644
index 0000000..16a3e75
--- /dev/null
+++ b/package/jasper/0003-Added-a-check-in-the-JP2-encoder-to-ensure-that-the-.patch
@@ -0,0 +1,30 @@
+From 58ba0365d911b9f9dd68e9abf826682c0b4f2293 Mon Sep 17 00:00:00 2001
+From: Michael Adams <mdadams@ece.uvic.ca>
+Date: Mon, 6 Mar 2017 08:06:54 -0800
+Subject: [PATCH] Added a check in the JP2 encoder to ensure that the image to
+ be coded has at least one component.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/libjasper/jp2/jp2_enc.c | 5 +++++
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/src/libjasper/jp2/jp2_enc.c b/src/libjasper/jp2/jp2_enc.c
+index 9a5e106..af4d9a4 100644
+--- a/src/libjasper/jp2/jp2_enc.c
++++ b/src/libjasper/jp2/jp2_enc.c
+@@ -115,6 +115,11 @@ int jp2_encode(jas_image_t *image, jas_stream_t *out, const char *optstr)
+ 	iccstream = 0;
+ 	iccprof = 0;
+ 
++	if (jas_image_numcmpts(image) < 1) {
++		jas_eprintf("image must have@least one component\n");
++		goto error;
++	}
++
+ 	allcmptssame = 1;
+ 	sgnd = jas_image_cmptsgnd(image, 0);
+ 	prec = jas_image_cmptprec(image, 0);
+-- 
+2.11.0
+
