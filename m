Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78538CAC5A7
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 09:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E011D8222B;
	Thu, 25 Sep 2025 09:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqt5tf661v66; Thu, 25 Sep 2025 09:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E98682266
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E98682266;
	Thu, 25 Sep 2025 09:20:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B888199
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 09:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E65588222B
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 09:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bi5PzD2IFSjP for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 09:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1349A815D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1349A815D9
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1349A815D9
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 09:20:01 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-634515fc54eso109630a12.3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 02:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758791999; x=1759396799;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eE+jjOLTgy1jvO3Lk6muJNpe3yyFA6ImvjBvxWLpN0c=;
 b=W7WfldRs4B9uYAR1msAAz6cd6a1ccC2+rTFFGEoV/M5V+XyNCqTDYuTstbI7qOhcrI
 ejASe/11NdlGlANs5L73xWEJJsfEM5OKwMz/hjsSvQwMe/7FMgm3Q6D3RxwE9KRjCyXK
 enwc3iUNva6x8V5Hx7DRxfIvnwi9uOhStGB0TWy59U56EezwvkJE1r5MO2WwnCalxd+B
 4HcQ/yEFKxgtdd/kXvkq8QwtooZcOj8DQ/7DGh8avBVhfOSUL8Gz2GhLdohdBK6aqW4d
 zyotrs7t8YsAH4kSw8xN+u8pMWYTPzcY6l7mQ4bNLs0Pif3iwF6Bk2cyEnb1X4CafxEe
 +BDw==
X-Gm-Message-State: AOJu0Yx8UyZ92FR6xyIHUNhW04Yhq3ObE5tL03/t/rPlVoGGJPF1qvZL
 6nQ3WjnslMWpZlypiOncQjoGyfMKPpazlt0tXCUUfDARsMLTk3sWiECsT7XnBLBuzULc/vjIKsA
 PdHuz
X-Gm-Gg: ASbGnctFzpN1UkLlizuLqe0Ca9jspGLGCGjnLXmz0veiqE+q7vXvICVcz+kaArw4jPi
 pU8Ohu9vlIXKN564oMxExTXrJrdNqcFPsC7lFoe86HjZVGTyDx3nX+wgKkSwQraTPWMbTtLPq+v
 wYToENVT/rGr1s+lmOW2Wa8SgLWSevOBDwXscRO69tIL4Azq6W1/i5WDSK6AVwdARA/arBidPFc
 8Ua0qVDBI/i1GAPf7EWctviFoUgL4d3uX8Altdbnjqz/vnsfHu9vxP09Pz2adJc062F/NSkAoqn
 LPmI7Y5mOWg0+/DH3Ne3rCcdmmRuOWjGYDIUjIBp6X5weLPH8VNYc6BMaQvwmgeHkezKf3znch+
 ZvEhH9g64/od4lALYILx0OylNIqupu954Qgfs/91dnZ+Tcd83xK6ihFgJADglv3n1xtEJ9JX6am
 l9l8bcAFGshKPspVjYcMpUARtjHkZMtOkGKw2pYZnn+mM/jTBQhPXoi2iNz3SO
X-Google-Smtp-Source: AGHT+IEK62h5AO2e5iqXoMHpb3J0I93iuKzuG7cVWkqmX/Wix5/8xG6jHcYzTbvNya9ZwJYjiKQRkQ==
X-Received: by 2002:a05:6402:4602:10b0:61b:1d72:d429 with SMTP id
 4fb4d7f45d1cf-6349fac70b9mr1022931a12.8.1758791999470; 
 Thu, 25 Sep 2025 02:19:59 -0700 (PDT)
Received: from adam.arnhem.chello.nl
 (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a3ae321csm921959a12.24.2025.09.25.02.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 02:19:59 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu, 25 Sep 2025 11:19:56 +0200
Message-ID: <20250925091956.25697-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758791999; x=1759396799;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eE+jjOLTgy1jvO3Lk6muJNpe3yyFA6ImvjBvxWLpN0c=;
 b=oSlLT5cuNrv01P/NVWJm9CUom0CTLdb1GCqMhTTHehvCGManEC61PjDVLSldbJceY3
 w3Qd45umv8KKQ3JE11V1krY6qVFMM8LT+M2oyJr4yMLeEuAPnLw84ZluTzh3k683ocpW
 yK2xP2JfbM+ioaxeNf0/qDdu8Hc/cX46ruYp0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=oSlLT5cu
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: Remove
 adam.duskett@amarulasolutions from sway package
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

Patches submitted to update these packages have gone ignored for
months without comment, and I no longer wish to recieve daily
emails about them being out of date.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9094973fdf..fc561eb1ea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -28,9 +28,6 @@
 
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
-F:	package/dmenu-wayland/
-F:	package/fcft/
-F:	package/foot/
 F:	package/flutter-engine/
 F:	package/flutter-packages/
 F:	package/flutter-packages/flutter-adaptive-scaffold-example/
@@ -42,9 +39,7 @@ F:	package/flutter-packages/flutter-rfw-local-example/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/ivi-homescreen/
-F:	package/libutempter/
 F:	package/mender-update-modules/
-F:	package/tllist/
 F:	support/testing/tests/package/test_flutter.py
 
 N:	Adam Heinrich <adam@adamh.cz>
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
