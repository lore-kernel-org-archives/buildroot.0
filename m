From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 May 2018 17:47:08 +0200
Subject: [Buildroot] [git commit] wavpack: add upstream security fixes
Message-ID: <20180521155400.ED34E81D3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc730557571815cbb42a52b1f26d7119d1d14ac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

CVE-2018-10536: An issue was discovered in WavPack 5.1.0 and earlier.  The
WAV parser component contains a vulnerability that allows writing to memory
because ParseRiffHeaderConfig in riff.c does not reject multiple format
chunks.

CVE-2018-10537: An issue was discovered in WavPack 5.1.0 and earlier.  The
W64 parser component contains a vulnerability that allows writing to memory
because ParseWave64HeaderConfig in wave64.c does not reject multiple format
chunks.

CVE-2018-10538: An issue was discovered in WavPack 5.1.0 and earlier for WAV
input.  Out-of-bounds writes can occur because ParseRiffHeaderConfig in
riff.c does not validate the sizes of unknown chunks before attempting
memory allocation, related to a lack of integer-overflow protection within a
bytes_to_copy calculation and subsequent malloc call, leading to
insufficient memory allocation.

CVE-2018-10539: An issue was discovered in WavPack 5.1.0 and earlier for
DSDiff input.  Out-of-bounds writes can occur because
ParseDsdiffHeaderConfig in dsdiff.c does not validate the sizes of unknown
chunks before attempting memory allocation, related to a lack of
integer-overflow protection within a bytes_to_copy calculation and
subsequent malloc call, leading to insufficient memory allocation.

CVE-2018-10540: An issue was discovered in WavPack 5.1.0 and earlier for W64
input.  Out-of-bounds writes can occur because ParseWave64HeaderConfig in
wave64.c does not validate the sizes of unknown chunks before attempting
memory allocation, related to a lack of integer-overflow protection within a
bytes_to_copy calculation and subsequent malloc call, leading to
insufficient memory allocation.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sue-31-issue-32-no-multiple-format-chunks.patch | 64 ++++++++++++++++++
 ...nitize-size-of-unknown-chunks-before-mall.patch | 75 ++++++++++++++++++++++
 2 files changed, 139 insertions(+)

