Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF83CD3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 10:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 906B980D00;
	Mon, 29 Dec 2025 10:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlHA-jQ0w-NL; Mon, 29 Dec 2025 10:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B490C80DEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767005938;
	bh=sWBmyckNW1bAOHoNkPBWSJTiOatXLFSGue1ta7gMcq8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cPYHL8RkBGU7YSvUHl88CEgCwB175k+UgluSwj8KSUNjc434exR2VeK+XQHCUZIWy
	 M5jTlgc3EiiIjTDBStZ6/1rxhN+wLronEySD1bogmT/5UAGqt8SexPCtykgcZGMurs
	 EE+5IgIAkS5tJZzzPY2hjQ/1wk2KzmnXr1lT0lwGZM6DdWNBT7KC32Qtiloe/5MG9H
	 cdITGppV3wjwaMF2zafWWQFgtMLG3cSjSD2mo1sodXHo4R7ICJ2BteLH87wNBjyxIX
	 OIo+zDYR0ZDr7HrSEbjoSPDtubFxmQdX4dmDRWdntEuyBtNuErmGaFrKxybPy+X3+3
	 VG0J+7xRHQHMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B490C80DEA;
	Mon, 29 Dec 2025 10:58:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 14F79177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12A09400D6
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pemd3Z2q5H5W for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 10:58:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0EA26400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EA26400CE
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EA26400CE
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:58:56 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b7ffa421f1bso1712254766b.0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 02:58:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767005934; x=1767610734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y78kMLq+3NlLmUcp7t9Q+5NWxJLqL/sO+nUMfRzve9E=;
 b=O8KrYHLqEPOaoTAIxSXg6VOEa6bfOogvjYoex47HYceBPqkbw2ta3rLIzOcq4cAz/a
 NC/b/MC3BCQJ6F2QedYzr3PKSV8CebsdlyF2Ngbzq8NH6P6+CYayPmZhIvXUZDZmExte
 ZBR3Yo0DEl2kOZJ/58TrzrQOayBznEw6u4pm4Uysti0n+AiGXwb6BGXc3nT4+Lq8kZVl
 +zB/ep/FC+xCew2WJTnbbhHZLWn+KFEFeRH4kmfUQf5M7CxMrp2DPtuW2w2pnLZG2yH2
 7yoJ+eUFFdx76NMiKrRppdDSCJ/iH4fmhTV3S8HKoxoGWc8f/hHGBkpAt8ppK10MaPcT
 lo1g==
X-Gm-Message-State: AOJu0Yyi7mt3PLgpoFqsWAaANjf8jAj35EIOFXBYJjVZqoGQZm9IVSwA
 xwoTX3vfqEIgaG+UX9qrtfnNQ2gVN54rzcV2592rthLSb8Nxl9lgWgEUzqUC/c1uGAB90kgRC31
 6ctPn
X-Gm-Gg: AY/fxX5tXTtjzu0s6qFPG8tCpztGU8HKYJ/uxL4AfbBqb7+2ymaZ0FUq5YNrL50nP/T
 jtexqZQLfIdmzdsrIv1vnp2gufb3N9O4Ky+u6beaTISDQFY6XSSzM/hoKGh0b7cmiXJfqfP2oyF
 47I1TFy0g1vC5FYeEUrMlbJD41zV7/KfDoCo1O0rXCaiHfFE39rcU19vzQK3Zs+O1qY96V8KUuK
 PZZjeUuuNMssmCRCrWBkbNchoJenDtyDtnyZ58sFi3pZgmiwWTeIee+8xJ+MfgqdcESpV/LLwDU
 GQayTGHCRDeOuF0vgJcBbRUlsciefPD6+UWyqrZE+Lc47K5VpCFi3OBkblYMbxN3R0e2hPty+8D
 j8GCibBus76iKQBEmvrHa/lI4T3/XbHbhQMQaVEaCEMSCH5d8nEHX+3WB25jukZ3JtVJXY6K2Jx
 X6UnKIess1dVJbqknjAW+pWrnuWoW2flSpu+Hf7I0lJxZT5ZUmHbvpR4o5tYt7kwm2GmFo4BsZy
 UDDHyjCz/0edOrJYYpznMBE0jvAejCMbKSXxaKrqojipJ95KSqi6lMT/unNE0DLeVglJtYEzMn4
 FernbOCN4hM=
X-Google-Smtp-Source: AGHT+IH9dRmrUP7/imk8V7DQWHDGUlCwgCv4b53HzGaMCAVHM++/t5jBe/1VPnFTUrpnX0ZiOHtT4Q==
X-Received: by 2002:a17:907:70e:b0:b82:f808:3eb9 with SMTP id
 a640c23a62f3a-b82f808493emr1822421366b.9.1767005934525; 
 Mon, 29 Dec 2025 02:58:54 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b80377f2f18sm3276657966b.0.2025.12.29.02.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 02:58:54 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 29 Dec 2025 11:58:50 +0100
Message-ID: <20251229105850.50502-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1767005934; x=1767610734;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y78kMLq+3NlLmUcp7t9Q+5NWxJLqL/sO+nUMfRzve9E=;
 b=TpEgzhZcTzVTHkmvPyTk0fbxJUBLkNFC6ZVT9LYsiImUpBi7EhGGXVkEjMlFa8AlYW
 YPziuAgvobgactHZS/GenZmu8/mZ2kR26Ul/jmpQD5C+qg+b18f+wXd2e/CejS0VBAHr
 EKas45gdFHQLhvXqqQdGqTgqXErXSpjiTUnkw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=TpEgzhZc
Subject: [Buildroot] [PATCH 1/1] package/pocketpy: bump to version 2.1.6
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

Release notes:
https://github.com/pocketpy/pocketpy/releases/tag/v2.1.6

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/pocketpy/pocketpy.hash | 2 +-
 package/pocketpy/pocketpy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pocketpy/pocketpy.hash b/package/pocketpy/pocketpy.hash
index 2541e845a970..9f0fb868f4db 100644
--- a/package/pocketpy/pocketpy.hash
+++ b/package/pocketpy/pocketpy.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  eb7e8d9285d3848c2bc108b41fed4c49ea47df6b0018362319d2736a6f5821e1  pocketpy-2.1.5.tar.gz
+sha256  b0e4ee0ffcc6111f67a405c6418f5539caa0ab0368adb2027af23fbf17de88a6  pocketpy-2.1.6.tar.gz
 sha256  9dab6fe9086f93847540387be578edc94b6b280004db5ed7c850ccf8f086fd66  LICENSE
diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index b17184089032..06aa0faca014 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCKETPY_VERSION = 2.1.5
+POCKETPY_VERSION = 2.1.6
 POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
 POCKETPY_LICENSE = MIT
 POCKETPY_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
