Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20289CCF9E3
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 05:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4B436071D;
	Mon, 10 Nov 2025 05:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crKk55N18Pvy; Mon, 10 Nov 2025 05:55:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C25C9608D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C25C9608D6;
	Mon, 10 Nov 2025 05:55:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C88F25D
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 05:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 329FF608D6
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 05:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5P29uucnw7kx for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 05:55:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 630C46071D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 630C46071D
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 630C46071D
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 05:55:31 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-297ec50477aso7936345ad.1
 for <buildroot@buildroot.org>; Sun, 09 Nov 2025 21:55:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762754130; x=1763358930;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=INR+Z9+gqQrVFOuXZH+XK4h3jxyGCeFkkNorq/ASiXA=;
 b=p71i3tV7fbMp1XcMvA7ZPbvx/ZU4pMZLXQHb1WPKiN/dVxwTQ4ZtynqktssYPKok23
 FpFGTY/kGflvs66c8ri2HNmuJjBhczm5uF2ackm0Ts+WVeq9YV9Sl5jkaRcql67ksd5D
 NLkJ045kSI32FlOUSBJtYEyTehNdpX5iPKB2PwHtS7M61d+lIC0r7WqPJJbWmDKMPasj
 ADOpu9cnenTDRoS7kUHyDTEEogq9D7NcnzPp8JSLpV4vD+tKIM82dOjn6xjk8yhlXrDl
 HmlIR4dw+yK0AQFCCcsvu67E7LP2cRsJkQ9piYhIB1XxDMQXggf2TQpPTQF3xbyXgVPj
 4ZcA==
X-Gm-Message-State: AOJu0YzjP1WNXV0M4ji6thEauOvglNxTfbpmOASwZXELpluxit78BB0B
 jCNhbWeNJvlYZgA1vb/jc1qcciK6+lqbAbkKjTaR1jdyo6JtYzsFja8bPWZ8b4in
X-Gm-Gg: ASbGncsnXywe08NeeIgFSJ+Cp1GT+tkib2t8hsmuSOWVtaiBmowAK3nqgg1W40tlyoq
 eNwoX6d1c3vJPflNEIi6NHUDEo2BxVyjGgyzB/0qf4vOQ60LPQaMmEGyLQNbnglABWuXXR4KxnC
 5+k923lO6nMlhJCk2YtmvJw9UlyWA8Wbv+r+2C1YHHTlIT5iINKi8X7eH0EawbemRrPbyaBFKF5
 i++AgqYEgueIaoFrQJVswIXdwfocBJyMV5E9OV5dSwUk+kg+YObEW8+n8sMwiuBP5NoK2ICvQJr
 4NC1aUt/ZZ5syV2Xn59K+11jnmHRTkZgOgbUwuDA4gCqbO19sYKM+VWTwJAegNL3l+omLB652TT
 0MA2R/NEcebenlSSAkPfBUZgEqG8nZtGz/VXLCSByVvo/tQH7Isj4JgyfhIgH5cJX+QTUBCAmes
 qmy9IosSuBysIBPTsSYdnEW1s+gkhJpWXIUiCJxT1ZF3AOaWujJYoZHVSXAFoUO7Eggt993A==
X-Google-Smtp-Source: AGHT+IGXRb31vzjGU88gypVF8lqHhv58p8Ha+zqvfgP/o/V1l8vBikjmoOmnAT10XQSG2pETdNC3ow==
X-Received: by 2002:a17:903:19e5:b0:297:ec44:56f with SMTP id
 d9443c01a7336-297ec44099fmr81168845ad.14.1762754130380; 
 Sun, 09 Nov 2025 21:55:30 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651cca9c9sm129984345ad.100.2025.11.09.21.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Nov 2025 21:55:29 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sun,  9 Nov 2025 21:55:27 -0800
Message-Id: <20251110055527.205954-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762754130; x=1763358930; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=INR+Z9+gqQrVFOuXZH+XK4h3jxyGCeFkkNorq/ASiXA=;
 b=CDHH2LUq3hVAdzO0K8ydMwrplUZ8L4JoldggjXY0ARdyxFrTP6dZs/MNIHZbyA6jB8
 mLUgYtd+PY6k/gHAkTH4pICQgcZ/Ny+1TVBzpbyUrFCYEcOuNHIKFnSzCucvAkVaC03B
 EIKd0hh2mRTkC0bOklCOHEVi7X0xodzKMQJXqhXqjWQoHYQPrl9EVWDIYBS7Bi7oS2es
 y0jQaWL8TtQXSIMuvBIX3Vazt4DlG08ZKr3f7LE6u6T1SLba0AiuaIF4+xd6Yx7HEakD
 7z9Gajep3sAORK4f+UQ7kDGX1CxxyLhOcIntc6eRe5lBoo2nCQu3WTuosLLHID7vff3H
 q97Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CDHH2LUq
Subject: [Buildroot] [PATCH 1/1] package/nmap: bump to version 7.98
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

Changelog:
https://nmap.org/changelog.html#7.98

Note: It includes a fix for CVE-2025-43715, which impacts Windows-based systems.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/nmap/nmap.hash | 6 +++---
 package/nmap/nmap.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index e9bce1a01f..9303ff613e 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,6 +1,6 @@
-# From https://nmap.org/dist/sigs/nmap-7.97.tar.bz2.digest.txt (lowercase)
-sha256  af98f27925c670c257dd96a9ddf2724e06cb79b2fd1e0d08c9206316be1645c0  nmap-7.97.tar.bz2
-sha512  050241744c311f5fc16297e1698aded2a9fdc78eb7a0954d1c70f7713ef6e1b07f3fcbf28a6a53f43785b1ae710aadf10237d1d0bd8855c6b3c423da4d35961c  nmap-7.97.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.98.tar.bz2.digest.txt (lowercase)
+sha256  ce847313eaae9e5c9f21708e42d2ab7b56c7e0eb8803729a3092f58886d897e6  nmap-7.98.tar.bz2
+sha512  14e13689d1276f70efc8c905e8eb0a15970f4312c2ef86d8d97e9df11319735e7f7cd73f728f69cf43d27a078ef5ac1e0f39cd119d8cb9262060c42606c6cab3  nmap-7.98.tar.bz2
 
 # Locally calculated
 sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index a944627b38..629a00f30e 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.97
+NMAP_VERSION = 7.98
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
