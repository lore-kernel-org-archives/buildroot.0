Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD45C5320E
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 20:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA08D4012E;
	Sun, 18 Aug 2024 20:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XawNS-kSig3l; Sun, 18 Aug 2024 20:31:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F0E040145
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F0E040145;
	Sun, 18 Aug 2024 20:31:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 686B31BF41C
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 20:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5641B400BF
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 20:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmN8-iBBgWH3 for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 20:31:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 424F140021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 424F140021
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 424F140021
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 20:31:41 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f3bfcc2727so3954561fa.0
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 13:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724013098; x=1724617898;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xs4bo1x57K5e7B4eEC+w9Q/OUgx9PQj2XWL8Zsj/7I0=;
 b=EX75Me2yttFr/m9PjdPkN1vs7UeldUuLv1F0To1Qoa42Jw4U0iTk3KJ/tcqqwtmqlK
 xYUCWpWdqpbnOge+Fdm9/d+GXsBB58DxHS9MHVl/v46RHlpFjgRZ6G8+/mtrM3a5Wz19
 PPtRsoY93QnZd8iEiPptHAPUvrIJE3oHn7sOywLb2rdD5IOAMaam7WqokxU2OaNt6T8V
 cN0c1nINfBP/Y3kys3NIQfvlLYA1KfIm2NPOicwJdGBn6z5PsnUTFZs1/GZEJyhJwiBY
 ZiIhxDWM9yVr+0QNPgIod9+YO1mody7braFmbacjFIhDvd6b0/sUBFBoIQgauEkynrnf
 OCIA==
X-Gm-Message-State: AOJu0YzLgDm/xWrP1xxZLfkVMPIBBQNgDeuTkD70OqD7X+NTFi7v6olZ
 Dw/u8rOwV9zQc0/h1Yezg70Os6PaVxWQ88SwOjUCgpazAkfzL5HPbtKYSUZTYnc=
X-Google-Smtp-Source: AGHT+IFl7tNadB8EzkczjRlplUkbFWphHN9lt0r5SvN/7Cbi6GRv8xHJkbFfqGuPS5UJ0rp37cS/fA==
X-Received: by 2002:a2e:9151:0:b0:2ef:2dfd:15db with SMTP id
 38308e7fff4ca-2f3be58428bmr68345061fa.19.1724013097688; 
 Sun, 18 Aug 2024 13:31:37 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 38308e7fff4ca-2f3b746cd4bsm13023451fa.11.2024.08.18.13.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 13:31:36 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 23:31:28 +0300
Message-ID: <20240818203134.1512793-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724013098; x=1724617898; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xs4bo1x57K5e7B4eEC+w9Q/OUgx9PQj2XWL8Zsj/7I0=;
 b=FF+VC3zB5vYQ1hcoFfL/CO2FwTo8FNo+kIcuR3gCbBpIIXVxHc9vXb33k44aOpWaF4
 ZkT7GX9dKPJ3a7D6c+5YkCoYqkUzYi3Q1OqxIocrnb5GXVNchW4HOyyrkIOnP+3zzeEO
 QF0DyFb9TKuNy34tyuGkKK0Cf9i1SUrwvn9uf2ZQ5QLmSHGSfgj6EvmxSKMExkT4OXys
 58G9lCraUPFcH/tGMQJxWtcEKSrBRiWUH2Qp2s9Q0c2Ai4RgM1xjUIBraAwFiq4nOsem
 IODeb2jNfvwxoJo4RM4ciG0Uoz88kjac8NinAC1UR5QtID6VbMm4bDBxr1/YYZSwD/bZ
 +Xpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FF+VC3zB
Subject: [Buildroot] [PATCH 0/2] package/wpa_supplicant: follow-up fixes for
 v2.11
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Some issues have been discovered after wpa_supplicant update to v2.11:

- wired driver fails to build with kernel headers less than v5.7
  -- detected by Buildroot autobuilder
- wpa_supplicant fails to complete wpa2-psk connection on brcmfmac hardware

This patch series provides fixes for them:
- bump kernel headers restrictions for wired driver
- upstream patch revert to fix brcmfmac

Sergey Matyukevich (2):
  package/wpa_supplicant: wired driver needs headers >= 5.7
  package/wpa_supplicant: revert upstream patch to fix brcmfmac

 ...orization-completed-on-driver-indica.patch | 55 +++++++++++++++++++
 package/wpa_supplicant/Config.in              |  6 +-
 2 files changed, 58 insertions(+), 3 deletions(-)
 create mode 100644 package/wpa_supplicant/0001-Revert-Mark-authorization-completed-on-driver-indica.patch

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
