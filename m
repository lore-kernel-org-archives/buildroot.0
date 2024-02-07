Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDC9C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E94A8333F;
	Wed,  7 Feb 2024 15:35:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_v5Lv09RFQt; Wed,  7 Feb 2024 15:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BAA5839A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BAA5839A4;
	Wed,  7 Feb 2024 15:35:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A03071BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E00D613F2
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AYU1Sz1Y20Qd for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:35:55 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=sergio.prado@e-labworks.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A4F860BD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A4F860BD3
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A4F860BD3
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:35:55 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6e0507eb60cso532757b3a.3
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 07:35:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707320154; x=1707924954;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kYTtbRyBTKMoYy8Vwp7KDFFiNSygYnwPdkJKH7rQbcQ=;
 b=WMQadMyqDSPZn+zLZPdSF/H926arsgujSiwpU8hVtTpmw3Cwa6pkcikfSQI/zzIcQj
 KStWHrVH93ZmSV7XWzNyrzAHTMndlG4mKlQI2IN4c5wa8iIhYseXft98i8CXW98+/h8g
 TzVNhags0j/iCemyeIQDy+ZX522vjIbFWSiLMHfIstAQVRZufTgs05qvPrtdbeC7qHmJ
 jcds5F97vp07IIM+THhYpF55SpmfCYljqFwkI39AOynvLtGWFMI5ZWWd8cL2uFYnsUbq
 JZv98lOASabvwzJFxKMBTHPFaP2KuRfTvWRusF/e5LjPDeSChV0geiiHIUv20AaJX0En
 cCUA==
X-Gm-Message-State: AOJu0Yw2SjUHk0U6OmuXVHnqO1/jMXlmXWjnVpZnq3oXR6yX5LGNzUHQ
 hLOL9yFVgFjoR9RFczNDUSWp1k38n73MBikPRnpC1YKoJLPiQsk5IP/RIOx8ZZTewkHw0oi/IAK
 T2rM=
X-Google-Smtp-Source: AGHT+IF2fsy/03hj/lVTQansbZxVu5i52YI8NQeMAqoOwvuuXKnf7nc56MqjiDquENNtc1IARR5Yrw==
X-Received: by 2002:a05:6a20:958e:b0:19e:3ccd:6f86 with SMTP id
 iu14-20020a056a20958e00b0019e3ccd6f86mr6459831pzb.43.1707320154382; 
 Wed, 07 Feb 2024 07:35:54 -0800 (PST)
Received: from desktop.. ([2804:7f0:6401:3d0a:a6a6:9d8e:a5d4:9076])
 by smtp.gmail.com with ESMTPSA id
 lp20-20020a056a003d5400b006e04c3b3b58sm1778931pfb.179.2024.02.07.07.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 07:35:53 -0800 (PST)
From: Sergio Prado <sergio.prado@e-labworks.com>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 12:35:32 -0300
Message-Id: <20240207153532.1199300-1-sergio.prado@e-labworks.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=e-labworks-com.20230601.gappssmtp.com; s=20230601; t=1707320154; x=1707924954;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kYTtbRyBTKMoYy8Vwp7KDFFiNSygYnwPdkJKH7rQbcQ=;
 b=ujHVN8TakSe2quYqkrLyY+CHUnmVln2jZw89pRR1zM3HAMisk8Iqfg6bl3Vo7yWWrF
 KrZNfNe74B8or1uaIYQdAmO67lH551+s+b07nGBZcV1gNtmNqlNe/W69efRznAGp8kbq
 Hrob6sNkQs5ZXwoFuy3kEx4p7RZZn5Zeaj4rFHBLlIkA7YiFvTMXwt72oIdYLKk5iFpN
 /TGJAxZw612HlbHC3eS3NJWXo/EvmbWBsQO0Mr0wDDfK2xyj+QncEU4TqrNcb65ogVrB
 pg8XcrZbESoo8kTN3K4jZCYfEyk5cYyQSyBtEbRmCWwJxBXvuAC1seboo2BFu7Lq2guR
 Z5qw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=e-labworks.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=e-labworks-com.20230601.gappssmtp.com
 header.i=@e-labworks-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ujHVN8Ta
Subject: [Buildroot] [PATCH] package/tio: bump to version 2.7
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/tio/tio.hash | 4 ++--
 package/tio/tio.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tio/tio.hash b/package/tio/tio.hash
index cb0311a752ed..02699fdeb435 100644
--- a/package/tio/tio.hash
+++ b/package/tio/tio.hash
@@ -1,5 +1,5 @@
-# From https://github.com/tio/tio/releases/download/v1.47/tio-1.47.tar.xz.sha256sum:
-sha256  6f39ac582de747feb9a64c14e6b378c61cb0c3bfa6639e62050022c1b7f5c544  tio-1.47.tar.xz
+# From https://github.com/tio/tio/releases/download/v2.7/tio-2.7.tar.xz.sha256sum:
+sha256  bf8fe434848c2c1b6540af0b42503c986068176ddc1a988cf02e521e7de5daa5  tio-2.7.tar.xz
 
 # Hash for license files:
 sha256  9248dee77ee136321f24556a96e07ff8f90461013941884a9defd0ac825ef131  LICENSE
diff --git a/package/tio/tio.mk b/package/tio/tio.mk
index 0035ce445ee2..d7b554ee8478 100644
--- a/package/tio/tio.mk
+++ b/package/tio/tio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIO_VERSION = 1.47
+TIO_VERSION = 2.7
 TIO_SOURCE = tio-$(TIO_VERSION).tar.xz
 TIO_SITE = https://github.com/tio/tio/releases/download/v$(TIO_VERSION)
 TIO_LICENSE = GPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
