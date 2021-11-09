Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8FDC433FE
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 20:29:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 363BF6112F
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 20:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 363BF6112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA033608BD;
	Tue,  9 Nov 2021 20:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3HHnUfXvrjtQ; Tue,  9 Nov 2021 20:29:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4459F6086F;
	Tue,  9 Nov 2021 20:29:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71F151BF3B5
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 20:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EF0680EA2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 20:29:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id syjf5Zzatxcx for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 20:29:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C841280E65
 for <buildroot@busybox.net>; Tue,  9 Nov 2021 20:29:44 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t30so42502wra.10
 for <buildroot@busybox.net>; Tue, 09 Nov 2021 12:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DSNBC+hPLH+8Rc+GBtX+88haSZAQnZHlc6PTblBnDEs=;
 b=IBaRdF97T5jBObEiDmv8SuqDPLDW72y4G9SICEwKJco7ZcFYkOIRMyMccRVwRJ+F6d
 Daiua6fT3K9sYtNtGKDpHB8FlQgxfuecD2NtYjkY+5NNdJBUE/c7sJFR+qp/QykEDhBF
 AAyqa7+L2xKwMl5gY7Q0v6hlHSvaxqSwrKri3jdaeCbhsoE71TR6WCoVtFBkravTKQwi
 KUgZ3K5al/LobctH5dFKgPFGnXLkN8/xjRvu6W/OZswbAmiCsKxrxcw+VRY1OYAL6jiw
 v4egv/XeIOXsEQIA+f+HB5+KtVTiut7GmlvptsQMzxQGE7JXBKbpeTJzAjcv+QMNDNRp
 2g0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DSNBC+hPLH+8Rc+GBtX+88haSZAQnZHlc6PTblBnDEs=;
 b=6n8Z5a8EhF3dC1IcfZx/6iBPDcw6dfjCyu0AQZj9mFOzf6BnEvj1xw6iz62zoq9VXU
 6NMmljJEatgDoFGTjzkuMi1WqjbU3ht2wKYFTIffW4xsodcB7lA/QGxkzg4OQNqPJzc0
 3hZ5aBGc4OxNA+R4zX6etW7n3D/eqoxwY73pTzd8UoBslBPGsm3qH5455gIPfKb4RSqZ
 CzNO60e+vYMORJlMC30Lm19YTDa+PBvqhZEye2WLOwR+tXqAaTcK/CO3fXtNIY9+XadX
 NOyNraDNiC+YCoZvfZ6/WnkQypoLazQ4nOtcGDEw+MRBxiQuG4D+Ip1ru7lp4Kb8SUYa
 GrVw==
X-Gm-Message-State: AOAM530EOQkoeAKoUddjWfaNocZ6Kw3S/XcSq/faKsYtvvimdUPOhEIz
 YKVmOfztQ6X2KdRB1n0tObfoBcl7q3Q=
X-Google-Smtp-Source: ABdhPJzy2K7JhTyV6/WJShuuDjfAGUrB3iEsR9tC+6XrYqA+7IJLFMUiQ/elA+n2f5DGVTHayLJl0A==
X-Received: by 2002:adf:ed83:: with SMTP id c3mr12676121wro.169.1636489783003; 
 Tue, 09 Nov 2021 12:29:43 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id n4sm24275614wri.41.2021.11.09.12.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 12:29:42 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue,  9 Nov 2021 21:29:32 +0100
Message-Id: <20211109202933.245504-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lualogging: bump to version 1.6.0
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lualogging/lualogging.hash | 2 +-
 package/lualogging/lualogging.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lualogging/lualogging.hash b/package/lualogging/lualogging.hash
index 45f186885..294ef95ad 100644
--- a/package/lualogging/lualogging.hash
+++ b/package/lualogging/lualogging.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 70451dbec500dbc760f0eae666a10b19a0ba9bcbfa5dd8d3134908e5ae6d28b1  lualogging-1.5.1-1.src.rock
+sha256 d29c9c78e4266d9390069b2a5f7afacfcf9189dea12ce3774a5aa4e3cdbcd89f  lualogging-1.6.0-1.src.rock
 sha256 4d95b123e667a13615f567a829aa39211dd55b0b48c9f247bf3fcc5c0b485da7  lualogging/COPYRIGHT
diff --git a/package/lualogging/lualogging.mk b/package/lualogging/lualogging.mk
index 9c94e588a..4d01f546e 100644
--- a/package/lualogging/lualogging.mk
+++ b/package/lualogging/lualogging.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUALOGGING_VERSION = 1.5.1-1
+LUALOGGING_VERSION = 1.6.0-1
 LUALOGGING_SUBDIR = lualogging
 LUALOGGING_LICENSE = MIT
 LUALOGGING_LICENSE_FILES = $(LUALOGGING_SUBDIR)/COPYRIGHT
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
