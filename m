Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513F0C5B549
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 08:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E448460E51;
	Mon,  2 Jun 2025 08:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfPe4EL-ZOjH; Mon,  2 Jun 2025 08:01:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14A4960E62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14A4960E62;
	Mon,  2 Jun 2025 08:01:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AA601F7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 08:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5862C40577
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 08:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_a7Cpef5qnv for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 08:01:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92B5A40574
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92B5A40574
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92B5A40574
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 08:01:02 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-553241d30b3so4542729e87.3
 for <buildroot@buildroot.org>; Mon, 02 Jun 2025 01:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748851260; x=1749456060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I8StxYFbqzVrxgWTXC68bX1MN6Oew5sXoTO3gLAc1a0=;
 b=rOy3OlS8k0veSuKYw7eekQ8EXtXbJwddrejBp8hWh5EJyGZM0NqWzRy/EAoVWYKFAc
 uMu0f4C6o4qrVQkaT1PEVdJuwN9xh/bx52xGPXq3iUp5q9U2dwlvaDAUmTeHUeeNP0PW
 +ay81/l10/gGuBmk21SSxLG8WJszmjN2SAPIuYEnrvPNnsup/XnjJmJy7Af43Vc11yS4
 YSaA9S+5s2G8FbMSCfo8shHYAVviG1FXL4S2cZckZstEDc0KUKchREy5fTp4HZXCU64a
 mKhi5FKEMWOh+/DZshpo7JtWjZwoJi6ZtH2S7OSWPdfrHXy6RuEiAp2u7h2jcAWihpxh
 F4AQ==
X-Gm-Message-State: AOJu0Yy8MOfpUF4B/eMiS1jC0TaSzF2abwG1sh3dIkQk8B88Vf0zGoz7
 XmPyWsVsadq/maobuETc5b3X0+LLB/4a7PRSMvDIKK4FTqTIrOdCD+kKFTyWNQ==
X-Gm-Gg: ASbGncvlnl7Z1S6DlOj1trQQsb+KoL0SB/W3zHK63035VHVqBAJWVT7vR+RYo6EBFOi
 xtkvTdF6JzJWw+flkPm0iyrWWtBLYRfvaWARzfDQ63H7X2R6Nfssp/Z6ybXT32lBAY4olAH/f+g
 7v1gT/18Wb7VLCB0BG5IreV425B9jKCaiGDxIz15XNFkQC11m6s3plnD8cIHUbfX/AWimMd2QcU
 DkhGR6OEGDkjbf4UAGM6L6Ma44jn2p0zJEDXoKRWGbqGvIqps/rYs+RGIIuHnuaVoWPGp2IBe6A
 uac0s93hF8QrHqferV+524DXnTWdwY34e+tuEYvvgzQvoXZNtAz+e7+Xw6KHFyRV6z/7rnLSxok
 iNjHZZQP+cw==
X-Google-Smtp-Source: AGHT+IH8mUkoKtXdrVORSmLaAATrxwF50HPqpFwHt+rhh7w9AARXOWf+VUeCQ5VkYbFc1DvYF/OEuA==
X-Received: by 2002:a05:6512:3f26:b0:553:2a16:24fd with SMTP id
 2adb3069b0e04-55343191677mr1838067e87.47.1748851260050; 
 Mon, 02 Jun 2025 01:01:00 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533793770bsm1495467e87.238.2025.06.02.01.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 01:00:59 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  2 Jun 2025 10:00:50 +0200
Message-ID: <20250602080056.2466471-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748851260; x=1749456060; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I8StxYFbqzVrxgWTXC68bX1MN6Oew5sXoTO3gLAc1a0=;
 b=WcWJRtFC/4rJxnVvAxKNvg+gvCpczixRMDzkDOMnoFB1ID9KqWOmPWtbpCdwitxfDj
 rQMlUSFv9e3rPc1ENooN3rsic6nlKXgAZyvTRTulk/FDmf3tB7zwscIpckPIyY50Ma7b
 bf65Rz+Nj4b1dJhdI2ObNtM57YhxVZhCLzRHsQr23wsRF2KW0i7f2rZ0BGhYUmPh5jSC
 Bq7EFxQfftVUxwiqRgmqscjRJUdo541ZTu6rlJm1XoylcbgG9jSnhkk/QojwvazkF0d+
 g5va2nRh3m1ZUZCoYQ1I4L6N7+7LlFbjAxMwAc6AdSkZMYLbXyDym8af03O53jqIC+lh
 FFvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WcWJRtFC
Subject: [Buildroot] [PATCH v4 0/3] package/qt6/qt6tools: fix build failures
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

These patches were originally part of the series bumping Qt6 to 6.9.0.

The fixes were rebased on the old 6.8.1 version, and reordered to match
the order in which they actually appeared.

The commit messages and comments were updated.

Backport to: 2025.02.x, 2025.05.x

Changes v1 -> v2:
  - add missing patch "package/qt6/qt6tools: build without clang support"
Changes v2 -> v3:
  - remove options to build assistant, designer and linguist for target
as there is no good use-cases for these in buildroot for the moment (suggested by Thomas)
  - since target assistant, designer and linguist are unconditionally disabled, I
remov the target package.
  - squash the target build fixes related to assistant, designer and linguist
  - remove unised host option
Changes v3 -> v4:
  - it was not a good idea to remove the target variant, as this is needed, so we just
unconditionally disable the the targets that fail to build.

Roy Kollen Svendsen (3):
  package/qt6/qt6tools: avoid build failures
  package/qt6/qt6base: remove unused hidden host option
  package/qt6/qt6tools: build without clang support

 package/qt6/qt6base/Config.in.host  |  5 -----
 package/qt6/qt6base/qt6base.mk      | 10 +---------
 package/qt6/qt6tools/Config.in.host |  3 ---
 package/qt6/qt6tools/qt6tools.mk    | 13 +++++++++++++
 4 files changed, 14 insertions(+), 17 deletions(-)

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
