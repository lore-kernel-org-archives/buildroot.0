Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58810C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEF8D4F743;
	Fri, 28 Feb 2025 16:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-qelfsVaRBb; Fri, 28 Feb 2025 16:41:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A2B742EC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A2B742EC4;
	Fri, 28 Feb 2025 16:41:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11B4568
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75CE042645
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqOfZrUJgatQ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1819A41E86
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1819A41E86
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FD8A820F8; Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Dec 2024 22:29:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a60c38b381bbb46094f57fe1c252df962fab6673
X-Git-Newrev: e675ffd964d65067bb115ee1e770ee44ba073958
X-Patchwork-Hint: ignore
Message-Id: <20250228162942.0FD8A820F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsndfile: add
 upstream post-1.2.2 security fixes
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e675ffd964d65067bb115ee1e770ee44ba073958
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following security vulnerabilities:

CVE-2022-33065: Multiple signed integers overflow in function au_read_header
in src/au.c and in functions mat4_open and mat4_read_header in src/mat4.c in
Libsndfile, allows an attacker to cause Denial of Service or other
unspecified impacts.

CVE-2024-50612: libsndfile through 1.2.2 has an ogg_vorbis.c
vorbis_analysis_wrote out-of-bounds read.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...5-fix-int-overflow-in-dataend-calculation.patch |  45 +++
 ...d-int-overflow-while-calculating-data_end.patch |  58 +++
 ...3-avr-fix-int-overflow-in-avr_read_header.patch |  34 ++
 ...t-overflow-warning-in-sample-calculations.patch |  61 +++
 ...nt-overflow-when-counting-header-elements.patch |  39 ++
 ...cam-fix-int-overflow-in-ircam_read_header.patch |  82 ++++
 ...ix-int-overflow-when-calculating-blockwid.patch |  48 +++
 ...n-fix-int-overflow-in-psf_binheader_readf.patch | 181 +++++++++
 ...adpcm-fix-int-overflow-in-signal-estimate.patch | 233 ++++++++++++
 ..._adpcm-fix-int-overflow-in-sf.frames-calc.patch |  39 ++
 .../0011-pcm-fix-int-overflow-in-pcm_init.patch    |  35 ++
 ...rf64-fix-int-overflow-in-rf64_read_header.patch |  40 ++
 ...adpcm-fix-int-overflow-in-ima_reader_init.patch |  55 +++
 ...ter-error-checking-for-vorbis.-Fixes-1035.patch | 411 +++++++++++++++++++++
 package/libsndfile/libsndfile.mk                   |  18 +
 15 files changed, 1379 insertions(+)

