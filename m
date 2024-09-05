Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86DACD4F59
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 08:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCA954061D;
	Thu,  5 Sep 2024 08:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q58M_SjWAqkR; Thu,  5 Sep 2024 08:57:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88ED4405EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88ED4405EF;
	Thu,  5 Sep 2024 08:57:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4F6E1BF476
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 08:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1BF4404F8
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 08:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoGdX3dXLkrP for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 08:57:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 655134016B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 655134016B
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 655134016B
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 08:57:19 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id
 38308e7fff4ca-2f401c20b48so566971fa.1
 for <buildroot@buildroot.org>; Thu, 05 Sep 2024 01:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725526636; x=1726131436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fSSJuw+9faEkKvM3nbW5Drb1dzyr86XR1JVefEmJlys=;
 b=KyPpS+ZH/wQOQZyxGnmpcFrj+w8mA3IW8j3LQPOuhsNDaBi8AdfrN23dkuynHIHChS
 INrwpLJ0fkLvKEYfGNu97AnS90FMjSjliF4xIIS+YpOAE/jE6RhlzUMiZogOsF2zFTTB
 O11Io/fmRu8oQ4HYn2AhCCcGlOt7ZEMeWGEuKldv8scVpiVdPi+eNXHL0kLiRCGfRTLg
 N2NFVFPkcsE6YgMJkQrEbPAEAPkuWR/0KW17GgGJ5gcYgU2FXhhYwRFkZn/t5zaHFX0S
 ka92nYQKDCloNVVW5qo1THh+afvwgkkefVL1dJVx3m0IUgCsh2L+EEiuADuGkaCqxsCI
 qe0A==
X-Gm-Message-State: AOJu0Yxi3e992AG/TidrtNWaNB598bx8bju7T85tvB4iyTrFztrd7bj4
 aTbwkWM/ntNaQKEPOxqp2D5VMahIS20RGiyYXRlYCQ/7hj0htbXXjm5QfKI/XRUY2S9GGstDtVx
 fUvnd5LAy
X-Google-Smtp-Source: AGHT+IGxV4fGVEaTDm2S4In8BsZ1T4cXeZXPE8O6JanpbmJUxaz7tDOPlZDMbUJXDEoIaIlqte+YwA==
X-Received: by 2002:a05:651c:154b:b0:2f5:4e3:978 with SMTP id
 38308e7fff4ca-2f61e0c6b00mr78581221fa.8.1725526635980; 
 Thu, 05 Sep 2024 01:57:15 -0700 (PDT)
Received: from adam-laptop.arnhem.chello.nl
 (2a02-a210-041f-3480-432d-2b48-7707-30d7.cable.dynamic.v6.ziggo.nl.
 [2a02:a210:41f:3480:432d:2b48:7707:30d7])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc699e68sm941429a12.62.2024.09.05.01.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 01:57:15 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  5 Sep 2024 10:57:11 +0200
Message-ID: <20240905085713.383116-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240905085713.383116-1-adam.duskett@amarulasolutions.com>
References: <20240905085713.383116-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725526636; x=1726131436;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fSSJuw+9faEkKvM3nbW5Drb1dzyr86XR1JVefEmJlys=;
 b=qxTHAFPW6Bj8i0arUoXDmfUP/PKt4CZ1M2OCYTBCuzYN7YSHAeYO6RTSOxsRBqfBPr
 D4ONur3Q54hZjywmYb2QhCWiQ6URUSajRxSDDL5K1TF/Gzwr85rEZ+X0OeC3+n6xHLej
 /a3dkuyWoT11r70QxhBN0tQ3WTTd5TBhptXd4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=qxTHAFPW
Subject: [Buildroot] [PATCH 2/4] package/flutter-sdk-bin: bump version to
 3.24.2
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
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index 4f3622e725..011056c3e6 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d52a5d12f17d8bcf868d1ccc01fe0f7ffb05b53d9628aa21b07a18f9d33621f2  flutter_linux_3.24.0-stable.tar.xz
+sha256  143f77340401e7f147a380ba18112445ed017c1d187fb4d20e40bb6ea1f13aa5  flutter_linux_3.24.2-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 26415551bc..5f94c94ea0 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.24.0
+FLUTTER_SDK_BIN_VERSION = 3.24.2
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
