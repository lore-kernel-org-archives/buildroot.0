Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25EEC5478C
	for <buildroot@archiver.kernel.org>; Mon, 26 Feb 2024 20:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C059860B71;
	Mon, 26 Feb 2024 20:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GQBwgWc6mZls; Mon, 26 Feb 2024 20:55:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8E7260B94
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8E7260B94;
	Mon, 26 Feb 2024 20:55:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B66281BF271
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A308140120
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:55:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGcismvO5vwb for <buildroot@lists.busybox.net>;
 Mon, 26 Feb 2024 20:54:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E621400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E621400C4
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E621400C4
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 20:54:59 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6e49833ccdfso774203a34.2
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 12:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708980898; x=1709585698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YbH/hS4fjwI8S8c7H9186RMrM7qwO/PAFHQxMPCuU2Y=;
 b=AEt6Mof7/87KeT4+OvTaspkvnjHWSb3d7MD4z5r2RFbDRw1hKAwHxnHuyngKMIYX9H
 /1c9Q8L1ZUOx3EBO/S8Beh5ViYLxCOtfAKcZpZp3d14snorxdNZ1hVJ8/n+RqyOS5IC/
 mr6x/pYmXNqkLP1RhYXWyUsvDrD08oFy789Y9TT/OvQLDMAHSC4Oc4hHKqxxyPJRYPBd
 kSYXrdfODKzUsq7BsS8hMsyXGsw/V8zyB/T6lK+lrn89x9ohtsCHO0TpeIYDDorW18uK
 EbjbIG04bJ6BaBGWVUsxFTjOdK4e0JDU33JmKM/HvPQ+toHE7kELctW8eiwu+RQ6m7jl
 xudw==
X-Gm-Message-State: AOJu0Yy+od6tF5YAcQ43QqemrstEm6UPCSaos0MYuOIuO8Y73YD1uGhB
 KGJzES6MlsfcZhwpYk8TqkGU9HTbb3cKHpkg1v4juvWcu7+5zyidfQ9+o/af3M0Bhiw64l/y3ki
 8
X-Google-Smtp-Source: AGHT+IFBgZ7EF/gGhRShxOUwEt75vm7upjgrIu6hJ95BnA1x9ivE9obT6nIFtbjkTAd0q0LT6qYGuA==
X-Received: by 2002:a05:6358:6586:b0:17b:c8d:f3a7 with SMTP id
 x6-20020a056358658600b0017b0c8df3a7mr11640586rwh.32.1708980898158; 
 Mon, 26 Feb 2024 12:54:58 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a28-20020a631a1c000000b005dcbb855530sm4369991pga.76.2024.02.26.12.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 12:54:57 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 26 Feb 2024 13:54:45 -0700
Message-ID: <20240226205446.842600-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240226205446.842600-1-adam.duskett@amarulasolutions.com>
References: <20240226205446.842600-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708980898; x=1709585698;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YbH/hS4fjwI8S8c7H9186RMrM7qwO/PAFHQxMPCuU2Y=;
 b=BAzrw5astK+yCEJSoQwQv/vlp4bgWi1CIvOYTs7XTbVJjuaQZoGcWb+CdDotcpStdk
 E2uf7o8j8wfUM058cRqQh+mwj8rVTKo6pNlaJqRazfDnQX6G+tFomEy8Ze2h0C5++Dlm
 wuzkgSk0pwYrbAylApOke7E2TCemzhwm2lyhU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BAzrw5as
Subject: [Buildroot] [PATCH 9/9] package/setools: bump version to 4.4.4
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...1-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch | 2 +-
 package/setools/setools.hash                                    | 2 +-
 package/setools/setools.mk                                      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch b/package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
index 36063a4e13..67c306e99c 100644
--- a/package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
+++ b/package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
@@ -59,7 +59,7 @@ index 5f4e764..a27b781 100755
  import argparse
  import sys
  import logging
-@@ -91,8 +92,8 @@ elif args.booleans is not None:
+@@ -94,8 +95,8 @@ elif args.booleans is not None:
  try:
      p = setools.SELinuxPolicy(args.policy)
      m = setools.PermissionMap(args.map)
diff --git a/package/setools/setools.hash b/package/setools/setools.hash
index 6a61fc2809..bb98231de9 100644
--- a/package/setools/setools.hash
+++ b/package/setools/setools.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  29f5e7d98764a6942b2e32c8aa44da6a618882818c79599ade967ece0cf1dace  setools-4.4.3.tar.gz
+sha256  92afeea2f2433cbb981ff47f6ce4e2485d9202b530842f7f5d95f905b2ddaea4  setools-4.4.4.tar.gz
 sha256  0e58d74751e394f39748c7b7b4039d6a883b5def9711160668ba962b52e69e01  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index efb3869e5b..1ffc2852d2 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SETOOLS_VERSION = 4.4.3
+SETOOLS_VERSION = 4.4.4
 SETOOLS_SITE = $(call github,SELinuxProject,setools,$(SETOOLS_VERSION))
 SETOOLS_DEPENDENCIES = libselinux libsepol python-setuptools host-bison host-flex host-python-cython host-swig
 SETOOLS_INSTALL_STAGING = YES
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
