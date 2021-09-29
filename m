Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42588C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 22:00:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 946AC61423
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 22:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 946AC61423
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F04883EEE;
	Wed, 29 Sep 2021 22:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iu4cETxE671m; Wed, 29 Sep 2021 22:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7B2A83EAD;
	Wed, 29 Sep 2021 22:00:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2541BF3DC
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 22:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0848A83EAD
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 22:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N4CXSeSsQipP for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 22:00:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3F788355C
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 22:00:34 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k7so6524152wrd.13
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 15:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dZE5TvwIttBmDea3r1MOy/dvt+8LWeboNvYexygwaz0=;
 b=WWgp383qH9Lf5asIPIWmwycoYL1dYyGyM1tVDktftKJ3pCx1GWm17ekz40ViynYFZu
 KuB6CHbzVYmQ+ZwAKdXcQPtbm9WVgATKH+KP8yXMY+HYvApQVHp4ZL27BlEYvihhIYXL
 fiGd6NS+Budv3uDAj5k4R3AkaadW/7jCDZ2W6QM3HUH7cXe69+gL/9h8JxvyxJX2k7C/
 uaG7xAdxMpiIrj4qqyAwsPzn1DNAk47Czbg6Nn+ZaPmO5nozDfqCr/nB3woZHtrg0/cq
 woPNPdvWkBjvKcEBZQEHwpPO+FN18OrIz6ro2bvvmiVwT7abYKt7nQTiBPxOaEntlejJ
 bxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dZE5TvwIttBmDea3r1MOy/dvt+8LWeboNvYexygwaz0=;
 b=27Er+fC9M+tvH8h7MgHfYQpht32h/KSjgxicZo2/oCxtNX60EP8jRleluNhSIAYohg
 M/ghMme21RQlBUligQkJZh9vvzVm6fdEOtME8Zr3HJSo5q16eMPNb9Yx8K2Raf7VNbk6
 mix1+FAAaV8C8e1LrFru+8Ok0q1PCZL9p2ksdwxaOFi3dTnt4/MHjnDJ6o7h/tSwm+dz
 WUGDKc+8GYVEpdeHa36yg/0140gAsxTtWwvsmx3uxHPitCpoYzsbTvWtR+Tm8RxK2vob
 YdC9spA5iou5+imSTvhitxwH8taqdJeya5HDW9O5aG8ebUnL0C3pSUvPC5uvEE3igcBo
 GMKw==
X-Gm-Message-State: AOAM531X6G+SHaPZq6L3B2yLaFwuRh5xCpHH94Mxi/zfLr0E/Nlrzm/M
 v/F+aUsv0aTAUhFA6RwL1jPK9TXareI=
X-Google-Smtp-Source: ABdhPJzjQ1sqzRXprXEBOH3TWP46q5hyFieOiaIP1U4Rhh5YNSsdrwsByIXanZOc7XKSmQj+0IDIUw==
X-Received: by 2002:adf:ee4d:: with SMTP id w13mr2350972wro.223.1632952832960; 
 Wed, 29 Sep 2021 15:00:32 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 8sm957219wmo.47.2021.09.29.15.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 15:00:32 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 00:00:27 +0200
Message-Id: <20210929220027.10505-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH RFC] package/binutils: build deterministic
 archives by default
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The option --enable-deterministic-archives that build deterministic
archives is supported by binutils since binutils 2.23 [1][2].

See "Static libraries" chapter [3].
https://reproducible-builds.org/docs/archives/

Enable this option for target and host variant.

It was added to Yocto Morty (2.2) in 2016 [4].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=2e30cb575a1d2b1eb8f776356ed59b0722a943d1
[2] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=9cb80f72d8b8b2f59562692d9385cd5a533e9b3f
[3] https://reproducible-builds.org/docs/archives
[4] https://github.com/openembedded/openembedded-core/commit/df0d525c02780b5a0bd7a177a249c55f41797476

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/binutils/binutils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 8ec76134bc..c5c685ac85 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -57,6 +57,7 @@ BINUTILS_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
 	--enable-install-libiberty \
 	--enable-build-warnings=no \
+	--enable-deterministic-archives \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
@@ -93,6 +94,7 @@ HOST_BINUTILS_CONF_OPTS = \
 	--disable-shared \
 	--enable-static \
 	--with-sysroot=$(STAGING_DIR) \
+	--enable-deterministic-archives \
 	--enable-poison-system-directories \
 	--without-debuginfod \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
