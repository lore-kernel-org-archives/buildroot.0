Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE0FD2AB1C
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 10:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE1D780A9E;
	Tue, 29 Oct 2024 10:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ReGPoUoXZNNT; Tue, 29 Oct 2024 10:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3AF480AA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3AF480AA2;
	Tue, 29 Oct 2024 10:36:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9413B5E4E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 10:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75DB96064F
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 10:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGvqxEa7QxFg for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 10:36:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F6A260707
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F6A260707
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F6A260707
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 10:36:50 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c9404cef42so955191a12.0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 03:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730198208; x=1730803008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TTUfP/aHdvdMqiBTNc2j+AO1NxoFl91DtjcILyeb1J0=;
 b=DDd3cm7SH33ixhfecJuuJMEiq08l0Fy0YHeQBOyTB5mHrN5Lw+Iuu0MyTK3CUn4Bsq
 t0r+ijx0pNnFThbhgBs2u8P4RO9pHMELDsrGIiITy2+4U74HKCTvaiWOcurQ2MKBXrm6
 hpLBJV1kjJtJFkM023E7JpNdExymzgkJMPvZN396iSBEwTcs+ox7zBfVy5SBGwUb/kau
 uQX4s5NnKeV7GQLcOjcQ578jwl2VdDV3mPuXEa8ltZZ7CGsGFH8KcT2sAJe+W2/XoGU8
 6YNmZqrYEFPGuyZ5Ct2DKzSmF6d+Csw4ozR3Xi0zjEjG2PVUm5yxXz9SXd/IpSAJg5E6
 uTeQ==
X-Gm-Message-State: AOJu0YwRb/ioEzvuxkHPtdoySO06C8TSK/mf7bNnYYs7Q26c4txqhkVj
 b9qx9n3FTO8fm8ErSztZnd3Lf0RVwUew7XzuVKIeUrTXJ0lTtCzCxlrw4A4cdk6Pw0cTM347j+A
 GYO0=
X-Google-Smtp-Source: AGHT+IHFZOMsKYAXWENBP3qhVk5H8XDUJ8Lp86TgOhwteu/BcQLuf03umePJL2bQJgeP67j8FEumLQ==
X-Received: by 2002:a05:6402:13d5:b0:5c9:7f8b:4fcf with SMTP id
 4fb4d7f45d1cf-5cbbfa58bf5mr3671618a12.6.1730198207933; 
 Tue, 29 Oct 2024 03:36:47 -0700 (PDT)
Received: from adam-laptop.arnhem.chello.nl
 (2a02-a211-a140-6480-f59d-d8b2-eb04-8d6f.cable.dynamic.v6.ziggo.nl.
 [2a02:a211:a140:6480:f59d:d8b2:eb04:8d6f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb6348330sm3865320a12.89.2024.10.29.03.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 03:36:47 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 29 Oct 2024 11:36:44 +0100
Message-ID: <20241029103644.604199-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029103644.604199-1-adam.duskett@amarulasolutions.com>
References: <20241029103644.604199-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730198208; x=1730803008;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TTUfP/aHdvdMqiBTNc2j+AO1NxoFl91DtjcILyeb1J0=;
 b=UmGfGfilbzlTdJWQ4nZgOXGwvGBRHvxRDfFm+CsKgfoQmA+a2L6veQNkvEf/VDwIWb
 UtJH6p7Q8rmh20DoxeX85SuW9e3KElKc7wTy6tBQlDWFbGZ0d3m40FmxB5zvMF+zpH3E
 JtMGjYCEBOvCOXNmsMyYwn8jVLsQl8npc0YTs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=UmGfGfil
Subject: [Buildroot] [PATCH 4/4] package/flutter-packages: bump version to
 85c4934bda545beff36133dc63e47de5b5c5c56b
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-packages/flutter-packages.hash | 2 +-
 package/flutter-packages/flutter-packages.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
index 1a8613ecb3..9730f65bf2 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ddaa74f1d4a7d2c07dc620ccd5d33743b2c1ec6261d1cd00df74bdcf78aebb3a  flutter-packages-df88c814248ddc88fdc0ac0a75d94179f39d644b.tar.gz
+sha256  fe87edffd828f7081f5622c592cb5871a2bc107dc03ff2610ddb6599f4f0137b  flutter-packages-85c4934bda545beff36133dc63e47de5b5c5c56b.tar.gz
 sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index bf39bb4488..37f8141e7a 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PACKAGES_VERSION = df88c814248ddc88fdc0ac0a75d94179f39d644b
+FLUTTER_PACKAGES_VERSION = 85c4934bda545beff36133dc63e47de5b5c5c56b
 FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
 FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
