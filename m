Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDD8C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 15:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E25EA607B0;
	Sun,  3 Dec 2023 15:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E25EA607B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmTLuLHOGRvW; Sun,  3 Dec 2023 15:06:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35F3E60888;
	Sun,  3 Dec 2023 15:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35F3E60888
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DA331BF361
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 15:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83C4D60888
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 15:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83C4D60888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X_rMyPbdFSj2 for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 15:06:53 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44704607B0
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 15:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44704607B0
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40838915cecso37616325e9.2
 for <buildroot@buildroot.org>; Sun, 03 Dec 2023 07:06:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701616010; x=1702220810;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3TMQ6cBUcjuJLC+KP/Cfjpj2eGaIH9knG5R5n7pPDpA=;
 b=oo+JWsGWN9bT5kyUwbCSzm4DiCzs/ZdmK9tfwDCzNaW7XGAfwTfeT6A+YttjqYrgtJ
 vtLvei7SpPKt4tsA9G+QdYcKBjLhkn5RjENMVIbB0PvABvhYIJeSwMU6lbYYrO5YEYhi
 21nrIDRt09H6Uxqj572E2UY5J3PSDDb6KY+RXIBw25s4/L3il4JqjM4dKzXA3F1q1ss5
 wedS+3NB3d23yqxbE3XpJDBMMF0Xh0si1cwsFrC2FKmUtEckACMlkDoojYAugmlYUomq
 Eyr/82zu35juE2evZGjFqDwSCCqGPMIB8p/9/Qly+PbvO4mEeC+xnUP5yYNVZcsYRhYq
 mtsg==
X-Gm-Message-State: AOJu0YzamW2H1QQ1ZSyrG3yqdqrIMruuXwLvWAWAMShJWoRbk96RUDPc
 7Lq7vIsUYHRQXRBTKBlDa3buuWbLiiM=
X-Google-Smtp-Source: AGHT+IEie/lsSZNX+aqABB0/1WK+7KgYbd0yM6ifDs/pNIXz6S8lXyr/slenpotLhNOQKTbjiAZSEg==
X-Received: by 2002:a7b:c855:0:b0:40b:5e21:e284 with SMTP id
 c21-20020a7bc855000000b0040b5e21e284mr1831228wml.113.1701616010113; 
 Sun, 03 Dec 2023 07:06:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d9-20020adffd89000000b0033330846e76sm7000984wrr.86.2023.12.03.07.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 07:06:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Dec 2023 16:06:46 +0100
Message-ID: <20231203150646.1953347-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701616010; x=1702220810; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3TMQ6cBUcjuJLC+KP/Cfjpj2eGaIH9knG5R5n7pPDpA=;
 b=O+ud3lOQlsv5duqxl06uBaczJcn4oM8/GMsH1DerQHUofeJmzA9HKyvW8c8QRSEEdy
 yw395TTBGDwV9T343CTIdgZY6QtD2MfjPmkjYCNXHxjOjLkU5ILCpEd23cFzZEGfTefe
 sPzjn3/kgwLDm/aYVk/sUK43pRUUJ6dNUZUwolMxDoHuYK3onXCcM2JyVRY6a4LNeoEG
 WXeBXS3ain51lFn0b2xuBkCZHoFTJXMhr3nidWFMJgp6m7S0QA+VSVrIl9mMvqQcUo9V
 ijF1VERlpAxGbfRbg/6WkYRw61P5Ow4Vw0qhxjzrBYTcnUeSWMTGma2qn0zgys6ApUMM
 +mWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=O+ud3lOQ
Subject: [Buildroot] [PATCH/next 1/1] package/elfutils: drop -lfts
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

As spotted by Yann E. Morin in
https://patchwork.ozlabs.org/project/buildroot/patch/20231022154133.1619344-1-bernd@kuhls.net,
-lfts is not needed since bump to version 0.183 in commit
ef92e86e845134868011cb0b801509a0755f855e and
https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=da855fc9cd415c288bfcb9de1f3d5eb329de0557

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/elfutils/elfutils.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index b320311941..5760194e00 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -48,7 +48,6 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 ELFUTILS_DEPENDENCIES += musl-fts argp-standalone
-ELFUTILS_LDFLAGS += -lfts
 endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