diff --git a/package/wavpack/0005-issue-30-issue-31-issue-32-no-multiple-format-chunks.patch b/package/wavpack/0005-issue-30-issue-31-issue-32-no-multiple-format-chunks.patch
new file mode 100644
index 0000000000..f837a0e966
--- /dev/null
+++ b/package/wavpack/0005-issue-30-issue-31-issue-32-no-multiple-format-chunks.patch
@@ -0,0 +1,64 @@
+From 26cb47f99d481ad9b93eeff80d26e6b63bbd7e15 Mon Sep 17 00:00:00 2001
+From: David Bryant <david@wavpack.com>
+Date: Tue, 24 Apr 2018 22:18:07 -0700
+Subject: [PATCH] issue #30 issue #31 issue #32: no multiple format chunks in
+ WAV or W64
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ cli/riff.c   | 7 ++++++-
+ cli/wave64.c | 6 ++++++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/cli/riff.c b/cli/riff.c
+index 7bddf63..5d6452e 100644
+--- a/cli/riff.c
++++ b/cli/riff.c
+@@ -53,7 +53,7 @@ extern int debug_logging_mode;
+ 
+ int ParseRiffHeaderConfig (FILE *infile, char *infilename, char *fourcc, WavpackContext *wpc, WavpackConfig *config)
+ {
+-    int is_rf64 = !strncmp (fourcc, "RF64", 4), got_ds64 = 0;
++    int is_rf64 = !strncmp (fourcc, "RF64", 4), got_ds64 = 0, format_chunk = 0;
+     int64_t total_samples = 0, infilesize;
+     RiffChunkHeader riff_chunk_header;
+     ChunkHeader chunk_header;
+@@ -140,6 +140,11 @@ int ParseRiffHeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpack
+         else if (!strncmp (chunk_header.ckID, "fmt ", 4)) {     // if it's the format chunk, we want to get some info out of there and
+             int supported = TRUE, format;                        // make sure it's a .wav file we can handle
+ 
++            if (format_chunk++) {
++                error_line ("%s is not a valid .WAV file!", infilename);
++                return WAVPACK_SOFT_ERROR;
++            }
++
+             if (chunk_header.ckSize < 16 || chunk_header.ckSize > sizeof (WaveHeader) ||
+                 !DoReadFile (infile, &WaveHeader, chunk_header.ckSize, &bcount) ||
+                 bcount != chunk_header.ckSize) {
+diff --git a/cli/wave64.c b/cli/wave64.c
+index fa928a0..0388dc7 100644
+--- a/cli/wave64.c
++++ b/cli/wave64.c
+@@ -53,6 +53,7 @@ int ParseWave64HeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpa
+     Wave64ChunkHeader chunk_header;
+     Wave64FileHeader filehdr;
+     WaveHeader WaveHeader;
++    int format_chunk = 0;
+     uint32_t bcount;
+ 
+     infilesize = DoGetFileSize (infile);
+@@ -104,6 +105,11 @@ int ParseWave64HeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpa
+         if (!memcmp (chunk_header.ckID, fmt_guid, sizeof (fmt_guid))) {
+             int supported = TRUE, format;
+ 
++            if (format_chunk++) {
++                error_line ("%s is not a valid .W64 file!", infilename);
++                return WAVPACK_SOFT_ERROR;
++            }
++
+             chunk_header.ckSize = (chunk_header.ckSize + 7) & ~7L;
+ 
+             if (chunk_header.ckSize < 16 || chunk_header.ckSize > sizeof (WaveHeader) ||
+-- 
+2.11.0
+
diff --git a/package/wavpack/0006-issue-33-sanitize-size-of-unknown-chunks-before-mall.patch b/package/wavpack/0006-issue-33-sanitize-size-of-unknown-chunks-before-mall.patch
new file mode 100644
index 0000000000..76ebce66d6
--- /dev/null
+++ b/package/wavpack/0006-issue-33-sanitize-size-of-unknown-chunks-before-mall.patch
@@ -0,0 +1,75 @@
+From 6f8bb34c2993a48ab9afbe353e6d0cff7c8d821d Mon Sep 17 00:00:00 2001
+From: David Bryant <david@wavpack.com>
+Date: Tue, 24 Apr 2018 17:27:01 -0700
+Subject: [PATCH] issue #33, sanitize size of unknown chunks before malloc()
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ cli/dsdiff.c | 9 ++++++++-
+ cli/riff.c   | 9 ++++++++-
+ cli/wave64.c | 9 ++++++++-
+ 3 files changed, 24 insertions(+), 3 deletions(-)
+
+diff --git a/cli/dsdiff.c b/cli/dsdiff.c
+index c016df9..fa56bbb 100644
+--- a/cli/dsdiff.c
++++ b/cli/dsdiff.c
+@@ -279,7 +279,14 @@ int ParseDsdiffHeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpa
+         else {          // just copy unknown chunks to output file
+ 
+             int bytes_to_copy = (int)(((dff_chunk_header.ckDataSize) + 1) & ~(int64_t)1);
+-            char *buff = malloc (bytes_to_copy);
++            char *buff;
++
++            if (bytes_to_copy < 0 || bytes_to_copy > 4194304) {
++                error_line ("%s is not a valid .DFF file!", infilename);
++                return WAVPACK_SOFT_ERROR;
++            }
++
++            buff = malloc (bytes_to_copy);
+ 
+             if (debug_logging_mode)
+                 error_line ("extra unknown chunk \"%c%c%c%c\" of %d bytes",
+diff --git a/cli/riff.c b/cli/riff.c
+index de98c1e..7bddf63 100644
+--- a/cli/riff.c
++++ b/cli/riff.c
+@@ -286,7 +286,14 @@ int ParseRiffHeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpack
+         else {          // just copy unknown chunks to output file
+ 
+             int bytes_to_copy = (chunk_header.ckSize + 1) & ~1L;
+-            char *buff = malloc (bytes_to_copy);
++            char *buff;
++
++            if (bytes_to_copy < 0 || bytes_to_copy > 4194304) {
++                error_line ("%s is not a valid .WAV file!", infilename);
++                return WAVPACK_SOFT_ERROR;
++            }
++
++            buff = malloc (bytes_to_copy);
+ 
+             if (debug_logging_mode)
+                 error_line ("extra unknown chunk \"%c%c%c%c\" of %d bytes",
+diff --git a/cli/wave64.c b/cli/wave64.c
+index 591d640..fa928a0 100644
+--- a/cli/wave64.c
++++ b/cli/wave64.c
+@@ -241,7 +241,14 @@ int ParseWave64HeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpa
+         }
+         else {          // just copy unknown chunks to output file
+             int bytes_to_copy = (chunk_header.ckSize + 7) & ~7L;
+-            char *buff = malloc (bytes_to_copy);
++            char *buff;
++
++            if (bytes_to_copy < 0 || bytes_to_copy > 4194304) {
++                error_line ("%s is not a valid .W64 file!", infilename);
++                return WAVPACK_SOFT_ERROR;
++            }
++
++            buff = malloc (bytes_to_copy);
+ 
+             if (debug_logging_mode)
+                 error_line ("extra unknown chunk \"%c%c%c%c\" of %d bytes",
+-- 
+2.11.0
+
