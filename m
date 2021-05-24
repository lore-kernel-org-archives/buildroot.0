From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 14:17:37 +0200
Subject: [Buildroot] [git commit] package/libsndfile: bump to version 1.0.31
Message-ID: <20210607144657.64212814AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c600fda64f48c16d20588336dd7ac6a32241c6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to github to get latest release
- Drop all patches (already in version)
- Update indentation in hash file (two spaces)

https://github.com/libsndfile/libsndfile/releases/tag/1.0.31

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...it-Check-psf-sf.channels-against-upper-bo.patch | 39 ---------
 ...heck-MAX_CHANNELS-in-sndfile-deinterleave.patch | 36 --------
 ...-a-ulaw-fix-multiple-buffer-overflows-432.patch | 96 ----------------------
 .../0004-src-wav.c-Fix-heap-read-overflow.patch    | 35 --------
 ...rite_header-don-t-read-past-the-array-end.patch | 33 --------
 ...006-src-aiff.c-Fix-a-buffer-read-overflow.patch | 29 -------
 .../0007-FLAC-Fix-a-buffer-read-overrun.patch      | 68 ---------------
 ...008-src-flac.c-Fix-a-buffer-read-overflow.patch | 54 ------------
 .../0009-src-flac-c-Fix-another-memory-leak.patch  | 32 --------
 ...-buffer-overflows-when-writing-strings-in.patch | 92 ---------------------
 package/libsndfile/libsndfile.hash                 |  4 +-
 package/libsndfile/libsndfile.mk                   | 27 +-----
 12 files changed, 5 insertions(+), 540 deletions(-)

