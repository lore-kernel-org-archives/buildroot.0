Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E62C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 13:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C70F760AA8;
	Sun,  1 Jun 2025 13:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8E6VDKvflwM; Sun,  1 Jun 2025 13:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E41F4606F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E41F4606F6;
	Sun,  1 Jun 2025 13:28:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07DA01F7
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECDAE80CF3
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgZFPGKRQ77m for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 13:28:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1325F808AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1325F808AE
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1325F808AE
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:28:35 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-54d98aa5981so5057773e87.0
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 06:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748784514; x=1749389314;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8rdtQGGE6JyjdL7rfEPSQhMB7l2bxwAOCiGCf6f3Pps=;
 b=maZRxDrCeG3QhfJJkYO7ScUEEItpAKFFzvMDMKeC1pI1lKyCqVcNYJdRjeI2ZTxdVi
 0L6hDy8vBuH2KOScyTPqiz8c/uqh7H85HXCOKbZ2ngz+TThZ8L31tZCvMQ1rliGCfuGo
 ZpNmUfZDgTiik7fsQoOYGxAzrG88Q+pgBb7y1AWUML7kVVF/0OB1mn+YjKYXB8PtYlRh
 fQL9piv9jhYvSAYZUoO/5D9OhOWsxlgUSiS8TzTer39cy+DuAbvb15l/dBXM23/t9C+O
 6fy810GVy9e6pZ1Xwj9tzxNWOK7zxiEzC78/9K2hO56JGB+FAbl9tuGF4iw/gjSxgbD3
 ww+g==
X-Gm-Message-State: AOJu0Yxc0IXiyMlm4BzTWRJ2sRAE0wWoXLViuF6wW++28wrg1M9sArNe
 9L+UkyzwIPE53YFLL9Zg6JFpl2LCvdWMDMuLWYBEUXDObhKg9j820/+eV7RibQ==
X-Gm-Gg: ASbGncuUQGBFEs5xnZVIKK5bslG5Dm+BkG6+fdakov+F1plUBNf6aCspicZqk36sVmO
 l1PYCkRvz6XEhlLqRuuq7fpd5YGZmiI+ZNM0IFc5AsxRF4aBq9E2eMv6REWzAs3IwVrZFeuF674
 lXWbdoc7BbMoldhnf2JLOBrhjZBldGtUJ9R2QJRcXMdE451IxZbTBK3y6+YRy3nxyUEZQNqsOkW
 lLxpLUUgJ7Dc4kIB5kLJ/fA/pO+4ROx1JtmgvStmfIdiZ8o36WWnhPueYBpnGVH2SKOLS5kIh6h
 lrThrfLrvglV5ll1JnWGQ8fFdxE0CN2OJNYPgP4WreYR18FBbmj8uK0sL7qtxL3mG7i87HpU5YO
 j61Y=
X-Google-Smtp-Source: AGHT+IHevHyPVF278QS8y6W/fgYnu+Z6LQ/DrGIYKFGaW88X81QPNoGTNyCo4yJCIvobSwLu/2f8uA==
X-Received: by 2002:a05:6512:e98:b0:553:252f:addf with SMTP id
 2adb3069b0e04-55342f610a8mr1263351e87.10.1748784513418; 
 Sun, 01 Jun 2025 06:28:33 -0700 (PDT)
Received: from localhost.localdomain ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533787d38fsm1275178e87.42.2025.06.01.06.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 06:28:32 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 15:27:30 +0200
Message-ID: <20250601132736.3582117-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748784514; x=1749389314; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8rdtQGGE6JyjdL7rfEPSQhMB7l2bxwAOCiGCf6f3Pps=;
 b=QsB9YSXnRayG4NAO5RfY0QdNBsrhqyctbQSNk3eiOu9T+THT2Ms1M0Cy8ousP/tKhj
 Rt8lMiDPyhE3KuLv1ve0HPO7v7V0ix/qXqRhcrwi/h4xJvIx7Bb4i8U932lynPgzxmm2
 B59gyxICiivgupAf8757v/sM4fCPRmPMS0j1aY1mAJ5xQWseU3sBxdEIQkh+sN3C3a4Q
 lvGzJv9zzNl3TBpCagntFge+zOg+lVXJNZGtVU5qjIMaie24TeHOtzden0+RxMBSfAsu
 Mpq/vIs37BSouXGTG/RPeHcbXg0JzeNKh2S75PxR4dfsey7Q+s2I8cWA6QQE2Q3OmCvE
 U0dQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QsB9YSXn
Subject: [Buildroot] [PATCH v3 0/3] package/qt6/qt6tools: fix build failures
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

These patches were originally part of the series bumping Qt6 to 6.9.0.

The fixes were rebased on the old 6.8.1 version, and reordered to match
the order in which they actually appeared.

The commit messages and comments were updated.

Backport to: 2025.02.x, 2025.05.x

Changes v1 -> v2:
  - add missing patch "package/qt6/qt6tools: build without clang support"
Changes v2 -> v3:
  - remove options to build assistant, designer and linguist for target
as there is no good use-cases for these in buildroot for the moment (suggested by Thomas)
  - since target assistant, designer and linguist are unconditionally disabled, I
remov the target package.
  - squash the target build fixes related to assistant, designer and linguist
  - remove unised host option


Roy Kollen Svendsen (3):
  package/qt6/qt6tools: fix build failures
  package/qt6/qt6tools: build without clang support
  package/qt6/qt6base: remove unused hidden host option

 package/qt6/Config.in               |  1 -
 package/qt6/qt6base/Config.in.host  |  5 -----
 package/qt6/qt6base/qt6base.mk      |  9 ---------
 package/qt6/qt6tools/Config.in      | 13 -------------
 package/qt6/qt6tools/Config.in.host |  3 ---
 package/qt6/qt6tools/qt6tools.mk    | 19 ++++---------------
 6 files changed, 4 insertions(+), 46 deletions(-)
 delete mode 100644 package/qt6/qt6tools/Config.in

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
