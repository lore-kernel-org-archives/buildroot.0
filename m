Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C01C43334
	for <buildroot@archiver.kernel.org>; Sun, 26 Jun 2022 21:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE19340583;
	Sun, 26 Jun 2022 21:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE19340583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3wPAEUgO6-2; Sun, 26 Jun 2022 21:10:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9FFA4093B;
	Sun, 26 Jun 2022 21:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9FFA4093B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D91471BF3E3
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 21:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0FA34169B
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 21:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0FA34169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xU6cLLqYPUaf for <buildroot@lists.busybox.net>;
 Sun, 26 Jun 2022 21:10:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AD50410AB
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AD50410AB
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 21:10:49 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v14so10404914wra.5
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 14:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=abUsxQ5yizxKMvZMZJvzx1X0HF0GldeJJnDUTepn6YM=;
 b=Vk+oFxxDZ1uC7guYruBbOyRyXj6NBS5x8FMmfDtx9uYnRl04RYkmIyxL8k8tarn+nX
 RvJZW5pXEY9QN7AUu7aqvKSm+ikC/pL6CXumMFUFHTU2489Odnt53TZS8CupEGPDU7de
 knpZJZ5Q3b+urgA9NOSNAVdeSY5luXSyECycVHFLLwNgVAFPGiJsYQcPoWWGar0u6Bie
 nNqX1MYojrJUs5sQ5Cz/mi5hgH3MFvlULZYl020UU3u8SoBNivxOl5CptC2Pd+Jk+2JB
 X6DKsHcebbTXbSWkY2bQfBtF3Wf6GrXteMiasXOxjnc8i5rTOM92KIU3zS9ZICN+zcq6
 FFPQ==
X-Gm-Message-State: AJIora/pCr2m2ZqdnONAxr81wUCbYELqcIvcuJsCJHr7Kzp/etz8nGer
 BLtFaFFsfV9HY1rwkf1dQf3j9N5e3do=
X-Google-Smtp-Source: AGRyM1vVFv4YwNy/1yvDFMyn+b4K/JrKocAqAWg/j+KiKEnYdrDL7LXwgoN2fxpy8A4/U5Y4XYqfYA==
X-Received: by 2002:a05:6000:1f19:b0:21b:98d6:3532 with SMTP id
 bv25-20020a0560001f1900b0021b98d63532mr9486203wrb.45.1656277846976; 
 Sun, 26 Jun 2022 14:10:46 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a5d5105000000b0021b88ec99cesm8482359wrt.94.2022.06.26.14.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 14:10:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 23:07:59 +0200
Message-Id: <20220626210759.1618312-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=abUsxQ5yizxKMvZMZJvzx1X0HF0GldeJJnDUTepn6YM=;
 b=pr6HHYXSQnW3vC2CGRcN/dqkkhcVECvfbiKrcRQTRn1++MKjSEE655mOpG3Nr+u1dp
 z4RoTa3uC/mqzDElrfHtmdjkqRg7g8NmIgKSYlQm/ldD7+2SKC+mliCO/7doX0LzIpE9
 GzbjRGiKGZNQpVzuaqZuUrSJIQG6v/QRK5zjq4c8dbzVDrg81lorxLWPsQ/myGDAzZSR
 TzSc0JAD8QRa6Y6VH3E2sYs/IOwTPnZwU1Avdi4AFPeEaA7YNZ/ucaSg9gwcvqu0y9sd
 RyYA5SZPi7NqFz59vzRrL/J8q/j8cZRlFZRGJVDbdjZBYDKUkFtOyDgF0NS8AeD7DmUL
 SfMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pr6HHYXS
Subject: [Buildroot] [PATCH 1/1] package/libsndfile: security bump to
 version 1.1.0
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following security issues:
 - Heap buffer overflow in wavlike_ima_decode_block()
 - Heap buffer overflow in msadpcm_decode_block()
 - Heap buffer overflow in psf_binheader_readf()
 - Index out of bounds in psf_nms_adpcm_decode_block()
 - Heap buffer overflow in flac_buffer_copy()
 - Heap buffer overflow in copyPredictorTo24()
 - Uninitialized variable in psf_binheader_readf()

Drop patch (already in version)

While at it, also drop mention of CVE-2018-13419 which is correclty
tagged as only affecting version 1.0.28 in NVD NIST database:
https://nvd.nist.gov/vuln/detail/CVE-2018-13419

