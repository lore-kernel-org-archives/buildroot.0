Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5E8C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 16:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 483A4409F1;
	Tue,  2 Jan 2024 16:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 483A4409F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hs-tbzTjuDdH; Tue,  2 Jan 2024 16:33:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43BBF40A0E;
	Tue,  2 Jan 2024 16:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43BBF40A0E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 568151BF21A
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 16:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C481C409DD
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 16:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C481C409DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 92hDH_2zw4aJ for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 16:32:59 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 942CE4055F
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 16:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 942CE4055F
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50e7e1ddaddso7557314e87.3
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 08:32:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704213176; x=1704817976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k3CH3ljkKqE88XspAbHNrWHrd53Mb3mxq4RCyfGSKw4=;
 b=S4QLgFHluICU2dzQR/5HBkasRJ7Vry50MLgkt3IEA7i3J7wa+BopxV8F1TbCpoeAfi
 3FHo6uyF6b2Pyu2ZpYWRTdbl2RcPPeSQRpvc2391c/Y9JGuwq9CPCkXTqkXX/B5lm6im
 kQraK6yu0BphSxRKON6kD4eSZ114CDEa2BW7I3Xd8BHfP9EKP43uX5XTdXUTICsBoZHq
 ZC30ar214eBPmkqWN1JSV0+E590v6VCZ5EEGVI04kBCNl2JJMnUQUt58WsYmUmPJLBxG
 XmS4jS0te/JSX+X1zkdBmgVMlzVq1RLb+4T+SjtvdOf7VxzZpTQWOaVg1tWphG+85IFL
 iBGg==
X-Gm-Message-State: AOJu0YyNTzCXqkcdNuTPJmmOHQIkWIdd2ru9dqln6JruWDVBpm58II6U
 xtXvjeXp/hpWXKh3rBz4PiSrEKY6ro0=
X-Google-Smtp-Source: AGHT+IHvoJIxPGKyP1cmOonnuwzwlQWlobm+H8qFgLBibHzkpA5g81BY+Z2UxCOZn4XZPW1fWTBwMw==
X-Received: by 2002:ac2:4430:0:b0:50e:50a1:8321 with SMTP id
 w16-20020ac24430000000b0050e50a18321mr6422702lfl.79.1704213176321; 
 Tue, 02 Jan 2024 08:32:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u18-20020a05600c19d200b0040d61b1cecasm20951198wmq.33.2024.01.02.08.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 08:32:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 17:32:48 +0100
Message-ID: <20240102163248.330408-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704213176; x=1704817976; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k3CH3ljkKqE88XspAbHNrWHrd53Mb3mxq4RCyfGSKw4=;
 b=g6KZIGg1UvYOfH1EWACu835QgjjpH4L2Bb5ElkYwveft6WO/8SsEBuYOd4uBLEyDvr
 Buw4Vkqu2qSuscqWpNzXMkYYDTCzRmx5hGDFGnGfxAlQZMnODzyXOzsdFrD1ji0B+0gA
 QFw+d32fm3g+CVSgTfrVcbtfLwi97tx4iAHwS3HiAcitYzhAiVU8cqi1lGTGabB5PCzt
 /0+6M8mM63WbBBPxL7ZvKxL+09epTr11u7bnNf/jbNoKehmEJQ623CsuAahBY9Awy8hl
 lVOvMFeBlxShFcT5W2VFCFQM/DvQkkYLx1DH9wFuMHNsy5X/6Yb3COxnhrrY00i/zhMH
 ubTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g6KZIGg1
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: fix s390x build
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

Use linux64-s390x configure target to fix the following s390x build
failure raised since bump to version 3.2.0 in commit
973b1eba5a4ee72f040bd471b147267e36be73ad and
https://github.com/openssl/openssl/commit/79040cf29e011c21789563d74da626b7465a0540:

/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/13.2.0/../../../../s390x-buildroot-linux-gnu/bin/ld: libcrypto.a(libcrypto-lib-dh_key.o): in function `dh_bn_mod_exp':
dh_key.c:(.text+0x3c8): undefined reference to `s390x_mod_exp'
/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/13.2.0/../../../../s390x-buildroot-linux-gnu/bin/ld: libcrypto.a(libcrypto-lib-rsa_ossl.o): in function `rsa_ossl_s390x_mod_exp':
rsa_ossl.c:(.text+0xd2c): undefined reference to `s390x_crt'

Fixes:
 - http://autobuild.buildroot.org/results/77c5e13127de67a69782f138aa28c8b0ad951941

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libopenssl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 49958d9fd6..0c8db52e2e 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH
 	default "linux-x86_64"			if BR2_x86_64
 	default "linux64-riscv64"               if BR2_riscv && BR2_ARCH_IS_64
 	default "linux32-riscv32"               if BR2_riscv && !BR2_ARCH_IS_64
+	default "linux64-s390x"                 if BR2_s390x
 	# no-asm is needed with generic architectures such as
 	# linux-generic{32,64}, see
 	# https://github.com/openssl/openssl/issues/9839
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
