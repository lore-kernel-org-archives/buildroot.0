From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 13:38:44 +0200
Subject: [Buildroot] [git commit branch/2019.11.x] package/libsndfile: add
 upstream security fixes
Message-ID: <20200408112845.D268D8DAA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5eeda60b6d075134b3d1d0d01852f3553a03b7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

- Fix CVE-2017-6892: In libsndfile version 1.0.28, an error in the
  "aiff_read_chanmap()" function (aiff.c) can be exploited to cause an
  out-of-bounds read memory access via a specially crafted AIFF file.

- Fix CVE-2017-8361: The flac_buffer_copy function in flac.c in
  libsndfile 1.0.28 allows remote attackers to cause a denial of service
  (buffer overflow and application crash) or possibly have unspecified
  other impact via a crafted audio file.

- Fix CVE-2017-8362: The flac_buffer_copy function in flac.c in
  libsndfile 1.0.28 allows remote attackers to cause a denial of service
  (invalid read and application crash) via a crafted audio file.

- Fix CVE-2017-8363: The flac_buffer_copy function in flac.c in
  libsndfile 1.0.28 allows remote attackers to cause a denial of service
  (heap-based buffer over-read and application crash) via a crafted
  audio file.

- Fix CVE-2017-8365: The i2les_array function in pcm.c in
  libsndfile 1.0.28 allows remote attackers to cause a denial of service
  (buffer over-read and application crash) via a crafted audio file.

- Fix CVE-2017-12562: Heap-based Buffer Overflow in the
  psf_binheader_writef function in common.c in libsndfile through 1.0.28
  allows remote attackers to cause a denial of service (application
  crash) or possibly have unspecified other impact.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 76d5ab4d17fe00514c45323ab077d3b85a7add47)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...006-src-aiff.c-Fix-a-buffer-read-overflow.patch | 29 +++++++
 .../0007-FLAC-Fix-a-buffer-read-overrun.patch      | 68 ++++++++++++++++
 ...008-src-flac.c-Fix-a-buffer-read-overflow.patch | 54 +++++++++++++
 .../0009-src-flac-c-Fix-another-memory-leak.patch  | 32 ++++++++
 ...-buffer-overflows-when-writing-strings-in.patch | 92 ++++++++++++++++++++++
 5 files changed, 275 insertions(+)

