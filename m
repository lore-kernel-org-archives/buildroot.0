From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 23:17:45 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/wavpack: security
 bump to version 5.2.0
Message-ID: <20191223221155.E2E518E0ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60eedb398839bf80d40d444cf24d2a375d2a15ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

- Switch to github to get latest version
- Drop patches (already in version)
- Fix CVE-2018-19840: The function WavpackPackInit in pack_utils.c in
  libwavpack.a in WavPack through 5.1.0 allows attackers to cause a
  denial-of-service (resource exhaustion caused by an infinite loop) via
  a crafted wav audio file because WavpackSetConfiguration64 mishandles
  a sample rate of zero.
- Fix CVE-2018-19841: The function WavpackVerifySingleBlock in
  open_utils.c in libwavpack.a in WavPack through 5.1.0 allows attackers
  to cause a denial-of-service (out-of-bounds read and application
  crash) via a crafted WavPack Lossless Audio file, as demonstrated by
  wvunpack.
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7a24c6d63b168dc138af606b47c881e13c84774c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-19-new-dependency-on-wchar-t-by-removing.patch |  70 ------------
 ...-not-overwrite-stack-on-corrupt-RF64-file.patch | 118 ---------------------
 ...-not-overwrite-heap-on-corrupt-DSDIFF-fil.patch |  38 -------
 ...x-buffer-overflows-and-bad-allocs-on-corr.patch |  72 -------------
 ...sue-31-issue-32-no-multiple-format-chunks.patch |  64 -----------
 ...nitize-size-of-unknown-chunks-before-mall.patch |  75 -------------
 package/wavpack/wavpack.hash                       |   3 +-
 package/wavpack/wavpack.mk                         |   7 +-
 8 files changed, 6 insertions(+), 441 deletions(-)

