From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 22 Dec 2019 23:37:20 +0100
Subject: [Buildroot] [PATCH 1/2] package/twolame: bump to version 0.4.0
Message-ID: <20191222223721.3982310-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version)
- Update hash of license file (trailing whitespace removed:
  https://github.com/njh/twolame/commit/2cdcd064aa340b30209d8a0e86cef5a22394b4d5)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-Fix-static-linking-with-libmagic.patch | 228 ------------------
 package/twolame/twolame.hash                  |   4 +-
 package/twolame/twolame.mk                    |   2 +-
 3 files changed, 3 insertions(+), 231 deletions(-)
 delete mode 100644 package/twolame/0001-Fix-static-linking-with-libmagic.patch

diff --git a/package/twolame/0001-Fix-static-linking-with-libmagic.patch b/package/twolame/0001-Fix-static-linking-with-libmagic.patch
deleted file mode 100644
index 094d7e997e..0000000000
--- a/package/twolame/0001-Fix-static-linking-with-libmagic.patch
+++ /dev/null
@@ -1,228 +0,0 @@
-From 484275de103b2214cb8ff3868a2562e2c61ce0e1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 8 Nov 2018 20:57:08 +0100
-Subject: [PATCH] Fix static linking with libmagic
-
-libmagic (from file package) already provides the buffer_init function
-so to avoid a build failure for applications wanting to statically link
-with twolame and libmagic (for example sox), rename buffer_init into
-bitbuffer_init (also rename buffer_deinit into bitbuffer_deinit and
-buffer_sstell into bitbuffer_sstell for consistency)
-
-Fixes:
- - http://autobuild.buildroot.org/results/b3fc62e7f372fe595966e84091c11ccdb4cfa77c
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/njh/twolame/pull/81]
----
- libtwolame/bitbuffer.c |  4 ++--
- libtwolame/bitbuffer.h |  6 +++---
- libtwolame/energy.c    |  2 +-
- libtwolame/twolame.c   | 32 ++++++++++++++++----------------
- 4 files changed, 22 insertions(+), 22 deletions(-)
-
-diff --git a/libtwolame/bitbuffer.c b/libtwolame/bitbuffer.c
-index 38a632b..5b2fc4b 100644
---- a/libtwolame/bitbuffer.c
-+++ b/libtwolame/bitbuffer.c
-@@ -33,7 +33,7 @@
- 
- 
- /*create bit buffer*/
--bit_stream *buffer_init(unsigned char *buffer, int buffer_size)
-+bit_stream *bitbuffer_init(unsigned char *buffer, int buffer_size)
- {
-     bit_stream *bs = (bit_stream *) TWOLAME_MALLOC(sizeof(bit_stream));
- 
-@@ -49,7 +49,7 @@ bit_stream *buffer_init(unsigned char *buffer, int buffer_size)
- }
- 
- /* Dellocate bit buffer */
--void buffer_deinit(bit_stream ** bs)
-+void bitbuffer_deinit(bit_stream ** bs)
- {
- 
-     if (bs == NULL || *bs == NULL)
-diff --git a/libtwolame/bitbuffer.h b/libtwolame/bitbuffer.h
-index 0201347..f377c8f 100644
---- a/libtwolame/bitbuffer.h
-+++ b/libtwolame/bitbuffer.h
-@@ -39,11 +39,11 @@ typedef struct bit_stream_struc {
- } bit_stream;
- 
- 
--bit_stream *buffer_init(unsigned char *buffer, int buffer_size);
--void buffer_deinit(bit_stream ** bs);
-+bit_stream *bitbuffer_init(unsigned char *buffer, int buffer_size);
-+void bitbuffer_deinit(bit_stream ** bs);
- 
- /*return the current bit stream length (in bits)*/
--#define buffer_sstell(bs) (bs->totbit)
-+#define bitbuffer_sstell(bs) (bs->totbit)
- 
- #endif
- 
-diff --git a/libtwolame/energy.c b/libtwolame/energy.c
-index 219bd2c..312d8ae 100644
---- a/libtwolame/energy.c
-+++ b/libtwolame/energy.c
-@@ -73,7 +73,7 @@ void do_energy_levels(twolame_options * glopts, bit_stream * bs)
-     unsigned char rhibyte, rlobyte, lhibyte, llobyte;
- 
-     // Get the position (in butes) of the end of the mpeg audio frame
--    int frameEnd = buffer_sstell(bs) / 8;
-+    int frameEnd = bitbuffer_sstell(bs) / 8;
- 
- 
-     // find the maximum in the left and right channels
-diff --git a/libtwolame/twolame.c b/libtwolame/twolame.c
-index fa4bcc0..d3b8450 100644
---- a/libtwolame/twolame.c
-+++ b/libtwolame/twolame.c
-@@ -442,7 +442,7 @@ static int encode_frame(twolame_options * glopts, bit_stream * bs)
-     glopts->num_crc_bits = 0;
- 
-     // Store the number of bits initially in the bit buffer
--    initial_bits = buffer_sstell(bs);
-+    initial_bits = bitbuffer_sstell(bs);
- 
-     adb = available_bits(glopts);
- 
-@@ -580,7 +580,7 @@ static int encode_frame(twolame_options * glopts, bit_stream * bs)
- 
- 
-     // Calulate the number of bits in this frame
--    frameBits = buffer_sstell(bs) - initial_bits;
-+    frameBits = bitbuffer_sstell(bs) - initial_bits;
-     if (frameBits % 8) {        /* a program failure */
-         fprintf(stderr, "Sent %ld bits = %ld slots plus %ld\n", frameBits, frameBits / 8,
-                 frameBits % 8);
-@@ -630,7 +630,7 @@ int twolame_encode_buffer(twolame_options * glopts,
- 
-     // now would be a great time to validate the size of the buffer.
-     // samples/1152 * sizeof(frame) < mp2buffer_size 
--    mybs = buffer_init(mp2buffer, mp2buffer_size);
-+    mybs = bitbuffer_init(mp2buffer, mp2buffer_size);
- 
- 
-     // Use up all the samples in in_buffer
-@@ -658,7 +658,7 @@ int twolame_encode_buffer(twolame_options * glopts,
-         if (glopts->samples_in_buffer >= TWOLAME_SAMPLES_PER_FRAME) {
-             int bytes = encode_frame(glopts, mybs);
-             if (bytes <= 0) {
--                buffer_deinit(&mybs);
-+                bitbuffer_deinit(&mybs);
-                 return bytes;
-             }
-             mp2_size += bytes;
-@@ -667,7 +667,7 @@ int twolame_encode_buffer(twolame_options * glopts,
-     }
- 
-     // free up the bit stream buffer structure
--    buffer_deinit(&mybs);
-+    bitbuffer_deinit(&mybs);
- 
-     return (mp2_size);
- }
-@@ -687,7 +687,7 @@ int twolame_encode_buffer_interleaved(twolame_options * glopts,
- 
-     // now would be a great time to validate the size of the buffer.
-     // samples/1152 * sizeof(frame) < mp2buffer_size 
--    mybs = buffer_init(mp2buffer, mp2buffer_size);
-+    mybs = bitbuffer_init(mp2buffer, mp2buffer_size);
- 
-     // Use up all the samples in in_buffer
-     while (num_samples) {
-@@ -714,7 +714,7 @@ int twolame_encode_buffer_interleaved(twolame_options * glopts,
-         if (glopts->samples_in_buffer >= TWOLAME_SAMPLES_PER_FRAME) {
-             int bytes = encode_frame(glopts, mybs);
-             if (bytes <= 0) {
--                buffer_deinit(&mybs);
-+                bitbuffer_deinit(&mybs);
-                 return bytes;
-             }
-             mp2_size += bytes;
-@@ -723,7 +723,7 @@ int twolame_encode_buffer_interleaved(twolame_options * glopts,
-     }
- 
-     // free up the bit stream buffer structure
--    buffer_deinit(&mybs);
-+    bitbuffer_deinit(&mybs);
- 
- 
-     return (mp2_size);
-@@ -771,7 +771,7 @@ int twolame_encode_buffer_float32(twolame_options * glopts,
- 
-     // now would be a great time to validate the size of the buffer.
-     // samples/1152 * sizeof(frame) < mp2buffer_size 
--    mybs = buffer_init(mp2buffer, mp2buffer_size);
-+    mybs = bitbuffer_init(mp2buffer, mp2buffer_size);
- 
- 
-     // Use up all the samples in in_buffer
-@@ -800,7 +800,7 @@ int twolame_encode_buffer_float32(twolame_options * glopts,
-         if (glopts->samples_in_buffer >= TWOLAME_SAMPLES_PER_FRAME) {
-             int bytes = encode_frame(glopts, mybs);
-             if (bytes <= 0) {
--                buffer_deinit(&mybs);
-+                bitbuffer_deinit(&mybs);
-                 return bytes;
-             }
-             mp2_size += bytes;
-@@ -809,7 +809,7 @@ int twolame_encode_buffer_float32(twolame_options * glopts,
-     }
- 
-     // free up the bit stream buffer structure
--    buffer_deinit(&mybs);
-+    bitbuffer_deinit(&mybs);
- 
-     return (mp2_size);
- }
-@@ -829,7 +829,7 @@ int twolame_encode_buffer_float32_interleaved(twolame_options * glopts,
- 
-     // now would be a great time to validate the size of the buffer.
-     // samples/1152 * sizeof(frame) < mp2buffer_size 
--    mybs = buffer_init(mp2buffer, mp2buffer_size);
-+    mybs = bitbuffer_init(mp2buffer, mp2buffer_size);
- 
-     // Use up all the samples in in_buffer
-     while (num_samples) {
-@@ -857,7 +857,7 @@ int twolame_encode_buffer_float32_interleaved(twolame_options * glopts,
-         if (glopts->samples_in_buffer >= TWOLAME_SAMPLES_PER_FRAME) {
-             int bytes = encode_frame(glopts, mybs);
-             if (bytes <= 0) {
--                buffer_deinit(&mybs);
-+                bitbuffer_deinit(&mybs);
-                 return bytes;
-             }
-             mp2_size += bytes;
-@@ -866,7 +866,7 @@ int twolame_encode_buffer_float32_interleaved(twolame_options * glopts,
-     }
- 
-     // free up the bit stream buffer structure
--    buffer_deinit(&mybs);
-+    bitbuffer_deinit(&mybs);
- 
- 
-     return (mp2_size);
-@@ -885,7 +885,7 @@ int twolame_encode_flush(twolame_options * glopts, unsigned char *mp2buffer, int
-         return 0;
-     }
-     // Create bit stream structure
--    mybs = buffer_init(mp2buffer, mp2buffer_size);
-+    mybs = bitbuffer_init(mp2buffer, mp2buffer_size);
- 
-     // Pad out the PCM buffers with 0 and encode the frame
-     for (i = glopts->samples_in_buffer; i < TWOLAME_SAMPLES_PER_FRAME; i++) {
-@@ -897,7 +897,7 @@ int twolame_encode_flush(twolame_options * glopts, unsigned char *mp2buffer, int
-     glopts->samples_in_buffer = 0;
- 
-     // free up the bit stream buffer structure
--    buffer_deinit(&mybs);
-+    bitbuffer_deinit(&mybs);
- 
-     return mp2_size;
- }
--- 
-2.17.1
-
diff --git a/package/twolame/twolame.hash b/package/twolame/twolame.hash
index eab52876af..74941ae30c 100644
--- a/package/twolame/twolame.hash
+++ b/package/twolame/twolame.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  98f332f48951f47f23f70fd0379463aff7d7fb26f07e1e24e42ddef22cc6112a  twolame-0.3.13.tar.gz
-sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
+sha256  cc35424f6019a88c6f52570b63e1baf50f62963a3eac52a03a800bb070d7c87d  twolame-0.4.0.tar.gz
+sha256  257a842724705950b07da76ce0e22ffa80ec77b3e9dfc6702522ac342409da0f  COPYING
diff --git a/package/twolame/twolame.mk b/package/twolame/twolame.mk
index d5628d1b0a..5837b80a56 100644
--- a/package/twolame/twolame.mk
+++ b/package/twolame/twolame.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TWOLAME_VERSION = 0.3.13
+TWOLAME_VERSION = 0.4.0
 TWOLAME_SITE = http://downloads.sourceforge.net/project/twolame/twolame/$(TWOLAME_VERSION)
 TWOLAME_DEPENDENCIES = host-pkgconf libsndfile
 TWOLAME_INSTALL_STAGING = YES
-- 
2.24.0
