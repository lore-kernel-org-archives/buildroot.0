Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E8EC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:58:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B02E9613D2
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B02E9613D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 885E5404A0;
	Mon,  4 Oct 2021 21:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qE5iPYDSoNEg; Mon,  4 Oct 2021 21:58:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D85154034F;
	Mon,  4 Oct 2021 21:58:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5995B1BF97F
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49A30405C1
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r3WIIefPRQzs for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 21:57:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D63540640
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 21:57:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 646F88F2B9; Mon,  4 Oct 2021 21:54:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 23:56:27 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: afe4f30e17072a9890b6b3224098f93a76abf6b2
X-Git-Newrev: 7c392e2bfdc39c3c4f392418336966f2846bdb78
X-Patchwork-Hint: ignore
Message-Id: <20211004215448.646F88F2B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libsndfile: add
 security patch for CVE-2021-3246
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c392e2bfdc39c3c4f392418336966f2846bdb78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

A heap buffer overflow vulnerability in msadpcm_decode_block of libsndfile
1.0.30 allows attackers to execute arbitrary code via a crafted WAV file.

https://nvd.nist.gov/vuln/detail/CVE-2021-3246

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit cb18218ad125c1e4c13010c8ee946057ee07103c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0011-ms_adpcm-Fix-and-extend-size-checks.patch | 40 ++++++++++++++++++++++
 package/libsndfile/libsndfile.mk                   |  3 ++
 2 files changed, 43 insertions(+)

diff --git a/package/libsndfile/0011-ms_adpcm-Fix-and-extend-size-checks.patch b/package/libsndfile/0011-ms_adpcm-Fix-and-extend-size-checks.patch
new file mode 100644
index 0000000000..edacbda01a
--- /dev/null
+++ b/package/libsndfile/0011-ms_adpcm-Fix-and-extend-size-checks.patch
@@ -0,0 +1,40 @@
+From deb669ee8be55a94565f6f8a6b60890c2e7c6f32 Mon Sep 17 00:00:00 2001
+From: bobsayshilol <bobsayshilol@live.co.uk>
+Date: Thu, 18 Feb 2021 21:52:09 +0000
+Subject: [PATCH] ms_adpcm: Fix and extend size checks
+
+'blockalign' is the size of a block, and each block contains 7 samples
+per channel as part of the preamble, so check against 'samplesperblock'
+rather than 'blockalign'. Also add an additional check that the block
+is big enough to hold the samples it claims to hold.
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=26803
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/ms_adpcm.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/ms_adpcm.c b/src/ms_adpcm.c
+index 5e8f1a31..a21cb994 100644
+--- a/src/ms_adpcm.c
++++ b/src/ms_adpcm.c
+@@ -128,8 +128,14 @@ wavlike_msadpcm_init	(SF_PRIVATE *psf, int blockalign, int samplesperblock)
+ 	if (psf->file.mode == SFM_WRITE)
+ 		samplesperblock = 2 + 2 * (blockalign - 7 * psf->sf.channels) / psf->sf.channels ;
+ 
+-	if (blockalign < 7 * psf->sf.channels)
+-	{	psf_log_printf (psf, "*** Error blockalign (%d) should be > %d.\n", blockalign, 7 * psf->sf.channels) ;
++	/* There's 7 samples per channel in the preamble of each block */
++	if (samplesperblock < 7 * psf->sf.channels)
++	{	psf_log_printf (psf, "*** Error samplesperblock (%d) should be >= %d.\n", samplesperblock, 7 * psf->sf.channels) ;
++		return SFE_INTERNAL ;
++		} ;
++
++	if (2 * blockalign < samplesperblock * psf->sf.channels)
++	{	psf_log_printf (psf, "*** Error blockalign (%d) should be >= %d.\n", blockalign, samplesperblock * psf->sf.channels / 2) ;
+ 		return SFE_INTERNAL ;
+ 		} ;
+ 
+-- 
+2.20.1
+
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index eb15426146..81bf804eb8 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -19,6 +19,9 @@ LIBSNDFILE_IGNORE_CVES += CVE-2018-13139 CVE-2018-19432
 LIBSNDFILE_IGNORE_CVES += \
 	CVE-2017-14245 CVE-2017-14246 CVE-2017-17456 CVE-2017-17457 \
 	CVE-2018-19661 CVE-2018-19662
+# 0011-ms_adpcm-Fix-and-extend-size-checks.patch
+LIBSNDFILE_IGNORE_CVES += CVE-2021-3246
+
 # disputed, https://github.com/erikd/libsndfile/issues/398
 LIBSNDFILE_IGNORE_CVES += CVE-2018-13419
 # 0004-src-wav.c-Fix-heap-read-overflow.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
