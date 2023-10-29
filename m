Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084AEC4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 10:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ECEC84C7D;
	Sun, 29 Oct 2023 10:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ECEC84C7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iBNCNYKkiMUZ; Sun, 29 Oct 2023 10:12:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF1CF84C7A;
	Sun, 29 Oct 2023 10:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF1CF84C7A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD5441BF3A7
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 10:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6A3B4ED1A
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 10:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6A3B4ED1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wjq89G6vK1Ci for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 10:12:10 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 327C74ED19
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 10:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 327C74ED19
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c50906f941so51106411fa.2
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 03:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698574327; x=1699179127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2Is+U1SQ6PyYlz/iNsd1U0wZ5bkw/MBcSxTml3gcN0=;
 b=utC2fycWIvFjBxmLXp7RoRwJ9aq92PrOjy03hF6Ki4LOlG5OSZ9XRji+S3gSlWrg1+
 ctWvp5pYPTnx9wv600izyLr1tRpKf9PoGhEyAeUcpt684CryCkwViTRtGWS6koR0mnfj
 DhrWJrF5TBm9rIQyh8BRcTmoB1z98HSxSN/nP+AjwP5FS3Q2frosR7zwwoRZs8RUr/2v
 R/xZx/93Yhgnm5e+SxBTrgQTrSbQiIGfLeQ5zKFxyKNW+t9cYzMtSAwaIZVZhWmYTbAO
 GxSwMBjqTfXUkFIU4QWMyFudlr0JEmizGTpYa7b2gQtkWqi+Eui+LyUvQIjVfTEdKDd7
 arLQ==
X-Gm-Message-State: AOJu0YwWQFStGjWmmKcRcR53wGrsd2xnqXxumeMfLD3SLrwGyXbNqlNv
 W6zCqNTN7JGB1/XtlTJS+EcD00JeGH2zmQ==
X-Google-Smtp-Source: AGHT+IF6aKyGTNrQXr+BFzxbhqrlh3/Y//5bPoO0DALCbyZh0W3IModMOeqDy1OAcXec//1nO7wV7g==
X-Received: by 2002:a05:651c:2203:b0:2c5:1e70:7d30 with SMTP id
 y3-20020a05651c220300b002c51e707d30mr6464704ljq.30.1698574327249; 
 Sun, 29 Oct 2023 03:12:07 -0700 (PDT)
Received: from nibiru.lan (109-252-110-141.nat.spd-mgts.ru. [109.252.110.141])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a2e3504000000b002bf7fd1d336sm836092ljz.14.2023.10.29.03.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 03:12:06 -0700 (PDT)
From: Sergey Bobrenok <bobrofon@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 13:11:25 +0300
Message-ID: <20231029101125.34481-1-bobrofon@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231029084527.GN687180@scaer>
References: <20231029084527.GN687180@scaer>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698574327; x=1699179127; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C2Is+U1SQ6PyYlz/iNsd1U0wZ5bkw/MBcSxTml3gcN0=;
 b=mVnplAS03+9tLjLs88GVwC7UuHFFTQGNl6wclNkJfLut5GV1AV42g+ECnzNAxkjtBg
 WvvjDBeeYKd8CNOVpTgpCoT0U2a+712cMuKz/usGGKnfhi57AJ4IldTcoz9SKoRUYTKl
 0HIDS21bHBJ9osml4fDjX1cB61FUZDmAnXXvfgvdHUIBcT2c2/b8jRhxrybtlx6f4Buj
 FxiebFYZJQBn91GMn0+dfHz9Ypj1myZ5jZccIV8aAJOv2gSpeOhBwAPPvZwqPpouOmBE
 Ccky2SqUMviPm1r2vSYeP1liVS6N93MAgSMz/qPB7UEqJr9OGAKO3nzc9icWh2xqB6A0
 BdSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mVnplAS0
Subject: [Buildroot] [PATCH 1/1] package/sdbus-cpp: remove redundant
 SDBUS_CPP_SOURCE variable
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
Cc: Sergey Bobrenok <bobrofon@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is no need to define SDBUS_CPP_SOURCE explicitly because the
github helper defines this variable internally (but uses a different
file name).

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
---
 package/sdbus-cpp/sdbus-cpp.hash | 2 +-
 package/sdbus-cpp/sdbus-cpp.mk   | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index 379864e3ba..f4336228af 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  ca7405c7f0f9ae3023dcfa37bc68974c4b8a1c9ea2909b970e0aedc3e8657ee6  v1.4.0.tar.gz
+sha256  ca7405c7f0f9ae3023dcfa37bc68974c4b8a1c9ea2909b970e0aedc3e8657ee6  sdbus-cpp-1.4.0.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
 sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index 2c3844094e..9ffaeb26d2 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 SDBUS_CPP_VERSION = 1.4.0
-SDBUS_CPP_SOURCE = v$(SDBUS_CPP_VERSION).tar.gz
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
 SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
