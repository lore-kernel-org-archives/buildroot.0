From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 12:20:01 +0100
Subject: [Buildroot] [git commit] flac: drop CVE patches
Message-ID: <20141201112125.1A75F7FFF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c8fbd1f82a93089b24361ee4830507b165af0f8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These are alredy included in 1.3.1, and should have been dropped when I
merged next.

Reported-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flac/0002-fix-CVE-2014-9028.patch |   34 ------------------------
 package/flac/0003-fix-CVE-2014-8962.patch |   40 -----------------------------
 2 files changed, 0 insertions(+), 74 deletions(-)

diff --git a/package/flac/0002-fix-CVE-2014-9028.patch b/package/flac/0002-fix-CVE-2014-9028.patch
deleted file mode 100644
index 5a25ecf..0000000
--- a/package/flac/0002-fix-CVE-2014-9028.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From fcf0ba06ae12ccd7c67cee3c8d948df15f946b85 Mon Sep 17 00:00:00 2001
-From: Erik de Castro Lopo <erikd@mega-nerd.com>
-Date: Wed, 19 Nov 2014 19:35:59 -0800
-Subject: [PATCH] src/libFACL/stream_decoder.c : Fail safely to avoid a heap overflow.
-
-A file provided by the reporters caused the stream decoder to write to
-un-allocated heap space resulting in a segfault. The solution is to
-error out (by returning false from read_residual_partitioned_rice_())
-instead of trying to continue to decode.
-
-Fixes: CVE-2014-9028
-Reported-by: Michele Spagnuolo,
-             Google Security Team <mikispag@google.com>
----
- src/libFLAC/stream_decoder.c |    3 ++-
- 1 files changed, 2 insertions(+), 1 deletions(-)
-
-diff --git a/src/libFLAC/stream_decoder.c b/src/libFLAC/stream_decoder.c
-index 88a656d..54e84d4 100644
---- a/src/libFLAC/stream_decoder.c
-+++ b/src/libFLAC/stream_decoder.c
-@@ -2736,7 +2736,8 @@ FLAC__bool read_residual_partitioned_rice_(FLAC__StreamDecoder *decoder, unsigne
- 		if(decoder->private_->frame.header.blocksize < predictor_order) {
- 			send_error_to_client_(decoder, FLAC__STREAM_DECODER_ERROR_STATUS_LOST_SYNC);
- 			decoder->protected_->state = FLAC__STREAM_DECODER_SEARCH_FOR_FRAME_SYNC;
--			return true;
-+			/* We have received a potentially malicious bt stream. All we can do is error out to avoid a heap overflow. */
-+			return false;
- 		}
- 	}
- 	else {
--- 
-1.7.2.5
-
diff --git a/package/flac/0003-fix-CVE-2014-8962.patch b/package/flac/0003-fix-CVE-2014-8962.patch
deleted file mode 100644
index 563100e..0000000
--- a/package/flac/0003-fix-CVE-2014-8962.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5b3033a2b355068c11fe637e14ac742d273f076e Mon Sep 17 00:00:00 2001
-From: Erik de Castro Lopo <erikd@mega-nerd.com>
-Date: Tue, 18 Nov 2014 07:20:25 -0800
-Subject: [PATCH] src/libFLAC/stream_decoder.c : Fix buffer read overflow.
-
-This is CVE-2014-8962.
-
-Reported-by: Michele Spagnuolo,
-             Google Security Team <mikispag@google.com>
----
- src/libFLAC/stream_decoder.c |    6 +++++-
- 1 files changed, 5 insertions(+), 1 deletions(-)
-
-diff --git a/src/libFLAC/stream_decoder.c b/src/libFLAC/stream_decoder.c
-index cb66fe2..88a656d 100644
---- a/src/libFLAC/stream_decoder.c
-+++ b/src/libFLAC/stream_decoder.c
-@@ -71,7 +71,7 @@ FLAC_API int FLAC_API_SUPPORTS_OGG_FLAC =
-  *
-  ***********************************************************************/
- 
--static FLAC__byte ID3V2_TAG_[3] = { 'I', 'D', '3' };
-+static const FLAC__byte ID3V2_TAG_[3] = { 'I', 'D', '3' };
- 
- /***********************************************************************
-  *
-@@ -1361,6 +1361,10 @@ FLAC__bool find_metadata_(FLAC__StreamDecoder *decoder)
- 			id = 0;
- 			continue;
- 		}
-+
-+		if(id >= 3)
-+			return false;
-+
- 		if(x == ID3V2_TAG_[id]) {
- 			id++;
- 			i = 0;
--- 
-1.7.2.5
-
