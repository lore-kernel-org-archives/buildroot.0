Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567C9C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 21:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C98881E1A;
	Sun, 24 Mar 2024 21:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKyH2vuRZ5sg; Sun, 24 Mar 2024 21:25:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1571281CDC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1571281CDC;
	Sun, 24 Mar 2024 21:25:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34BBB1BF4E5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D6C081C44
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMTPw9wSX0hQ for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 21:25:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01E3D81400
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01E3D81400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01E3D81400
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 21:25:01 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso2687608a12.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711315500; x=1711920300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zbuJc/s0ontxHL32vOlBau+rUxgoGXR3xRayBsBBkMg=;
 b=BAP7vgmvFRiXxY+l7MzL6d/nJAIZNn6r3WqeN73lAv0VerrykOCB8J4nRqa7hKexoM
 9IAg6snfYSFdt5Lcwq/bSxlqkk0kjZ2+6wBkKppOwY5+nA+fvjt9h+anDtJuvOZIvkIH
 gHRiIeS9ob0uoZwzeQ6/mhw0ykY8hBW4qyxNs2g8MLqh8wPq6JbbB2b/zzhuzy+cSiJ9
 zENrobY6RTbDf862lZjO9Fm2z+hQECQwlCfunItoJxv2uTDSxGleCw276rcJRhbSxirr
 sZgpoDXXKf4SdZ+WhGZtlb8FprJ00gVLsgB3zOgk1SYTlNQBq/ZEShnk5dKHJmyI9vPZ
 C6GQ==
X-Gm-Message-State: AOJu0Yw9tCcsUddJx43XEeIZ/YTPGtqYU9V6y3H1rUdg+aFQOCnvrH+F
 yqR9Gh9rvdvs62SezSbbBC/U2MpjM/2iIuSQW2wzEgB/ogCfd43o9u1vubl2tTmPrq34udA5GqW
 U
X-Google-Smtp-Source: AGHT+IHfxDS7HGb7VHtSa5uxdXUObrZhMJJjDjyERY/nBZeHCcTbm2E4DbUCVvslL/awk/AiCfeIWg==
X-Received: by 2002:a05:6a20:be11:b0:1a3:ab6f:ca83 with SMTP id
 ge17-20020a056a20be1100b001a3ab6fca83mr4849413pzb.46.1711315500124; 
 Sun, 24 Mar 2024 14:25:00 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a17090a658700b0029c3bac0aa8sm8979556pjj.4.2024.03.24.14.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 14:24:59 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 15:24:40 -0600
Message-ID: <20240324212441.526544-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324212441.526544-1-adam.duskett@amarulasolutions.com>
References: <20240324212441.526544-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711315500; x=1711920300;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zbuJc/s0ontxHL32vOlBau+rUxgoGXR3xRayBsBBkMg=;
 b=hg2qU7yWePKbAgMk4gz4wdbUjOi4Wam2A7L+3BzAzue0dzumTs82G33fRlK6Jn4fNQ
 4bocFMr4yz0lFoK9hpy8nGDdBt9wQY3OoGELyjZWj3LmGaRGzo+JVd27Fs9j+XN29Zuo
 dHvYlD8D1JctnSAdvP5lfNlDp1o2cWFl1ef0o=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=hg2qU7yW
Subject: [Buildroot] [PATCH v2 9/9] package/setools: bump version to 4.4.4
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
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
