Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248ACC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 08:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFA4060C12;
	Tue, 22 Apr 2025 08:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAwHEh68oezz; Tue, 22 Apr 2025 08:53:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 217C860C1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 217C860C1E;
	Tue, 22 Apr 2025 08:53:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2A0D1A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 08:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A88E640FA4
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 08:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDe18eDy8hGW for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 08:53:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0AA6B401CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AA6B401CC
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AA6B401CC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 08:53:52 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39ee5a5bb66so3352047f8f.3
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 01:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745312030; x=1745916830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p0QkMVOJ7f8BvNUCpI8/NefJNwg6nsgJd77XyxJKfNk=;
 b=UcldO2Xj26eUYrqH4LIOU0h6GEKPLOunFWbAPQL5X+AygEqGokmV0lDsnq6EZzY/Cl
 04F0EO7hc9tqeTArRRvktTihiNeLlOdkJ+Bl3LF+V4kuqIzAX5KWQaGkkU6aQhHbYNDe
 CbOnh4lCzfbnXR57hmX8P9s1YmAx/MVcV5hGXYoDoqslRq2uPSx/1pSogR1Znr98IIbk
 5rqETaKuWad0JgbbbIiCYMKBi+7O4YOUELLFW8RwlSgVygMUm/L/s5+VKIGnroNGeiEJ
 jMzCE5Wef4lB4su8lTcU180czACd5dKH/UruAlvBYhcrs0OHxvcrcIAYpWZkW8N7pNpm
 vNYw==
X-Gm-Message-State: AOJu0YzjI73Vw+aI0xSeyV2fBXWK1U1S/gzkcxqsGuLDgr9S75f7/63F
 UU/gGrXuDxWRtNk8RzIYY+AfLhiSWK49XHzciNdubZVOnA2pbeE83gEqnV3IGQrMRl1vENUCVFj
 Csuk=
X-Gm-Gg: ASbGncvw5DI3LXY9+B3kgorXty7L85ScO/69rT4rBvCHawDZTB1FJSmbHxKRNHsrDxG
 LuWedn7adFrhEixZcidMWqyKK7lzaETPCHulRZGlDKaMrUAN315F2+MKeudtYhdFepmSSp4EIBi
 6fHu3Bg3sb4c4S69dGURgY3OVSIi7viW5kUsK+7Yn6bvx2C59tMyeZrq5sVsort64CY09T7v4rj
 57lIkVHriZvk+kcaWo0N6aOxyxKpmh2W2EmjEITFJWxaIeMg2Ci6Kxk4EjszG+AUY7nfvDRrxk7
 m/oe0NjXkQ1+z59s6WeVOu72t2A3oAT1f1woIgouxORYgf4gcxhQvk0nRTMwnUK4gRTrwZFaL+E
 t6MXrsJFJnWZMWuXhkbB5dDgnVyC+hmhkJVg=
X-Google-Smtp-Source: AGHT+IFbFCpLANGAVSCHFV2qWmq55Mi2CQAXEXgJJscSt+V/uH93ZSmOHlDVx4/ov4Wigy9YVjN+DQ==
X-Received: by 2002:a05:6000:1acb:b0:39c:1258:2dc8 with SMTP id
 ffacd0b85a97d-39efbaf211bmr11507511f8f.57.1745312030342; 
 Tue, 22 Apr 2025 01:53:50 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa3a1685sm14451238f8f.0.2025.04.22.01.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 01:53:50 -0700 (PDT)
To: buildroot@buildroot.org
Cc: David Pierret <david.pierret@smile.fr>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Tue, 22 Apr 2025 10:53:36 +0200
Message-ID: <20250422085337.901025-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745312030; x=1745916830; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p0QkMVOJ7f8BvNUCpI8/NefJNwg6nsgJd77XyxJKfNk=;
 b=kFhKHUCbNvGTed+o9fy90y6MRo/rCN9fFd0pIjid4PMUncuOfUxdsgRcvWNUsdJkr7
 DXBthRRoAULmMOp+pFnQ1gbpoH1QZ2b1ZHSVZoyaElQ/EE//+L7NTCAEyfxLimjBT7E/
 8LcVRu9JKmbIml6MrNflLEVmpQDiFfBx+KBLs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=kFhKHUCb
Subject: [Buildroot] [PATCH 1/2] package/bat:bump to version 0.25.0
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/sharkdp/bat/blob/master/CHANGELOG.md

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/bat/bat.hash | 2 +-
 package/bat/bat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index e80301ff49..f3050f6354 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  45fcdd6076dc1b45698a7b6c0f4d1f5d9ae676f3ca3b155402ad24680d5b4df6  bat-0.24.0-cargo2.tar.gz
+sha256  d793a8f3a6e47b96ee81d624d2b4b470f005b6823ef6b0f38c0cc10726d35fdc  bat-0.25.0-cargo2.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
diff --git a/package/bat/bat.mk b/package/bat/bat.mk
index b95cdb25ac..7e89d361af 100644
--- a/package/bat/bat.mk
+++ b/package/bat/bat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BAT_VERSION = 0.24.0
+BAT_VERSION = 0.25.0
 BAT_SITE = $(call github,sharkdp,bat,v$(BAT_VERSION))
 BAT_LICENSE = Apache-2.0 or MIT
 BAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
