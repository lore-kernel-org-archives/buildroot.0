Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB833C54E71
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 11:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 550518131B;
	Wed, 28 Aug 2024 11:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4cFUw3zayaJ; Wed, 28 Aug 2024 11:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AE6281320
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AE6281320;
	Wed, 28 Aug 2024 11:02:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC1FB1BF3FC
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 11:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8D0760AA6
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 11:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PV7RbQBSiE2s for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 11:02:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C0DCA60A96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0DCA60A96
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0DCA60A96
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 11:02:23 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5334adf7249so7791731e87.3
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 04:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724842941; x=1725447741;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UuiIEyicWlvuxzM4835GIwvfXK6WIGj61U0qv4EW1H0=;
 b=K1r+WUvCSDO0kNt5XzPz3+C+/wrs5k3ZTC6b2Or93EUxJ9rEX/qwmPPkx+2nx3/xhQ
 UUieLF2sPQNh69e4OvVMBrVv2TbUzUTg0Elf63lvuGbfKbIBDPUU+g6+e8k5V01lG2wF
 Fstyitx5vWn70cWj1bOt23M5LUtGOdab2XiyhPa3M6CBFyQ7YtXCSk4v8Gdp19uIguhi
 qVr9gdpa3VOvCFJCfs/Tb43wJqwgOUFUerMAWyf47KbWNAiXgC0LrNy/h5hQoT4Pin/O
 R2ZwdoDML4ilSeTQYxQtaxfb4Yb5dP2T3e0PtTcwl8+/LVk6Dd5gApieT4cQ5lW7dxnV
 mhfw==
X-Gm-Message-State: AOJu0Yz0G1grAq+05yT6ypDnTO4XBQheEFIe1+UX9YKqNjmOwCAEt6d3
 Q9+dcj3Ox4DC9vLg8i58H/qob69AYs88U4OqcxM45RzOxt/uBkl3ZPf6ng==
X-Google-Smtp-Source: AGHT+IEQAClpDb5W5tKvWzuxGobR80uovZ2IsSl4u0COY1yzMQQ7mg2Ku2rHNbWlXjgilT3jgJ/tcQ==
X-Received: by 2002:a05:6512:1047:b0:533:97b:e272 with SMTP id
 2adb3069b0e04-5346c75f1a1mr1321508e87.41.1724842940748; 
 Wed, 28 Aug 2024 04:02:20 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334ea2933csm2132989e87.4.2024.08.28.04.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 04:02:20 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 28 Aug 2024 13:02:13 +0200
Message-ID: <20240828110215.147869-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724842941; x=1725447741; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UuiIEyicWlvuxzM4835GIwvfXK6WIGj61U0qv4EW1H0=;
 b=PtGe493c0kMBeOxJ1eSgyqD5DWRutW7tGe87xw1lr5jsOlF09gFJ0MuJgB/0yJ518H
 FRnZBeOlJduCIT65b9+l1USD6bpDAbPriqDOFeyhTlrdLhJxGAIH3qdpMDXMrZVlZF8c
 g5UYV1Tr4TiZO8xkyXgEZ4tDPCHoYH+jujwymEsU29BIMjEP68orgqM0iww3n7SQUjJ/
 HfNrQf5RtVwUrFhq/V7OrugRsCdaDNQybaxeU4X6cf2ff3ZW9WXc/cRgQYKGpLGI2szb
 uNjXGK7Z7JTyMeU4N2s8ui5Yqy+b+cC+nY7vEywYT+wizJ0lvkJ3sZqDd1sAHuCfN/E8
 7s8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PtGe493c
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6declarative: fix typo
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6declarative/qt6declarative.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt6/qt6declarative/qt6declarative.mk b/package/qt6/qt6declarative/qt6declarative.mk
index 57a89a3b6e..ecf14d3323 100644
--- a/package/qt6/qt6declarative/qt6declarative.mk
+++ b/package/qt6/qt6declarative/qt6declarative.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# qt6declaratve
+# qt6declarative
 #
 ################################################################################
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
