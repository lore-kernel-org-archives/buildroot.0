Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CE7C27C53
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 06:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC03C40181;
	Wed,  5 Jun 2024 06:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01XYxuaioCNt; Wed,  5 Jun 2024 06:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F512402E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F512402E4;
	Wed,  5 Jun 2024 06:32:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 938FD1BF5EA
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 06:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8128E84387
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 06:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z489HIDj8A0c for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 06:32:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8539784386
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8539784386
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8539784386
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 06:32:06 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52b919d214cso3876455e87.2
 for <buildroot@buildroot.org>; Tue, 04 Jun 2024 23:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717569124; x=1718173924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xLDgyegAc8CNrtLTv95qw78S8GRqjGtLG+qjD7U1Nhk=;
 b=AO2nPdLCNHHM4csDgrr4ZqWwRcjHvsfWQ+4qhkC2Pp+9gYfKlRt3WdoXIDHFxgWFQv
 pG2LjrWMAqwaE15OsxB6OhN9w2jW+FFRLh/tzKQvw2eh7XvHNEwcJ17Zqo2uJUh8WunK
 +nFFvVTxrzs+UaVGwYughaTwNy/UoeG4yMF93HfbKlSIj4PxkRx4nvNRkBL2sSHjGW0z
 MHnuD5avPdbV9hV3jidfHYscXh/gOG17RPoJLvTJrdqvpMsCZDtOxzH6ahh9agxxa3J3
 cqYvr3xw4sEjGLvjzbPA+OOXOBRFqebxsdS4zWfMWQIf8YB6abtCRPqVvCZDXsrT6pBv
 8W9A==
X-Gm-Message-State: AOJu0Yy5yG3VT8CfeuGq90zIfTvYhfY8bIQ61xskCPp5/qHshEj0Lhzw
 WAiv/v/l6TtjXxMP4WbvSpbVHnyuDzb5viHs3FPiCMJjn3QN7z7EAdwwcnbpjxfF1sB1o7NAKyT
 Y
X-Google-Smtp-Source: AGHT+IGqPvsTYHOy/Sknzr3J0UtpdxAt2R7af5xGsb6vSBbvmVC/KV7fbLL3gB+l0NmAIvGPRsyj8A==
X-Received: by 2002:a05:6512:3457:b0:51e:150e:2c45 with SMTP id
 2adb3069b0e04-52bab4fbda2mr749345e87.63.1717569122227; 
 Tue, 04 Jun 2024 23:32:02 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.12])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158102ab8sm8635295e9.18.2024.06.04.23.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 23:32:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 08:31:58 +0200
Message-ID: <20240605063158.2385945-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1717569124; x=1718173924;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xLDgyegAc8CNrtLTv95qw78S8GRqjGtLG+qjD7U1Nhk=;
 b=Rip/cdOmEfcq2YXo+AYj/ZH3Os1/iKbNIMNpOsTLYbh4npBIO3D4Xg+1DqP/m4lw1Z
 ZBlP1Qf8Fb4g5SArZUyHx+LhKooBG5S67bbPm+U48I4MdSO0MA4EHxVrXlfgqlaf18pK
 jAJtX8tb3HD1+IdAc5Hji3sQnCXCQu3hQl7kw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Rip/cdOm
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.182
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a hot fix for version 1.5.181.

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.182

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 787bf7d48705..9dc286c41ffc 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  5e3bab017cf1b7a6a85d0cd46c0de6660de9b93fb24b0a21d8ecc4fb9f663e2c  uuu_source-uuu_1.5.181.tar.gz
+sha256  723d3da358e6af974a056e3adbcb105fac9dad4b87544de0d22b8c974a8037aa  uuu_source-uuu_1.5.182.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 056b2a8c52db..63556b9938a8 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.181
+UUU_VERSION = 1.5.182
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
