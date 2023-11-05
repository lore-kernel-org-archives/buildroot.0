Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3F9C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98928417D7;
	Sun,  5 Nov 2023 21:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98928417D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9kWi_V8PYkO5; Sun,  5 Nov 2023 21:52:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDF70417D0;
	Sun,  5 Nov 2023 21:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDF70417D0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 869BE1BF45A
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C54E811E8
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C54E811E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qXWsQrqgs2Bz for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:52:26 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 583F680F76
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 583F680F76
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1cc921a4632so30679505ad.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:52:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699221145; x=1699825945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mvHPO3C3eCUlKirx7ZzBtb2Tg8F8uOeU57GaW2kUQlY=;
 b=ql1E8qju7hGJnO2+i/o3URf7KTJ9eSXpHElVZ1yfjCsWp/pO0p8RY8OcKk2zK5rI4H
 5+CtzpEkCdEFGBIjuiYthlo7kg1FypUXNxwds4OcoVuKcsHMTE4zf01jm760QMYsz3d2
 pGe/AAfnEdwvzLphZWHZFwFqXNMz9LLw1Wmb1HeaC+5Je20ab43/hjAfOMf3Nd+yojBt
 uVg1NZKRSpolT91WSxMB3zkMlQTSTIvAWqdZ/I22RyNfASWTpq8xbSdx+BsLZfAd/L55
 oeafR7AtqvUj92qC4zANdmLE0XjAUbBsVROBL+TuEQGT8dm1xLvQQHkaha8c37Kj56Uo
 +liQ==
X-Gm-Message-State: AOJu0YwieDxk2YxS7xiTpU5FEvs9YHIfLkwhwuLMEfr+IItndgdLcbv7
 uYzrEde7RW1dBhSxbtqklA6DZFRCJiUZ+VWleGSdcsYL
X-Google-Smtp-Source: AGHT+IHIP0RSaXg/aoDOO9qOT9wAgQ1zkrZAMcB/PppiYcFj2PZaRn78xxqb5Jrygy0xu4pOZJhnNQ==
X-Received: by 2002:a17:902:e848:b0:1cc:4559:ff with SMTP id
 t8-20020a170902e84800b001cc455900ffmr26828574plg.13.1699221144868; 
 Sun, 05 Nov 2023 13:52:24 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a170902b09600b001b8a3e2c241sm4607175plr.14.2023.11.05.13.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 13:52:24 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 14:52:17 -0700
Message-ID: <20231105215221.1602465-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699221145; x=1699825945;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mvHPO3C3eCUlKirx7ZzBtb2Tg8F8uOeU57GaW2kUQlY=;
 b=njiYes3foo340ENWkW1EMVBRlO6SIjN+odgdGDAN0qqU99NyC/0mqBckwprmE0+W28
 f3Fvwhek48wf48qnsh8xdjxDEMawRZE0GUHXhnJrtT/EZaVGjbpe4DAoofmhID8bHChf
 oebGSRfn8D4YW/DGSKr10VeFzrjlu0ZMYhafw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=njiYes3f
Subject: [Buildroot] [PATCH 1/5] support/testing/infra/emulator.py: add a
 timeout argument for the login method
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

to override the current value of 60 seconds

As per a suggestion by Thomas, add a timeout argument to override the current
value of 60 seconds for the emulator.login method.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 support/testing/infra/emulator.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 02cf486128..09f81eca89 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -84,11 +84,11 @@ class Emulator(object):
 
     # Wait for the login prompt to appear, and then login as root with
     # the provided password, or no password if not specified.
-    def login(self, password=None):
+    def login(self, password=None, timeout=60):
         # The login prompt can take some time to appear when running multiple
         # instances in parallel, so set the timeout to a large value
         index = self.qemu.expect(["buildroot login:", pexpect.TIMEOUT],
-                                 timeout=60 * self.timeout_multiplier)
+                                 timeout=timeout * self.timeout_multiplier)
         if index != 0:
             self.logfile.write("==> System does not boot")
             raise SystemError("System does not boot")
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
