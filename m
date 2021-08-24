Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089FAC4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 19:51:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A33B8604AC
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 19:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A33B8604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CF5880E22;
	Tue, 24 Aug 2021 19:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6b3M_P7u3jU; Tue, 24 Aug 2021 19:50:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D536A80E23;
	Tue, 24 Aug 2021 19:50:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94E1E1BF5DF
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 19:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FDD560BE0
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 19:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9pqNsDsJ7Chw for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 19:50:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F415B60BCC
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 19:50:48 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id x12so32923388wrr.11
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 12:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AW4JF7dk0B12+nwQD90KRmAVRO/Usa7umc/cuml8dcM=;
 b=F7oKumx7075EiZaBDlGSqlUFe+nhTACXt/CS40zCN/cZf3chGCm70Oe42PBmyT0xWP
 Rvefl3Q6uzuZwBINqxldepk//3GtUuJF8cVUO6lFiWv34+tXRWXaCxplLLD/mWrAnuOC
 magT3C0vLQW88yW1k2dc7gTh8qbGSJ7sM0GKnr6MZr6AlFQtW+0iIaSbSvpkmhsUR7JU
 +SnVotB79uv7OfcR9CtMuIfiCP7iLLDmoT3X+IwWLo7gkN/HGEOgM6B36LtQvJzjT0c2
 sDnwQ/iKGTa2K7lb87EmQYOEN8mHcyoqUhK2rCqrxM7uqMPMmMNR9x21kEMRnYReySKc
 XT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AW4JF7dk0B12+nwQD90KRmAVRO/Usa7umc/cuml8dcM=;
 b=jSD+CaDILQYgn1UiwtmebvCp1QDEdUiqzPf6UAZ12HV1pe8Nys8myEkmNxlNPqKkYD
 PsW3BPPobb475Dl1dt/ehKNnbW69yxlHZwSRBW99iVDyWgnHyrAZeFYK6P5t5+jZi4jJ
 3zvKsWyjyGsazfj+WJySN1XiOsFAQYEdg0aHg4COjtuKXPuN82jW//NlPHqd6/ohBTse
 KbEPYjQbg0hjX0SZ7/SPxoo4tafoH9jEK7S/K5ncQWI66Z84cBDQElhx8bMZbftuw3Sh
 hKbvT40mGIQtHWwpJ64Im3m0ItWxPN6oHrcwQA+Aoec8pHe8kx3XK07MhU8SQ/ci1RdQ
 3ULg==
X-Gm-Message-State: AOAM533YVZw3piCqMjCNAWTSQQV7OmoDvTOsQPt/aYzfQm3czPRol/sp
 prUPpJfHVwU1Xzznr19UtTyg8iqrvFm+JvVk
X-Google-Smtp-Source: ABdhPJy3E1Luv0IeYgZwfFA01J+OgLfpDSzgeejXgNdue5DuAz73+uIewyPr8B71MVknizWe5Ax7Sg==
X-Received: by 2002:a5d:6d8f:: with SMTP id l15mr21467268wrs.42.1629834647068; 
 Tue, 24 Aug 2021 12:50:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id c190sm3213377wma.21.2021.08.24.12.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 12:50:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 21:50:06 +0200
Message-Id: <20210824195006.185258-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libarchive: security bump to
 version 3.5.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix CVE-2021-36976: libarchive 3.4.1 through 3.5.1 has a use-after-free
in copy_string (called from do_uncompress_block and process_block).

https://github.com/libarchive/libarchive/releases/tag/v3.5.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libarchive/libarchive.hash | 2 +-
 package/libarchive/libarchive.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index bf0d6e4fdd..d31e9f55f4 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  9015d109ec00bb9ae1a384b172bf2fc1dff41e2c66e5a9eeddf933af9db37f5a  libarchive-3.5.1.tar.gz
+sha256  f0b19ff39c3c9a5898a219497ababbadab99d8178acc980155c7e1271089b5a0  libarchive-3.5.2.tar.xz
 # Locally computed:
 sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 9cc69fd45a..eec256ba75 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.5.1
+LIBARCHIVE_VERSION = 3.5.2
+LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
