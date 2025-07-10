Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988FCC83F20
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5612C80E38;
	Thu, 10 Jul 2025 20:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7NTQ-17mXFM; Thu, 10 Jul 2025 20:23:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A73380DC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A73380DC0;
	Thu, 10 Jul 2025 20:23:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CEF3212E
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B62BC6137B;
 Thu, 10 Jul 2025 20:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rnonuPg4aak; Thu, 10 Jul 2025 20:23:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D7F7660EB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7F7660EB5
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7F7660EB5
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:03 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a6f2c6715fso1414557f8f.1
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178982; x=1752783782;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YQOLPjRa+rQ9JAMhsAGMeATGGfVj7QpbdzC9qCvtw80=;
 b=UdbfP7N0rhMzm8LogfqcD370MMyjcnTrV0O1U9KiTOnU7GRzQdpOFNbZowXLh+IYNJ
 a7gQIwknigY1a3ksuupNQVX0wnFEakyEyD950kzI8GxTXLdfYuJpsDldJQXXoSlK6Bqw
 siWsOqDbKE61pnEhdY1ohqvgXNwsVAlZrusAtQ7EJuSE5D95eX+Ved65gOHpxx89EJGF
 ToAIgyRoqoSPnhXIKnzuAppdAP1TWvfXkb5Kd28j/c4sVoEG/bUBF79nxcYueGovWU4Y
 4xk+gFzckgZqpkyJR383kZO5Elk5qTD2ZQLS/5d8+2JGWGgbvtZVe9JvDgLVXvyFgQNq
 GY9A==
X-Gm-Message-State: AOJu0Yy7BOzUnyXIXfAQMaUvLn93GYSjNKxO/pBOkyO8jHUY9XfEVAeZ
 vpHiu/hT9L5M4L/J/9vVOqGcGvfXte70+4o7FmddtfzWlzthpxikmbwV15fKmg==
X-Gm-Gg: ASbGncvQ40IZ0jSIkXgZ1H+Sb/Jx7dnmg3THnfmp/8uWfUn6jxJM5xPLJ0W9v+mOHKx
 jz11QF2+h6pu0vvoko+EgcZcvz62MnVjYoBJmHVeeJsngtyRa2HK8anoQTx5IFia+yZLBVZUn5f
 iebMv/tVbCP2GHeprFm/zqzvm5pDFPkbNmDPTJVVGBl3tqnXRW/SF5pENNCYasnrsHk8H9eAkN5
 NzYfV6gA5nwI+vIcjTysidbiPfy6WlhcrkR1Vfg2N+iGD7xEQRzMVUu6gQxssignmWpqz8r4UUx
 ITQ72U7lGg2n+JqfHVtU60MWKLLX8/TDtETdHlvgp+bacWbIKmDuTmEraqnJT88E6hEwTFJm
X-Google-Smtp-Source: AGHT+IGTYG2VlwBrC9A3vBRHHwU8mJxEfAxsfq/01h12oA9W/R9teiqHgUZkYhnZNzy2Lab3L+P4hg==
X-Received: by 2002:a05:6000:1ac8:b0:3a5:21c8:af31 with SMTP id
 ffacd0b85a97d-3b5f2dc2178mr89883f8f.16.1752178981533; 
 Thu, 10 Jul 2025 13:23:01 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1997sm2742694f8f.10.2025.07.10.13.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:23:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Jul 2025 22:22:44 +0200
Message-ID: <90a0958f8624ac64c6ef7a8caa6a9390b77297b3.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178982; x=1752783782; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQOLPjRa+rQ9JAMhsAGMeATGGfVj7QpbdzC9qCvtw80=;
 b=KD8y7j1EPfV8TqPwFYJ1Y8OjmlP91+oyjpAo/3Kw50Z+6ZbramiE89dU6C71g0QlTf
 pRkp8law84h425Pr61E9b4IUl4sMyfZ0WIcu3xxddp0lGrl07YSD7nBMw7EROyLJ7LCK
 utU8Kmb8zbrrvMe25hNNUlm6xsMRY9EJ6Emu5aDKRLw92lZGCKs2QeNFyLW7quZsx9c8
 AFHSdG9KoJdBv2EXWM2FWi+KArUem38yTiJrN0FPz14SX6wiVZPlKY/V/2TiwjoCBYg0
 t9SFooTAusMxbX9OWWNKpIboQx2lN2aOWuSOwZ3/nETZesiBCcCwm+HUoN9U+tfQ8ynG
 pBsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KD8y7j1E
Subject: [Buildroot] [PATCH 02/17 v2] system: drop superfluous negative
 condition for default PATH
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kconfig applies the default values in the order they are defined, and
stops at the first which condition is met. In this case, the two
conditions are mutually exclusive, so we can drop the second one. This
also makes it obvious there actually is a default value.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle <arnout@mind.be>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 1bc8b61f11..b24004c533 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -535,7 +535,7 @@ endif # BR2_ROOTFS_SKELETON_DEFAULT
 config BR2_SYSTEM_DEFAULT_PATH
 	string "Set the system's default PATH"
 	default "/usr/bin:/usr/sbin" if BR2_ROOTFS_MERGED_USR
-	default "/bin:/sbin:/usr/bin:/usr/sbin" if !BR2_ROOTFS_MERGED_USR
+	default "/bin:/sbin:/usr/bin:/usr/sbin"
 	help
 	  Sets the system's default PATH. It is being used in
 	  /etc/profile in the skeleton-init-common package and by some
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
