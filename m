Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAC2C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 12:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BC154037A;
	Sat, 19 Feb 2022 12:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kx4yEXMb7UZQ; Sat, 19 Feb 2022 12:28:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A207408D4;
	Sat, 19 Feb 2022 12:28:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1A7C1BF3DA
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 12:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FB67401D5
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 12:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBgvtqosmr1o for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 12:28:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D244740128
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 12:28:24 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v12so18928629wrv.2
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 04:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qMFSTGxW91hShDbWNCj3fzoWTEJHWg26gMrgfgQC+bc=;
 b=a5A4oxL6kDkz6RI8+HiszLuVNermlvHxaLmhc6Wl6Da/FXxrz5kUTPzVfJpPpdqC1N
 DJ1zXK2Wtv6DYXixW+uib4fcQ6UiWKhUeV7lb9Co1uB/aq6LYQf5sTDUuREPgXbcI/Pc
 H2avmUCc5MJu8p/WS+vgHppKo637s9vibOt3WGlyOvqpEHidNFtvFEvGbOncps5HElu5
 1FXEhXpy7Zj/xixd/N/cTpTNMVcS+HU3OdJJZ81egDuXITUKiDdCHtJqCEvfV9V3Z+fH
 6lgNWSb00K6Dp3gzgfrVgAgUiW6ZOqxprTLqtemPIWVXZXVol56V3TLlthgFFZSIg0he
 +GdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qMFSTGxW91hShDbWNCj3fzoWTEJHWg26gMrgfgQC+bc=;
 b=ltMN+3rYQqBSUkpaCehcQI0Ie5hOEWRq5J80GJmPoKcL9kxdcpzkzJu3kVxb1E838V
 CKWM6PpXNqSFnYCygYrAfTrqS3iO+D3uxlZZEhEuIohSd1aeqm739rNj5MDDOrof+7M7
 PH16TObZGN0/wrFVFiEW5xVT84GNw5oqfFd16/KekKv+ZlQ54q4x6sqi+77BVynotpa6
 JCxNceZzNPMkZ+5w+Ih91EjOc5viG7BGFUhy67yLq8k5WC7WLjnQ/3jFvfIM1cDPSQ+Y
 O5RB9yvlfjNZPUt1/rbbo8SIBPdB2Bi8Tb6vdlI38s0IfCgkAvkATYmBvVLLVV1X5BL/
 bAkg==
X-Gm-Message-State: AOAM530K70hXpQwZlHJ4pks02xU+yJvr+Ohb46CaMBs8Ipnsdot4dq4m
 77Y27Hkc/skfP2iu0wKCCBdbItuu9o4=
X-Google-Smtp-Source: ABdhPJy53YAVmI6F/xa+Av2tmQ6S0n2F0l6yZzL4dErihxJemGkD+pU+6xAqFoalEgpdxzp+SWNrlQ==
X-Received: by 2002:a05:6000:108b:b0:1e3:222a:25dd with SMTP id
 y11-20020a056000108b00b001e3222a25ddmr9555579wrw.481.1645273702819; 
 Sat, 19 Feb 2022 04:28:22 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id b15sm43364087wri.96.2022.02.19.04.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 04:28:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 19 Feb 2022 13:28:30 +0100
Message-Id: <20220219122831.2961097-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/expat: fix tarball sha256
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

Commit ab71ac15ddd7ed6a8ca83cbc23ea0b0cbb343f0f forgot to update sha256

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/expat/expat.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 3129801668..a6f43af291 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -3,5 +3,5 @@ md5  a712d23b7afb32e7527cf0b3fd8f12ac  expat-2.4.4.tar.xz
 sha1  6028b04d3505fc519c4c7c6bd67e1ad1a08cd7b6  expat-2.4.4.tar.xz
 
 # Locally calculated
-sha256  b1f9f1b1a5ebb0acaa88c9ff79bfa4e145823b78aa5185e5c5d85f060824778a  expat-2.4.3.tar.xz
+sha256  b1f9f1b1a5ebb0acaa88c9ff79bfa4e145823b78aa5185e5c5d85f060824778a  expat-2.4.4.tar.xz
 sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