diff --git a/package/libsndfile/0001-mat4-mat5-fix-int-overflow-in-dataend-calculation.patch b/package/libsndfile/0001-mat4-mat5-fix-int-overflow-in-dataend-calculation.patch
new file mode 100644
index 0000000000..79d521002c
--- /dev/null
+++ b/package/libsndfile/0001-mat4-mat5-fix-int-overflow-in-dataend-calculation.patch
@@ -0,0 +1,45 @@
+From 0754562e13d2e63a248a1c82f90b30bc0ffe307c Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Tue, 10 Oct 2023 16:10:34 -0400
+Subject: [PATCH] mat4/mat5: fix int overflow in dataend calculation
+
+The clang sanitizer warns of a possible signed integer overflow when
+calculating the `dataend` value in `mat4_read_header()`.
+
+```
+src/mat4.c:323:41: runtime error: signed integer overflow: 205 * -100663296 cannot be represented in type 'int'
+SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior src/mat4.c:323:41 in
+src/mat4.c:323:48: runtime error: signed integer overflow: 838860800 * 4 cannot be represented in type 'int'
+SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior src/mat4.c:323:48 in
+```
+
+Cast the offending `rows` and `cols` ints to `sf_count_t` (the type of
+`dataend` before performing the calculation, to avoid the issue.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/789
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+Upstream: https://github.com/libsndfile/libsndfile/commit/0754562e13d2e63a248a1c82f90b30bc0ffe307c
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/mat4.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mat4.c b/src/mat4.c
+index 0b1b414b..575683ba 100644
+--- a/src/mat4.c
++++ b/src/mat4.c
+@@ -320,7 +320,7 @@ mat4_read_header (SF_PRIVATE *psf)
+ 				psf->filelength - psf->dataoffset, psf->sf.channels * psf->sf.frames * psf->bytewidth) ;
+ 		}
+ 	else if ((psf->filelength - psf->dataoffset) > psf->sf.channels * psf->sf.frames * psf->bytewidth)
+-		psf->dataend = psf->dataoffset + rows * cols * psf->bytewidth ;
++		psf->dataend = psf->dataoffset + (sf_count_t) rows * (sf_count_t) cols * psf->bytewidth ;
+ 
+ 	psf->datalength = psf->filelength - psf->dataoffset - psf->dataend ;
+ 
+-- 
+2.39.5
+
diff --git a/package/libsndfile/0002-au-avoid-int-overflow-while-calculating-data_end.patch b/package/libsndfile/0002-au-avoid-int-overflow-while-calculating-data_end.patch
new file mode 100644
index 0000000000..28d8cfff64
--- /dev/null
+++ b/package/libsndfile/0002-au-avoid-int-overflow-while-calculating-data_end.patch
@@ -0,0 +1,58 @@
+From a5afea2e24080ddf5c7b8e26c29cdbd94ae8226b Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 16:36:02 -0400
+Subject: [PATCH] au: avoid int overflow while calculating data_end
+
+At several points in au_read_header(), we calculate the functional end
+of the data segment by adding the (int)au_fmt.dataoffset and the
+(int)au_fmt.datasize. This can overflow the implicit int_32 return value
+and cause undefined behavior.
+
+Instead, precalculate the value and assign it to a 64-bit
+(sf_count_t)data_end variable.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+Upstream: https://github.com/libsndfile/libsndfile/commit/a5afea2e24080ddf5c7b8e26c29cdbd94ae8226b
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/au.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/au.c b/src/au.c
+index 62bd691d..f68f2587 100644
+--- a/src/au.c
++++ b/src/au.c
+@@ -291,6 +291,7 @@ static int
+ au_read_header (SF_PRIVATE *psf)
+ {	AU_FMT	au_fmt ;
+ 	int		marker, dword ;
++	sf_count_t data_end ;
+ 
+ 	memset (&au_fmt, 0, sizeof (au_fmt)) ;
+ 	psf_binheader_readf (psf, "pm", 0, &marker) ;
+@@ -317,14 +318,15 @@ au_read_header (SF_PRIVATE *psf)
+ 		return SFE_AU_EMBED_BAD_LEN ;
+ 		} ;
+ 
++	data_end = (sf_count_t) au_fmt.dataoffset + (sf_count_t) au_fmt.datasize ;
+ 	if (psf->fileoffset > 0)
+-	{	psf->filelength = au_fmt.dataoffset + au_fmt.datasize ;
++	{	psf->filelength = data_end ;
+ 		psf_log_printf (psf, "  Data Size   : %d\n", au_fmt.datasize) ;
+ 		}
+-	else if (au_fmt.datasize == -1 || au_fmt.dataoffset + au_fmt.datasize == psf->filelength)
++	else if (au_fmt.datasize == -1 || data_end == psf->filelength)
+ 		psf_log_printf (psf, "  Data Size   : %d\n", au_fmt.datasize) ;
+-	else if (au_fmt.dataoffset + au_fmt.datasize < psf->filelength)
+-	{	psf->filelength = au_fmt.dataoffset + au_fmt.datasize ;
++	else if (data_end < psf->filelength)
++	{	psf->filelength = data_end ;
+ 		psf_log_printf (psf, "  Data Size   : %d\n", au_fmt.datasize) ;
+ 		}
+ 	else
+-- 
+2.39.5
+
diff --git a/package/libsndfile/0003-avr-fix-int-overflow-in-avr_read_header.patch b/package/libsndfile/0003-avr-fix-int-overflow-in-avr_read_header.patch
new file mode 100644
index 0000000000..f50e4fb552
--- /dev/null
+++ b/package/libsndfile/0003-avr-fix-int-overflow-in-avr_read_header.patch
@@ -0,0 +1,34 @@
+From 2f8eece78cc8b4dce6c95b3045867f0936714db8 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 16:46:29 -0400
+Subject: [PATCH] avr: fix int overflow in avr_read_header()
+
+Pre-cast hdr.frames to sf_count_t, to provide the calculation with
+enough numeric space to avoid an int-overflow.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+Upstream: https://github.com/libsndfile/libsndfile/commit/2f8eece78cc8b4dce6c95b3045867f0936714db8
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/avr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/avr.c b/src/avr.c
+index 6c78ff69..1bc1ffc9 100644
+--- a/src/avr.c
++++ b/src/avr.c
+@@ -162,7 +162,7 @@ avr_read_header (SF_PRIVATE *psf)
+ 	psf->endian = SF_ENDIAN_BIG ;
+ 
+  	psf->dataoffset = AVR_HDR_SIZE ;
+-	psf->datalength = hdr.frames * (hdr.rez / 8) ;
++	psf->datalength = (sf_count_t) hdr.frames * (hdr.rez / 8) ;
+ 
+ 	if (psf->fileoffset > 0)
+ 		psf->filelength = AVR_HDR_SIZE + psf->datalength ;
+-- 
+2.39.5
+
diff --git a/package/libsndfile/0004-sds-fix-int-overflow-warning-in-sample-calculations.patch b/package/libsndfile/0004-sds-fix-int-overflow-warning-in-sample-calculations.patch
new file mode 100644
index 0000000000..c93b1006d7
--- /dev/null
+++ b/package/libsndfile/0004-sds-fix-int-overflow-warning-in-sample-calculations.patch
@@ -0,0 +1,61 @@
+From 2e9f71dd5d5c85b5bd4a0573d1fa05b5b89b33a7 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 16:54:21 -0400
+Subject: [PATCH] sds: fix int overflow warning in sample calculations
+
+The sds_*byte_read() functions compose their uint_32 sample buffers by
+shifting 7bit samples into a 32bit wide buffer, and adding them
+together. Because the 7bit samples are stored in 32bit ints, code
+fuzzers become concerned that the addition operation can overflow and
+cause undefined behavior.
+
+Instead, bitwise-OR the bytes together - which should accomplish the
+same arithmetic operation, without risking an int-overflow.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Do the same for the 3byte and 4byte read functions.
+
+Upstream: https://github.com/libsndfile/libsndfile/commit/2e9f71dd5d5c85b5bd4a0573d1fa05b5b89b33a7
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/sds.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/sds.c b/src/sds.c
+index 6bc76171..2a0f164c 100644
+--- a/src/sds.c
++++ b/src/sds.c
+@@ -454,7 +454,7 @@ sds_2byte_read (SF_PRIVATE *psf, SDS_PRIVATE *psds)
+ 
+ 	ucptr = psds->read_data + 5 ;
+ 	for (k = 0 ; k < 120 ; k += 2)
+-	{	sample = arith_shift_left (ucptr [k], 25) + arith_shift_left (ucptr [k + 1], 18) ;
++	{	sample = arith_shift_left (ucptr [k], 25) | arith_shift_left (ucptr [k + 1], 18) ;
+ 		psds->read_samples [k / 2] = (int) (sample - 0x80000000) ;
+ 		} ;
+ 
+@@ -498,7 +498,7 @@ sds_3byte_read (SF_PRIVATE *psf, SDS_PRIVATE *psds)
+ 
+ 	ucptr = psds->read_data + 5 ;
+ 	for (k = 0 ; k < 120 ; k += 3)
+-	{	sample = (((uint32_t) ucptr [k]) << 25) + (ucptr [k + 1] << 18) + (ucptr [k + 2] << 11) ;
++	{	sample = (((uint32_t) ucptr [k]) << 25) | (ucptr [k + 1] << 18) | (ucptr [k + 2] << 11) ;
+ 		psds->read_samples [k / 3] = (int) (sample - 0x80000000) ;
+ 		} ;
+ 
+@@ -542,7 +542,7 @@ sds_4byte_read (SF_PRIVATE *psf, SDS_PRIVATE *psds)
+ 
+ 	ucptr = psds->read_data + 5 ;
+ 	for (k = 0 ; k < 120 ; k += 4)
+-	{	sample = (((uint32_t) ucptr [k]) << 25) + (ucptr [k + 1] << 18) + (ucptr [k + 2] << 11) + (ucptr [k + 3] << 4) ;
++	{	sample = (((uint32_t) ucptr [k]) << 25) | (ucptr [k + 1] << 18) | (ucptr [k + 2] << 11) | (ucptr [k + 3] << 4) ;
+ 		psds->read_samples [k / 4] = (int) (sample - 0x80000000) ;
+ 		} ;
+ 
+-- 
+2.39.5
+
diff --git a/package/libsndfile/0005-aiff-fix-int-overflow-when-counting-header-elements.patch b/package/libsndfile/0005-aiff-fix-int-overflow-when-counting-header-elements.patch
new file mode 100644
index 0000000000..5efb6f2368
--- /dev/null
+++ b/package/libsndfile/0005-aiff-fix-int-overflow-when-counting-header-elements.patch
@@ -0,0 +1,39 @@
+From 187451dbd3c044f9a76b6c1d950d458de0103180 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 17:26:51 -0400
+Subject: [PATCH] aiff: fix int overflow when counting header elements
+
+aiff_read_basc_chunk() tries to count the AIFF header size by keeping
+track of the bytes returned by psf_binheader_readf(). Though improbable,
+it is technically possible for these added bytes to exceed the int-sized
+`count` accumulator.
+
+Use a 64-bit sf_count_t type for `count`, to ensure that it always has
+enough numeric space.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+Upstream: https://github.com/libsndfile/libsndfile/commit/187451dbd3c044f9a76b6c1d950d458de0103180
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/aiff.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/aiff.c b/src/aiff.c
+index ac3655e9..6d8f1bc8 100644
+--- a/src/aiff.c
++++ b/src/aiff.c
+@@ -1702,7 +1702,7 @@ static int
+ aiff_read_basc_chunk (SF_PRIVATE * psf, int datasize)
+ {	const char * type_str ;
+ 	basc_CHUNK bc ;
+-	int count ;
++	sf_count_t count ;
+ 
+ 	count = psf_binheader_readf (psf, "E442", &bc.version, &bc.numBeats, &bc.rootNote) ;
+ 	count += psf_binheader_readf (psf, "E222", &bc.scaleType, &bc.sigNumerator, &bc.sigDenominator) ;
+-- 
+2.39.5
+
diff --git a/package/libsndfile/0006-ircam-fix-int-overflow-in-ircam_read_header.patch b/package/libsndfile/0006-ircam-fix-int-overflow-in-ircam_read_header.patch
new file mode 100644
index 0000000000..b240a38e2f
--- /dev/null
+++ b/package/libsndfile/0006-ircam-fix-int-overflow-in-ircam_read_header.patch
@@ -0,0 +1,82 @@
+From 5d5319300587e3d4a146332a2f48674ceb8a0257 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 17:43:02 -0400
+Subject: [PATCH] ircam: fix int overflow in ircam_read_header()
+
+When reading the IRCAM header, it is possible for the calculated
+blockwidth to exceed the bounds of a signed int32.
+
+Use a 64bit sf_count_t to store the blockwidth.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+Upstream: https://github.com/libsndfile/libsndfile/commit/5d5319300587e3d4a146332a2f48674ceb8a0257
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/common.h |  2 +-
+ src/ircam.c  | 10 +++++-----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/common.h b/src/common.h
+index cd9ac8b0..01f6ae09 100644
+--- a/src/common.h
++++ b/src/common.h
+@@ -439,7 +439,7 @@ typedef struct sf_private_tag
+ 	sf_count_t		datalength ;	/* Length in bytes of the audio data. */
+ 	sf_count_t		dataend ;		/* Offset to file tailer. */
+ 
+-	int				blockwidth ;	/* Size in bytes of one set of interleaved samples. */
++	sf_count_t		blockwidth ;	/* Size in bytes of one set of interleaved samples. */
+ 	int				bytewidth ;		/* Size in bytes of one sample (one channel). */
+ 
+ 	void			*dither ;
+diff --git a/src/ircam.c b/src/ircam.c
+index 8e7cdba8..3d73ba44 100644
+--- a/src/ircam.c
++++ b/src/ircam.c
+@@ -171,35 +171,35 @@ ircam_read_header	(SF_PRIVATE *psf)
+ 	switch (encoding)
+ 	{	case IRCAM_PCM_16 :
+ 				psf->bytewidth = 2 ;
+-				psf->blockwidth = psf->sf.channels * psf->bytewidth ;
++				psf->blockwidth = (sf_count_t) psf->sf.channels * psf->bytewidth ;
+ 
+ 				psf->sf.format = SF_FORMAT_IRCAM | SF_FORMAT_PCM_16 ;
+ 				break ;
+ 
+ 		case IRCAM_PCM_32 :
+ 				psf->bytewidth = 4 ;
+-				psf->blockwidth = psf->sf.channels * psf->bytewidth ;
++				psf->blockwidth = (sf_count_t) psf->sf.channels * psf->bytewidth ;
+ 
+ 				psf->sf.format = SF_FORMAT_IRCAM | SF_FORMAT_PCM_32 ;
+ 				break ;
+ 
+ 		case IRCAM_FLOAT :
+ 				psf->bytewidth = 4 ;
+-				psf->blockwidth = psf->sf.channels * psf->bytewidth ;
++				psf->blockwidth = (sf_count_t) psf->sf.channels * psf->bytewidth ;
+ 
+ 				psf->sf.format = SF_FORMAT_IRCAM | SF_FORMAT_FLOAT ;
+ 				break ;
+ 
+ 		case IRCAM_ALAW :
+ 				psf->bytewidth = 1 ;
+-				psf->blockwidth = psf->sf.channels * psf->bytewidth ;
++				psf->blockwidth = (sf_count_t) psf->sf.channels * psf->bytewidth ;
+ 
+ 				psf->sf.format = SF_FORMAT_IRCAM | SF_FORMAT_ALAW ;
+ 				break ;
+ 
+ 		case IRCAM_ULAW :
+ 				psf->bytewidth = 1 ;
+-				psf->blockwidth = psf->sf.channels * psf->bytewidth ;
++				psf->blockwidth = (sf_count_t) psf->sf.channels * psf->bytewidth ;
+ 
+ 				psf->sf.format = SF_FORMAT_IRCAM | SF_FORMAT_ULAW ;
+ 				break ;
+-- 
+2.39.5
+
diff --git a/package/libsndfile/0007-mat4-mat5-fix-int-overflow-when-calculating-blockwid.patch b/package/libsndfile/0007-mat4-mat5-fix-int-overflow-when-calculating-blockwid.patch
new file mode 100644
index 0000000000..ef4d6c0f04
--- /dev/null
+++ b/package/libsndfile/0007-mat4-mat5-fix-int-overflow-when-calculating-blockwid.patch
@@ -0,0 +1,48 @@
+From 39f2a4ffe5ab77d1cadc2057c2db046a9a3d5d65 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 16:12:22 -0400
+Subject: [PATCH] mat4/mat5: fix int overflow when calculating blockwidth
+
+Pre-cast the components of the blockwidth calculation to sf_count_t to
+avoid overflowing integers during calculation.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+Upstream: https://github.com/libsndfile/libsndfile/commit/39f2a4ffe5ab77d1cadc2057c2db046a9a3d5d65
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/mat4.c | 2 +-
+ src/mat5.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/mat4.c b/src/mat4.c
+index 575683ba..9f046f0c 100644
+--- a/src/mat4.c
++++ b/src/mat4.c
+@@ -104,7 +104,7 @@ mat4_open	(SF_PRIVATE *psf)
+ 
+ 	psf->container_close = mat4_close ;
+ 
+-	psf->blockwidth = psf->bytewidth * psf->sf.channels ;
++	psf->blockwidth = (sf_count_t) psf->bytewidth * psf->sf.channels ;
+ 
+ 	switch (subformat)
+ 	{	case SF_FORMAT_PCM_16 :
+diff --git a/src/mat5.c b/src/mat5.c
+index da5a6eca..20f0ea64 100644
+--- a/src/mat5.c
++++ b/src/mat5.c
+@@ -114,7 +114,7 @@ mat5_open	(SF_PRIVATE *psf)
+ 
+ 	psf->container_close = mat5_close ;
+ 
+-	psf->blockwidth = psf->bytewidth * psf->sf.channels ;
++	psf->blockwidth = (sf_count_t) psf->bytewidth * psf->sf.channels ;
+ 
+ 	switch (subformat)
+ 	{	case SF_FORMAT_PCM_U8 :
+-- 
+2.39.5
+
diff --git a/package/libsndfile/0008-common-fix-int-overflow-in-psf_binheader_readf.patch b/package/libsndfile/0008-common-fix-int-overflow-in-psf_binheader_readf.patch
new file mode 100644
index 0000000000..c9b6ff18f2
--- /dev/null
+++ b/package/libsndfile/0008-common-fix-int-overflow-in-psf_binheader_readf.patch
@@ -0,0 +1,181 @@
+From 6be8906740cdca067f12920bb4a63f728485aff0 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Mon, 16 Oct 2023 12:37:47 -0400
+Subject: [PATCH] common: fix int overflow in psf_binheader_readf()
+
+The psf_binheader_readf() function attempts to count and return the
+number of bytes traversed in the header. During this accumulation, it is
+possible to overflow the int-sized byte_count variable.
+
+Avoid this overflow by checking that the accumulated bytes do not exceed
+INT_MAX and throwing an error if they do. This implies that files with
+multi-gigabyte headers threaten to produce this error, but I imagine
+those files don't really exist - and this error is better than the
+undefined behavior which would have resulted previously.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+Upstream: https://github.com/libsndfile/libsndfile/commit/6be8906740cdca067f12920bb4a63f728485aff0
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/common.c | 36 ++++++++++++++++++++++++------------
+ 1 file changed, 24 insertions(+), 12 deletions(-)
+
+diff --git a/src/common.c b/src/common.c
+index b877aa86..8982379a 100644
+--- a/src/common.c
++++ b/src/common.c
+@@ -18,6 +18,7 @@
+ 
+ #include <config.h>
+ 
++#include <limits.h>
+ #include <stdarg.h>
+ #include <string.h>
+ #if HAVE_UNISTD_H
+@@ -990,6 +991,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *format, ...)
+ 	double			*doubleptr ;
+ 	char			c ;
+ 	int				byte_count = 0, count = 0 ;
++	int				read_bytes = 0 ;
+ 
+ 	if (! format)
+ 		return psf_ftell (psf) ;
+@@ -998,6 +1000,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *format, ...)
+ 
+ 	while ((c = *format++))
+ 	{
++		read_bytes = 0 ;
+ 		if (psf->header.indx + 16 >= psf->header.len && psf_bump_header_allocation (psf, 16))
+ 			break ;
+ 
+@@ -1014,7 +1017,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *format, ...)
+ 					intptr = va_arg (argptr, unsigned int*) ;
+ 					*intptr = 0 ;
+ 					ucptr = (unsigned char*) intptr ;
+-					byte_count += header_read (psf, ucptr, sizeof (int)) ;
++					read_bytes = header_read (psf, ucptr, sizeof (int)) ;
+ 					*intptr = GET_MARKER (ucptr) ;
+ 					break ;
+ 
+@@ -1022,7 +1025,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *format, ...)
+ 					intptr = va_arg (argptr, unsigned int*) ;
+ 					*intptr = 0 ;
+ 					ucptr = (unsigned char*) intptr ;
+-					byte_count += header_read (psf, sixteen_bytes, sizeof (sixteen_bytes)) ;
++					read_bytes = header_read (psf, sixteen_bytes, sizeof (sixteen_bytes)) ;
+ 					{	int k ;
+ 						intdata = 0 ;
+ 						for (k = 0 ; k < 16 ; k++)
+@@ -1034,14 +1037,14 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *format, ...)
+ 			case '1' :
+ 					charptr = va_arg (argptr, char*) ;
+ 					*charptr = 0 ;
+-					byte_count += header_read (psf, charptr, sizeof (char)) ;
++					read_bytes = header_read (psf, charptr, sizeof (char)) ;
+ 					break ;
+ 
+ 			case '2' : /* 2 byte value with the current endian-ness */
+ 					shortptr = va_arg (argptr, unsigned short*) ;
+ 					*shortptr = 0 ;
+ 					ucptr = (unsigned char*) shortptr ;
+-					byte_count += header_read (psf, ucptr, sizeof (short)) ;
++					read_bytes = header_read (psf, ucptr, sizeof (short)) ;
+ 					if (psf->rwf_endian == SF_ENDIAN_BIG)
+ 						*shortptr = GET_BE_SHORT (ucptr) ;
+ 					else
+@@ -1051,7 +1054,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *format, ...)
+ 			case '3' : /* 3 byte value with the current endian-ness */
+ 					intptr = va_arg (argptr, unsigned int*) ;
+ 					*intptr = 0 ;
+-					byte_count += header_read (psf, sixteen_bytes, 3) ;
++					read_bytes = header_read (psf, sixteen_bytes, 3) ;
+ 					if (psf->rwf_endian == SF_ENDIAN_BIG)
+ 						*intptr = GET_BE_3BYTE (sixteen_bytes) ;
+ 					else
+@@ -1062,7 +1065,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *format, ...)
+ 					intptr = va_arg (argptr, unsigned int*) ;
+ 					*intptr = 0 ;
+ 					ucptr = (unsigned char*) intptr ;
+-					byte_count += header_read (psf, ucptr, sizeof (int)) ;
++					read_bytes = header_read (psf, ucptr, sizeof (int)) ;
+ 					if (psf->rwf_endian == SF_ENDIAN_BIG)
+ 						*intptr = psf_get_be32 (ucptr, 0) ;
+ 					else
+@@ -1072,7 +1075,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *format, ...)
+ 			case '8' : /* 8 byte value with the current endian-ness */
+ 					countptr = va_arg (argptr, sf_count_t *) ;
+ 					*countptr = 0 ;
+-					byte_count += header_read (psf, sixteen_bytes, 8) ;
++					read_bytes = header_read (psf, sixteen_bytes, 8) ;
+ 					if (psf->rwf_endian == SF_ENDIAN_BIG)
+ 						countdata = psf_get_be64 (sixteen_bytes, 0) ;
+ 					else
+@@ -1083,7 +1086,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *format, ...)
+ 			case 'f' : /* Float conversion */
+ 					floatptr = va_arg (argptr, float *) ;
+ 					*floatptr = 0.0 ;
+-					byte_count += header_read (psf, floatptr, sizeof (float)) ;
++					read_bytes = header_read (psf, floatptr, sizeof (float)) ;
+ 					if (psf->rwf_endian == SF_ENDIAN_BIG)
+ 						*floatptr = float32_be_read ((unsigned char*) floatptr) ;
+ 					else
+@@ -1093,7 +1096,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *format, ...)
+ 			case 'd' : /* double conversion */
+ 					doubleptr = va_arg (argptr, double *) ;
+ 					*doubleptr = 0.0 ;
+-					byte_count += header_read (psf, doubleptr, sizeof (double)) ;
++					read_bytes = header_read (psf, doubleptr, sizeof (double)) ;
+ 					if (psf->rwf_endian == SF_ENDIAN_BIG)
+ 						*doubleptr = double64_be_read ((unsigned char*) doubleptr) ;
+ 					else
+@@ -1117,7 +1120,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *format, ...)
+ 					charptr = va_arg (argptr, char*) ;
+ 					count = va_arg (argptr, size_t) ;
+ 					memset (charptr, 0, count) ;
+-					byte_count += header_read (psf, charptr, count) ;
++					read_bytes = header_read (psf, charptr, count) ;
+ 					break ;
+ 
+ 			case 'G' :
+@@ -1128,7 +1131,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *format, ...)
+ 					if (psf->header.indx + count >= psf->header.len && psf_bump_header_allocation (psf, count))
+ 						break ;
+ 
+-					byte_count += header_gets (psf, charptr, count) ;
++					read_bytes = header_gets (psf, charptr, count) ;
+ 					break ;
+ 
+ 			case 'z' :
+@@ -1152,7 +1155,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *format, ...)
+ 			case 'j' :	/* Seek to position from current position. */
+ 					count = va_arg (argptr, size_t) ;
+ 					header_seek (psf, count, SEEK_CUR) ;
+-					byte_count += count ;
++					read_bytes = count ;
+ 					break ;
+ 
+ 			case '!' : /* Clear buffer, forcing re-read. */
+@@ -1164,8 +1167,17 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *format, ...)
+ 				psf->error = SFE_INTERNAL ;
+ 				break ;
+ 			} ;
++
++		if (read_bytes > 0 && byte_count > (INT_MAX - read_bytes))
++		{	psf_log_printf (psf, "Header size exceeds INT_MAX. Aborting.", c) ;
++			psf->error = SFE_INTERNAL ;
++			break ;
++		} else
++		{	byte_count += read_bytes ;
+ 		} ;
+ 
++		} ;	/*end while*/
++
+ 	va_end (argptr) ;
+ 
+ 	return byte_count ;
+-- 
+2.39.5
+
diff --git a/package/libsndfile/0009-nms_adpcm-fix-int-overflow-in-signal-estimate.patch b/package/libsndfile/0009-nms_adpcm-fix-int-overflow-in-signal-estimate.patch
new file mode 100644
index 0000000000..266fa661b1
--- /dev/null
+++ b/package/libsndfile/0009-nms_adpcm-fix-int-overflow-in-signal-estimate.patch
@@ -0,0 +1,233 @@
+From 71565532463b22c24824101845a533a67bff4c9c Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Thu, 19 Oct 2023 14:07:19 -0400
+Subject: [PATCH] nms_adpcm: fix int overflow in signal estimate
+
+It is possible (though functionally incorrect) for the signal estimate
+calculation in nms_adpcm_update() to overflow the int value of s_e,
+resulting in undefined behavior.
+
+Since adpcm state signal values are never practically larger than
+16 bits, use smaller numeric sizes throughout the file to avoid the
+overflow.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Authored-by: Arthur Taylor <art@ified.ca>
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+Upstream: https://github.com/libsndfile/libsndfile/commit/71565532463b22c24824101845a533a67bff4c9c
+[Peter: adjust for 1.2.2]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/nms_adpcm.c | 81 ++++++++++++++++++++++++-------------------------
+ 1 file changed, 40 insertions(+), 41 deletions(-)
+
+diff --git a/src/nms_adpcm.c b/src/nms_adpcm.c
+index 5999be1f..dca85f0b 100644
+--- a/src/nms_adpcm.c
++++ b/src/nms_adpcm.c
+@@ -48,36 +48,36 @@
+ /* Variable names from ITU G.726 spec */
+ struct nms_adpcm_state
+ {	/* Log of the step size multiplier. Operated on by codewords. */
+-	int yl ;
++	short yl ;
+ 
+ 	/* Quantizer step size multiplier. Generated from yl. */
+-	int y ;
++	short y ;
+ 
+ 	/* Coefficents of the pole predictor */
+-	int a [2] ;
++	short a [2] ;
+ 
+ 	/* Coefficents of the zero predictor  */
+-	int b [6] ;
++	short b [6] ;
+ 
+ 	/* Previous quantized deltas (multiplied by 2^14) */
+-	int d_q [7] ;
++	short d_q [7] ;
+ 
+ 	/* d_q [x] + s_ez [x], used by the pole-predictor for signs only. */
+-	int p [3] ;
++	short p [3] ;
+ 
+ 	/* Previous reconstructed signal values. */
+-	int s_r [2] ;
++	short s_r [2] ;
+ 
+ 	/* Zero predictor components of the signal estimate. */
+-	int s_ez ;
++	short s_ez ;
+ 
+ 	/* Signal estimate, (including s_ez). */
+-	int s_e ;
++	short s_e ;
+ 
+ 	/* The most recent codeword (enc:generated, dec:inputted) */
+-	int Ik ;
++	char Ik ;
+ 
+-	int parity ;
++	char parity ;
+ 
+ 	/*
+ 	** Offset into code tables for the bitrate.
+@@ -109,7 +109,7 @@ typedef struct
+ } NMS_ADPCM_PRIVATE ;
+ 
+ /* Pre-computed exponential interval used in the antilog approximation. */
+-static unsigned int table_expn [] =
++static unsigned short table_expn [] =
+ {	0x4000, 0x4167, 0x42d5, 0x444c,	0x45cb, 0x4752, 0x48e2, 0x4a7a,
+ 	0x4c1b, 0x4dc7, 0x4f7a, 0x5138,	0x52ff, 0x54d1, 0x56ac, 0x5892,
+ 	0x5a82, 0x5c7e, 0x5e84, 0x6096,	0x62b4, 0x64dd, 0x6712, 0x6954,
+@@ -117,21 +117,21 @@ static unsigned int table_expn [] =
+ } ;
+ 
+ /* Table mapping codewords to scale factor deltas. */
+-static int table_scale_factor_step [] =
++static short table_scale_factor_step [] =
+ {	0x0,	0x0,	0x0,	0x0,	0x4b0,	0x0,	0x0,	0x0,	/* 2-bit */
+ 	-0x3c,	0x0,	0x90,	0x0,	0x2ee,	0x0,	0x898,	0x0,	/* 3-bit */
+ 	-0x30,	0x12,	0x6b,	0xc8,	0x188,	0x2e0,	0x551,	0x1150,	/* 4-bit */
+ } ;
+ 
+ /* Table mapping codewords to quantized delta interval steps. */
+-static unsigned int table_step [] =
++static unsigned short table_step [] =
+ {	0x73F,	0,		0,		0,		0x1829,	0,		0,		0,		/* 2-bit */
+ 	0x3EB,	0,		0xC18,	0,		0x1581,	0,		0x226E,	0,		/* 3-bit */
+ 	0x20C,	0x635,	0xA83,	0xF12,	0x1418,	0x19E3,	0x211A,	0x2BBA,	/* 4-bit */
+ } ;
+ 
+ /* Binary search lookup table for quantizing using table_step. */
+-static int table_step_search [] =
++static short table_step_search [] =
+ {	0,		0x1F6D,	0,		-0x1F6D,	0,		0,			0,			0, /* 2-bit */
+ 	0x1008,	0x1192,	0,		-0x219A,	0x1656,	-0x1656,	0,			0, /* 3-bit */
+ 	0x872,	0x1277,	-0x8E6,	-0x232B,	0xD06,	-0x17D7,	-0x11D3,	0, /* 4-bit */
+@@ -179,23 +179,23 @@ static sf_count_t nms_adpcm_seek (SF_PRIVATE *psf, int mode, sf_count_t offset)
+ ** Maps [1,20480] to [1,1024] in an exponential relationship. This is
+ ** approximately ret = b^exp where b = e^(ln(1024)/ln(20480)) ~= 1.0003385
+ */
+-static inline int
+-nms_adpcm_antilog (int exp)
+-{	int ret ;
++static inline short
++nms_adpcm_antilog (short exp)
++{	int_fast32_t r ;
+ 
+-	ret = 0x1000 ;
+-	ret += (((exp & 0x3f) * 0x166b) >> 12) ;
+-	ret *= table_expn [(exp & 0x7c0) >> 6] ;
+-	ret >>= (26 - (exp >> 11)) ;
++	r = 0x1000 ;
++	r += (((int_fast32_t) (exp & 0x3f) * 0x166b) >> 12) ;
++	r *= table_expn [(exp & 0x7c0) >> 6] ;
++	r >>= (26 - (exp >> 11)) ;
+ 
+-	return ret ;
++	return (short) r ;
+ } /* nms_adpcm_antilog */
+ 
+ static void
+ nms_adpcm_update (struct nms_adpcm_state *s)
+ {	/* Variable names from ITU G.726 spec */
+-	int a1ul ;
+-	int fa1 ;
++	short a1ul, fa1 ;
++	int_fast32_t se ;
+ 	int i ;
+ 
+ 	/* Decay and Modify the scale factor in the log domain based on the codeword. */
+@@ -222,7 +222,7 @@ nms_adpcm_update (struct nms_adpcm_state *s)
+ 	else if (fa1 > 256)
+ 		fa1 = 256 ;
+ 
+-	s->a [0] = (0xff * s->a [0]) >> 8 ;
++	s->a [0] = (s->a [0] * 0xff) >> 8 ;
+ 	if (s->p [0] != 0 && s->p [1] != 0 && ((s->p [0] ^ s->p [1]) < 0))
+ 		s->a [0] -= 192 ;
+ 	else
+@@ -230,7 +230,7 @@ nms_adpcm_update (struct nms_adpcm_state *s)
+ 		fa1 = -fa1 ;
+ 		}
+ 
+-	s->a [1] = fa1 + ((0xfe * s->a [1]) >> 8) ;
++	s->a [1] = fa1 + ((s->a [1] * 0xfe) >> 8) ;
+ 	if (s->p [0] != 0 && s->p [2] != 0 && ((s->p [0] ^ s->p [2]) < 0))
+ 		s->a [1] -= 128 ;
+ 	else
+@@ -250,19 +250,18 @@ nms_adpcm_update (struct nms_adpcm_state *s)
+ 			s->a [0] = a1ul ;
+ 		} ;
+ 
+-	/* Compute the zero predictor estimate. Rotate past deltas too. */
+-	s->s_ez = 0 ;
++	/* Compute the zero predictor estimate and rotate past deltas. */
++	se = 0 ;
+ 	for (i = 5 ; i >= 0 ; i--)
+-	{	s->s_ez += s->d_q [i] * s->b [i] ;
++	{	se += (int_fast32_t) s->d_q [i] * s->b [i] ;
+ 		s->d_q [i + 1] = s->d_q [i] ;
+ 		} ;
++	s->s_ez = se >> 14 ;
+ 
+-	/* Compute the signal estimate. */
+-	s->s_e = s->a [0] * s->s_r [0] + s->a [1] * s->s_r [1] + s->s_ez ;
+-
+-	/* Return to scale */
+-	s->s_ez >>= 14 ;
+-	s->s_e >>= 14 ;
++	/* Complete the signal estimate. */
++	se += (int_fast32_t) s->a [0] * s->s_r [0] ;
++	se += (int_fast32_t) s->a [1] * s->s_r [1] ;
++	s->s_e = se >> 14 ;
+ 
+ 	/* Rotate members to prepare for next iteration. */
+ 	s->s_r [1] = s->s_r [0] ;
+@@ -274,7 +273,7 @@ nms_adpcm_update (struct nms_adpcm_state *s)
+ static int16_t
+ nms_adpcm_reconstruct_sample (struct nms_adpcm_state *s, uint8_t I)
+ {	/* Variable names from ITU G.726 spec */
+-	int dqx ;
++	int_fast32_t dqx ;
+ 
+ 	/*
+ 	** The ordering of the 12-bit right-shift is a precision loss. It agrees
+@@ -308,17 +307,17 @@ nms_adpcm_codec_init (struct nms_adpcm_state *s, enum nms_enc_type type)
+ /*
+ ** nms_adpcm_encode_sample()
+ **
+-** Encode a linear 16-bit pcm sample into a 2,3, or 4 bit NMS-ADPCM codeword
++** Encode a linear 16-bit pcm sample into a 2, 3, or 4 bit NMS-ADPCM codeword
+ ** using and updating the predictor state.
+ */
+ static uint8_t
+ nms_adpcm_encode_sample (struct nms_adpcm_state *s, int16_t sl)
+ {	/* Variable names from ITU G.726 spec */
+-	int d ;
++	int_fast32_t d ;
+ 	uint8_t I ;
+ 
+ 	/* Down scale the sample from 16 => ~14 bits. */
+-	sl = (sl * 0x1fdf) / 0x7fff ;
++	sl = ((int_fast32_t) sl * 0x1fdf) / 0x7fff ;
+ 
+ 	/* Compute estimate, and delta from actual value */
+ 	nms_adpcm_update (s) ;
+@@ -407,7 +406,7 @@ nms_adpcm_encode_sample (struct nms_adpcm_state *s, int16_t sl)
+ */
+ static int16_t
+ nms_adpcm_decode_sample (struct nms_adpcm_state *s, uint8_t I)
+-{	int sl ;
++{	int_fast32_t sl ;
+ 
+ 	nms_adpcm_update (s) ;
+ 	sl = nms_adpcm_reconstruct_sample (s, I) ;
+-- 
+2.39.5
+
diff --git a/package/libsndfile/0010-nms_adpcm-fix-int-overflow-in-sf.frames-calc.patch b/package/libsndfile/0010-nms_adpcm-fix-int-overflow-in-sf.frames-calc.patch
new file mode 100644
index 0000000000..0763a53de4
--- /dev/null
+++ b/package/libsndfile/0010-nms_adpcm-fix-int-overflow-in-sf.frames-calc.patch
@@ -0,0 +1,39 @@
+From 3fb27a2c93a11dd3321b0b13140d89ebb39060cb Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Tue, 17 Oct 2023 11:50:53 -0400
+Subject: [PATCH] nms_adpcm: fix int overflow in sf.frames calc
+
+When calculating sf.frames from the blocks_total PNMS variable, it is
+theoretically possible to overflow the blocks_total int boundaries,
+leading to undefined behavior.
+
+Cast blocks_total to a long-sized sf_count_t before the calculation, to
+provide it with enough numeric space and because that is the final
+typing regardless.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+Upstream: https://github.com/libsndfile/libsndfile/commit/3fb27a2c93a11dd3321b0b13140d89ebb39060cb
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/nms_adpcm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/nms_adpcm.c b/src/nms_adpcm.c
+index dca85f0b..61d171c7 100644
+--- a/src/nms_adpcm.c
++++ b/src/nms_adpcm.c
+@@ -1090,7 +1090,7 @@ nms_adpcm_init (SF_PRIVATE *psf)
+ 	else
+ 		pnms->blocks_total = psf->datalength / (pnms->shortsperblock * sizeof (short)) ;
+ 
+-	psf->sf.frames		= pnms->blocks_total * NMS_SAMPLES_PER_BLOCK ;
++	psf->sf.frames		= (sf_count_t) pnms->blocks_total * NMS_SAMPLES_PER_BLOCK ;
+ 	psf->codec_close	= nms_adpcm_close ;
+ 	psf->seek			= nms_adpcm_seek ;
+ 
+-- 
+2.39.5
+
diff --git a/package/libsndfile/0011-pcm-fix-int-overflow-in-pcm_init.patch b/package/libsndfile/0011-pcm-fix-int-overflow-in-pcm_init.patch
new file mode 100644
index 0000000000..aa30090a69
--- /dev/null
+++ b/package/libsndfile/0011-pcm-fix-int-overflow-in-pcm_init.patch
@@ -0,0 +1,35 @@
+From 09f8f8d5544d98a5a2d28504c02314a2a816ac37 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Tue, 17 Oct 2023 11:57:23 -0400
+Subject: [PATCH] pcm: fix int overflow in pcm_init()
+
+Cast the int-sized bytewidth variable to a long-sized sf_count_t type
+prior to calculating the blockwidth, to provide the calculation with
+enough numeric space and sf_count_t is the final typing regardless.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+Upstream: https://github.com/libsndfile/libsndfile/commit/09f8f8d5544d98a5a2d28504c02314a2a816ac37
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/pcm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pcm.c b/src/pcm.c
+index bdf46183..a42e4868 100644
+--- a/src/pcm.c
++++ b/src/pcm.c
+@@ -127,7 +127,7 @@ pcm_init (SF_PRIVATE *psf)
+ 		return SFE_INTERNAL ;
+ 		} ;
+ 
+-	psf->blockwidth = psf->bytewidth * psf->sf.channels ;
++	psf->blockwidth = (sf_count_t) psf->bytewidth * psf->sf.channels ;
+ 
+ 	if ((SF_CODEC (psf->sf.format)) == SF_FORMAT_PCM_S8)
+ 		chars = SF_CHARS_SIGNED ;
+-- 
+2.39.5
+
diff --git a/package/libsndfile/0012-rf64-fix-int-overflow-in-rf64_read_header.patch b/package/libsndfile/0012-rf64-fix-int-overflow-in-rf64_read_header.patch
new file mode 100644
index 0000000000..8d39986260
--- /dev/null
+++ b/package/libsndfile/0012-rf64-fix-int-overflow-in-rf64_read_header.patch
@@ -0,0 +1,40 @@
+From 49704025956f03751d3436a0bb42287cd7f434b6 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Tue, 17 Oct 2023 12:01:00 -0400
+Subject: [PATCH] rf64: fix int overflow in rf64_read_header()
+
+When checking for mismatches between the filelength and riff_size, it is
+possible to overflow the temporary riff_size value used in the
+comparison by adding a static offset; which is probably fine, but it is
+offensive to overflow fuzzers.
+
+Since filelength is always a positive value, simply move the offset to
+the other side of the comparison operator as a negative value, avoid the
+possibility of an overflow.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+Upstream: https://github.com/libsndfile/libsndfile/commit/49704025956f03751d3436a0bb42287cd7f434b6
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/rf64.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/rf64.c b/src/rf64.c
+index 123db445..c60399fb 100644
+--- a/src/rf64.c
++++ b/src/rf64.c
+@@ -242,7 +242,7 @@ rf64_read_header (SF_PRIVATE *psf, int *blockalign, int *framesperblock)
+ 							} ;
+ 						} ;
+ 
+-					if (psf->filelength != riff_size + 8)
++					if (psf->filelength - 8 != riff_size)
+ 						psf_log_printf (psf, "  Riff size : %D (should be %D)\n", riff_size, psf->filelength - 8) ;
+ 					else
+ 						psf_log_printf (psf, "  Riff size : %D\n", riff_size) ;
+-- 
+2.39.5
+
diff --git a/package/libsndfile/0013-ima_adpcm-fix-int-overflow-in-ima_reader_init.patch b/package/libsndfile/0013-ima_adpcm-fix-int-overflow-in-ima_reader_init.patch
new file mode 100644
index 0000000000..ee324158c4
--- /dev/null
+++ b/package/libsndfile/0013-ima_adpcm-fix-int-overflow-in-ima_reader_init.patch
@@ -0,0 +1,55 @@
+From 9a829113c88a51e57c1e46473e90609e4b7df151 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Tue, 17 Oct 2023 12:19:12 -0400
+Subject: [PATCH] ima_adpcm: fix int overflow in ima_reader_init()
+
+When calculating sf.frames, pre-cast samplesperblock to sf_count_t, to
+provide the calculation with enough numeric space to avoid overflows.
+
+Other changes in this commit are syntactic, and only to satisfy the git
+pre-commit syntax checker.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+Upstream: https://github.com/libsndfile/libsndfile/commit/9a829113c88a51e57c1e46473e90609e4b7df151
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/ima_adpcm.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/ima_adpcm.c b/src/ima_adpcm.c
+index bc61f4e5..7464d1b3 100644
+--- a/src/ima_adpcm.c
++++ b/src/ima_adpcm.c
+@@ -187,7 +187,7 @@ ima_reader_init (SF_PRIVATE *psf, int blockalign, int samplesperblock)
+ 	**	to avoid having to branch when pulling apart the nibbles.
+ 	*/
+ 	count = ((samplesperblock - 2) | 7) + 2 ;
+-	pimasize = sizeof (IMA_ADPCM_PRIVATE) + psf->sf.channels * (blockalign + samplesperblock + sizeof(short) * count) ;
++	pimasize = sizeof (IMA_ADPCM_PRIVATE) + psf->sf.channels * (blockalign + samplesperblock + sizeof (short) * count) ;
+ 
+ 	if (! (pima = calloc (1, pimasize)))
+ 		return SFE_MALLOC_FAILED ;
+@@ -238,7 +238,7 @@ ima_reader_init (SF_PRIVATE *psf, int blockalign, int samplesperblock)
+ 		case SF_FORMAT_AIFF :
+ 				psf_log_printf (psf, "still need to check block count\n") ;
+ 				pima->decode_block = aiff_ima_decode_block ;
+-				psf->sf.frames = pima->samplesperblock * pima->blocks / pima->channels ;
++				psf->sf.frames = (sf_count_t) pima->samplesperblock * pima->blocks / pima->channels ;
+ 				break ;
+ 
+ 		default :
+@@ -391,7 +391,7 @@ aiff_ima_encode_block (SF_PRIVATE *psf, IMA_ADPCM_PRIVATE *pima)
+ static int
+ wavlike_ima_decode_block (SF_PRIVATE *psf, IMA_ADPCM_PRIVATE *pima)
+ {	int		chan, k, predictor, blockindx, indx, indxstart, diff ;
+-	short	step, bytecode, stepindx [2] = { 0 };
++	short	step, bytecode, stepindx [2] = { 0 } ;
+ 
+ 	pima->blockcount ++ ;
+ 	pima->samplecount = 0 ;
+-- 
+2.39.5
+
diff --git a/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch b/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch
new file mode 100644
index 0000000000..dd9f157811
--- /dev/null
+++ b/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch
@@ -0,0 +1,411 @@
+From 4755f5bd7854611d92ad0f1295587b439f9950ba Mon Sep 17 00:00:00 2001
+From: Arthur Taylor <art@ified.ca>
+Date: Fri, 15 Nov 2024 19:46:53 -0800
+Subject: [PATCH] src/ogg: better error checking for vorbis. Fixes #1035
+
+Upstream: https://github.com/libsndfile/libsndfile/commit/4755f5bd7854611d92ad0f1295587b439f9950ba
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/ogg.c        |  12 ++--
+ src/ogg_opus.c   |  17 +++--
+ src/ogg_vorbis.c | 170 ++++++++++++++++++++++++++---------------------
+ 3 files changed, 114 insertions(+), 85 deletions(-)
+
+diff --git a/src/ogg.c b/src/ogg.c
+index 529941af..e2d679d4 100644
+--- a/src/ogg.c
++++ b/src/ogg.c
+@@ -211,12 +211,16 @@ ogg_read_first_page (SF_PRIVATE *psf, OGG_PRIVATE *odata)
+ 
+ int
+ ogg_write_page (SF_PRIVATE *psf, ogg_page *page)
+-{	int bytes ;
++{	int n ;
+ 
+-	bytes = psf_fwrite (page->header, 1, page->header_len, psf) ;
+-	bytes += psf_fwrite (page->body, 1, page->body_len, psf) ;
++	n = psf_fwrite (page->header, 1, page->header_len, psf) ;
++	if (n == page->header_len)
++		n += psf_fwrite (page->body, 1, page->body_len, psf) ;
+ 
+-	return bytes == page->header_len + page->body_len ;
++	if (n != page->body_len + page->header_len)
++		return -1 ;
++
++	return n ;
+ } /* ogg_write_page */
+ 
+ sf_count_t
+diff --git a/src/ogg_opus.c b/src/ogg_opus.c
+index 511653ec..e01224b9 100644
+--- a/src/ogg_opus.c
++++ b/src/ogg_opus.c
+@@ -827,15 +827,16 @@ ogg_opus_write_header (SF_PRIVATE *psf, int UNUSED (calc_length))
+ 
+ 	/* The first page MUST only contain the header, so flush it out now */
+ 	ogg_stream_packetin (&odata->ostream, &op) ;
+-	for ( ; (nn = ogg_stream_flush (&odata->ostream, &odata->opage)) ; )
+-	{	if (! (nn = ogg_write_page (psf, &odata->opage)))
++	while (ogg_stream_flush (&odata->ostream, &odata->opage))
++	{	nn = ogg_write_page (psf, &odata->opage) ;
++		if (nn < 0)
+ 		{	psf_log_printf (psf, "Opus : Failed to write header!\n") ;
+ 			if (psf->error)
+ 				return psf->error ;
+ 			return SFE_INTERNAL ;
+ 			} ;
+ 		psf->dataoffset += nn ;
+-		}
++		} ;
+ 
+ 	/*
+ 	** Metadata Tags (manditory)
+@@ -850,15 +851,16 @@ ogg_opus_write_header (SF_PRIVATE *psf, int UNUSED (calc_length))
+ 	vorbiscomment_write_tags (psf, &op, &opustags_ident, opus_get_version_string (), - (OGG_OPUS_COMMENT_PAD)) ;
+ 	op.packetno = 2 ;
+ 	ogg_stream_packetin (&odata->ostream, &op) ;
+-	for ( ; (nn = ogg_stream_flush (&odata->ostream, &odata->opage)) ; )
+-	{	if (! (nn = ogg_write_page (psf, &odata->opage)))
++	while (ogg_stream_flush (&odata->ostream, &odata->opage))
++	{	nn = ogg_write_page (psf, &odata->opage) ;
++		if (nn < 0)
+ 		{	psf_log_printf (psf, "Opus : Failed to write comments!\n") ;
+ 			if (psf->error)
+ 				return psf->error ;
+ 			return SFE_INTERNAL ;
+ 			} ;
+ 		psf->dataoffset += nn ;
+-		}
++		} ;
+ 
+ 	return 0 ;
+ } /* ogg_opus_write_header */
+@@ -1132,7 +1134,8 @@ ogg_opus_write_out (SF_PRIVATE *psf, OGG_PRIVATE *odata, OPUS_PRIVATE *oopus)
+ 		if (nbytes > 0)
+ 		{	oopus->u.encode.last_segments -= ogg_page_segments (&odata->opage) ;
+ 			oopus->pg_pos = oopus->pkt_pos ;
+-			ogg_write_page (psf, &odata->opage) ;
++			if (ogg_write_page (psf, &odata->opage) < 0)
++				return -1 ;
+ 			}
+ 		else
+ 			break ;
+diff --git a/src/ogg_vorbis.c b/src/ogg_vorbis.c
+index add12396..fae252ca 100644
+--- a/src/ogg_vorbis.c
++++ b/src/ogg_vorbis.c
+@@ -82,28 +82,6 @@
+ /* How many seconds in the future to not bother bisection searching for. */
+ #define VORBIS_SEEK_THRESHOLD 2
+ 
+-typedef int convert_func (SF_PRIVATE *psf, int, void *, int, int, float **) ;
+-
+-static int	vorbis_read_header (SF_PRIVATE *psf) ;
+-static int	vorbis_write_header (SF_PRIVATE *psf, int calc_length) ;
+-static int	vorbis_close (SF_PRIVATE *psf) ;
+-static int	vorbis_command (SF_PRIVATE *psf, int command, void *data, int datasize) ;
+-static int	vorbis_byterate (SF_PRIVATE *psf) ;
+-static int	vorbis_calculate_granulepos (SF_PRIVATE *psf, uint64_t *gp_out) ;
+-static int	vorbis_skip (SF_PRIVATE *psf, uint64_t target_gp) ;
+-static int	vorbis_seek_trysearch (SF_PRIVATE *psf, uint64_t target_gp) ;
+-static sf_count_t	vorbis_seek (SF_PRIVATE *psf, int mode, sf_count_t offset) ;
+-static sf_count_t	vorbis_read_s (SF_PRIVATE *psf, short *ptr, sf_count_t len) ;
+-static sf_count_t	vorbis_read_i (SF_PRIVATE *psf, int *ptr, sf_count_t len) ;
+-static sf_count_t	vorbis_read_f (SF_PRIVATE *psf, float *ptr, sf_count_t len) ;
+-static sf_count_t	vorbis_read_d (SF_PRIVATE *psf, double *ptr, sf_count_t len) ;
+-static sf_count_t	vorbis_write_s (SF_PRIVATE *psf, const short *ptr, sf_count_t len) ;
+-static sf_count_t	vorbis_write_i (SF_PRIVATE *psf, const int *ptr, sf_count_t len) ;
+-static sf_count_t	vorbis_write_f (SF_PRIVATE *psf, const float *ptr, sf_count_t len) ;
+-static sf_count_t	vorbis_write_d (SF_PRIVATE *psf, const double *ptr, sf_count_t len) ;
+-static sf_count_t	vorbis_read_sample (SF_PRIVATE *psf, void *ptr, sf_count_t lens, convert_func *transfn) ;
+-static int	vorbis_rnull (SF_PRIVATE *psf, int samples, void *vptr, int off , int channels, float **pcm) ;
+-
+ typedef struct
+ {	int id ;
+ 	const char *name ;
+@@ -145,6 +123,45 @@ typedef struct
+ 	sf_count_t last_page ;
+ } VORBIS_PRIVATE ;
+ 
++typedef int convert_func (SF_PRIVATE *psf, int, void *, int, int, float **) ;
++
++static int	vorbis_read_header (SF_PRIVATE *psf) ;
++static int	vorbis_write_header (SF_PRIVATE *psf, int calc_length) ;
++static int	vorbis_close (SF_PRIVATE *psf) ;
++static int	vorbis_command (SF_PRIVATE *psf, int command, void *data, int datasize) ;
++static int	vorbis_byterate (SF_PRIVATE *psf) ;
++static int	vorbis_calculate_granulepos (SF_PRIVATE *psf, uint64_t *gp_out) ;
++static int	vorbis_skip (SF_PRIVATE *psf, uint64_t target_gp) ;
++static int	vorbis_seek_trysearch (SF_PRIVATE *psf, uint64_t target_gp) ;
++static sf_count_t	vorbis_seek (SF_PRIVATE *psf, int mode, sf_count_t offset) ;
++static sf_count_t	vorbis_read_s (SF_PRIVATE *psf, short *ptr, sf_count_t len) ;
++static sf_count_t	vorbis_read_i (SF_PRIVATE *psf, int *ptr, sf_count_t len) ;
++static sf_count_t	vorbis_read_f (SF_PRIVATE *psf, float *ptr, sf_count_t len) ;
++static sf_count_t	vorbis_read_d (SF_PRIVATE *psf, double *ptr, sf_count_t len) ;
++static sf_count_t	vorbis_write_s (SF_PRIVATE *psf, const short *ptr, sf_count_t len) ;
++static sf_count_t	vorbis_write_i (SF_PRIVATE *psf, const int *ptr, sf_count_t len) ;
++static sf_count_t	vorbis_write_f (SF_PRIVATE *psf, const float *ptr, sf_count_t len) ;
++static sf_count_t	vorbis_write_d (SF_PRIVATE *psf, const double *ptr, sf_count_t len) ;
++static sf_count_t	vorbis_read_sample (SF_PRIVATE *psf, void *ptr, sf_count_t lens, convert_func *transfn) ;
++static int	vorbis_write_samples (SF_PRIVATE *psf, OGG_PRIVATE *odata, VORBIS_PRIVATE *vdata, int in_frames) ;
++static int	vorbis_rnull (SF_PRIVATE *psf, int samples, void *vptr, int off , int channels, float **pcm) ;
++static void	vorbis_log_error (SF_PRIVATE *psf, int error) ;
++
++
++static void
++vorbis_log_error(SF_PRIVATE *psf, int error) {
++	switch (error)
++	{	case 0: return;
++		case OV_EIMPL:		psf->error = SFE_UNIMPLEMENTED ; break ;
++		case OV_ENOTVORBIS:	psf->error = SFE_MALFORMED_FILE ; break ;
++		case OV_EBADHEADER:	psf->error = SFE_MALFORMED_FILE ; break ;
++		case OV_EVERSION:	psf->error = SFE_UNSUPPORTED_ENCODING ; break ;
++		case OV_EFAULT:
++		case OV_EINVAL:
++		default: psf->error = SFE_INTERNAL ;
++		} ;
++} ;
++
+ static int
+ vorbis_read_header (SF_PRIVATE *psf)
+ {	OGG_PRIVATE *odata = (OGG_PRIVATE *) psf->container_data ;
+@@ -380,7 +397,6 @@ vorbis_write_header (SF_PRIVATE *psf, int UNUSED (calc_length))
+ 	{	ogg_packet header ;
+ 		ogg_packet header_comm ;
+ 		ogg_packet header_code ;
+-		int result ;
+ 
+ 		vorbis_analysis_headerout (&vdata->vdsp, &vdata->vcomment, &header, &header_comm, &header_code) ;
+ 		ogg_stream_packetin (&odata->ostream, &header) ; /* automatically placed in its own page */
+@@ -390,9 +406,9 @@ vorbis_write_header (SF_PRIVATE *psf, int UNUSED (calc_length))
+ 		/* This ensures the actual
+ 		 * audio data will start on a new page, as per spec
+ 		 */
+-		while ((result = ogg_stream_flush (&odata->ostream, &odata->opage)) != 0)
+-		{	ogg_write_page (psf, &odata->opage) ;
+-			} ;
++		while (ogg_stream_flush (&odata->ostream, &odata->opage))
++			if (ogg_write_page (psf, &odata->opage) < 0)
++				return -1 ;
+ 	}
+ 
+ 	return 0 ;
+@@ -402,6 +418,7 @@ static int
+ vorbis_close (SF_PRIVATE *psf)
+ {	OGG_PRIVATE* odata = psf->container_data ;
+ 	VORBIS_PRIVATE *vdata = psf->codec_data ;
++	int ret = 0 ;
+ 
+ 	if (odata == NULL || vdata == NULL)
+ 		return 0 ;
+@@ -412,34 +429,14 @@ vorbis_close (SF_PRIVATE *psf)
+ 	if (psf->file.mode == SFM_WRITE)
+ 	{
+ 		if (psf->write_current <= 0)
+-			vorbis_write_header (psf, 0) ;
++			ret = vorbis_write_header (psf, 0) ;
+ 
+-		vorbis_analysis_wrote (&vdata->vdsp, 0) ;
+-		while (vorbis_analysis_blockout (&vdata->vdsp, &vdata->vblock) == 1)
+-		{
+-
+-		/* analysis, assume we want to use bitrate management */
+-			vorbis_analysis (&vdata->vblock, NULL) ;
+-			vorbis_bitrate_addblock (&vdata->vblock) ;
+-
+-			while (vorbis_bitrate_flushpacket (&vdata->vdsp, &odata->opacket))
+-			{	/* weld the packet into the bitstream */
+-				ogg_stream_packetin (&odata->ostream, &odata->opacket) ;
+-
+-				/* write out pages (if any) */
+-				while (!odata->eos)
+-				{	int result = ogg_stream_pageout (&odata->ostream, &odata->opage) ;
+-					if (result == 0) break ;
+-					ogg_write_page (psf, &odata->opage) ;
+-
+-		/* this could be set above, but for illustrative purposes, I do
+-		   it here (to show that vorbis does know where the stream ends) */
+-
+-					if (ogg_page_eos (&odata->opage)) odata->eos = 1 ;
+-				}
+-			}
+-		}
+-	}
++		if (ret == 0)
++		{	/* A write of zero samples tells Vorbis the stream is done and to
++			   flush. */
++			ret = vorbis_write_samples (psf, odata, vdata, 0) ;
++			} ;
++		} ;
+ 
+ 	/* ogg_page and ogg_packet structs always point to storage in
+ 	   libvorbis.  They are never freed or manipulated directly */
+@@ -449,7 +446,7 @@ vorbis_close (SF_PRIVATE *psf)
+ 	vorbis_comment_clear (&vdata->vcomment) ;
+ 	vorbis_info_clear (&vdata->vinfo) ;
+ 
+-	return 0 ;
++	return ret ;
+ } /* vorbis_close */
+ 
+ int
+@@ -688,33 +685,40 @@ vorbis_read_d (SF_PRIVATE *psf, double *ptr, sf_count_t lens)
+ /*==============================================================================
+ */
+ 
+-static void
++static int
+ vorbis_write_samples (SF_PRIVATE *psf, OGG_PRIVATE *odata, VORBIS_PRIVATE *vdata, int in_frames)
+-{
+-	vorbis_analysis_wrote (&vdata->vdsp, in_frames) ;
++{	int ret ;
++
++	if ((ret = vorbis_analysis_wrote (&vdata->vdsp, in_frames)) != 0)
++		return ret ;
+ 
+ 	/*
+ 	**	Vorbis does some data preanalysis, then divvies up blocks for
+ 	**	more involved (potentially parallel) processing. Get a single
+ 	**	block for encoding now.
+ 	*/
+-	while (vorbis_analysis_blockout (&vdata->vdsp, &vdata->vblock) == 1)
++	while ((ret = vorbis_analysis_blockout (&vdata->vdsp, &vdata->vblock)) == 1)
+ 	{
+ 		/* analysis, assume we want to use bitrate management */
+-		vorbis_analysis (&vdata->vblock, NULL) ;
+-		vorbis_bitrate_addblock (&vdata->vblock) ;
++		if ((ret = vorbis_analysis (&vdata->vblock, NULL)) != 0)
++			return ret ;
++		if ((ret = vorbis_bitrate_addblock (&vdata->vblock)) != 0)
++			return ret ;
+ 
+-		while (vorbis_bitrate_flushpacket (&vdata->vdsp, &odata->opacket))
++		while ((ret = vorbis_bitrate_flushpacket (&vdata->vdsp, &odata->opacket)) == 1)
+ 		{
+ 			/* weld the packet into the bitstream */
+-			ogg_stream_packetin (&odata->ostream, &odata->opacket) ;
++			if ((ret = ogg_stream_packetin (&odata->ostream, &odata->opacket)) != 0)
++				return ret ;
+ 
+ 			/* write out pages (if any) */
+ 			while (!odata->eos)
+-			{	int result = ogg_stream_pageout (&odata->ostream, &odata->opage) ;
+-				if (result == 0)
++			{	ret = ogg_stream_pageout (&odata->ostream, &odata->opage) ;
++				if (ret == 0)
+ 					break ;
+-				ogg_write_page (psf, &odata->opage) ;
++
++				if (ogg_write_page (psf, &odata->opage) < 0)
++					return -1 ;
+ 
+ 				/*	This could be set above, but for illustrative purposes, I do
+ 				**	it here (to show that vorbis does know where the stream ends) */
+@@ -722,16 +726,22 @@ vorbis_write_samples (SF_PRIVATE *psf, OGG_PRIVATE *odata, VORBIS_PRIVATE *vdata
+ 					odata->eos = 1 ;
+ 				} ;
+ 			} ;
++		if (ret != 0)
++			return ret ;
+ 		} ;
++	if (ret != 0)
++		return ret ;
+ 
+ 	vdata->gp += in_frames ;
++
++	return 0 ;
+ } /* vorbis_write_data */
+ 
+ 
+ static sf_count_t
+ vorbis_write_s (SF_PRIVATE *psf, const short *ptr, sf_count_t lens)
+ {
+-	int i, m, j = 0 ;
++	int i, m, j = 0, ret ;
+ 	OGG_PRIVATE *odata = (OGG_PRIVATE *) psf->container_data ;
+ 	VORBIS_PRIVATE *vdata = (VORBIS_PRIVATE *) psf->codec_data ;
+ 	int in_frames = lens / psf->sf.channels ;
+@@ -740,14 +750,17 @@ vorbis_write_s (SF_PRIVATE *psf, const short *ptr, sf_count_t lens)
+ 		for (m = 0 ; m < psf->sf.channels ; m++)
+ 			buffer [m][i] = (float) (ptr [j++]) / 32767.0f ;
+ 
+-	vorbis_write_samples (psf, odata, vdata, in_frames) ;
++	if ((ret = vorbis_write_samples (psf, odata, vdata, in_frames)))
++	{	vorbis_log_error (psf, ret) ;
++		return 0 ;
++		} ;
+ 
+ 	return lens ;
+ } /* vorbis_write_s */
+ 
+ static sf_count_t
+ vorbis_write_i (SF_PRIVATE *psf, const int *ptr, sf_count_t lens)
+-{	int i, m, j = 0 ;
++{	int i, m, j = 0, ret ;
+ 	OGG_PRIVATE *odata = (OGG_PRIVATE *) psf->container_data ;
+ 	VORBIS_PRIVATE *vdata = (VORBIS_PRIVATE *) psf->codec_data ;
+ 	int in_frames = lens / psf->sf.channels ;
+@@ -756,14 +769,17 @@ vorbis_write_i (SF_PRIVATE *psf, const int *ptr, sf_count_t lens)
+ 		for (m = 0 ; m < psf->sf.channels ; m++)
+ 			buffer [m][i] = (float) (ptr [j++]) / 2147483647.0f ;
+ 
+-	vorbis_write_samples (psf, odata, vdata, in_frames) ;
++	if ((ret = vorbis_write_samples (psf, odata, vdata, in_frames)))
++	{	vorbis_log_error (psf, ret) ;
++		return 0 ;
++		} ;
+ 
+ 	return lens ;
+ } /* vorbis_write_i */
+ 
+ static sf_count_t
+ vorbis_write_f (SF_PRIVATE *psf, const float *ptr, sf_count_t lens)
+-{	int i, m, j = 0 ;
++{	int i, m, j = 0, ret ;
+ 	OGG_PRIVATE *odata = (OGG_PRIVATE *) psf->container_data ;
+ 	VORBIS_PRIVATE *vdata = (VORBIS_PRIVATE *) psf->codec_data ;
+ 	int in_frames = lens / psf->sf.channels ;
+@@ -772,14 +788,17 @@ vorbis_write_f (SF_PRIVATE *psf, const float *ptr, sf_count_t lens)
+ 		for (m = 0 ; m < psf->sf.channels ; m++)
+ 			buffer [m][i] = ptr [j++] ;
+ 
+-	vorbis_write_samples (psf, odata, vdata, in_frames) ;
++	if ((ret = vorbis_write_samples (psf, odata, vdata, in_frames)) != 0)
++	{	vorbis_log_error (psf, ret) ;
++		return 0 ;
++		} ;
+ 
+ 	return lens ;
+ } /* vorbis_write_f */
+ 
+ static sf_count_t
+ vorbis_write_d (SF_PRIVATE *psf, const double *ptr, sf_count_t lens)
+-{	int i, m, j = 0 ;
++{	int i, m, j = 0, ret ;
+ 	OGG_PRIVATE *odata = (OGG_PRIVATE *) psf->container_data ;
+ 	VORBIS_PRIVATE *vdata = (VORBIS_PRIVATE *) psf->codec_data ;
+ 	int in_frames = lens / psf->sf.channels ;
+@@ -788,7 +807,10 @@ vorbis_write_d (SF_PRIVATE *psf, const double *ptr, sf_count_t lens)
+ 		for (m = 0 ; m < psf->sf.channels ; m++)
+ 			buffer [m][i] = (float) ptr [j++] ;
+ 
+-	vorbis_write_samples (psf, odata, vdata, in_frames) ;
++	if ((ret = vorbis_write_samples (psf, odata, vdata, in_frames)) != 0)
++	{	vorbis_log_error (psf, ret) ;
++		return 0 ;
++		} ;
+ 
+ 	return lens ;
+ } /* vorbis_write_d */
+@@ -884,7 +906,7 @@ vorbis_seek_trysearch (SF_PRIVATE *psf, uint64_t target_gp)
+ 		return 0 ;
+ 
+ 	/*	Search for a position a half large-block before our target. As Vorbis is
+-	**	lapped, every sample position come from two blocks, the "left" half of
++	**	lapped, every sample position comes from two blocks, the "left" half of
+ 	**	one block and the "right" half of the previous block.  The granule
+ 	**	position of an Ogg page of a Vorbis stream is the sample offset of the
+ 	**	last finished sample in the stream that can be decoded from a page.  A
+-- 
+2.39.5
+
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index dc23d94cb1..4caba72c4f 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -13,6 +13,24 @@ LIBSNDFILE_LICENSE_FILES = COPYING
 LIBSNDFILE_CPE_ID_VALID = YES
 LIBSNDFILE_DEPENDENCIES = host-pkgconf
 
+# 0001-mat4-mat5-fix-int-overflow-in-dataend-calculation.patch
+# 0002-au-avoid-int-overflow-while-calculating-data_end.patch
+# 0003-avr-fix-int-overflow-in-avr_read_header.patch
+# 0004-sds-fix-int-overflow-warning-in-sample-calculations.patch
+# 0005-aiff-fix-int-overflow-when-counting-header-elements.patch
+# 0006-ircam-fix-int-overflow-in-ircam_read_header.patch
+# 0007-mat4-mat5-fix-int-overflow-when-calculating-blockwid.patch
+# 0008-common-fix-int-overflow-in-psf_binheader_readf.patch
+# 0009-nms_adpcm-fix-int-overflow-in-signal-estimate.patch
+# 0010-nms_adpcm-fix-int-overflow-in-sf.frames-calc.patch
+# 0011-pcm-fix-int-overflow-in-pcm_init.patch
+# 0012-rf64-fix-int-overflow-in-rf64_read_header.patch
+# 0013-ima_adpcm-fix-int-overflow-in-ima_reader_init.patch
+LIBSNDFILE_IGNORE_CVES += CVE-2022-33065
+
+# 0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch
+LIBSNDFILE_IGNORE_CVES += CVE-2024-50612
+
 LIBSNDFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 LIBSNDFILE_CONF_OPTS = \
 	--disable-sqlite \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
