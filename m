Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89B0C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 13:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B43E40895;
	Sat, 13 Jul 2024 13:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNxlwiGlzFOo; Sat, 13 Jul 2024 13:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6279540968
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6279540968;
	Sat, 13 Jul 2024 13:25:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 341971BF400
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 13:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2141583EFF
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 13:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWLHtn-Kvjyg for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 13:25:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4232E83EE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4232E83EE4
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4232E83EE4
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:25:37 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5854ac817afso3625089a12.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 06:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720877135; x=1721481935;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w+Gd6u+B4jMJimiuCigTyWsm2V+C5l439mdSsrybkh4=;
 b=JARi4b3LB3rXZqq1wIKvt9MfZRQqSN48dy/L/ppNYZ3aNUrjeIwtKD7rtCovIPaHlB
 GEtzr7PI5O3xQSpRiDx4vd8v8eSnJ7hAGsExBAoTe1Fgruf2DeQ7BDHU3PfssCU/UZ3l
 FpscDGJuXng6NJfpKL7rQq1Ah19W8l9Q1Zpo+UHnxHQrR2tNWUBkjWbQy6TEhGFdov2h
 hd9jfkXH4GiryLwfeIllOdwEZ9VkV12dowks3jbKguyEL1D1/hcA8zbf5/HZlnhKtKkP
 ZpnCpd2G4P2mOEf8yUv/QxJY+cVuVy5fiH/izhPRP2EpHTtZTHyf9O6B2/we7CCudJn3
 YUuw==
X-Gm-Message-State: AOJu0YyhxAVlgArz+8mYHToEmv1ZfD0mCgVkkgKDaWVJqiovnWv8tv1O
 0A+0BWazsbyF0HIB1qEq+MdNumzlo9i2DOb2yMfRES9fsjYrT6FIr7XcfS7594Scu5iF9ow2gPf
 DNc8=
X-Google-Smtp-Source: AGHT+IEfR9fYAvEM83RpeMTH702NY8QqW7jjLCs7hMy35Bl8yBc5rirP6SYKPI0urBNwnIML2WkDSA==
X-Received: by 2002:a17:907:7247:b0:a77:e2e3:3546 with SMTP id
 a640c23a62f3a-a780b68a8d1mr1232547666b.9.1720877135045; 
 Sat, 13 Jul 2024 06:25:35 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-101-21.retail.telecomitalia.it. [95.244.101.21])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc800056sm51907866b.174.2024.07.13.06.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 06:25:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 15:25:32 +0200
Message-ID: <20240713132532.4099578-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720877135; x=1721481935;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w+Gd6u+B4jMJimiuCigTyWsm2V+C5l439mdSsrybkh4=;
 b=E19WcRyj82tBXRbz9bOU/t4tVM6y1SrmohQVNmjfvinM/P8T5FuB8DkMrO4hy8cinC
 Y0gcS9cWMCfQwG54+kU79my3bjhZ0abeF1NoJNHpeQAh4GyohINoumHm/4esRdtvZZVc
 YZ4Lz+/t9gdn+0gwNaxWGkDJgdoQHOgXPiDWU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=E19WcRyj
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: drop duplicated libnfc entry
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch removes one of the two occurrences of libnfc from the list of
packages managed by Simon Dawson.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b66fda5fcb26..5634a27e7ae7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2926,7 +2926,6 @@ F:	package/lcdapi/
 F:	package/libfreefare/
 F:	package/libjson/
 F:	package/libnfc/
-F:	package/libnfc/
 F:	package/libserial/
 F:	package/libsigsegv/
 F:	package/macchanger/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
