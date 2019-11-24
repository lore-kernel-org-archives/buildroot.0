From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Nov 2019 22:23:09 +0100
Subject: [Buildroot] [PATCH] package/jpeg-turbo: security bump to version
 2.0.3
Message-ID: <20191124212309.31678-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security vulnerabilities:

- CVE-2019-2201: In generate_jsimd_ycc_rgb_convert_neon of
  jsimd_arm64_neon.S, there is a possible out of bounds write due to a
  missing bounds check.  This could lead to remote code execution in an
  unprivileged process with no additional execution privileges needed.

For more details, see the upstream bugtracker:
https://github.com/libjpeg-turbo/libjpeg-turbo/issues/361

Additionally, it fixes a number of other issues.  From the release notes:

- Fixed a regression in the SIMD feature detection code, introduced by the
  AVX2 SIMD extensions (2.0 beta1[1]), that was known to cause an illegal
  instruction exception, in rare cases, on CPUs that lack support for CPUID
  leaf 07H (or on which the maximum CPUID leaf has been limited by way of a
  BIOS setting.)

- The 4:4:0 (h1v2) fancy (smooth) chroma upsampling algorithm in the
  decompressor now uses a similar bias pattern to that of the 4:2:2 (h2v1)
  fancy chroma upsampling algorithm, rounding up or down the upsampled
  result for alternate pixels rather than always rounding down.  This
  ensures that, regardless of whether a 4:2:2 JPEG image is rotated or
  transposed prior to decompression (in the frequency domain) or after
  decompression (in the spatial domain), the final image will be similar.

- Fixed a regression introduced by 2.0 beta1[15] whereby attempting to
  generate a progressive JPEG image on an SSE2-capable CPU using a scan
  script containing one or more scans with lengths divisible by 16 would
  result in an error ("Missing Huffman code table entry") and an invalid
  JPEG image.

- Fixed an issue whereby tjDecodeYUV() and tjDecodeYUVPlanes() would throw
  an error ("Invalid progressive parameters") or a warning ("Inconsistent
  progression sequence") if passed a TurboJPEG instance that was previously
  used to decompress a progressive JPEG image.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg-turbo/jpeg-turbo.hash | 8 ++++----
 package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index 56b3478ab6..ea6060f2b9 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/2.0.2/
-sha1 1cff52d50b81755d0bdcf9055eb22157f39a1695  libjpeg-turbo-2.0.2.tar.gz
-md5 79f76fbfb0c6109631332762d10e16d2  libjpeg-turbo-2.0.2.tar.gz
+# From https://sourceforge.net/projects/libjpeg-turbo/files/2.0.3/
+sha1 539363a444f92421c098a1a3e7cebfda48d4cfb3  libjpeg-turbo-2.0.3.tar.gz
+md5  bd07fddf26f9def7bab02739eb655116 libjpeg-turbo-2.0.3.tar.gz
 # Locally computed
-sha256 acb8599fe5399af114287ee5907aea4456f8f2c1cc96d26c28aebfdf5ee82fed  libjpeg-turbo-2.0.2.tar.gz
+sha256 4246de500544d4ee408ee57048aa4aadc6f165fc17f141da87669f20ed3241b7  libjpeg-turbo-2.0.3.tar.gz
 sha256 69e570a251515ced17d4492256d57c89db77ed949652f88a44c80c1ca9607920  LICENSE.md
 sha256 82fece2bff2669c476495f0fe70096b154e8bc5b40916a64e99836d9a01c3110  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 3735132b2e..0c75cf1db5 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 2.0.2
+JPEG_TURBO_VERSION = 2.0.3
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
-- 
2.20.1
