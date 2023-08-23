Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E330EE49A0
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 14:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0728813AB;
	Wed, 23 Aug 2023 14:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0728813AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GabalrsbaWli; Wed, 23 Aug 2023 14:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 037AC81311;
	Wed, 23 Aug 2023 14:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 037AC81311
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 776FA1BF593
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 14:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E59B81311
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 14:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E59B81311
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5prPkZKh_3Ue for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 14:05:17 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8811781290
 for <buildroot@busybox.net>; Wed, 23 Aug 2023 14:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8811781290
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fe4cdb72b9so53193155e9.0
 for <buildroot@busybox.net>; Wed, 23 Aug 2023 07:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692799515; x=1693404315;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2zuzZdRyUGV752z8ODtIBts9CrVJvcT2LCNlGIHYcd4=;
 b=SykrPRw/U/62JAAXFQgl9MGIKFhD1qCqgQsL1sE1ko9n6fvvd6HLDXXgSqQ4rKWvog
 Qws9EhmFN9zlIZqZiWgqUbWku3T2dkLVuuZb+D5CBQJOwnRR4mjf8TnFQ3MVenQHR7ae
 Sv2zspWrDw2tJqACqQUc6dZBc5liLmjtGSJSiaKVdRAL6CqKt2fkCnZ6ijKoRk+1Dmef
 rozIG6+B5KVz6IaY4VN91YPpWqjcXutBXQ/Jt0M8FBj/+BtH4vBmV2qHICIliByJy8yy
 7OKylpYL2xZzTGf56cloaS4f1b60BIpfc43UrnKRurhC9tGTP5xMzYxxr6FTbaWY+D/W
 kTqA==
X-Gm-Message-State: AOJu0Yw24gW9h6aGXfbGZ4SfskBwn5r9j7GLqF/viv/N/atEJs7+CkHN
 hkJdJt/7IcIh36TJIudf7JalkYtmDq4=
X-Google-Smtp-Source: AGHT+IFrd5MnmRdswYK0m/f7nLOS3YwCsYHTxhCKAxx1s8CgapM7PcqTV1KQxeyaKCvFW1jtVyMClw==
X-Received: by 2002:a7b:c4c9:0:b0:3fe:2b8c:9f0b with SMTP id
 g9-20020a7bc4c9000000b003fe2b8c9f0bmr9485456wmk.23.1692799514805; 
 Wed, 23 Aug 2023 07:05:14 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 v1-20020a05600c214100b003fff96bb62csm1683562wml.16.2023.08.23.07.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 07:05:14 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 23 Aug 2023 16:05:07 +0200
Message-Id: <20230823140507.496751-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692799515; x=1693404315;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2zuzZdRyUGV752z8ODtIBts9CrVJvcT2LCNlGIHYcd4=;
 b=n0i3h814s2u5KfD5/rAMKEWyrCV0V3PraQ88lntfHkZNoJUrqimsaZ2J5YbELryTP1
 pWQlTgHLiCqhSxWbYncb8lI8IsfXTa9iWwFIejFWr3ajxUOYsm67QO80geBEnRkjOare
 aRGbf2FZMe++KjxljmFohXuD2KmidL8Vt/uuqTe5IbP2FMOE/3rYdzpFiFnNewnXpiF/
 4uEIa/CiWVUOJGZKI3X1Xb3s3wITDYlrAXAIV4Lg4xPXRLhS5Ofo5315HTufkt8rPRih
 GVmD7bZ9tYs4ICJ4U3Vvg3uY00oWVnaJbvFVAT/7Sm+VKmQVLa5XY/9F0Gb53hlormqd
 C6xA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=n0i3h814
Subject: [Buildroot] [PATCH] package/lua-silva: bump to version 0.2.0
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

diff COPYRIGHT:
-Copyright (C) 2017-2021 Francois Perrad.
+Copyright (C) 2017-2023 Francois Perrad

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-silva/lua-silva.hash | 4 ++--
 package/lua-silva/lua-silva.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-silva/lua-silva.hash b/package/lua-silva/lua-silva.hash
index 418c3e9e4..3ceab6572 100644
--- a/package/lua-silva/lua-silva.hash
+++ b/package/lua-silva/lua-silva.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  0e656c42c71b64285d4a375fa7b8b1a910b05c4ab6d30f5b427b078fff204e1f  lua-silva-0.1.8-1.src.rock
-sha256  5b59ffbfc12d9d1cb907dd65b0f16d3453e1a43cc018c6128a00b00e08f6c485  lua-Silva-0.1.8/COPYRIGHT
+sha256  fa838ed10b2e2c16f76fff9e47d52cde1f250efd73994865090d85218c2e5368  lua-silva-0.2.0-1.src.rock
+sha256  638206532ac117ec92a04791045e274e6aa55c3d7f408cd2be993a00424c2f96  lua-Silva-0.2.0/COPYRIGHT
diff --git a/package/lua-silva/lua-silva.mk b/package/lua-silva/lua-silva.mk
index 91b1b7747..809ac3dd2 100644
--- a/package/lua-silva/lua-silva.mk
+++ b/package/lua-silva/lua-silva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_SILVA_VERSION = 0.1.8-1
+LUA_SILVA_VERSION = 0.2.0-1
 LUA_SILVA_NAME_UPSTREAM = lua-Silva
 LUA_SILVA_LICENSE = MIT
 LUA_SILVA_LICENSE_FILES = $(LUA_SILVA_SUBDIR)/COPYRIGHT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
