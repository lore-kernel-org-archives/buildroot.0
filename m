Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB01C02180
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 01:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BCA24062B;
	Tue, 14 Jan 2025 01:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7i7Nn9uqWMUk; Tue, 14 Jan 2025 01:15:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB1D340636
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB1D340636;
	Tue, 14 Jan 2025 01:15:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D858B89
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 01:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C04D81649
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 01:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cky6vP1CqLHR for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 01:15:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5367381CBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5367381CBA
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5367381CBA
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 01:15:29 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-844e161a8b4so174171939f.0
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 17:15:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736817328; x=1737422128;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KFRRpQMlyV6MNCqm5sE2QeSORIPS4EbbHZLShHUNoc8=;
 b=JRN90CiO7Aik2ADckI4UPCJ05iiUjRZypLMQA48iFsLidC5IOXRDSlr71kcegtBS7d
 9YDUhMrtUlKyH/TO6okkGMKxRfyejGNmTQQmTQoK6QQMNmI+N418BreN2RK0fRKGfXqs
 pUQ8zs1jDbZA02nYsfp9OTRh4xObMRrvXGQCFqOcFzn64dKu1wEjiFIizyPgwaSVSJ4D
 J/2b+2hewTrHp/tYf+28gp3PQp0D2R3Riw54Yu08gi9FToW8hHDUytG15jrZ4wfJwitH
 LaE6/GfEubf96Q5WYCn29Oqp6sgeU8KHQ8+XKDuVQ6q8CMbkoYLwvB/QSlR+LFU894U2
 7ycg==
X-Gm-Message-State: AOJu0YyDQsKYkOuSt7eje51GcOpTbPCrpTl66XOJB1/V/3HxrSl5ZL2E
 EZ7aSUHTFgM4hJFCNoXRweAWNp7h7w5uR4PqahCOfg7DQAXLi+79wkOjtYyc8ys=
X-Gm-Gg: ASbGncvjQf+EYmyz1qftjMKpQcgRurs7I2ElWvCq/XavYDli1mmZL0kdTotkOdOVNBN
 QsmIqwJy6mIEGEC0EqU5nXtj2ktIGHOkns82HPGC3ApDY7Noe+Vl/+VXhqpzKK+4MbgFWWKGkxC
 r/PqKYkcKtyQTSvKyD/IofjR3pfaWEvfOGsl3U6L1Ke4KRoVpYp9YO3k89f1yyYnPEQcMr801in
 +9Mix4vDRRYZxqiHRnBIuA7oR//7KhY+IaVKv0QuwQYw/xQgZ9eRsYlVJyMm8EQgHWqeWZLs4Kk
 yxn7ehGM2spnktkFyYJBFOUkzYSkLiU=
X-Google-Smtp-Source: AGHT+IF98henwy2TWQKJ1XrSeaSh2kliYZC9zE5X4Kw5WOK/pGtbKva3Tca7M5wL4MVfX0uU9vSsGw==
X-Received: by 2002:a05:6e02:1f05:b0:3ce:31f4:91c2 with SMTP id
 e9e14a558f8ab-3ce3a9c6c4emr155634345ab.11.1736817327950; 
 Mon, 13 Jan 2025 17:15:27 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4adef371sm30756945ab.47.2025.01.13.17.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 17:15:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 18:15:24 -0700
Message-Id: <20250114011524.1106877-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736817328; x=1737422128; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KFRRpQMlyV6MNCqm5sE2QeSORIPS4EbbHZLShHUNoc8=;
 b=J28s7j+vzNzX591+W4YQW0KhKdDCSNQurFOFVoV7MbBPkNj7lBg3USIAkJ5Upgo0ka
 A96hafkCTjJRYGB0ok+cTl58Ihs3zlY4LN7fAx/XBV+/mxEeO/84G0bWDJfPnu4gc8rE
 p9GeHeXQG4T0/t/QCJ/wzfl6so7AnDEsqx4yLNRgMWYWDV/b0f8s/2sW6jPFyvYqSYAY
 ShS2PJBOAz1xPDjE/Odhq2Ua7k9uIDP2Pn+a7j5nwnO+0qiCqHjhEcS+HwsEXgmIQjov
 dR/fBABlYQo2x5MxVQu7aT/8KDB1bg2EWjlHg6siocbM/DfyQdobcasGlxH/T5H15PtZ
 8nhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=J28s7j+v
Subject: [Buildroot] [PATCH 1/1] package/python-betterproto: disable
 dependency check
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to bypass an unnecessarily strict dependency version check.

Bypasses this error:
* Getting build dependencies for wheel...

ERROR Missing dependencies:
	poetry-core<2,>=1.0.0

Fixes:
 - http://autobuild.buildroot.net/results/0de/0de5b31bc649b97684deaa826e386ada50022d6a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-betterproto/python-betterproto.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-betterproto/python-betterproto.mk b/package/python-betterproto/python-betterproto.mk
index 0fc43e86a2..4fbed23863 100644
--- a/package/python-betterproto/python-betterproto.mk
+++ b/package/python-betterproto/python-betterproto.mk
@@ -10,5 +10,6 @@ PYTHON_BETTERPROTO_SITE = https://files.pythonhosted.org/packages/4e/94/930a1368
 PYTHON_BETTERPROTO_SETUP_TYPE = poetry
 PYTHON_BETTERPROTO_LICENSE = MIT
 PYTHON_BETTERPROTO_LICENSE_FILES = LICENSE.md
+PYTHON_BETTERPROTO_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
