Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED57CF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 17:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 283C740018;
	Sun, 22 Sep 2024 17:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LSjCrcOfjsnp; Sun, 22 Sep 2024 17:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D727140022
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D727140022;
	Sun, 22 Sep 2024 17:35:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18B151BF297
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 17:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13EA8405D0
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 17:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtmxSEFtg_Of for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 17:35:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A06E6405CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A06E6405CD
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A06E6405CD
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 17:35:26 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2d889ba25f7so2474857a91.0
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727026526; x=1727631326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w6DnbCuBg/11sr4ijY5XUxDysLAqJDDTEOn0RNVcRq8=;
 b=RBaoq5xTIs/GfNQqSbXe3TLChWECNPs6u7T8FQ25lGobxhppR7mLuqGGxkkO3kQPt/
 Lh7VMImjBuzCxSIGGZl2DeVovaDessmgTdq0XCZuUXJ0uhHOGNY+PDXozYFCV8lFEQPw
 SarWi0e9bf3tYb4tzQ6ahDTCnxt+clVZ4dl1OF4z/jFwk95VYNjJI109OqY7tzMrMQJp
 UARqTfYoJWI14g1Dzm3CLpsp8hYyfJmQi9TY5WCjJWH4GUYF1qMMR1cF4+0qJz7Kszxy
 SeJQcmjHvddHIDjFtgxDxtbssPlLuUw+OkZfqYjVAyUSgUJVXDKsyT9k8MvYdV1wBhY2
 UPRQ==
X-Gm-Message-State: AOJu0YxGkefznOMhue/aDca1N9bKkzmXKukIkcr/BuRCxYF8IYTpnlxr
 PXdQkFGSwMHU6RCyOphuN4aeFNO7uxuHQnOcnLEqgmdcxgwS/JiKto4y4kkMvuk=
X-Google-Smtp-Source: AGHT+IFYR04RbPexEhNdQ1EGd/ec3CQT549Fr9cIMoJP0YBrzfPEyqMNvUOn5xr9ur6JTXXJLe93Yw==
X-Received: by 2002:a17:90b:485:b0:2cf:c9ab:e747 with SMTP id
 98e67ed59e1d1-2dd7f36cb4cmr12285103a91.1.1727026526141; 
 Sun, 22 Sep 2024 10:35:26 -0700 (PDT)
Received: from localhost.localdomain ([2600:8802:2a05:9000:ad2f:66c:ef69:238f])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2dd7f874fe7sm5686200a91.30.2024.09.22.10.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 10:35:24 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 10:35:22 -0700
Message-Id: <20240922173522.3283547-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727026526; x=1727631326; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w6DnbCuBg/11sr4ijY5XUxDysLAqJDDTEOn0RNVcRq8=;
 b=WK8lbwX7mOMtUqn+ccbyF9LvJ3C/TapcP/otGxSjA2uO8PahCWD9xmS0adSpCaiej1
 O7uYac3Y1WAXEaGwergNL2VDZXIURU2+z6T/8JEuXwCSrrf/rNuPHo7rbFaso/DErRaT
 mrcnRA/z2LtQF1GwS+h8qDcqg6htanjpxmrvrQvRrmbXA1UC4VQXpkpGvIu7aNkMqHQl
 a6pjtz9YOIzkXznmKZv3cL7OvHZ8a4cegcmD2Xrc+PiFYChwXxT3wG/Hj+Lt6FvYRG6y
 aBkV23/3oDhANWECix3UKfYwSmNXsBRg55yvO3sQpsMWAcOLe/wBTvZ5It81sKYEg88P
 7hFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WK8lbwX7
Subject: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 8.10.1
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
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog - https://curl.se/ch/8.10.1.html

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 1d01935501..4817ec11d6 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.9.1.tar.xz.asc
+# https://curl.se/download/curl-8.10.1.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  f292f6cc051d5bbabf725ef85d432dfeacc8711dd717ea97612ae590643801e5  curl-8.9.1.tar.xz
+sha256  73a4b0e99596a09fa5924a4fb7e4b995a85fda0d18a2c02ab9cf134bebce04ee  curl-8.10.1.tar.xz
 sha256  adb1fc06547fd136244179809f7b7c2d2ae6c4534f160aa513af9b6a12866a32  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 3661cbf5bd..b81e355195 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.9.1
+LIBCURL_VERSION = 8.10.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
