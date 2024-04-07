Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A00CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 17:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E526F81ED2;
	Sun,  7 Apr 2024 17:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Or76kHj_0sI; Sun,  7 Apr 2024 17:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8F0281EBC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8F0281EBC;
	Sun,  7 Apr 2024 17:14:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B5551BF2BE
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 17:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04EEA40806
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 17:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIanLCDeTcxu for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 17:14:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DBB0640803
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBB0640803
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBB0640803
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 17:14:49 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-343e46ec237so1913214f8f.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 10:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712510087; x=1713114887;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5HurB8fR0/yOQfbnjTlmL5RdFChnrNlWFy0jmCF0JD4=;
 b=wnpUWKA0dL813bvj2JNY8+42LzlCDXIhC2O1aNlX4BdsDggaVxqrajELpd8BtBaC2s
 IEycrDzreAzp87zPm3cebQ06wwyLsf0sp8lTLmbRqkM1HO42o2eCl6qh8ySNbNHyaI64
 eko8WOUkQ8Mm6TGJVD3kZxxyuaSn2M+2bk9TBmLYHDrTprFd5X2Ri5YHJWbAF3ODpV4a
 BImM2CJSJPQzUwl3YlruRw9nXtgDfTL3ucnTMq4aOTovlS5VND+nQQisA4eykUk65sNa
 j19SsNnU+TrcaW/LD54aibM3jri/vWDzGPeO7S/3iJ3rKZFhoaC0b/FMyRNQP/LgKzcC
 RGaA==
X-Gm-Message-State: AOJu0YzAuJIlJ1BQ8gzM2nkLHuSlYCpmAryoKHh4CfxcYkgWHSaH/OC6
 URo3Atd/FDJ+oCKjvm1FuEMdd9+WcVbZSOuiy35CLOTSAM50uNZNTgPeLwNZ
X-Google-Smtp-Source: AGHT+IF3OYnpC/z8FYH17QoL04v7GqXydGJ/tAu0KJe2HCFPD9To/1RlN+r8jOgDBgfLMm4cchjz6Q==
X-Received: by 2002:a5d:6450:0:b0:343:3a67:85f4 with SMTP id
 d16-20020a5d6450000000b003433a6785f4mr4897825wrw.41.1712510086676; 
 Sun, 07 Apr 2024 10:14:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q18-20020adfcd92000000b00343e5f3a3e2sm6635862wrj.19.2024.04.07.10.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 10:14:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 19:14:45 +0200
Message-ID: <20240407171445.2795738-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712510087; x=1713114887; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5HurB8fR0/yOQfbnjTlmL5RdFChnrNlWFy0jmCF0JD4=;
 b=U92uWQ+ghlh4u7e+PnWTwkM/leOk6l4MbbW7hkFt9An78sSxXqq+xCGTfydjXeYLW0
 GtbkllYMwmrkRvKA1F2oNWKEuZiemQQBnwzSG0ZSe9xFLKuipC9b7IN0D3uArKhv/V3l
 XZwIO6EosMy2LUuojdvWN5gB0Vaj+rkknDyIANF7kaOzsNsqPwdB8NfxEiAwKkb0lOac
 +AL6dYuHQlT+IdOPg2ib2JAuMqmbQwERBjGrEJX1p048gf/YMutIiUlG03gYjrBY46uk
 8OINvagQpU8Bi79ZiJ9eO65a8w/OI6gVf/Ix744kKVJwcVjPJd807JJKvf6LWatW5vTl
 60+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U92uWQ+g
Subject: [Buildroot] [PATCH 1/1] package/nasm: bump to version 2.16.02
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

https://nasm.us/doc/nasmdocc.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nasm/nasm.hash | 2 +-
 package/nasm/nasm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nasm/nasm.hash b/package/nasm/nasm.hash
index e9771c1d7f..d6513ff9c6 100644
--- a/package/nasm/nasm.hash
+++ b/package/nasm/nasm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c77745f4802375efeee2ec5c0ad6b7f037ea9c87c92b149a9637ff099f162558  nasm-2.16.01.tar.xz
+sha256  1e1b942ea88f22edae89659e15be26fa027eae0747f51413540f52d4eac4790d  nasm-2.16.02.tar.xz
 sha256  1563996c52e220e15ef2418e67d39488255aa8c28c89e617074d3afe3ee329e0  LICENSE
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index 043a84cf07..ec03b03977 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NASM_VERSION = 2.16.01
+NASM_VERSION = 2.16.02
 NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = https://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
