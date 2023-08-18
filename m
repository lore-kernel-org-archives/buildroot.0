Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E68C2FC0E
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 00:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7C9560E73;
	Fri, 18 Aug 2023 00:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7C9560E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LITD27AZcqAF; Fri, 18 Aug 2023 00:31:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E18360E79;
	Fri, 18 Aug 2023 00:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E18360E79
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E76E71BF98E
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 00:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE08340481
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 00:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE08340481
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HAygzuQXh-ym for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 00:31:35 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64C7840150
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 00:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64C7840150
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bdf1abee23so603965ad.0
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 17:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692318694; x=1692923494;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=21BOz1PYwW/XTtJ7aAci4iJy9+9459Vh76Zc//LemRM=;
 b=QmgF3eFXdrAbM3Ct8AnMsBt2PYxTL2FU7FcapiMwBbY0/N8RdKXLJ0JXBopCMBM0R+
 0Nb4HQfxPvS0AJSOGeBo8InIw0UeDnRlILRmNy6uBPKwFretyqCXpf2PP4NpNJy2QueK
 AycB+j8kC+hYHKsdzmBzoWpiLBaP0BFPYMaem2U0fMNBFeA2PEqnZ/AfQsualnL8FATb
 dpJDD098W8nwUAA3vvBY5LlJM2FQF5Z2ceqOVUsJ7FukKJ2n8gRjd1nyoGQb0l0F5JDE
 Jdx3F78QB2Jn7ueX6oeaiMimRESIWRJ4cHdluah3Uz2O9cjLQmvF4crd73yVZzGSfLJ+
 LpRA==
X-Gm-Message-State: AOJu0YzfdkeCblreJFd8BNhKlVc+c+VeI1ry0MQlxPxq/shR/FJoLLey
 D+nMFDpkE7VRSpOZQnMmJNAGBhAoMApqZWesx6qgaA==
X-Google-Smtp-Source: AGHT+IHgIPZedwk+bioX7/KAjWPQyOiYmot/fAdLxD6P96xSVp4M8XbJrEcvPyQZLcHAPCPVXY2KNg==
X-Received: by 2002:a17:903:41cf:b0:1b8:a27d:f591 with SMTP id
 u15-20020a17090341cf00b001b8a27df591mr1002115ple.5.1692318694644; 
 Thu, 17 Aug 2023 17:31:34 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170902ee8b00b001bda42a216bsm364371pld.100.2023.08.17.17.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 17:31:34 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id 0EA9263A; Thu, 17 Aug 2023 17:31:33 -0700 (PDT)
To: Buildroot mailing list <buildroot@buildroot.org>
Date: Thu, 17 Aug 2023 17:31:22 -0700
Message-Id: <20230818003124.3770152-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1692318694; x=1692923494;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=21BOz1PYwW/XTtJ7aAci4iJy9+9459Vh76Zc//LemRM=;
 b=VU59NgUaMmqXYekK4fXAEypqdn8e1I8Vh6ZehxDS5zb9YDQ2iWf5t827o977dsH3yl
 uySBFeUYumQiGTyGxoZGEMhvBtKLlLqHdaFMUHqTfPw0B7Tx5tvzdEysk1brnjfz4+uA
 x6mGppwWHd5SbLAlm/gGGEvYzVgqBg3rjrKLQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=VU59NgUa
Subject: [Buildroot] [PATCH 0/2] util-linux 2.39.2
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: "Yann E . Morin" <yann.morin.1998@free.fr>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the version of util-linux to 2.39.2, which lets us get rid of a
downstream patch and the need for re-running autoconf.

Markus Mayer (2):
  package/util-linux: bump version to 2.39.2
  Revert "package/util-linux: add missing autoreconf"

 .../0001-libmount-ifdef-statx-call.patch      | 57 -------------------
 package/util-linux/util-linux.hash            |  2 +-
 package/util-linux/util-linux.mk              |  6 +-
 3 files changed, 2 insertions(+), 63 deletions(-)
 delete mode 100644 package/util-linux/0001-libmount-ifdef-statx-call.patch

-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
