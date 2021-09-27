Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEEFC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 20:18:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7608C61041
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 20:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7608C61041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41E40404B8;
	Mon, 27 Sep 2021 20:18:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a9gASp3g8K7o; Mon, 27 Sep 2021 20:18:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5FDD404B1;
	Mon, 27 Sep 2021 20:18:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 018611BF239
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 20:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2E7180F94
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 20:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KvEzfxv0qaEK for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 20:18:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9CB080F8B
 for <buildroot@busybox.net>; Mon, 27 Sep 2021 20:18:03 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u18so54055038wrg.5
 for <buildroot@busybox.net>; Mon, 27 Sep 2021 13:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Is6emeltubIfqOCHRWaVn8oDqLs81emrumRolUNxmHs=;
 b=QMFKqpzLv7QEnMEkCekFDsHjr9JsavsNlxYq80TnWo8PaYeXVyC61VfKiXu7ZzWRKK
 uIFaHswvps0l0egmnNNbHlWYSqtDh5JVQDaSz5+8o0sAcAsHSFhjkrKohyIcKP2L0pFP
 EAaaflzasYtHSZslm98KjLTN8BM8zVhfdFP7WTDFo0GeTGLaPHTJRrkJO9vgsskzl6uL
 tCUjX7vvh12SNfdr99m1G6Pr2pK5YpEcrSa/Y9WuV7XfxUpurYB+HFay9k1xa+WK9/g/
 Wt0FaNy7vSifEglvGWxCPUkhknCy+zCewyZPqqwked5IO1eLJH95nOyUS0HIaG8uuboz
 gVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Is6emeltubIfqOCHRWaVn8oDqLs81emrumRolUNxmHs=;
 b=NdAeRmjC4t1cawKsziFp5pHjEhahVawsTlGmIuOzUtDYfeNr220Z9Y49IlJD77Qjx/
 ZfulkH05e7qqdo8Z2b7hFGYx4Tfu2/BwMv48Q8GdO1CxNgkxiFOb1uhykuykgDmtOhtm
 zTjWjl67rU6MXoPYcqYYhgLWqh+fodV3drDf5JO9LaTZ0fsAKkRKN0b6dAfQ8Ap7qImv
 xYoaxqhe4TmUq5yZnGg0fJioUYK39pRH3a6sWX8HCubTLP5eAVjD5OdKZz280BQaPt36
 aBv9n/TFS95fX1Qxb4kFjM8MFzya3I/hqHfHsyho1yHPtdVFB0DoxKWm/MuBBcqyYVK/
 rluQ==
X-Gm-Message-State: AOAM530u/5KkYuRN1Cn3mnWNA2UrV1oJK3iV37dLyeLv/HHkipi3BB1A
 mXiACdisrJ5wS2niau9tCtFbJd3qbWY=
X-Google-Smtp-Source: ABdhPJz2CDBPRoJor3JFQD04J8Gz0za710v+sYRtEI52Y3QfBM1QqFR5iXd2yqMW+7x5Ic1igJbPIw==
X-Received: by 2002:adf:fcca:: with SMTP id f10mr2075941wrs.304.1632773881992; 
 Mon, 27 Sep 2021 13:18:01 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id f1sm18950547wri.43.2021.09.27.13.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 13:18:01 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 27 Sep 2021 22:17:53 +0200
Message-Id: <20210927201753.122703-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pcre2: bump to version 10.37
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff LICENSE:
-Copyright (c) 1997-2020 University of Cambridge
+Copyright (c) 1997-2021 University of Cambridge
-Copyright(c) 2010-2020 Zoltan Herczeg
+Copyright(c) 2010-2021 Zoltan Herczeg

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pcre2/pcre2.hash | 6 +++---
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index b30a29096..130ce1f59 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.pcre.org/pub/pcre/pcre2-10.36.tar.bz2.sig
-sha256  a9ef39278113542968c7c73a31cfcb81aca1faa64690f400b907e8ab6b4a665c  pcre2-10.36.tar.bz2
+# https://ftp.pcre.org/pub/pcre/pcre2-10.37.tar.bz2.sig
+sha256  4d95a96e8b80529893b4562be12648d798b957b1ba1aae39606bbc2ab956d270  pcre2-10.37.tar.bz2
 # Locally computed
-sha256  8937734bbb1ba65d9f8ac7a7c8fc9016759a09aa2fb37d2175c06c9e7a856a24  LICENCE
+sha256  9c9488256e3612ec5ea40fd12abe7ec55a58f23bd36e6f465116c2b3cbffba02  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index d02772650..220eb8a99 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.36
+PCRE2_VERSION = 10.37
 PCRE2_SITE = https://ftp.pcre.org/pub/pcre
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
