From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 23:58:22 +0100
Subject: [Buildroot] [PATCH 2/2] jasper: add upstream security fix
In-Reply-To: <20170314225822.30891-1-peter@korsgaard.com>
References: <20170314225822.30891-1-peter@korsgaard.com>
Message-ID: <20170314225822.30891-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a NULL Pointer Dereference jp2_encode:

https://github.com/mdadams/jasper/issues/120

No CVE assigned yet.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ck-in-the-JP2-encoder-to-ensure-that-the-.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/jasper/0003-Added-a-check-in-the-JP2-encoder-to-ensure-that-the-.patch

diff --git a/package/jasper/0003-Added-a-check-in-the-JP2-encoder-to-ensure-that-the-.patch b/package/jasper/0003-Added-a-check-in-the-JP2-encoder-to-ensure-that-the-.patch
new file mode 100644
index 000000000..16a3e75bf
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
-- 
2.11.0
