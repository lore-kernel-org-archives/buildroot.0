Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DC5C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 16:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9491060600;
	Sun, 26 Jan 2025 16:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCOwmRYcvq5i; Sun, 26 Jan 2025 16:02:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B15F26062B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B15F26062B;
	Sun, 26 Jan 2025 16:02:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B63BC94A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 16:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4273400E2
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 16:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4J1EiIRjsQS for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 16:02:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 57C0B4004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57C0B4004A
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57C0B4004A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 16:02:04 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3cf8e017abcso11032215ab.1
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 08:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737907323; x=1738512123;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YVA9nH59wbK5Fsd72zKAcYFNZhL9QH4cWc8ttOMiAvQ=;
 b=jxJwkzpP3lOpvrzsqGCW02SHDuHpsvY4hZ6NGBhB2mqfWShMV9MlrAwKChMpTjzS7p
 JwOKA0PGoOseSRcfQvpTwOigweVEjuWQkwdggPyhTa9Kk2VcKh9OTwRcd3muZL3iomJP
 //CKZIalJmaOb+NrWwEuZ6dq5pG43xhOby7Prqv5f6TxZ7fajMDeIoz05RkJjHdohWbm
 U9wOpxvIwiHhT8jdO6otxUVOqnVlVJfH8rCLCLY0Q6HQne9+d9AplCyMUBB73WeJtsAd
 TTitgD/wrE88z9EmAXfUiuSFo0ogpJr6BG+pTE/uV5jtfgxwnOk1Lg9pIM6YcKai1Yx+
 Wjig==
X-Gm-Message-State: AOJu0Yxz4dfkzlTaAnzYDL2AvYRVOEtszjtqBu1IyHdhdhYTJUIHqaOZ
 aTLaydfVyTOKDMrERpLBkddwTehmMsIocsys6HEWAi9b7bBlIhwSGG2aBjjs
X-Gm-Gg: ASbGnctAAqHGwdtibIIa1TEGag9YW4q4cyUSjqTi7aAYcnsEmhEa9X6l6XIL3t4W+Tl
 OYIYByOFrU4fc+KaSdT06cg2cz3Yk79RkT7z14PeYGiMbsJkauxKr2EzSu2MMwvWgcosho/RmMm
 1Yb3JWPkRjimQNx6R+ge9JGJ/LfXg+/mJwCIFbL9OJ1/l3G/jx7OyQZQwg39mRbF/m3piHpPdBy
 7IK+QI+ND8dO09VukFFWEqlu3qQY7CGVraVbI9d8MyeZGE/0OW4yQTvud38hrDrcd3Ixz0OnfuD
 oWtGBwbNvBqDU0uNrwaXOKbWAc288+xnGAQuUCVZKkvd1of/UXHprKI=
X-Google-Smtp-Source: AGHT+IGJCLoc5dBWsiu9WKF5/iryZod6s0/1Zf5XWLPW9sbx30WCHjZxQG55dnn+Yz0uNg1L3BkisQ==
X-Received: by 2002:a05:6e02:4618:b0:3cf:b0c1:d161 with SMTP id
 e9e14a558f8ab-3cfb0c1d456mr163906135ab.20.1737907323008; 
 Sun, 26 Jan 2025 08:02:03 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc7506d29sm21084865ab.65.2025.01.26.08.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 08:02:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 26 Jan 2025 09:01:59 -0700
Message-Id: <20250126160159.485223-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737907323; x=1738512123; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YVA9nH59wbK5Fsd72zKAcYFNZhL9QH4cWc8ttOMiAvQ=;
 b=HLmWAeFs0gJFEZM+mhBiltX8rXmmTkdTxqiZDC4znVlltNT6eW+uWqtNNk5fJ7MIiA
 qxMQDWPPlIOdW5B79WTsCPdEHd6gi91WGpptKwim3ZLoil1Ae2q7c0E7kxz59U+ljgJW
 kfvp53YivZh08u2Szc9kKLHBwWOh+EM2FB8rkf5hfTfYMKv971ldTYmORGg0gMSWoanj
 Ew3hZC1KxHgJAud+oRUvAvrFwot3BNpIsm8OOTzpfE8TqGFu1buCg3labv7f15e2EpBS
 0Iu5UPMTEGxPQJHIl51Rh5lbfS2faWpdI6keAL+IJYkNYuCdudc/+NGGGfpZMahRi9gJ
 0qGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HLmWAeFs
Subject: [Buildroot] [PATCH 1/1] package/cloudflared: bump to version
 2025.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/cloudflared/cloudflared.hash | 2 +-
 package/cloudflared/cloudflared.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
index 3d02b78b6f..f199160a94 100644
--- a/package/cloudflared/cloudflared.hash
+++ b/package/cloudflared/cloudflared.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  48b9c54d79419d0489baadb8cb54d5196e0ff17650fb9eff81de02989fa8b009  cloudflared-2024.12.2-go2.tar.gz
+sha256  f9223cdefaa4b75aa1c49638936af9d5007b6c7bd943ab70203bb75bf32467da  cloudflared-2025.1.0-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
index 78b46f9d0e..bf341b6b62 100644
--- a/package/cloudflared/cloudflared.mk
+++ b/package/cloudflared/cloudflared.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLOUDFLARED_VERSION = 2024.12.2
+CLOUDFLARED_VERSION = 2025.1.0
 CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
 CLOUDFLARED_LICENSE = Apache-2.0
 CLOUDFLARED_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
