Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42859C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 10:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B72E14090D;
	Sun,  3 Mar 2024 10:06:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ulQd6VkLMEni; Sun,  3 Mar 2024 10:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6304540885
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6304540885;
	Sun,  3 Mar 2024 10:06:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E68FA1BF5AE
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 10:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D331440136
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 10:06:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39rKJ3ibbbl2 for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 10:06:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 178034011C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 178034011C
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 178034011C
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 10:06:32 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33d9c3f36c2so1736057f8f.2
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 02:06:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709460390; x=1710065190;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eRvUAjkGMhwok83DGAaldaPUMz54pAvFvGOF20RppyE=;
 b=NUXbbZVwqMAbBX1Ev7C/iE+bsVeUqODdW5hsd2aHz63zeujDNj4Tk8BUuaLG4d6t/d
 gs04S8GQUw9QLaADbGrpisl0Rb9CLl+GTrsZGS9o/8qP/V9EtDDcK1ahiLvxakpagXUX
 EB6gXm3lC7icRM1H/imbEshhUhOseLS/XG+npRqNv7LSELC2/cFLbZwH7fW6Ler8jtzY
 iXhgPoFOXbnsgMegOJYKNpDlWPt5e+PH2KQc+Fj6oSd8rzfZGeTg4gOFpHi0nZRt59zm
 8LGQsi8lA09+Dq0d9DJO7Ar5048W47Vg7CppZ0vR8WFeLudhE/juY+LOop8Nev2wztH1
 Hjig==
X-Gm-Message-State: AOJu0YyVM99wx9JNLGjMYvmmfUdwberVQ63p4FqhuJmoAcdk5dr3W6Th
 LSl4OGuvUKd0/F93xiLWwni8WjUd6q+RlC4yf7aqCarYcquzsezDE6gASEnv
X-Google-Smtp-Source: AGHT+IE7KAF4joM+rDVjRnIQyEoNRpOzc63WnW30jY6MQFN3G/vA3kIRkUiSKp3gznDWuTm4UYZTkw==
X-Received: by 2002:a5d:6150:0:b0:33d:1f94:d347 with SMTP id
 y16-20020a5d6150000000b0033d1f94d347mr4251418wrt.4.1709460389920; 
 Sun, 03 Mar 2024 02:06:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d8-20020adf9c88000000b0033da430f286sm9331359wre.69.2024.03.03.02.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Mar 2024 02:06:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 11:06:26 +0100
Message-ID: <20240303100626.120767-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709460390; x=1710065190; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eRvUAjkGMhwok83DGAaldaPUMz54pAvFvGOF20RppyE=;
 b=ch0NGK5IW0j3davnt+Ile+L/6htD7CMSXGlfy9Tz+ReVBEzq9OebPrfolKmeeVtSMn
 TK7S5XkKBnpVXRoW0OvbmMYHbyXIWKwjJWblIO4PIPzLZ/xNNcO78e1598sJB2cM4Yi6
 5SlmW7L5cYzobOzUP+TNciXwmyg7tJ7v16WUwGp3OsarxRWMfurGTLb6zkgbFwFxajhI
 AUH6R5TrQ2hOPa1a1BQPXLuk3PUcDWVXZgIsho9Fktl81Wd0BbSf1iObB6uNTSuFX1XK
 L0ozFznOCoed0AlupIFfzG76Q4DGhsCV2e/CIqqlboI3ROo/7i74pfBHVx8dINI4rgMH
 zWVg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ch0NGK5I
Subject: [Buildroot] [PATCH 1/1] package/conmon: fix build with gcc 4.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 4.8 raised since the addition
of the package in commit 06f50ff1bf066feb6cf6ed512113773f87c884fb:

src/conmon.c:5:2: error: #error conmon.c requires C99 or later
 #error conmon.c requires C99 or later
  ^

Fixes: 06f50ff1bf066feb6cf6ed512113773f87c884fb
 - http://autobuild.buildroot.org/results/b573aceefde04435ea13dfd2a48f9c2372bde4d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/conmon/conmon.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
index 214cb460a5..1e57786686 100644
--- a/package/conmon/conmon.mk
+++ b/package/conmon/conmon.mk
@@ -25,7 +25,8 @@ define CONMON_CONFIGURE_CMDS
 endef
 
 define CONMON_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS) -std=c99" \
 		LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D) bin/conmon
 endef
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
