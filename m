Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4713C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 11:31:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22D29611EE
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 11:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22D29611EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C09F2407B3;
	Wed, 22 Sep 2021 11:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g9XyAOfH_IAS; Wed, 22 Sep 2021 11:31:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 137EF407AC;
	Wed, 22 Sep 2021 11:31:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D48581BF3BE
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 11:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D17D583F97
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 11:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OUOR6Fipe5CB for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 11:31:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA0E783F6F
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 11:31:23 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 67B7024000C;
 Wed, 22 Sep 2021 11:31:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mT0T9-0000Qe-Aj; Wed, 22 Sep 2021 13:31:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 13:31:09 +0200
Message-Id: <20210922113110.1586-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libsndfile: add security patch for
 CVE-2021-3246
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

A heap buffer overflow vulnerability in msadpcm_decode_block of libsndfile
1.0.30 allows attackers to execute arbitrary code via a crafted WAV file.

https://nvd.nist.gov/vuln/detail/CVE-2021-3246

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-ms_adpcm-Fix-and-extend-size-checks.patch | 40 +++++++++++++++++++
 package/libsndfile/libsndfile.mk              |  3 ++
 2 files changed, 43 insertions(+)
 create mode 100644 package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch

diff --git a/package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch b/package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch
new file mode 100644
index 0000000000..edacbda01a
--- /dev/null
+++ b/package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch
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
index c955b9d088..ed9e8e3d14 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -12,6 +12,9 @@ LIBSNDFILE_LICENSE = LGPL-2.1+
 LIBSNDFILE_LICENSE_FILES = COPYING
 LIBSNDFILE_CPE_ID_VENDOR = libsndfile_project
 
+# 0001-ms_adpcm-Fix-and-extend-size-checks.patch
+LIBSNDFILE_IGNORE_CVES += CVE-2021-3246
+
 # disputed, https://github.com/erikd/libsndfile/issues/398
 LIBSNDFILE_IGNORE_CVES += CVE-2018-13419
 
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