diff --git a/package/libsndfile/0006-src-aiff.c-Fix-a-buffer-read-overflow.patch b/package/libsndfile/0006-src-aiff.c-Fix-a-buffer-read-overflow.patch
new file mode 100644
index 0000000000..68b9e8ed67
--- /dev/null
+++ b/package/libsndfile/0006-src-aiff.c-Fix-a-buffer-read-overflow.patch
@@ -0,0 +1,29 @@
+From f833c53cb596e9e1792949f762e0b33661822748 Mon Sep 17 00:00:00 2001
+From: Erik de Castro Lopo <erikd@mega-nerd.com>
+Date: Tue, 23 May 2017 20:15:24 +1000
+Subject: [PATCH] src/aiff.c: Fix a buffer read overflow
+
+Secunia Advisory SA76717.
+
+Found by: Laurent Delosieres, Secunia Research at Flexera Software
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/erikd/libsndfile/commit/f833c53cb596e9e1792949f762e0b33661822748]
+---
+ src/aiff.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/aiff.c b/src/aiff.c
+index 5b5f9f53..45864b76 100644
+--- a/src/aiff.c
++++ b/src/aiff.c
+@@ -1759,7 +1759,7 @@ aiff_read_chanmap (SF_PRIVATE * psf, unsigned dword)
+ 		psf_binheader_readf (psf, "j", dword - bytesread) ;
+ 
+ 	if (map_info->channel_map != NULL)
+-	{	size_t chanmap_size = psf->sf.channels * sizeof (psf->channel_map [0]) ;
++	{	size_t chanmap_size = SF_MIN (psf->sf.channels, layout_tag & 0xffff) * sizeof (psf->channel_map [0]) ;
+ 
+ 		free (psf->channel_map) ;
+ 
diff --git a/package/libsndfile/0007-FLAC-Fix-a-buffer-read-overrun.patch b/package/libsndfile/0007-FLAC-Fix-a-buffer-read-overrun.patch
new file mode 100644
index 0000000000..b000143b70
--- /dev/null
+++ b/package/libsndfile/0007-FLAC-Fix-a-buffer-read-overrun.patch
@@ -0,0 +1,68 @@
+From fd0484aba8e51d16af1e3a880f9b8b857b385eb3 Mon Sep 17 00:00:00 2001
+From: Erik de Castro Lopo <erikd@mega-nerd.com>
+Date: Wed, 12 Apr 2017 19:45:30 +1000
+Subject: [PATCH] FLAC: Fix a buffer read overrun
+
+Buffer read overrun occurs when reading a FLAC file that switches
+from 2 channels to one channel mid-stream. Only option is to
+abort the read.
+
+Closes: https://github.com/erikd/libsndfile/issues/230
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/erikd/libsndfile/commit/fd0484aba8e51d16af1e3a880f9b8b857b385eb3]
+---
+ src/common.h  |  1 +
+ src/flac.c    | 13 +++++++++++++
+ src/sndfile.c |  1 +
+ 3 files changed, 15 insertions(+)
+
+diff --git a/src/common.h b/src/common.h
+index 0bd810c3..e2669b6a 100644
+--- a/src/common.h
++++ b/src/common.h
+@@ -725,6 +725,7 @@ enum
+ 	SFE_FLAC_INIT_DECODER,
+ 	SFE_FLAC_LOST_SYNC,
+ 	SFE_FLAC_BAD_SAMPLE_RATE,
++	SFE_FLAC_CHANNEL_COUNT_CHANGED,
+ 	SFE_FLAC_UNKOWN_ERROR,
+ 
+ 	SFE_WVE_NOT_WVE,
+diff --git a/src/flac.c b/src/flac.c
+index 84de0e26..986a7b8f 100644
+--- a/src/flac.c
++++ b/src/flac.c
+@@ -434,6 +434,19 @@ sf_flac_meta_callback (const FLAC__StreamDecoder * UNUSED (decoder), const FLAC_
+ 
+ 	switch (metadata->type)
+ 	{	case FLAC__METADATA_TYPE_STREAMINFO :
++			if (psf->sf.channels > 0 && psf->sf.channels != (int) metadata->data.stream_info.channels)
++			{	psf_log_printf (psf, "Error: FLAC stream changed from %d to %d channels\n"
++									"Nothing to be but to error out.\n" ,
++									psf->sf.channels, metadata->data.stream_info.channels) ;
++				psf->error = SFE_FLAC_CHANNEL_COUNT_CHANGED ;
++				return ;
++				} ;
++
++			if (psf->sf.channels > 0 && psf->sf.samplerate != (int) metadata->data.stream_info.sample_rate)
++			{	psf_log_printf (psf, "Warning: FLAC stream changed sample rates from %d to %d.\n"
++									"Carrying on as if nothing happened.",
++									psf->sf.samplerate, metadata->data.stream_info.sample_rate) ;
++				} ;
+ 			psf->sf.channels = metadata->data.stream_info.channels ;
+ 			psf->sf.samplerate = metadata->data.stream_info.sample_rate ;
+ 			psf->sf.frames = metadata->data.stream_info.total_samples ;
+diff --git a/src/sndfile.c b/src/sndfile.c
+index 41875610..e2a87be8 100644
+--- a/src/sndfile.c
++++ b/src/sndfile.c
+@@ -245,6 +245,7 @@ ErrorStruct SndfileErrors [] =
+ 	{	SFE_FLAC_INIT_DECODER	, "Error : problem with initialization of the flac decoder." },
+ 	{	SFE_FLAC_LOST_SYNC		, "Error : flac decoder lost sync." },
+ 	{	SFE_FLAC_BAD_SAMPLE_RATE, "Error : flac does not support this sample rate." },
++	{	SFE_FLAC_CHANNEL_COUNT_CHANGED, "Error : flac channel changed mid stream." },
+ 	{	SFE_FLAC_UNKOWN_ERROR	, "Error : unknown error in flac decoder." },
+ 
+ 	{	SFE_WVE_NOT_WVE			, "Error : not a WVE file." },
diff --git a/package/libsndfile/0008-src-flac.c-Fix-a-buffer-read-overflow.patch b/package/libsndfile/0008-src-flac.c-Fix-a-buffer-read-overflow.patch
new file mode 100644
index 0000000000..f716e26867
--- /dev/null
+++ b/package/libsndfile/0008-src-flac.c-Fix-a-buffer-read-overflow.patch
@@ -0,0 +1,54 @@
+From ef1dbb2df1c0e741486646de40bd638a9c4cd808 Mon Sep 17 00:00:00 2001
+From: Erik de Castro Lopo <erikd@mega-nerd.com>
+Date: Fri, 14 Apr 2017 15:19:16 +1000
+Subject: [PATCH] src/flac.c: Fix a buffer read overflow
+
+A file (generated by a fuzzer) which increased the number of channels
+from one frame to the next could cause a read beyond the end of the
+buffer provided by libFLAC. Only option is to abort the read.
+
+Closes: https://github.com/erikd/libsndfile/issues/231
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/erikd/libsndfile/commit/ef1dbb2df1c0e741486646de40bd638a9c4cd808]
+---
+ src/flac.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/src/flac.c b/src/flac.c
+index 5a4f8c21..e4f9aaa0 100644
+--- a/src/flac.c
++++ b/src/flac.c
+@@ -169,6 +169,14 @@ flac_buffer_copy (SF_PRIVATE *psf)
+ 	const int32_t* const *buffer = pflac->wbuffer ;
+ 	unsigned i = 0, j, offset, channels, len ;
+ 
++	if (psf->sf.channels != (int) frame->header.channels)
++	{	psf_log_printf (psf, "Error: FLAC frame changed from %d to %d channels\n"
++									"Nothing to do but to error out.\n" ,
++									psf->sf.channels, frame->header.channels) ;
++		psf->error = SFE_FLAC_CHANNEL_COUNT_CHANGED ;
++		return 0 ;
++		} ;
++
+ 	/*
+ 	**	frame->header.blocksize is variable and we're using a constant blocksize
+ 	**	of FLAC__MAX_BLOCK_SIZE.
+@@ -202,7 +210,6 @@ flac_buffer_copy (SF_PRIVATE *psf)
+ 		return 0 ;
+ 		} ;
+ 
+-
+ 	len = SF_MIN (pflac->len, frame->header.blocksize) ;
+ 
+ 	if (pflac->remain % channels != 0)
+@@ -436,7 +443,7 @@ sf_flac_meta_callback (const FLAC__StreamDecoder * UNUSED (decoder), const FLAC_
+ 	{	case FLAC__METADATA_TYPE_STREAMINFO :
+ 			if (psf->sf.channels > 0 && psf->sf.channels != (int) metadata->data.stream_info.channels)
+ 			{	psf_log_printf (psf, "Error: FLAC stream changed from %d to %d channels\n"
+-									"Nothing to be but to error out.\n" ,
++									"Nothing to do but to error out.\n" ,
+ 									psf->sf.channels, metadata->data.stream_info.channels) ;
+ 				psf->error = SFE_FLAC_CHANNEL_COUNT_CHANGED ;
+ 				return ;
diff --git a/package/libsndfile/0009-src-flac-c-Fix-another-memory-leak.patch b/package/libsndfile/0009-src-flac-c-Fix-another-memory-leak.patch
new file mode 100644
index 0000000000..788b9b5187
--- /dev/null
+++ b/package/libsndfile/0009-src-flac-c-Fix-another-memory-leak.patch
@@ -0,0 +1,32 @@
+From cd7da8dbf6ee4310d21d9e44b385d6797160d9e8 Mon Sep 17 00:00:00 2001
+From: Erik de Castro Lopo <erikd@mega-nerd.com>
+Date: Wed, 12 Apr 2017 20:19:34 +1000
+Subject: [PATCH] src/flac.c: Fix another memory leak
+
+When the FLAC decoder was passed a malformed file, the associated
+`FLAC__StreamDecoder` object was not getting released.
+
+Closes: https://github.com/erikd/libsndfile/issues/233
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/erikd/libsndfile/commit/cd7da8dbf6ee4310d21d9e44b385d6797160d9e8]
+---
+ src/flac.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/flac.c b/src/flac.c
+index 986a7b8f..5a4f8c21 100644
+--- a/src/flac.c
++++ b/src/flac.c
+@@ -841,7 +841,9 @@ flac_read_header (SF_PRIVATE *psf)
+ 
+ 	psf_log_printf (psf, "End\n") ;
+ 
+-	if (psf->error == 0)
++	if (psf->error != 0)
++		FLAC__stream_decoder_delete (pflac->fsd) ;
++	else
+ 	{	FLAC__uint64 position ;
+ 
+ 		FLAC__stream_decoder_get_decode_position (pflac->fsd, &position) ;
diff --git a/package/libsndfile/0010-src-common-c-Fix-heap-buffer-overflows-when-writing-strings-in.patch b/package/libsndfile/0010-src-common-c-Fix-heap-buffer-overflows-when-writing-strings-in.patch
new file mode 100644
index 0000000000..91aa36c9d6
--- /dev/null
+++ b/package/libsndfile/0010-src-common-c-Fix-heap-buffer-overflows-when-writing-strings-in.patch
@@ -0,0 +1,92 @@
+From cf7a8182c2642c50f1cf90dddea9ce96a8bad2e8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rn=20Heusipp?= <osmanx@problemloesungsmaschine.de>
+Date: Wed, 14 Jun 2017 12:25:40 +0200
+Subject: [PATCH] src/common.c: Fix heap buffer overflows when writing strings
+ in binheader
+
+Fixes the following problems:
+ 1. Case 's' only enlarges the buffer by 16 bytes instead of size bytes.
+ 2. psf_binheader_writef() enlarges the header buffer (if needed) prior to the
+    big switch statement by an amount (16 bytes) which is enough for all cases
+    where only a single value gets added. Cases 's', 'S', 'p' however
+    additionally write an arbitrary length block of data and again enlarge the
+    buffer to the required amount. However, the required space calculation does
+    not take into account the size of the length field which gets output before
+    the data.
+ 3. Buffer size requirement calculation in case 'S' does not account for the
+    padding byte ("size += (size & 1) ;" happens after the calculation which
+    uses "size").
+ 4. Case 'S' can overrun the header buffer by 1 byte when no padding is
+    involved
+    ("memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size + 1) ;" while
+    the buffer is only guaranteed to have "size" space available).
+ 5. "psf->header.ptr [psf->header.indx] = 0 ;" in case 'S' always writes 1 byte
+    beyond the space which is guaranteed to be allocated in the header buffer.
+ 6. Case 's' can overrun the provided source string by 1 byte if padding is
+    involved ("memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size) ;"
+    where "size" is "strlen (strptr) + 1" (which includes the 0 terminator,
+    plus optionally another 1 which is padding and not guaranteed to be
+    readable via the source string pointer).
+
+Closes: https://github.com/erikd/libsndfile/issues/292
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/erikd/libsndfile/commit/cf7a8182c2642c50f1cf90dddea9ce96a8bad2e8]
+---
+ src/common.c | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/src/common.c b/src/common.c
+index 1a6204ca..6b2a2ee9 100644
+--- a/src/common.c
++++ b/src/common.c
+@@ -681,16 +681,16 @@ psf_binheader_writef (SF_PRIVATE *psf, const char *format, ...)
+ 					/* Write a C string (guaranteed to have a zero terminator). */
+ 					strptr = va_arg (argptr, char *) ;
+ 					size = strlen (strptr) + 1 ;
+-					size += (size & 1) ;
+ 
+-					if (psf->header.indx + (sf_count_t) size >= psf->header.len && psf_bump_header_allocation (psf, 16))
++					if (psf->header.indx + 4 + (sf_count_t) size + (sf_count_t) (size & 1) > psf->header.len && psf_bump_header_allocation (psf, 4 + size + (size & 1)))
+ 						return count ;
+ 
+ 					if (psf->rwf_endian == SF_ENDIAN_BIG)
+-						header_put_be_int (psf, size) ;
++						header_put_be_int (psf, size + (size & 1)) ;
+ 					else
+-						header_put_le_int (psf, size) ;
++						header_put_le_int (psf, size + (size & 1)) ;
+ 					memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size) ;
++					size += (size & 1) ;
+ 					psf->header.indx += size ;
+ 					psf->header.ptr [psf->header.indx - 1] = 0 ;
+ 					count += 4 + size ;
+@@ -703,16 +703,15 @@ psf_binheader_writef (SF_PRIVATE *psf, const char *format, ...)
+ 					*/
+ 					strptr = va_arg (argptr, char *) ;
+ 					size = strlen (strptr) ;
+-					if (psf->header.indx + (sf_count_t) size > psf->header.len && psf_bump_header_allocation (psf, size))
++					if (psf->header.indx + 4 + (sf_count_t) size + (sf_count_t) (size & 1) > psf->header.len && psf_bump_header_allocation (psf, 4 + size + (size & 1)))
+ 						return count ;
+ 					if (psf->rwf_endian == SF_ENDIAN_BIG)
+ 						header_put_be_int (psf, size) ;
+ 					else
+ 						header_put_le_int (psf, size) ;
+-					memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size + 1) ;
++					memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size + (size & 1)) ;
+ 					size += (size & 1) ;
+ 					psf->header.indx += size ;
+-					psf->header.ptr [psf->header.indx] = 0 ;
+ 					count += 4 + size ;
+ 					break ;
+ 
+@@ -724,7 +723,7 @@ psf_binheader_writef (SF_PRIVATE *psf, const char *format, ...)
+ 					size = (size & 1) ? size : size + 1 ;
+ 					size = (size > 254) ? 254 : size ;
+ 
+-					if (psf->header.indx + (sf_count_t) size > psf->header.len && psf_bump_header_allocation (psf, size))
++					if (psf->header.indx + 1 + (sf_count_t) size > psf->header.len && psf_bump_header_allocation (psf, 1 + size))
+ 						return count ;
+ 
+ 					header_put_byte (psf, size) ;
