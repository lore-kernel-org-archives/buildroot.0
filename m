Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37968C43334
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 21:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE7CB40BDE;
	Tue, 21 Jun 2022 21:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE7CB40BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K0omPMJj3nk5; Tue, 21 Jun 2022 21:11:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC4E24059C;
	Tue, 21 Jun 2022 21:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC4E24059C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA8901BF2F3
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 21:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C485A4059C
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 21:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C485A4059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hOcFrqcQwrBZ for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 21:11:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5B364023B
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5B364023B
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 21:11:41 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id eo8so21142842edb.0
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 14:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WfHgGFqY5Gc6LS3uIAdt5qu0ZS4tiQ4+S1DilzWVOaA=;
 b=Ean/s8y/5eg5SkUz8d1ZNfb94A1ZHDV0cKXK2qeyJzz/JE9sh2P7Prx1XufBuUEqI3
 HOl3Z6Rngk3H5vGxCfWlj6q7M/iPhipNThJVGZ80hk8De9XBLaZfm544JrQlHnVSYKA7
 Ow1zRpJGb//OKAD3CGrWfrzszhBDVXv49i065KiAp78cmJXdEdeSO3xPBQtenlao4nSz
 js6HATxX61NNVnAxKzMQIczRM7KNRy6iPPm4s6PTCXiNxhZzdOxARODMZMGSwdFg2uuq
 XWj4/QtUKgt4hHX0IOKfBWnjaFPYVzJgZEjup6u7Im6cFnldy9OQFLFUW0m/E8Fnysby
 M0sg==
X-Gm-Message-State: AJIora+W77j8G31itUScClllZgksGsVwxJHc+lVuz7hOypdiZDewXa43
 7spz8xFxpP6GM7sLC6HS+X7ZKGEv4ZwpjQ==
X-Google-Smtp-Source: AGRyM1v/WtMqB5XxX7HGPpWXeonP1pKSAD58tA5adBVBG9BNTZDc/cLgRLxX3Xi9cVk4RGruM++lkQ==
X-Received: by 2002:aa7:d795:0:b0:435:7fc8:2d1b with SMTP id
 s21-20020aa7d795000000b004357fc82d1bmr24093edq.201.1655845899949; 
 Tue, 21 Jun 2022 14:11:39 -0700 (PDT)
Received: from angelo-ThinkPad-X270.. (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00705fa7087bbsm8348850ejo.142.2022.06.21.14.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 14:11:39 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jun 2022 23:11:40 +0200
Message-Id: <20220621211140.2043539-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WfHgGFqY5Gc6LS3uIAdt5qu0ZS4tiQ4+S1DilzWVOaA=;
 b=CJMvmvpEtF+1IGUZqCSNUpYaUwnOTXIwxBbmz61LmJ9iXn92ONLpXTY9d0a10tqlMp
 dGHnbrbgeX8MuPgiaSsSlwClTTKp5Vngd/7hQ+mmH+T6ejZUlglVMBXgOA7Au+kdvG4o
 xgwWST6zeNb1AW63bV+R5dab1hm9FDFaStpno=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=CJMvmvpE
Subject: [Buildroot] [PATCH] package/cups: security bump to version 2.4.2
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2022-26691
https://github.com/OpenPrinting/cups/blob/master/CHANGES.md

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/cups/cups.hash | 2 +-
 package/cups/cups.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index 8308b7b803..ba220e903e 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  c7339f75f8d4f2dec50c673341a45fc06b6885bb6d4366d6bf59a4e6c10ae178  cups-2.4.1-source.tar.gz
+sha256  f03ccb40b087d1e30940a40e0141dcbba263f39974c20eb9f2521066c9c6c908  cups-2.4.2-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  7a7bd639e3a8457ae40b0dcfb74ea3cc6a8132b06c726142e993625d33eb6de5  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 298a6ed879..ab56b23bcd 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.1
+CUPS_VERSION = 2.4.2
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
