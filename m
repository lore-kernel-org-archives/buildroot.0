Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0D4C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 20:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55ACD42F1B;
	Sat, 28 Oct 2023 20:33:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55ACD42F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lLPgBjEI_mSr; Sat, 28 Oct 2023 20:33:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 908EF42F16;
	Sat, 28 Oct 2023 20:33:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 908EF42F16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8841E1BF25F
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F9F04187C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F9F04187C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CM1eyhXUDS_d for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 20:32:58 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 164DF40102
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 20:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 164DF40102
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c6b48cb2b6so6890801fa.2
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 13:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698525175; x=1699129975;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=10CE3JQRe5a8Tsf12jD8O8eDirahB9NH1IbRlvT+ezY=;
 b=dtNiHC5niBMYglN1r+pG6itZKVbhkt48GtbMSNw/65cX5nySDmnI2p+lPUVjx4W05h
 gkVLTE2tutr+47m5TPw2HFbKJwymjHUgpYjVytQ/FNeyLUA+m5prSM4W4J5ANHM4M4qR
 Klt2NQNnh62c6prg5lud4/9lzbjckqem7dbfvJSu8u1LjUYuaFFI1UN21QgtYed6L8Vj
 0Q9hbJzH+44F6jxZA+hmsVvVhbIGUDZmeD5Ooovh5u76e+dWFooDayF8GIfpJbHywcmh
 +NpDG5tSRZByKgQnX5OZkwNpPfsACCvuyNuKzBfqftUBMzg0tmDzjNsQBwP+AufoP4xv
 Zl6w==
X-Gm-Message-State: AOJu0YwmVO5QT8p/LEgCCdwidtXjl18wGHzW6JphbKXXKzzyeF3Xcs7s
 XMqXJeBx7DOloycmKC8MBlhpF4IwBoE=
X-Google-Smtp-Source: AGHT+IGSWQmai2eLvv7uHB2kne7zJUThp516ominTxS5OUqCn7ulvUoaIp8vYN7+grozu28rXq8LvA==
X-Received: by 2002:a05:651c:1a23:b0:2c5:1ea4:4e99 with SMTP id
 by35-20020a05651c1a2300b002c51ea44e99mr5612609ljb.48.1698525174981; 
 Sat, 28 Oct 2023 13:32:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v18-20020a05600c4d9200b004065e235417sm8193856wmp.21.2023.10.28.13.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 13:32:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 22:32:52 +0200
Message-ID: <20231028203252.1177951-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698525175; x=1699129975; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=10CE3JQRe5a8Tsf12jD8O8eDirahB9NH1IbRlvT+ezY=;
 b=CPkVwodVCsn3Lzjw5ro2UFt2tS6X94ncx+T5s6J03g1ovLbevuaf5dG5bjt4zeMh8M
 59cvMxSsJOCdcF0omxtOshPZNqo8CRXH/Y9FcbjZjdr9OajAxGp2nsNh00xVAskl6gma
 ENpzBGCelFOgOU3+nqou00K431wM/pdq1kaD/dGuvIDVg5Vu0/CvBKtl2cmR8rxDpVaj
 60ggZp44AePkkU9kPWxgsNf4rIw1aNMmVBtLR6EgEw2MfmJx9CCFlLTfaSzzLOS3uDs0
 8hBtB4QHIM5ES0VkzllujchBkADAKG7CMQvGa6Bsa+2W5Zdf2/ZLvxwM/hQrtmYA0OF6
 wxJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CPkVwodV
Subject: [Buildroot] [PATCH 1/1] package/cjson: bump to version 1.7.16
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

https://github.com/DaveGamble/cJSON/releases/tag/v1.7.16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index c39e884cdd..74844d6aa6 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5308fd4bd90cef7aa060558514de6a1a4a0819974a26e6ed13973c5f624c24b2  cjson-1.7.15.tar.gz
+sha256  451131a92c55efc5457276807fc0c4c2c2707c9ee96ef90c47d68852d5384c6c  cjson-1.7.16.tar.gz
 sha256  a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index ad9d76a4ba..7ed732ac90 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = 1.7.15
+CJSON_VERSION = 1.7.16
 CJSON_SITE = $(call github,DaveGamble,cjson,v$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
