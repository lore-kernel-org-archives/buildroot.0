From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Nov 2014 09:58:06 -0300
Subject: [Buildroot] [PATCH] flac: add security patches
Message-ID: <1416920286-16063-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-9028 - Heap buffer write overflow
CVE-2014-8962 - Heap buffer read overflow

Patches are upstream part of the upcoming 1.3.1 release.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ec-logic.patch => 0001-fix-altivec-logic.patch} |  0
 package/flac/0002-fix-CVE-2014-9028.patch          | 34 ++++++++++++++++++
 package/flac/0003-fix-CVE-2014-8962.patch          | 40 ++++++++++++++++++++++
 3 files changed, 74 insertions(+)
 rename package/flac/{flac-01-fix-altivec-logic.patch => 0001-fix-altivec-logic.patch} (100%)
 create mode 100644 package/flac/0002-fix-CVE-2014-9028.patch
 create mode 100644 package/flac/0003-fix-CVE-2014-8962.patch

diff --git a/package/flac/flac-01-fix-altivec-logic.patch b/package/flac/0001-fix-altivec-logic.patch
similarity index 100%
rename from package/flac/flac-01-fix-altivec-logic.patch
rename to package/flac/0001-fix-altivec-logic.patch
diff --git a/package/flac/0002-fix-CVE-2014-9028.patch b/package/flac/0002-fix-CVE-2014-9028.patch
new file mode 100644
index 0000000..5a25ecf
--- /dev/null
+++ b/package/flac/0002-fix-CVE-2014-9028.patch
@@ -0,0 +1,34 @@
+From fcf0ba06ae12ccd7c67cee3c8d948df15f946b85 Mon Sep 17 00:00:00 2001
+From: Erik de Castro Lopo <erikd@mega-nerd.com>
+Date: Wed, 19 Nov 2014 19:35:59 -0800
+Subject: [PATCH] src/libFACL/stream_decoder.c : Fail safely to avoid a heap overflow.
+
+A file provided by the reporters caused the stream decoder to write to
+un-allocated heap space resulting in a segfault. The solution is to
+error out (by returning false from read_residual_partitioned_rice_())
+instead of trying to continue to decode.
+
+Fixes: CVE-2014-9028
+Reported-by: Michele Spagnuolo,
+             Google Security Team <mikispag@google.com>
+---
+ src/libFLAC/stream_decoder.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/src/libFLAC/stream_decoder.c b/src/libFLAC/stream_decoder.c
+index 88a656d..54e84d4 100644
+--- a/src/libFLAC/stream_decoder.c
++++ b/src/libFLAC/stream_decoder.c
+@@ -2736,7 +2736,8 @@ FLAC__bool read_residual_partitioned_rice_(FLAC__StreamDecoder *decoder, unsigne
+ 		if(decoder->private_->frame.header.blocksize < predictor_order) {
+ 			send_error_to_client_(decoder, FLAC__STREAM_DECODER_ERROR_STATUS_LOST_SYNC);
+ 			decoder->protected_->state = FLAC__STREAM_DECODER_SEARCH_FOR_FRAME_SYNC;
+-			return true;
++			/* We have received a potentially malicious bt stream. All we can do is error out to avoid a heap overflow. */
++			return false;
+ 		}
+ 	}
+ 	else {
+-- 
+1.7.2.5
+
diff --git a/package/flac/0003-fix-CVE-2014-8962.patch b/package/flac/0003-fix-CVE-2014-8962.patch
new file mode 100644
index 0000000..563100e
--- /dev/null
+++ b/package/flac/0003-fix-CVE-2014-8962.patch
@@ -0,0 +1,40 @@
+From 5b3033a2b355068c11fe637e14ac742d273f076e Mon Sep 17 00:00:00 2001
+From: Erik de Castro Lopo <erikd@mega-nerd.com>
+Date: Tue, 18 Nov 2014 07:20:25 -0800
+Subject: [PATCH] src/libFLAC/stream_decoder.c : Fix buffer read overflow.
+
+This is CVE-2014-8962.
+
+Reported-by: Michele Spagnuolo,
+             Google Security Team <mikispag@google.com>
+---
+ src/libFLAC/stream_decoder.c |    6 +++++-
+ 1 files changed, 5 insertions(+), 1 deletions(-)
+
+diff --git a/src/libFLAC/stream_decoder.c b/src/libFLAC/stream_decoder.c
+index cb66fe2..88a656d 100644
+--- a/src/libFLAC/stream_decoder.c
++++ b/src/libFLAC/stream_decoder.c
+@@ -71,7 +71,7 @@ FLAC_API int FLAC_API_SUPPORTS_OGG_FLAC =
+  *
+  ***********************************************************************/
+ 
+-static FLAC__byte ID3V2_TAG_[3] = { 'I', 'D', '3' };
++static const FLAC__byte ID3V2_TAG_[3] = { 'I', 'D', '3' };
+ 
+ /***********************************************************************
+  *
+@@ -1361,6 +1361,10 @@ FLAC__bool find_metadata_(FLAC__StreamDecoder *decoder)
+ 			id = 0;
+ 			continue;
+ 		}
++
++		if(id >= 3)
++			return false;
++
+ 		if(x == ID3V2_TAG_[id]) {
+ 			id++;
+ 			i = 0;
+-- 
+1.7.2.5
+
-- 
2.0.4