diff --git a/package/libsndfile/0001-double64_init-Check-psf-sf.channels-against-upper-bo.patch b/package/libsndfile/0001-double64_init-Check-psf-sf.channels-against-upper-bo.patch
deleted file mode 100644
index 59ba8f85f6..0000000000
--- a/package/libsndfile/0001-double64_init-Check-psf-sf.channels-against-upper-bo.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 85c877d5072866aadbe8ed0c3e0590fbb5e16788 Mon Sep 17 00:00:00 2001
-From: Fabian Greffrath <fabian@greffrath.com>
-Date: Thu, 28 Sep 2017 12:15:04 +0200
-Subject: [PATCH] double64_init: Check psf->sf.channels against upper bound
-
-This prevents division by zero later in the code.
-
-While the trivial case to catch this (i.e. sf.channels < 1) has already
-been covered, a crafted file may report a number of channels that is
-so high (i.e. > INT_MAX/sizeof(double)) that it "somehow" gets
-miscalculated to zero (if this makes sense) in the determination of the
-blockwidth. Since we only support a limited number of channels anyway,
-make sure to check here as well.
-
-CVE-2017-14634
-
-Closes: https://github.com/erikd/libsndfile/issues/318
-Signed-off-by: Erik de Castro Lopo <erikd@mega-nerd.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/double64.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/double64.c b/src/double64.c
-index b318ea86..78dfef7f 100644
---- a/src/double64.c
-+++ b/src/double64.c
-@@ -91,7 +91,7 @@ int
- double64_init	(SF_PRIVATE *psf)
- {	static int double64_caps ;
- 
--	if (psf->sf.channels < 1)
-+	if (psf->sf.channels < 1 || psf->sf.channels > SF_MAX_CHANNELS)
- 	{	psf_log_printf (psf, "double64_init : internal error : channels = %d\n", psf->sf.channels) ;
- 		return SFE_INTERNAL ;
- 		} ;
--- 
-2.11.0
-
diff --git a/package/libsndfile/0002-Check-MAX_CHANNELS-in-sndfile-deinterleave.patch b/package/libsndfile/0002-Check-MAX_CHANNELS-in-sndfile-deinterleave.patch
deleted file mode 100644
index 3b828de6ac..0000000000
--- a/package/libsndfile/0002-Check-MAX_CHANNELS-in-sndfile-deinterleave.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From aaea680337267bfb6d2544da878890ee7f1c5077 Mon Sep 17 00:00:00 2001
-From: "Brett T. Warden" <brett.t.warden@intel.com>
-Date: Tue, 28 Aug 2018 12:01:17 -0700
-Subject: [PATCH] Check MAX_CHANNELS in sndfile-deinterleave
-
-Allocated buffer has space for only 16 channels. Verify that input file
-meets this limit.
-
-Fixes #397
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- programs/sndfile-deinterleave.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/programs/sndfile-deinterleave.c b/programs/sndfile-deinterleave.c
-index 53660310..225b4d54 100644
---- a/programs/sndfile-deinterleave.c
-+++ b/programs/sndfile-deinterleave.c
-@@ -89,6 +89,13 @@ main (int argc, char **argv)
- 		exit (1) ;
- 		} ;
- 
-+	if (sfinfo.channels > MAX_CHANNELS)
-+	{	printf ("\nError : Input file '%s' has too many (%d) channels. Limit is %d.\n",
-+			argv [1], sfinfo.channels, MAX_CHANNELS) ;
-+		exit (1) ;
-+		} ;
-+
-+
- 	state.channels = sfinfo.channels ;
- 	sfinfo.channels = 1 ;
- 
--- 
-2.11.0
-
diff --git a/package/libsndfile/0003-a-ulaw-fix-multiple-buffer-overflows-432.patch b/package/libsndfile/0003-a-ulaw-fix-multiple-buffer-overflows-432.patch
deleted file mode 100644
index 536bad2678..0000000000
--- a/package/libsndfile/0003-a-ulaw-fix-multiple-buffer-overflows-432.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 8ddc442d539ca775d80cdbc7af17a718634a743f Mon Sep 17 00:00:00 2001
-From: Hugo Lefeuvre <hle@owl.eu.com>
-Date: Mon, 24 Dec 2018 06:43:48 +0100
-Subject: [PATCH] a/ulaw: fix multiple buffer overflows (#432)
-
-i2ulaw_array() and i2alaw_array() fail to handle ptr [count] = INT_MIN
-properly, leading to buffer underflow. INT_MIN is a special value
-since - INT_MIN cannot be represented as int.
-
-In this case round - INT_MIN to INT_MAX and proceed as usual.
-
-f2ulaw_array() and f2alaw_array() fail to handle ptr [count] = NaN
-properly, leading to null pointer dereference.
-
-In this case, arbitrarily set the buffer value to 0.
-
-This commit fixes #429 (CVE-2018-19661 and CVE-2018-19662) and
-fixes #344 (CVE-2017-17456 and CVE-2017-17457).
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/alaw.c | 9 +++++++--
- src/ulaw.c | 9 +++++++--
- 2 files changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/src/alaw.c b/src/alaw.c
-index 063fd1a2..4220224c 100644
---- a/src/alaw.c
-+++ b/src/alaw.c
-@@ -19,6 +19,7 @@
- #include	"sfconfig.h"
- 
- #include	<math.h>
-+#include	<limits.h>
- 
- #include	"sndfile.h"
- #include	"common.h"
-@@ -326,7 +327,9 @@ s2alaw_array (const short *ptr, int count, unsigned char *buffer)
- static inline void
- i2alaw_array (const int *ptr, int count, unsigned char *buffer)
- {	while (--count >= 0)
--	{	if (ptr [count] >= 0)
-+	{	if (ptr [count] == INT_MIN)
-+			buffer [count] = alaw_encode [INT_MAX >> (16 + 4)] ;
-+		else if (ptr [count] >= 0)
- 			buffer [count] = alaw_encode [ptr [count] >> (16 + 4)] ;
- 		else
- 			buffer [count] = 0x7F & alaw_encode [- ptr [count] >> (16 + 4)] ;
-@@ -346,7 +349,9 @@ f2alaw_array (const float *ptr, int count, unsigned char *buffer, float normfact
- static inline void
- d2alaw_array (const double *ptr, int count, unsigned char *buffer, double normfact)
- {	while (--count >= 0)
--	{	if (ptr [count] >= 0)
-+	{	if (!isfinite (ptr [count]))
-+			buffer [count] = 0 ;
-+		else if (ptr [count] >= 0)
- 			buffer [count] = alaw_encode [lrint (normfact * ptr [count])] ;
- 		else
- 			buffer [count] = 0x7F & alaw_encode [- lrint (normfact * ptr [count])] ;
-diff --git a/src/ulaw.c b/src/ulaw.c
-index e50b4cb5..b6070ade 100644
---- a/src/ulaw.c
-+++ b/src/ulaw.c
-@@ -19,6 +19,7 @@
- #include	"sfconfig.h"
- 
- #include	<math.h>
-+#include	<limits.h>
- 
- #include	"sndfile.h"
- #include	"common.h"
-@@ -827,7 +828,9 @@ s2ulaw_array (const short *ptr, int count, unsigned char *buffer)
- static inline void
- i2ulaw_array (const int *ptr, int count, unsigned char *buffer)
- {	while (--count >= 0)
--	{	if (ptr [count] >= 0)
-+	{	if (ptr [count] == INT_MIN)
-+			buffer [count] = ulaw_encode [INT_MAX >> (16 + 2)] ;
-+		else if (ptr [count] >= 0)
- 			buffer [count] = ulaw_encode [ptr [count] >> (16 + 2)] ;
- 		else
- 			buffer [count] = 0x7F & ulaw_encode [-ptr [count] >> (16 + 2)] ;
-@@ -847,7 +850,9 @@ f2ulaw_array (const float *ptr, int count, unsigned char *buffer, float normfact
- static inline void
- d2ulaw_array (const double *ptr, int count, unsigned char *buffer, double normfact)
- {	while (--count >= 0)
--	{	if (ptr [count] >= 0)
-+	{	if (!isfinite (ptr [count]))
-+			buffer [count] = 0 ;
-+		else if (ptr [count] >= 0)
- 			buffer [count] = ulaw_encode [lrint (normfact * ptr [count])] ;
- 		else
- 			buffer [count] = 0x7F & ulaw_encode [- lrint (normfact * ptr [count])] ;
--- 
-2.11.0
-
diff --git a/package/libsndfile/0004-src-wav.c-Fix-heap-read-overflow.patch b/package/libsndfile/0004-src-wav.c-Fix-heap-read-overflow.patch
deleted file mode 100644
index 2e730ca3fa..0000000000
--- a/package/libsndfile/0004-src-wav.c-Fix-heap-read-overflow.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 42132c543358cee9f7c3e9e9b15bb6c1063a608e Mon Sep 17 00:00:00 2001
-From: Erik de Castro Lopo <erikd@mega-nerd.com>
-Date: Tue, 1 Jan 2019 20:11:46 +1100
-Subject: [PATCH] src/wav.c: Fix heap read overflow
-
-This is CVE-2018-19758.
-
-Closes: https://github.com/erikd/libsndfile/issues/435
-[Retrieved (and backported) from:
-https://github.com/erikd/libsndfile/commit/42132c543358cee9f7c3e9e9b15bb6c1063a608e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/wav.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/wav.c b/src/wav.c
-index 9d71aadb..5c825f2a 100644
---- a/src/wav.c
-+++ b/src/wav.c
-@@ -1,5 +1,5 @@
- /*
--** Copyright (C) 1999-2016 Erik de Castro Lopo <erikd@mega-nerd.com>
-+** Copyright (C) 1999-2019 Erik de Castro Lopo <erikd@mega-nerd.com>
- ** Copyright (C) 2004-2005 David Viens <davidv@plogue.com>
- **
- ** This program is free software; you can redistribute it and/or modify
-@@ -1146,6 +1146,8 @@ wav_write_header (SF_PRIVATE *psf, int calc_length)
- 		psf_binheader_writef (psf, "44", BHW4 (0), BHW4 (0)) ; /* SMTPE format */
- 		psf_binheader_writef (psf, "44", BHW4 (psf->instrument->loop_count), BHW4 (0)) ;
- 
-+		/* Loop count is signed 16 bit number so we limit it range to something sensible. */
-+		psf->instrument->loop_count &= 0x7fff ;
- 		for (tmp = 0 ; tmp < psf->instrument->loop_count ; tmp++)
- 		{	int type ;
- 
diff --git a/package/libsndfile/0005-wav_write_header-don-t-read-past-the-array-end.patch b/package/libsndfile/0005-wav_write_header-don-t-read-past-the-array-end.patch
deleted file mode 100644
index e958517808..0000000000
--- a/package/libsndfile/0005-wav_write_header-don-t-read-past-the-array-end.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 6d7ce94c020cc720a6b28719d1a7879181790008 Mon Sep 17 00:00:00 2001
-From: Emilio Pozuelo Monfort <pochu27@gmail.com>
-Date: Tue, 5 Mar 2019 11:27:17 +0100
-Subject: [PATCH] wav_write_header: don't read past the array end
-
-If loop_count is bigger than the array, truncate it to the array
-length (and not to 32k).
-
-CVE-2019-3832
-[Retrieved from:
-https://github.com/erikd/libsndfile/commit/6d7ce94c020cc720a6b28719d1a7879181790008]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/wav.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/wav.c b/src/wav.c
-index 5c825f2a..104bd0a7 100644
---- a/src/wav.c
-+++ b/src/wav.c
-@@ -1146,8 +1146,10 @@ wav_write_header (SF_PRIVATE *psf, int calc_length)
- 		psf_binheader_writef (psf, "44", BHW4 (0), BHW4 (0)) ; /* SMTPE format */
- 		psf_binheader_writef (psf, "44", BHW4 (psf->instrument->loop_count), BHW4 (0)) ;
- 
--		/* Loop count is signed 16 bit number so we limit it range to something sensible. */
--		psf->instrument->loop_count &= 0x7fff ;
-+		/* Make sure we don't read past the loops array end. */
-+		if (psf->instrument->loop_count > ARRAY_LEN (psf->instrument->loops))
-+			psf->instrument->loop_count = ARRAY_LEN (psf->instrument->loops) ;
-+
- 		for (tmp = 0 ; tmp < psf->instrument->loop_count ; tmp++)
- 		{	int type ;
- 
diff --git a/package/libsndfile/0006-src-aiff.c-Fix-a-buffer-read-overflow.patch b/package/libsndfile/0006-src-aiff.c-Fix-a-buffer-read-overflow.patch
deleted file mode 100644
index 68b9e8ed67..0000000000
--- a/package/libsndfile/0006-src-aiff.c-Fix-a-buffer-read-overflow.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From f833c53cb596e9e1792949f762e0b33661822748 Mon Sep 17 00:00:00 2001
-From: Erik de Castro Lopo <erikd@mega-nerd.com>
-Date: Tue, 23 May 2017 20:15:24 +1000
-Subject: [PATCH] src/aiff.c: Fix a buffer read overflow
-
-Secunia Advisory SA76717.
-
-Found by: Laurent Delosieres, Secunia Research at Flexera Software
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/erikd/libsndfile/commit/f833c53cb596e9e1792949f762e0b33661822748]
----
- src/aiff.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/aiff.c b/src/aiff.c
-index 5b5f9f53..45864b76 100644
---- a/src/aiff.c
-+++ b/src/aiff.c
-@@ -1759,7 +1759,7 @@ aiff_read_chanmap (SF_PRIVATE * psf, unsigned dword)
- 		psf_binheader_readf (psf, "j", dword - bytesread) ;
- 
- 	if (map_info->channel_map != NULL)
--	{	size_t chanmap_size = psf->sf.channels * sizeof (psf->channel_map [0]) ;
-+	{	size_t chanmap_size = SF_MIN (psf->sf.channels, layout_tag & 0xffff) * sizeof (psf->channel_map [0]) ;
- 
- 		free (psf->channel_map) ;
- 
diff --git a/package/libsndfile/0007-FLAC-Fix-a-buffer-read-overrun.patch b/package/libsndfile/0007-FLAC-Fix-a-buffer-read-overrun.patch
deleted file mode 100644
index b000143b70..0000000000
--- a/package/libsndfile/0007-FLAC-Fix-a-buffer-read-overrun.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From fd0484aba8e51d16af1e3a880f9b8b857b385eb3 Mon Sep 17 00:00:00 2001
-From: Erik de Castro Lopo <erikd@mega-nerd.com>
-Date: Wed, 12 Apr 2017 19:45:30 +1000
-Subject: [PATCH] FLAC: Fix a buffer read overrun
-
-Buffer read overrun occurs when reading a FLAC file that switches
-from 2 channels to one channel mid-stream. Only option is to
-abort the read.
-
-Closes: https://github.com/erikd/libsndfile/issues/230
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/erikd/libsndfile/commit/fd0484aba8e51d16af1e3a880f9b8b857b385eb3]
----
- src/common.h  |  1 +
- src/flac.c    | 13 +++++++++++++
- src/sndfile.c |  1 +
- 3 files changed, 15 insertions(+)
-
-diff --git a/src/common.h b/src/common.h
-index 0bd810c3..e2669b6a 100644
---- a/src/common.h
-+++ b/src/common.h
-@@ -725,6 +725,7 @@ enum
- 	SFE_FLAC_INIT_DECODER,
- 	SFE_FLAC_LOST_SYNC,
- 	SFE_FLAC_BAD_SAMPLE_RATE,
-+	SFE_FLAC_CHANNEL_COUNT_CHANGED,
- 	SFE_FLAC_UNKOWN_ERROR,
- 
- 	SFE_WVE_NOT_WVE,
-diff --git a/src/flac.c b/src/flac.c
-index 84de0e26..986a7b8f 100644
---- a/src/flac.c
-+++ b/src/flac.c
-@@ -434,6 +434,19 @@ sf_flac_meta_callback (const FLAC__StreamDecoder * UNUSED (decoder), const FLAC_
- 
- 	switch (metadata->type)
- 	{	case FLAC__METADATA_TYPE_STREAMINFO :
-+			if (psf->sf.channels > 0 && psf->sf.channels != (int) metadata->data.stream_info.channels)
-+			{	psf_log_printf (psf, "Error: FLAC stream changed from %d to %d channels\n"
-+									"Nothing to be but to error out.\n" ,
-+									psf->sf.channels, metadata->data.stream_info.channels) ;
-+				psf->error = SFE_FLAC_CHANNEL_COUNT_CHANGED ;
-+				return ;
-+				} ;
-+
-+			if (psf->sf.channels > 0 && psf->sf.samplerate != (int) metadata->data.stream_info.sample_rate)
-+			{	psf_log_printf (psf, "Warning: FLAC stream changed sample rates from %d to %d.\n"
-+									"Carrying on as if nothing happened.",
-+									psf->sf.samplerate, metadata->data.stream_info.sample_rate) ;
-+				} ;
- 			psf->sf.channels = metadata->data.stream_info.channels ;
- 			psf->sf.samplerate = metadata->data.stream_info.sample_rate ;
- 			psf->sf.frames = metadata->data.stream_info.total_samples ;
-diff --git a/src/sndfile.c b/src/sndfile.c
-index 41875610..e2a87be8 100644
---- a/src/sndfile.c
-+++ b/src/sndfile.c
-@@ -245,6 +245,7 @@ ErrorStruct SndfileErrors [] =
- 	{	SFE_FLAC_INIT_DECODER	, "Error : problem with initialization of the flac decoder." },
- 	{	SFE_FLAC_LOST_SYNC		, "Error : flac decoder lost sync." },
- 	{	SFE_FLAC_BAD_SAMPLE_RATE, "Error : flac does not support this sample rate." },
-+	{	SFE_FLAC_CHANNEL_COUNT_CHANGED, "Error : flac channel changed mid stream." },
- 	{	SFE_FLAC_UNKOWN_ERROR	, "Error : unknown error in flac decoder." },
- 
- 	{	SFE_WVE_NOT_WVE			, "Error : not a WVE file." },
diff --git a/package/libsndfile/0008-src-flac.c-Fix-a-buffer-read-overflow.patch b/package/libsndfile/0008-src-flac.c-Fix-a-buffer-read-overflow.patch
deleted file mode 100644
index f716e26867..0000000000
--- a/package/libsndfile/0008-src-flac.c-Fix-a-buffer-read-overflow.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From ef1dbb2df1c0e741486646de40bd638a9c4cd808 Mon Sep 17 00:00:00 2001
-From: Erik de Castro Lopo <erikd@mega-nerd.com>
-Date: Fri, 14 Apr 2017 15:19:16 +1000
-Subject: [PATCH] src/flac.c: Fix a buffer read overflow
-
-A file (generated by a fuzzer) which increased the number of channels
-from one frame to the next could cause a read beyond the end of the
-buffer provided by libFLAC. Only option is to abort the read.
-
-Closes: https://github.com/erikd/libsndfile/issues/231
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/erikd/libsndfile/commit/ef1dbb2df1c0e741486646de40bd638a9c4cd808]
----
- src/flac.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/src/flac.c b/src/flac.c
-index 5a4f8c21..e4f9aaa0 100644
---- a/src/flac.c
-+++ b/src/flac.c
-@@ -169,6 +169,14 @@ flac_buffer_copy (SF_PRIVATE *psf)
- 	const int32_t* const *buffer = pflac->wbuffer ;
- 	unsigned i = 0, j, offset, channels, len ;
- 
-+	if (psf->sf.channels != (int) frame->header.channels)
-+	{	psf_log_printf (psf, "Error: FLAC frame changed from %d to %d channels\n"
-+									"Nothing to do but to error out.\n" ,
-+									psf->sf.channels, frame->header.channels) ;
-+		psf->error = SFE_FLAC_CHANNEL_COUNT_CHANGED ;
-+		return 0 ;
-+		} ;
-+
- 	/*
- 	**	frame->header.blocksize is variable and we're using a constant blocksize
- 	**	of FLAC__MAX_BLOCK_SIZE.
-@@ -202,7 +210,6 @@ flac_buffer_copy (SF_PRIVATE *psf)
- 		return 0 ;
- 		} ;
- 
--
- 	len = SF_MIN (pflac->len, frame->header.blocksize) ;
- 
- 	if (pflac->remain % channels != 0)
-@@ -436,7 +443,7 @@ sf_flac_meta_callback (const FLAC__StreamDecoder * UNUSED (decoder), const FLAC_
- 	{	case FLAC__METADATA_TYPE_STREAMINFO :
- 			if (psf->sf.channels > 0 && psf->sf.channels != (int) metadata->data.stream_info.channels)
- 			{	psf_log_printf (psf, "Error: FLAC stream changed from %d to %d channels\n"
--									"Nothing to be but to error out.\n" ,
-+									"Nothing to do but to error out.\n" ,
- 									psf->sf.channels, metadata->data.stream_info.channels) ;
- 				psf->error = SFE_FLAC_CHANNEL_COUNT_CHANGED ;
- 				return ;
diff --git a/package/libsndfile/0009-src-flac-c-Fix-another-memory-leak.patch b/package/libsndfile/0009-src-flac-c-Fix-another-memory-leak.patch
deleted file mode 100644
index 788b9b5187..0000000000
--- a/package/libsndfile/0009-src-flac-c-Fix-another-memory-leak.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From cd7da8dbf6ee4310d21d9e44b385d6797160d9e8 Mon Sep 17 00:00:00 2001
-From: Erik de Castro Lopo <erikd@mega-nerd.com>
-Date: Wed, 12 Apr 2017 20:19:34 +1000
-Subject: [PATCH] src/flac.c: Fix another memory leak
-
-When the FLAC decoder was passed a malformed file, the associated
-`FLAC__StreamDecoder` object was not getting released.
-
-Closes: https://github.com/erikd/libsndfile/issues/233
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/erikd/libsndfile/commit/cd7da8dbf6ee4310d21d9e44b385d6797160d9e8]
----
- src/flac.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/flac.c b/src/flac.c
-index 986a7b8f..5a4f8c21 100644
---- a/src/flac.c
-+++ b/src/flac.c
-@@ -841,7 +841,9 @@ flac_read_header (SF_PRIVATE *psf)
- 
- 	psf_log_printf (psf, "End\n") ;
- 
--	if (psf->error == 0)
-+	if (psf->error != 0)
-+		FLAC__stream_decoder_delete (pflac->fsd) ;
-+	else
- 	{	FLAC__uint64 position ;
- 
- 		FLAC__stream_decoder_get_decode_position (pflac->fsd, &position) ;
diff --git a/package/libsndfile/0010-src-common-c-Fix-heap-buffer-overflows-when-writing-strings-in.patch b/package/libsndfile/0010-src-common-c-Fix-heap-buffer-overflows-when-writing-strings-in.patch
deleted file mode 100644
index 91aa36c9d6..0000000000
--- a/package/libsndfile/0010-src-common-c-Fix-heap-buffer-overflows-when-writing-strings-in.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From cf7a8182c2642c50f1cf90dddea9ce96a8bad2e8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rn=20Heusipp?= <osmanx@problemloesungsmaschine.de>
-Date: Wed, 14 Jun 2017 12:25:40 +0200
-Subject: [PATCH] src/common.c: Fix heap buffer overflows when writing strings
- in binheader
-
-Fixes the following problems:
- 1. Case 's' only enlarges the buffer by 16 bytes instead of size bytes.
- 2. psf_binheader_writef() enlarges the header buffer (if needed) prior to the
-    big switch statement by an amount (16 bytes) which is enough for all cases
-    where only a single value gets added. Cases 's', 'S', 'p' however
-    additionally write an arbitrary length block of data and again enlarge the
-    buffer to the required amount. However, the required space calculation does
-    not take into account the size of the length field which gets output before
-    the data.
- 3. Buffer size requirement calculation in case 'S' does not account for the
-    padding byte ("size += (size & 1) ;" happens after the calculation which
-    uses "size").
- 4. Case 'S' can overrun the header buffer by 1 byte when no padding is
-    involved
-    ("memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size + 1) ;" while
-    the buffer is only guaranteed to have "size" space available).
- 5. "psf->header.ptr [psf->header.indx] = 0 ;" in case 'S' always writes 1 byte
-    beyond the space which is guaranteed to be allocated in the header buffer.
- 6. Case 's' can overrun the provided source string by 1 byte if padding is
-    involved ("memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size) ;"
-    where "size" is "strlen (strptr) + 1" (which includes the 0 terminator,
-    plus optionally another 1 which is padding and not guaranteed to be
-    readable via the source string pointer).
-
-Closes: https://github.com/erikd/libsndfile/issues/292
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/erikd/libsndfile/commit/cf7a8182c2642c50f1cf90dddea9ce96a8bad2e8]
----
- src/common.c | 15 +++++++--------
- 1 file changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/src/common.c b/src/common.c
-index 1a6204ca..6b2a2ee9 100644
---- a/src/common.c
-+++ b/src/common.c
-@@ -681,16 +681,16 @@ psf_binheader_writef (SF_PRIVATE *psf, const char *format, ...)
- 					/* Write a C string (guaranteed to have a zero terminator). */
- 					strptr = va_arg (argptr, char *) ;
- 					size = strlen (strptr) + 1 ;
--					size += (size & 1) ;
- 
--					if (psf->header.indx + (sf_count_t) size >= psf->header.len && psf_bump_header_allocation (psf, 16))
-+					if (psf->header.indx + 4 + (sf_count_t) size + (sf_count_t) (size & 1) > psf->header.len && psf_bump_header_allocation (psf, 4 + size + (size & 1)))
- 						return count ;
- 
- 					if (psf->rwf_endian == SF_ENDIAN_BIG)
--						header_put_be_int (psf, size) ;
-+						header_put_be_int (psf, size + (size & 1)) ;
- 					else
--						header_put_le_int (psf, size) ;
-+						header_put_le_int (psf, size + (size & 1)) ;
- 					memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size) ;
-+					size += (size & 1) ;
- 					psf->header.indx += size ;
- 					psf->header.ptr [psf->header.indx - 1] = 0 ;
- 					count += 4 + size ;
-@@ -703,16 +703,15 @@ psf_binheader_writef (SF_PRIVATE *psf, const char *format, ...)
- 					*/
- 					strptr = va_arg (argptr, char *) ;
- 					size = strlen (strptr) ;
--					if (psf->header.indx + (sf_count_t) size > psf->header.len && psf_bump_header_allocation (psf, size))
-+					if (psf->header.indx + 4 + (sf_count_t) size + (sf_count_t) (size & 1) > psf->header.len && psf_bump_header_allocation (psf, 4 + size + (size & 1)))
- 						return count ;
- 					if (psf->rwf_endian == SF_ENDIAN_BIG)
- 						header_put_be_int (psf, size) ;
- 					else
- 						header_put_le_int (psf, size) ;
--					memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size + 1) ;
-+					memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size + (size & 1)) ;
- 					size += (size & 1) ;
- 					psf->header.indx += size ;
--					psf->header.ptr [psf->header.indx] = 0 ;
- 					count += 4 + size ;
- 					break ;
- 
-@@ -724,7 +723,7 @@ psf_binheader_writef (SF_PRIVATE *psf, const char *format, ...)
- 					size = (size & 1) ? size : size + 1 ;
- 					size = (size > 254) ? 254 : size ;
- 
--					if (psf->header.indx + (sf_count_t) size > psf->header.len && psf_bump_header_allocation (psf, size))
-+					if (psf->header.indx + 1 + (sf_count_t) size > psf->header.len && psf_bump_header_allocation (psf, 1 + size))
- 						return count ;
- 
- 					header_put_byte (psf, size) ;
diff --git a/package/libsndfile/libsndfile.hash b/package/libsndfile/libsndfile.hash
index c744a7675a..14dfe823f9 100644
--- a/package/libsndfile/libsndfile.hash
+++ b/package/libsndfile/libsndfile.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	1ff33929f042fa333aed1e8923aa628c3ee9e1eb85512686c55092d1e5a9dfa9	libsndfile-1.0.28.tar.gz
+sha256  a8cfb1c09ea6e90eff4ca87322d4168cdbe5035cb48717b40bf77e751cc02163  libsndfile-1.0.31.tar.bz2
 # Locally calculated
-sha256	ad01ea5cd2755f6048383c8d54c88459cd6fcb17757c5c8892f8c5ea060f6140	COPYING
+sha256  ad01ea5cd2755f6048383c8d54c88459cd6fcb17757c5c8892f8c5ea060f6140  COPYING
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index eb15426146..2505e8d17f 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -4,37 +4,16 @@
 #
 ################################################################################
 
-LIBSNDFILE_VERSION = 1.0.28
-LIBSNDFILE_SITE = http://www.mega-nerd.com/libsndfile/files
+LIBSNDFILE_VERSION = 1.0.31
+LIBSNDFILE_SOURCE = libsndfile-$(LIBSNDFILE_VERSION).tar.bz2
+LIBSNDFILE_SITE = https://github.com/libsndfile/libsndfile/releases/download/$(LIBSNDFILE_VERSION)
 LIBSNDFILE_INSTALL_STAGING = YES
 LIBSNDFILE_LICENSE = LGPL-2.1+
 LIBSNDFILE_LICENSE_FILES = COPYING
 LIBSNDFILE_CPE_ID_VENDOR = libsndfile_project
 
-# 0001-double64_init-Check-psf-sf.channels-against-upper-bo.patch
-LIBSNDFILE_IGNORE_CVES += CVE-2017-14634
-# 0002-Check-MAX_CHANNELS-in-sndfile-deinterleave.patch
-LIBSNDFILE_IGNORE_CVES += CVE-2018-13139 CVE-2018-19432
-# 0003-a-ulaw-fix-multiple-buffer-overflows-432.patch
-LIBSNDFILE_IGNORE_CVES += \
-	CVE-2017-14245 CVE-2017-14246 CVE-2017-17456 CVE-2017-17457 \
-	CVE-2018-19661 CVE-2018-19662
 # disputed, https://github.com/erikd/libsndfile/issues/398
 LIBSNDFILE_IGNORE_CVES += CVE-2018-13419
-# 0004-src-wav.c-Fix-heap-read-overflow.patch
-LIBSNDFILE_IGNORE_CVES += CVE-2018-19758
-# 0005-wav_write_header-don-t-read-past-the-array-end.patch
-LIBSNDFILE_IGNORE_CVES += CVE-2019-3832
-# 0006-src-aiff.c-Fix-a-buffer-read-overflow.patch
-LIBSNDFILE_IGNORE_CVES += CVE-2017-6892
-# 0007-FLAC-Fix-a-buffer-read-overrun.patch
-LIBSNDFILE_IGNORE_CVES += CVE-2017-8361
-# 0008-src-flac.c-Fix-a-buffer-read-overflow.patch
-LIBSNDFILE_IGNORE_CVES += CVE-2017-8362 CVE-2017-8365
-# 0009-src-flac-c-Fix-another-memory-leak.patch
-LIBSNDFILE_IGNORE_CVES += CVE-2017-8363
-# 0010-src-common-c-Fix-heap-buffer-overflows-when-writing-strings-in.patch
-LIBSNDFILE_IGNORE_CVES += CVE-2017-12562
 
 LIBSNDFILE_CONF_OPTS = \
 	--disable-sqlite \
