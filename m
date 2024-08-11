Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64498C3DA7F
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 00:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E238D81400;
	Sun, 11 Aug 2024 00:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEtzEtv3Cp9s; Sun, 11 Aug 2024 00:00:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15A7C81416
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15A7C81416;
	Sun, 11 Aug 2024 00:00:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECBEE1BF865
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 00:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC6A1412CC
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 00:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzcZ3Cw-SoHI for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 00:00:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8C6D412A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8C6D412A8
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8C6D412A8
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 00:00:46 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-70d162eef54so2442495b3a.3
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 17:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723334446; x=1723939246;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1mOXZo74CIQxF71Ojec2LojnPDz5rNICqxHfSyRirSM=;
 b=SbS9RGBFuVWfNPHAS5G/tZ+5XB4e+w8l7yoTua3Gg9hAkOFU4J9iXnKDo9Z6hPgltp
 q+LGnXgYRG10uZ2XiCrBaVjdP+MlpP8PzTjL6BjBXkL7AuuBq1ZOysY+aek8teFY8lsV
 9cyAWLhLefmTMAExxWrietYdW2mRNxuTc6IhqS1FibbuH8MxWcsRZgHHkFawcEywMaTi
 JUg0xhRZLlgEwcwx5bgTlNBPcvqIFzMbggwuUAMgoaXD/2cb+j8jT2Df14NaHvwF+cL/
 znBMVvDVBF7MdVgMLPXOvAustwrIkPcy1LWoLRj/CX27Ti2yDbHyRhcYxtz4B/0RdYWg
 nO0g==
X-Gm-Message-State: AOJu0Ywzxj38NUGZQH7Ro7P3JSJvWW3QzSlGJTKue7p5fVHyj63B8Ral
 qNT4m9AXs5fxxFvoh5FjG0eJDeAI4hd2O5POCxtdyldBCYd2BDVuJX5PaQ==
X-Google-Smtp-Source: AGHT+IFVPZsAc5qOe0LuD26FjT/JjVN0nMoBKA9s56ZF/MdgevYNFj62fa4okAhXJd/7ZDCBojwqvA==
X-Received: by 2002:a05:6a00:10d0:b0:70d:3777:da8b with SMTP id
 d2e1a72fcca58-710dc9a32a2mr4521113b3a.25.1723334445598; 
 Sat, 10 Aug 2024 17:00:45 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:646:a200:bbd0:19b6:28ae:c9fb:dc2f])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e5ab3524sm1682139b3a.190.2024.08.10.17.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Aug 2024 17:00:45 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 17:00:27 -0700
Message-Id: <20240811000029.1956409-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723334446; x=1723939246; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1mOXZo74CIQxF71Ojec2LojnPDz5rNICqxHfSyRirSM=;
 b=WODv+JgN1pLhDVTZoaBcPAlcVpcWHrDUeQh2bR0VBgeUjt3DBEo97283/3/glcBG5w
 PZNvXJiRcP+RJw5NOBOpEJD6XxDvNXyr8xMt3ZsHfY3WPC5gGotFFyVrOkyjnRcdIiGv
 IwyWrCPbJTwVhRfuWEQV6ty1BrvgE8ILebY7aXC67s69Hv8UY8mYKcyt9X7zNAuHxljP
 IRvK/byRZpn1l4mWsQq3SCuZ6wxXrBmdAAXG1Q0NX68tSj6sajkqga3M9PpWSxmKt1c7
 6I2tEn1PCO3F7o2sT3DCAIR+ipSVsFiJl30iWU5AwhfLYGcXtZoLnVwjaMgzyu3fMdcw
 aeyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WODv+JgN
Subject: [Buildroot] [PATCH 0/2] package/chicken: pass TARGET_CFLAGS to the
 build system
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

this series reverts xtensa-specific patch applied to the chicken package
and instead passes TARGET_CFLAGS to the chicken build system.

Max Filippov (2):
  Revert "package/chicken: move literals into text section for xtensa
    architecture"
  package/chicken: pass TARGET_CFLAGS to the build system

 .../0001-xtensa-text-section-literals.patch   | 30 -------------------
 package/chicken/chicken.mk                    | 15 ++--------
 2 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/chicken/0001-xtensa-text-section-literals.patch

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