diff --git a/package/wavpack/0001-fix-Github-issue-19-new-dependency-on-wchar-t-by-removing.patch b/package/wavpack/0001-fix-Github-issue-19-new-dependency-on-wchar-t-by-removing.patch
deleted file mode 100644
index e5faf91221..0000000000
--- a/package/wavpack/0001-fix-Github-issue-19-new-dependency-on-wchar-t-by-removing.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 876fc3f3907e871d0938ac6c8c5252f5f31abd1f Mon Sep 17 00:00:00 2001
-From: David Bryant <david@wavpack.com>
-Date: Thu, 16 Feb 2017 17:11:12 -0800
-Subject: [PATCH] fix GitHub issue #19 (new dependency on wchar_t) by removing
- dependency
-
-[Upstream commit: https://github.com/dbry/WavPack/commit/876fc3f3907e871d0938ac6c8c5252f5f31abd1f]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- cli/import_id3.c | 10 +++++-----
- cli/wvtag.c      |  2 ++
- 2 files changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/cli/import_id3.c b/cli/import_id3.c
-index 51e54ee..fc30aeb 100644
---- a/cli/import_id3.c
-+++ b/cli/import_id3.c
-@@ -34,7 +34,7 @@ static struct {
- 
- #define NUM_TEXT_TAG_ITEMS (sizeof (text_tag_table) / sizeof (text_tag_table [0]))
- 
--static int WideCharToUTF8 (const wchar_t *Wide, unsigned char *pUTF8, int len);
-+static int WideCharToUTF8 (const uint16_t *Wide, unsigned char *pUTF8, int len);
- static void Latin1ToUTF8 (void *string, int len);
- 
- // Import specified ID3v2.3 tag. The WavPack context accepts the tag items, and can be
-@@ -163,7 +163,7 @@ int ImportID3v2 (WavpackContext *wpc, unsigned char *tag_data, int tag_size, cha
-             }
-             else if (frame_body [0] == 1 && frame_size > 2 && frame_body [1] == 0xFF && frame_body [2] == 0xFE) {
-                 int nchars = (frame_size - 3) / 2;
--                wchar_t *wide_string = malloc ((nchars + 1) * sizeof (wchar_t));
-+                uint16_t *wide_string = malloc ((nchars + 1) * sizeof (uint16_t));
-                 unsigned char *fp = frame_body + 3;
- 
-                 utf8_string = malloc ((nchars + 1) * 3);
-@@ -297,9 +297,9 @@ int ImportID3v2 (WavpackContext *wpc, unsigned char *tag_data, int tag_size, cha
- // may be less than the number of characters in the wide string if the buffer
- // length is exceeded.
- 
--static int WideCharToUTF8 (const wchar_t *Wide, unsigned char *pUTF8, int len)
-+static int WideCharToUTF8 (const uint16_t *Wide, unsigned char *pUTF8, int len)
- {
--    const wchar_t *pWide = Wide;
-+    const uint16_t *pWide = Wide;
-     int outndx = 0;
- 
-     while (*pWide) {
-@@ -335,7 +335,7 @@ static int WideCharToUTF8 (const wchar_t *Wide, unsigned char *pUTF8, int len)
- static void Latin1ToUTF8 (void *string, int len)
- {
-     int max_chars = (int) strlen (string);
--    wchar_t *temp = (wchar_t *) malloc ((max_chars + 1) * 2);
-+    uint16_t *temp = (uint16_t *) malloc ((max_chars + 1) * sizeof (uint16_t));
- 
-     MultiByteToWideChar (28591, 0, string, -1, temp, max_chars + 1);
-     WideCharToUTF8 (temp, (unsigned char *) string, len);
-diff --git a/cli/wvtag.c b/cli/wvtag.c
-index 6e6512a..45e621e 100644
---- a/cli/wvtag.c
-+++ b/cli/wvtag.c
-@@ -1344,7 +1344,9 @@ static void dump_UTF8_string (char *string, FILE *dst)
- // resulting string will not fit in the specified buffer size then it is
- // truncated.
- 
-+#if defined (_WIN32)
- static int UTF8ToWideChar (const unsigned char *pUTF8, wchar_t *pWide);
-+#endif
- 
- static void UTF8ToAnsi (char *string, int len)
- {
diff --git a/package/wavpack/0002-issue-27-do-not-overwrite-stack-on-corrupt-RF64-file.patch b/package/wavpack/0002-issue-27-do-not-overwrite-stack-on-corrupt-RF64-file.patch
deleted file mode 100644
index bda00999b9..0000000000
--- a/package/wavpack/0002-issue-27-do-not-overwrite-stack-on-corrupt-RF64-file.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From d5bf76b5a88d044a1be1d5656698e3ba737167e5 Mon Sep 17 00:00:00 2001
-From: David Bryant <david@wavpack.com>
-Date: Sun, 4 Feb 2018 11:28:15 -0800
-Subject: [PATCH] issue #27, do not overwrite stack on corrupt RF64 file
-
-Fixes CVE-2018-6767
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- cli/riff.c | 39 ++++++++++++++++++++++++++++++++-------
- 1 file changed, 32 insertions(+), 7 deletions(-)
-
-diff --git a/cli/riff.c b/cli/riff.c
-index 8b1af45..de98c1e 100644
---- a/cli/riff.c
-+++ b/cli/riff.c
-@@ -42,6 +42,7 @@ typedef struct {
- 
- #pragma pack(pop)
- 
-+#define CS64ChunkFormat "4D"
- #define DS64ChunkFormat "DDDL"
- 
- #define WAVPACK_NO_ERROR    0
-@@ -101,13 +102,13 @@ int ParseRiffHeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpack
- 
-         if (!strncmp (chunk_header.ckID, "ds64", 4)) {
-             if (chunk_header.ckSize < sizeof (DS64Chunk) ||
--                !DoReadFile (infile, &ds64_chunk, chunk_header.ckSize, &bcount) ||
--                bcount != chunk_header.ckSize) {
-+                !DoReadFile (infile, &ds64_chunk, sizeof (DS64Chunk), &bcount) ||
-+                bcount != sizeof (DS64Chunk)) {
-                     error_line ("%s is not a valid .WAV file!", infilename);
-                     return WAVPACK_SOFT_ERROR;
-             }
-             else if (!(config->qmode & QMODE_NO_STORE_WRAPPER) &&
--                !WavpackAddWrapper (wpc, &ds64_chunk, chunk_header.ckSize)) {
-+                !WavpackAddWrapper (wpc, &ds64_chunk, sizeof (DS64Chunk))) {
-                     error_line ("%s", WavpackGetErrorMessage (wpc));
-                     return WAVPACK_SOFT_ERROR;
-             }
-@@ -315,10 +316,11 @@ int ParseRiffHeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpack
- 
- int WriteRiffHeader (FILE *outfile, WavpackContext *wpc, int64_t total_samples, int qmode)
- {
--    int do_rf64 = 0, write_junk = 1;
-+    int do_rf64 = 0, write_junk = 1, table_length = 0;
-     ChunkHeader ds64hdr, datahdr, fmthdr;
-     RiffChunkHeader riffhdr;
-     DS64Chunk ds64_chunk;
-+    CS64Chunk cs64_chunk;
-     JunkChunk junkchunk;
-     WaveHeader wavhdr;
-     uint32_t bcount;
-@@ -380,6 +382,7 @@ int WriteRiffHeader (FILE *outfile, WavpackContext *wpc, int64_t total_samples,
-     strncpy (riffhdr.formType, "WAVE", sizeof (riffhdr.formType));
-     total_riff_bytes = sizeof (riffhdr) + wavhdrsize + sizeof (datahdr) + ((total_data_bytes + 1) & ~(int64_t)1);
-     if (do_rf64) total_riff_bytes += sizeof (ds64hdr) + sizeof (ds64_chunk);
-+    total_riff_bytes += table_length * sizeof (CS64Chunk);
-     if (write_junk) total_riff_bytes += sizeof (junkchunk);
-     strncpy (fmthdr.ckID, "fmt ", sizeof (fmthdr.ckID));
-     strncpy (datahdr.ckID, "data", sizeof (datahdr.ckID));
-@@ -394,11 +397,12 @@ int WriteRiffHeader (FILE *outfile, WavpackContext *wpc, int64_t total_samples,
- 
-     if (do_rf64) {
-         strncpy (ds64hdr.ckID, "ds64", sizeof (ds64hdr.ckID));
--        ds64hdr.ckSize = sizeof (ds64_chunk);
-+        ds64hdr.ckSize = sizeof (ds64_chunk) + (table_length * sizeof (CS64Chunk));
-         CLEAR (ds64_chunk);
-         ds64_chunk.riffSize64 = total_riff_bytes;
-         ds64_chunk.dataSize64 = total_data_bytes;
-         ds64_chunk.sampleCount64 = total_samples;
-+        ds64_chunk.tableLength = table_length;
-         riffhdr.ckSize = (uint32_t) -1;
-         datahdr.ckSize = (uint32_t) -1;
-         WavpackNativeToLittleEndian (&ds64hdr, ChunkHeaderFormat);
-@@ -409,6 +413,14 @@ int WriteRiffHeader (FILE *outfile, WavpackContext *wpc, int64_t total_samples,
-         datahdr.ckSize = (uint32_t) total_data_bytes;
-     }
- 
-+    // this "table" is just a dummy placeholder for testing (normally not written)
-+
-+    if (table_length) {
-+        strncpy (cs64_chunk.ckID, "dmmy", sizeof (cs64_chunk.ckID));
-+        cs64_chunk.chunkSize64 = 12345678;
-+        WavpackNativeToLittleEndian (&cs64_chunk, CS64ChunkFormat);
-+    }
-+
-     // write the RIFF chunks up to just before the data starts
- 
-     WavpackNativeToLittleEndian (&riffhdr, ChunkHeaderFormat);
-@@ -418,8 +430,21 @@ int WriteRiffHeader (FILE *outfile, WavpackContext *wpc, int64_t total_samples,
- 
-     if (!DoWriteFile (outfile, &riffhdr, sizeof (riffhdr), &bcount) || bcount != sizeof (riffhdr) ||
-         (do_rf64 && (!DoWriteFile (outfile, &ds64hdr, sizeof (ds64hdr), &bcount) || bcount != sizeof (ds64hdr))) ||
--        (do_rf64 && (!DoWriteFile (outfile, &ds64_chunk, sizeof (ds64_chunk), &bcount) || bcount != sizeof (ds64_chunk))) ||
--        (write_junk && (!DoWriteFile (outfile, &junkchunk, sizeof (junkchunk), &bcount) || bcount != sizeof (junkchunk))) ||
-+        (do_rf64 && (!DoWriteFile (outfile, &ds64_chunk, sizeof (ds64_chunk), &bcount) || bcount != sizeof (ds64_chunk)))) {
-+            error_line ("can't write .WAV data, disk probably full!");
-+            return FALSE;
-+    }
-+
-+    // again, this is normally not written except for testing
-+
-+    while (table_length--)
-+        if (!DoWriteFile (outfile, &cs64_chunk, sizeof (cs64_chunk), &bcount) || bcount != sizeof (cs64_chunk)) {
-+            error_line ("can't write .WAV data, disk probably full!");
-+            return FALSE;
-+        }
-+
-+
-+    if ((write_junk && (!DoWriteFile (outfile, &junkchunk, sizeof (junkchunk), &bcount) || bcount != sizeof (junkchunk))) ||
-         !DoWriteFile (outfile, &fmthdr, sizeof (fmthdr), &bcount) || bcount != sizeof (fmthdr) ||
-         !DoWriteFile (outfile, &wavhdr, wavhdrsize, &bcount) || bcount != wavhdrsize ||
-         !DoWriteFile (outfile, &datahdr, sizeof (datahdr), &bcount) || bcount != sizeof (datahdr)) {
--- 
-2.11.0
-
diff --git a/package/wavpack/0003-issue-28-do-not-overwrite-heap-on-corrupt-DSDIFF-fil.patch b/package/wavpack/0003-issue-28-do-not-overwrite-heap-on-corrupt-DSDIFF-fil.patch
deleted file mode 100644
index 950877b03c..0000000000
--- a/package/wavpack/0003-issue-28-do-not-overwrite-heap-on-corrupt-DSDIFF-fil.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 36a24c7881427d2e1e4dc1cef58f19eee0d13aec Mon Sep 17 00:00:00 2001
-From: David Bryant <david@wavpack.com>
-Date: Sat, 10 Feb 2018 16:01:39 -0800
-Subject: [PATCH] issue #28, do not overwrite heap on corrupt DSDIFF file
-
-Fixes CVE-2018-7253
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- cli/dsdiff.c | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/cli/dsdiff.c b/cli/dsdiff.c
-index 410dc1c..c016df9 100644
---- a/cli/dsdiff.c
-+++ b/cli/dsdiff.c
-@@ -153,7 +153,17 @@ int ParseDsdiffHeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpa
-                 error_line ("dsdiff file version = 0x%08x", version);
-         }
-         else if (!strncmp (dff_chunk_header.ckID, "PROP", 4)) {
--            char *prop_chunk = malloc ((size_t) dff_chunk_header.ckDataSize);
-+            char *prop_chunk;
-+
-+            if (dff_chunk_header.ckDataSize < 4 || dff_chunk_header.ckDataSize > 1024) {
-+                error_line ("%s is not a valid .DFF file!", infilename);
-+                return WAVPACK_SOFT_ERROR;
-+            }
-+
-+            if (debug_logging_mode)
-+                error_line ("got PROP chunk of %d bytes total", (int) dff_chunk_header.ckDataSize);
-+
-+            prop_chunk = malloc ((size_t) dff_chunk_header.ckDataSize);
- 
-             if (!DoReadFile (infile, prop_chunk, (uint32_t) dff_chunk_header.ckDataSize, &bcount) ||
-                 bcount != dff_chunk_header.ckDataSize) {
--- 
-2.11.0
-
diff --git a/package/wavpack/0004-issue-28-fix-buffer-overflows-and-bad-allocs-on-corr.patch b/package/wavpack/0004-issue-28-fix-buffer-overflows-and-bad-allocs-on-corr.patch
deleted file mode 100644
index 142e81ff7a..0000000000
--- a/package/wavpack/0004-issue-28-fix-buffer-overflows-and-bad-allocs-on-corr.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 8e3fe45a7bac31d9a3b558ae0079e2d92a04799e Mon Sep 17 00:00:00 2001
-From: David Bryant <david@wavpack.com>
-Date: Sun, 11 Feb 2018 16:37:47 -0800
-Subject: [PATCH] issue #28, fix buffer overflows and bad allocs on corrupt CAF
- files
-
-Fixes CVE-2018-7254
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- cli/caff.c | 30 +++++++++++++++++++++++-------
- 1 file changed, 23 insertions(+), 7 deletions(-)
-
-diff --git a/cli/caff.c b/cli/caff.c
-index ae57c4b..6248a71 100644
---- a/cli/caff.c
-+++ b/cli/caff.c
-@@ -89,8 +89,8 @@ typedef struct
- 
- #define CAFChannelDescriptionFormat "LLLLL"
- 
--static const char TMH_full [] = { 1,2,3,13,9,10,5,6,12,14,15,16,17,9,4,18,7,8,19,20,21 };
--static const char TMH_std [] = { 1,2,3,11,8,9,5,6,10,12,13,14,15,7,4,16 };
-+static const char TMH_full [] = { 1,2,3,13,9,10,5,6,12,14,15,16,17,9,4,18,7,8,19,20,21,0 };
-+static const char TMH_std [] = { 1,2,3,11,8,9,5,6,10,12,13,14,15,7,4,16,0 };
- 
- static struct {
-     uint32_t mChannelLayoutTag;     // Core Audio layout, 100 - 146 in high word, num channels in low word
-@@ -274,10 +274,19 @@ int ParseCaffHeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpack
-             }
-         }
-         else if (!strncmp (caf_chunk_header.mChunkType, "chan", 4)) {
--            CAFChannelLayout *caf_channel_layout = malloc ((size_t) caf_chunk_header.mChunkSize);
-+            CAFChannelLayout *caf_channel_layout;
- 
--            if (caf_chunk_header.mChunkSize < sizeof (CAFChannelLayout) ||
--                !DoReadFile (infile, caf_channel_layout, (uint32_t) caf_chunk_header.mChunkSize, &bcount) ||
-+            if (caf_chunk_header.mChunkSize < sizeof (CAFChannelLayout) || caf_chunk_header.mChunkSize > 1024) {
-+                error_line ("this .CAF file has an invalid 'chan' chunk!");
-+                return WAVPACK_SOFT_ERROR;
-+            }
-+
-+            if (debug_logging_mode)
-+                error_line ("'chan' chunk is %d bytes", (int) caf_chunk_header.mChunkSize);
-+
-+            caf_channel_layout = malloc ((size_t) caf_chunk_header.mChunkSize);
-+
-+            if (!DoReadFile (infile, caf_channel_layout, (uint32_t) caf_chunk_header.mChunkSize, &bcount) ||
-                 bcount != caf_chunk_header.mChunkSize) {
-                     error_line ("%s is not a valid .CAF file!", infilename);
-                     free (caf_channel_layout);
-@@ -495,8 +504,15 @@ int ParseCaffHeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpack
-         }
-         else {          // just copy unknown chunks to output file
- 
--            int bytes_to_copy = (uint32_t) caf_chunk_header.mChunkSize;
--            char *buff = malloc (bytes_to_copy);
-+            uint32_t bytes_to_copy = (uint32_t) caf_chunk_header.mChunkSize;
-+            char *buff;
-+
-+            if (caf_chunk_header.mChunkSize < 0 || caf_chunk_header.mChunkSize > 1048576) {
-+                error_line ("%s is not a valid .CAF file!", infilename);
-+                return WAVPACK_SOFT_ERROR;
-+            }
-+
-+            buff = malloc (bytes_to_copy);
- 
-             if (debug_logging_mode)
-                 error_line ("extra unknown chunk \"%c%c%c%c\" of %d bytes",
--- 
-2.11.0
-
diff --git a/package/wavpack/0005-issue-30-issue-31-issue-32-no-multiple-format-chunks.patch b/package/wavpack/0005-issue-30-issue-31-issue-32-no-multiple-format-chunks.patch
deleted file mode 100644
index f837a0e966..0000000000
--- a/package/wavpack/0005-issue-30-issue-31-issue-32-no-multiple-format-chunks.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 26cb47f99d481ad9b93eeff80d26e6b63bbd7e15 Mon Sep 17 00:00:00 2001
-From: David Bryant <david@wavpack.com>
-Date: Tue, 24 Apr 2018 22:18:07 -0700
-Subject: [PATCH] issue #30 issue #31 issue #32: no multiple format chunks in
- WAV or W64
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- cli/riff.c   | 7 ++++++-
- cli/wave64.c | 6 ++++++
- 2 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/cli/riff.c b/cli/riff.c
-index 7bddf63..5d6452e 100644
---- a/cli/riff.c
-+++ b/cli/riff.c
-@@ -53,7 +53,7 @@ extern int debug_logging_mode;
- 
- int ParseRiffHeaderConfig (FILE *infile, char *infilename, char *fourcc, WavpackContext *wpc, WavpackConfig *config)
- {
--    int is_rf64 = !strncmp (fourcc, "RF64", 4), got_ds64 = 0;
-+    int is_rf64 = !strncmp (fourcc, "RF64", 4), got_ds64 = 0, format_chunk = 0;
-     int64_t total_samples = 0, infilesize;
-     RiffChunkHeader riff_chunk_header;
-     ChunkHeader chunk_header;
-@@ -140,6 +140,11 @@ int ParseRiffHeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpack
-         else if (!strncmp (chunk_header.ckID, "fmt ", 4)) {     // if it's the format chunk, we want to get some info out of there and
-             int supported = TRUE, format;                        // make sure it's a .wav file we can handle
- 
-+            if (format_chunk++) {
-+                error_line ("%s is not a valid .WAV file!", infilename);
-+                return WAVPACK_SOFT_ERROR;
-+            }
-+
-             if (chunk_header.ckSize < 16 || chunk_header.ckSize > sizeof (WaveHeader) ||
-                 !DoReadFile (infile, &WaveHeader, chunk_header.ckSize, &bcount) ||
-                 bcount != chunk_header.ckSize) {
-diff --git a/cli/wave64.c b/cli/wave64.c
-index fa928a0..0388dc7 100644
---- a/cli/wave64.c
-+++ b/cli/wave64.c
-@@ -53,6 +53,7 @@ int ParseWave64HeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpa
-     Wave64ChunkHeader chunk_header;
-     Wave64FileHeader filehdr;
-     WaveHeader WaveHeader;
-+    int format_chunk = 0;
-     uint32_t bcount;
- 
-     infilesize = DoGetFileSize (infile);
-@@ -104,6 +105,11 @@ int ParseWave64HeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpa
-         if (!memcmp (chunk_header.ckID, fmt_guid, sizeof (fmt_guid))) {
-             int supported = TRUE, format;
- 
-+            if (format_chunk++) {
-+                error_line ("%s is not a valid .W64 file!", infilename);
-+                return WAVPACK_SOFT_ERROR;
-+            }
-+
-             chunk_header.ckSize = (chunk_header.ckSize + 7) & ~7L;
- 
-             if (chunk_header.ckSize < 16 || chunk_header.ckSize > sizeof (WaveHeader) ||
--- 
-2.11.0
-
diff --git a/package/wavpack/0006-issue-33-sanitize-size-of-unknown-chunks-before-mall.patch b/package/wavpack/0006-issue-33-sanitize-size-of-unknown-chunks-before-mall.patch
deleted file mode 100644
index 76ebce66d6..0000000000
--- a/package/wavpack/0006-issue-33-sanitize-size-of-unknown-chunks-before-mall.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 6f8bb34c2993a48ab9afbe353e6d0cff7c8d821d Mon Sep 17 00:00:00 2001
-From: David Bryant <david@wavpack.com>
-Date: Tue, 24 Apr 2018 17:27:01 -0700
-Subject: [PATCH] issue #33, sanitize size of unknown chunks before malloc()
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- cli/dsdiff.c | 9 ++++++++-
- cli/riff.c   | 9 ++++++++-
- cli/wave64.c | 9 ++++++++-
- 3 files changed, 24 insertions(+), 3 deletions(-)
-
-diff --git a/cli/dsdiff.c b/cli/dsdiff.c
-index c016df9..fa56bbb 100644
---- a/cli/dsdiff.c
-+++ b/cli/dsdiff.c
-@@ -279,7 +279,14 @@ int ParseDsdiffHeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpa
-         else {          // just copy unknown chunks to output file
- 
-             int bytes_to_copy = (int)(((dff_chunk_header.ckDataSize) + 1) & ~(int64_t)1);
--            char *buff = malloc (bytes_to_copy);
-+            char *buff;
-+
-+            if (bytes_to_copy < 0 || bytes_to_copy > 4194304) {
-+                error_line ("%s is not a valid .DFF file!", infilename);
-+                return WAVPACK_SOFT_ERROR;
-+            }
-+
-+            buff = malloc (bytes_to_copy);
- 
-             if (debug_logging_mode)
-                 error_line ("extra unknown chunk \"%c%c%c%c\" of %d bytes",
-diff --git a/cli/riff.c b/cli/riff.c
-index de98c1e..7bddf63 100644
---- a/cli/riff.c
-+++ b/cli/riff.c
-@@ -286,7 +286,14 @@ int ParseRiffHeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpack
-         else {          // just copy unknown chunks to output file
- 
-             int bytes_to_copy = (chunk_header.ckSize + 1) & ~1L;
--            char *buff = malloc (bytes_to_copy);
-+            char *buff;
-+
-+            if (bytes_to_copy < 0 || bytes_to_copy > 4194304) {
-+                error_line ("%s is not a valid .WAV file!", infilename);
-+                return WAVPACK_SOFT_ERROR;
-+            }
-+
-+            buff = malloc (bytes_to_copy);
- 
-             if (debug_logging_mode)
-                 error_line ("extra unknown chunk \"%c%c%c%c\" of %d bytes",
-diff --git a/cli/wave64.c b/cli/wave64.c
-index 591d640..fa928a0 100644
---- a/cli/wave64.c
-+++ b/cli/wave64.c
-@@ -241,7 +241,14 @@ int ParseWave64HeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpa
-         }
-         else {          // just copy unknown chunks to output file
-             int bytes_to_copy = (chunk_header.ckSize + 7) & ~7L;
--            char *buff = malloc (bytes_to_copy);
-+            char *buff;
-+
-+            if (bytes_to_copy < 0 || bytes_to_copy > 4194304) {
-+                error_line ("%s is not a valid .W64 file!", infilename);
-+                return WAVPACK_SOFT_ERROR;
-+            }
-+
-+            buff = malloc (bytes_to_copy);
- 
-             if (debug_logging_mode)
-                 error_line ("extra unknown chunk \"%c%c%c%c\" of %d bytes",
--- 
-2.11.0
-
diff --git a/package/wavpack/wavpack.hash b/package/wavpack/wavpack.hash
index 56ba7d839c..6b1f90a1fe 100644
--- a/package/wavpack/wavpack.hash
+++ b/package/wavpack/wavpack.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256  1939627d5358d1da62bc6158d63f7ed12905552f3a799c799ee90296a7612944  wavpack-5.1.0.tar.bz2
+sha256  77e5b1cfa26e387e4275b362f0c3fb9a27106447d9bce00f9f794f30badb77e3  wavpack-5.2.0.tar.xz
+sha256  2ab58075e26305cc16920e9867c1d43f46ce81adab2051100dd316a3a93a2619  COPYING
diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index c23b12752a..9246b95397 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-WAVPACK_VERSION = 5.1.0
-WAVPACK_SITE = http://www.wavpack.com
-WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.bz2
+WAVPACK_VERSION = 5.2.0
+WAVPACK_SITE = \
+	https://github.com/dbry/WavPack/releases/download/$(WAVPACK_VERSION)
+WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.xz
 WAVPACK_INSTALL_STAGING = YES
 WAVPACK_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),,libiconv)
 WAVPACK_LICENSE = BSD-3-Clause
