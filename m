From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Nov 2014 22:47:37 +0100
Subject: [Buildroot] [PATCH next 1/1] package/flac: bump version to 1.3.1
Message-ID: <1417297657-23448-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All patches were applied upstream:
http://xiph.org/flac/changelog.html

Added hash

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/flac/0001-fix-altivec-logic.patch |   32 -----------------------
 package/flac/0002-fix-CVE-2014-9028.patch |   34 ------------------------
 package/flac/0003-fix-CVE-2014-8962.patch |   40 -----------------------------
 package/flac/flac.hash                    |    2 ++
 package/flac/flac.mk                      |    2 +-
 5 files changed, 3 insertions(+), 107 deletions(-)
 delete mode 100644 package/flac/0001-fix-altivec-logic.patch
 delete mode 100644 package/flac/0002-fix-CVE-2014-9028.patch
 delete mode 100644 package/flac/0003-fix-CVE-2014-8962.patch
 create mode 100644 package/flac/flac.hash

diff --git a/package/flac/0001-fix-altivec-logic.patch b/package/flac/0001-fix-altivec-logic.patch
deleted file mode 100644
index a1ac8a1..0000000
--- a/package/flac/0001-fix-altivec-logic.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d65ede3e874c79348efc85cf3a185c170046c4c8 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 4 Dec 2013 13:31:28 -0300
-Subject: [PATCH] Fix Makefile.am altivec logic
-
-Besides SPE (FSL e500v? cores) there are other powerpc processors
-that don't support altivec instructions so only enable them when it's
-100% sure that the target has it.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Erik de Castro Lopo <erikd@mega-nerd.com>
----
- src/libFLAC/Makefile.am | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/libFLAC/Makefile.am b/src/libFLAC/Makefile.am
-index 247e33c..258de40 100644
---- a/src/libFLAC/Makefile.am
-+++ b/src/libFLAC/Makefile.am
-@@ -47,8 +47,7 @@ CPUCFLAGS = -faltivec -force_cpusubtype_ALL -DFLAC__NO_ASM
- else
- # Linux-gcc for PPC does not have -force_cpusubtype_ALL, it is Darwin-specific
- CPUCFLAGS =
--if FLaC__CPU_PPC_SPE
--else
-+if FLaC__USE_ALTIVEC
- CPUCFLAGS += -maltivec -mabi=altivec
- endif
- #@@@ PPC optimizations temporarily disabled
--- 
-1.8.3.2
-
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
diff --git a/package/flac/flac.hash b/package/flac/flac.hash
new file mode 100644
index 0000000..b5389fc
--- /dev/null
+++ b/package/flac/flac.hash
@@ -0,0 +1,2 @@
+# http://downloads.xiph.org/releases/flac/SHA256SUMS.txt
+sha256	4773c0099dba767d963fd92143263be338c48702172e8754b9bc5103efe1c56c	flac-1.3.1.tar.xz
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index daedd47..2f8c9c3 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLAC_VERSION = 1.3.0
+FLAC_VERSION = 1.3.1
 FLAC_SITE = http://downloads.xiph.org/releases/flac
 FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
 FLAC_INSTALL_STAGING = YES
-- 
1.7.10.4