https://github.com/libsndfile/libsndfile/releases/tag/1.1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-ms_adpcm-Fix-and-extend-size-checks.patch | 40 -------------------
 package/libsndfile/libsndfile.hash            |  2 +-
 package/libsndfile/libsndfile.mk              | 10 +----
 3 files changed, 3 insertions(+), 49 deletions(-)
 delete mode 100644 package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch

diff --git a/package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch b/package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch
deleted file mode 100644
index edacbda01a..0000000000
--- a/package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From deb669ee8be55a94565f6f8a6b60890c2e7c6f32 Mon Sep 17 00:00:00 2001
-From: bobsayshilol <bobsayshilol@live.co.uk>
-Date: Thu, 18 Feb 2021 21:52:09 +0000
-Subject: [PATCH] ms_adpcm: Fix and extend size checks
-
-'blockalign' is the size of a block, and each block contains 7 samples
-per channel as part of the preamble, so check against 'samplesperblock'
-rather than 'blockalign'. Also add an additional check that the block
-is big enough to hold the samples it claims to hold.
-
-https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=26803
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/ms_adpcm.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/src/ms_adpcm.c b/src/ms_adpcm.c
-index 5e8f1a31..a21cb994 100644
---- a/src/ms_adpcm.c
-+++ b/src/ms_adpcm.c
-@@ -128,8 +128,14 @@ wavlike_msadpcm_init	(SF_PRIVATE *psf, int blockalign, int samplesperblock)
- 	if (psf->file.mode == SFM_WRITE)
- 		samplesperblock = 2 + 2 * (blockalign - 7 * psf->sf.channels) / psf->sf.channels ;
- 
--	if (blockalign < 7 * psf->sf.channels)
--	{	psf_log_printf (psf, "*** Error blockalign (%d) should be > %d.\n", blockalign, 7 * psf->sf.channels) ;
-+	/* There's 7 samples per channel in the preamble of each block */
-+	if (samplesperblock < 7 * psf->sf.channels)
-+	{	psf_log_printf (psf, "*** Error samplesperblock (%d) should be >= %d.\n", samplesperblock, 7 * psf->sf.channels) ;
-+		return SFE_INTERNAL ;
-+		} ;
-+
-+	if (2 * blockalign < samplesperblock * psf->sf.channels)
-+	{	psf_log_printf (psf, "*** Error blockalign (%d) should be >= %d.\n", blockalign, samplesperblock * psf->sf.channels / 2) ;
- 		return SFE_INTERNAL ;
- 		} ;
- 
--- 
-2.20.1
-
diff --git a/package/libsndfile/libsndfile.hash b/package/libsndfile/libsndfile.hash
index 14dfe823f9..67d10d03c4 100644
--- a/package/libsndfile/libsndfile.hash
+++ b/package/libsndfile/libsndfile.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  a8cfb1c09ea6e90eff4ca87322d4168cdbe5035cb48717b40bf77e751cc02163  libsndfile-1.0.31.tar.bz2
+sha256  0f98e101c0f7c850a71225fb5feaf33b106227b3d331333ddc9bacee190bcf41  libsndfile-1.1.0.tar.xz
 # Locally calculated
 sha256  ad01ea5cd2755f6048383c8d54c88459cd6fcb17757c5c8892f8c5ea060f6140  COPYING
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index ed9e8e3d14..12a6601b6b 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -4,20 +4,14 @@
 #
 ################################################################################
 
-LIBSNDFILE_VERSION = 1.0.31
-LIBSNDFILE_SOURCE = libsndfile-$(LIBSNDFILE_VERSION).tar.bz2
+LIBSNDFILE_VERSION = 1.1.0
+LIBSNDFILE_SOURCE = libsndfile-$(LIBSNDFILE_VERSION).tar.xz
 LIBSNDFILE_SITE = https://github.com/libsndfile/libsndfile/releases/download/$(LIBSNDFILE_VERSION)
 LIBSNDFILE_INSTALL_STAGING = YES
 LIBSNDFILE_LICENSE = LGPL-2.1+
 LIBSNDFILE_LICENSE_FILES = COPYING
 LIBSNDFILE_CPE_ID_VENDOR = libsndfile_project
 
-# 0001-ms_adpcm-Fix-and-extend-size-checks.patch
-LIBSNDFILE_IGNORE_CVES += CVE-2021-3246
-
-# disputed, https://github.com/erikd/libsndfile/issues/398
-LIBSNDFILE_IGNORE_CVES += CVE-2018-13419
-
 LIBSNDFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 LIBSNDFILE_CONF_OPTS = \
 	--disable-sqlite \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
