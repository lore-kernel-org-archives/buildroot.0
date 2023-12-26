Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0A4C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 15:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43434408C3;
	Tue, 26 Dec 2023 15:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43434408C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f91OQLunV0cJ; Tue, 26 Dec 2023 15:32:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7332640386;
	Tue, 26 Dec 2023 15:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7332640386
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C0B91BF2C5
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 15:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 045C140289
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 15:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 045C140289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mY444f1TNnCe for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 15:32:50 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB44440386
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 15:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB44440386
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40d2764c0f2so60838365e9.2
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 07:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703604767; x=1704209567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OzJxNcYYAnbiCKUkfTsuNu/c8JEyYmtlAhurYlBxcXM=;
 b=tkD2qPyv/s93PPiALZvduHvnp4l42flaGRhn7MngF7971K3uZG4CLzf06R9AoYLac4
 zP/DURuy1TA29NbImX+Vv4OlRXgvOlzWjTNoUYPOUrHXG7b4Hbi9EZwCgo8ADWVHpYpr
 2lDlhfEj2xiHjPtD4duAGzGFKsKmMgwsLc/x7qX1TEH/rCRjIxx4i9WRFjIMkdkSy4lg
 8rUWDGuCE22/2csa3cV+PH5l1OtStiyzMZdG28XIBm7KQm4RPpppa+x+R1JBA5RV6PZo
 ZCWY0ph8LiWfUUpaRSHQZC+bqDyEctq3LyyRd17Owf+T2u79i7B8vcuMxivXxtylSH4R
 I5aw==
X-Gm-Message-State: AOJu0Yyq4OkbOdX4WDs16yyUkBKtj2iGqKyxNIIB8/Axufg1KOEmWHP9
 W5VPC617vwrKTP79XFOddV+rjnipmns=
X-Google-Smtp-Source: AGHT+IFEv3n6Np9MdvJy1/UzF0lIGhYCuJaaZK4Ax7KOZYq+KDDMskDpsSSTYTT8PJifiohIium/bQ==
X-Received: by 2002:a05:600c:1383:b0:40c:691e:50aa with SMTP id
 u3-20020a05600c138300b0040c691e50aamr3899875wmf.39.1703604766700; 
 Tue, 26 Dec 2023 07:32:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c468f00b0040d4e1393dcsm13535877wmo.20.2023.12.26.07.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 07:32:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 16:32:44 +0100
Message-ID: <20231226153244.527793-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703604767; x=1704209567; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OzJxNcYYAnbiCKUkfTsuNu/c8JEyYmtlAhurYlBxcXM=;
 b=hFBuyfRqhmGkLFGbl8QHIzJouQu0YXCwLFfz1RHFTOmeZMlOkJiCdbTdCaOsSDsjML
 MqoiLoM5/HwWtWoXOs+eTarSOhjerEkWKv6pTGfWY6e30+Tk1S/cb857Be4vDeBtSOx+
 Ntr9MsWP0V61mRPRcyNSSg9mUEE4ScxIZqmqp33t3k2+Nzy6/SvmF2tqf48fba57D7n2
 DL11UmBiAvLHVD38NKwHsAXMi8V1nJCKnqe55sX6Y08iLZSB2niTpMFofJpgpW9kTSl4
 9wBNtGB4d8egmuQmiyxRd4UuOohliOJhen6KI10uK1Nc0ndFHWTQ46FoTQIKSkRpmF7j
 F/Yw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hFBuyfRq
Subject: [Buildroot] [PATCH 1/1] package/assimp: bump to version 5.3.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/assimp/assimp/releases/tag/v5.3.1
https://github.com/assimp/assimp/releases/tag/v5.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/assimp/assimp.hash | 2 +-
 package/assimp/assimp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
index 86a90927ed..79415706f9 100644
--- a/package/assimp/assimp.hash
+++ b/package/assimp/assimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b5219e63ae31d895d60d98001ee5bb809fb2c7b2de1e7f78ceeb600063641e1a  assimp-5.2.5.tar.gz
+sha256  a07666be71afe1ad4bc008c2336b7c688aca391271188eb9108d0c6db1be53f1  assimp-5.3.1.tar.gz
 sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 0b6034fb8e..2765cc7171 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASSIMP_VERSION = 5.2.5
+ASSIMP_VERSION = 5.3.1
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
