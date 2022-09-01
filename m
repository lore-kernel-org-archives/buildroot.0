Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA07ECAAD1
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 10:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6C2760C13;
	Thu,  1 Sep 2022 10:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6C2760C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id muEx1YTUhw6u; Thu,  1 Sep 2022 10:58:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9321607C7;
	Thu,  1 Sep 2022 10:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9321607C7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10C4D1BF3FB
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 10:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED17382D07
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 10:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED17382D07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 91_8693Rhl8d for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 10:58:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A75A82D04
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A75A82D04
 for <buildroot@busybox.net>; Thu,  1 Sep 2022 10:58:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v16so19094336wrm.8
 for <buildroot@busybox.net>; Thu, 01 Sep 2022 03:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=PuFdkBQa2Lqgpz5FmbNkaDRhw+tHe70Mh4+olnU0zG4=;
 b=HIHqDlOYXdb5D5y1WViqQoex6937WwHliNFqs3sqLCMdSQ7zMMAS3+hOpaQqCK7VEZ
 Y4PCf8rb5+kVfIXU0k6jBh0o8EFPY7QTXIJdyONvSgVVO8lzudiEGOCcAnZVmnRBHqTU
 N8/w8+GtlrV1rp3VGQrDL3nLSPlcfKprwZnq9VzmZ1KtQ2r7nZKhJUgxUzGjM9HWCVcX
 uJQTWsZ7tMR4Ni4eToBnlB9Vj7QoVy+uSUYv9lyrswto7YhQkREkvQxL284aniG8o54L
 b7aSpYwsUVg/Es+zeHrPlG13rBI3xMSFo1EdZBuF0wO1XB6pIdijTYa5m8ID+d43+UXh
 K0RA==
X-Gm-Message-State: ACgBeo2mKcsW/br1HeeckEug3CRrX0AawEMfftc/vwp9TsQPAhgGcDwf
 AuywwfWMrepNaogAdRFirEzHW3ay6+s=
X-Google-Smtp-Source: AA6agR59K6CuakuUtwxfzAN1G/Ytt25aL1HQgne/72P5Uxr5PlggS/VzxX5AeQUcMMtB5f8TY1tQ5g==
X-Received: by 2002:a5d:6e8e:0:b0:21d:ea5:710f with SMTP id
 k14-20020a5d6e8e000000b0021d0ea5710fmr14390518wrz.48.1662029907226; 
 Thu, 01 Sep 2022 03:58:27 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 ay19-20020a05600c1e1300b003a682354f63sm5661720wmb.11.2022.09.01.03.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 03:58:26 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu,  1 Sep 2022 12:58:19 +0200
Message-Id: <20220901105819.1825795-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=PuFdkBQa2Lqgpz5FmbNkaDRhw+tHe70Mh4+olnU0zG4=;
 b=fdK3kLYorZ0fn4bRwKaen1KWXZD+KHPHjSbvrwdaKUtOlIj4mQ+ULzHgquayrHz208
 lZ3YsgChhoJyVWXDQehVXdAa4q/JphTTTu+O2QeNYAp9qbzaFZxz84/F7reDAahI6wc1
 MLj2OibIUKjboNVxrTchLRy+tEgRSOA6CLUuMaXKzHLCd+0c82Q3rM/jQc9vka+0MPKy
 5nVA1nIAHZ/BGOiOWHUyZiuIFhJkXCQaMdPufHvk1RLiG82Hin+HSCLeF+vYh9YnBAVu
 wXZWAREYORmf2GaUk71D65J8SE45wYqU0E+N1VfzCWIUyzRrOlOtmChNm9V0EwwzI+7O
 h/0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fdK3kLYo
Subject: [Buildroot] [PATCH] package/luaexpat: bump to version 1.5.0
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
 package/luaexpat/luaexpat.hash | 2 +-
 package/luaexpat/luaexpat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luaexpat/luaexpat.hash b/package/luaexpat/luaexpat.hash
index fbfb623fc..be67e9be6 100644
--- a/package/luaexpat/luaexpat.hash
+++ b/package/luaexpat/luaexpat.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  bee88ddc1063f49c5685b75b6696e8df0607a388432cbcb189cd0b8291d956aa  luaexpat-1.4.0-1.src.rock
+sha256  536a5eda09bb070d2de8ecdd15566d3a55e2afa5ded2ef183cd453bac8c41e98  luaexpat-1.5.0-1.src.rock
 sha256  7e6a727e5b57cca713a2f2633f05d7e0cc1e261cc6a7613bbe266e625b2f14da  luaexpat/LICENSE
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index c176fb8c1..f56bf604b 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAEXPAT_VERSION = 1.4.0-1
+LUAEXPAT_VERSION = 1.5.0-1
 LUAEXPAT_SUBDIR = luaexpat
 LUAEXPAT_LICENSE = MIT
 LUAEXPAT_LICENSE_FILES = $(LUAEXPAT_SUBDIR)/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
