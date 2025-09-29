Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D4ACAC5B0
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 12:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 952EC80996;
	Mon, 29 Sep 2025 12:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIACQ69d6gCD; Mon, 29 Sep 2025 12:50:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A96C8099A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A96C8099A;
	Mon, 29 Sep 2025 12:50:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A8773194
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 12:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A1B140A0B
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 12:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DVzgT6b4mA5 for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 12:50:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E4BE409F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E4BE409F3
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E4BE409F3
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 12:50:04 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b3e44f22f15so187969566b.2
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 05:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759150202; x=1759755002;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n0SBgCsgdtSG+r8kuUq+ZlJbGHmHW9ogBoA7t0X0qVE=;
 b=gijhSSPbRkRy7nTD/pBRh98JLO4E8L/29RmpT4ZQB4h8Th2VNtlpTIiqnkxSkFXq+t
 8JirphsgMrddVhXrHLkPPsRSK8JN49yGVSUexkBvoEz8++AL2Z5iQjJYy7S7i0ig/zZ7
 5DRZlRIaE853XNjylIIT7eq2yoOQsRekVrmmGECgD/e6NJbjmbYZ+WGXx2RWszz31WxF
 H6LPZCe4DHvigg+8nUOVUhPuirCC6caaVRKIEIJkFsOvL8f0GoVVo1EV+q2LldAcfgG6
 3k+kOggc8E4MdhrXW/HIwV9SENMPcdAJo8d9QgKDHiU+njm+T5QsroS7P7btRdQpTsZO
 U5YQ==
X-Gm-Message-State: AOJu0Yw+nIRmJEjEs2QrFb9Fvl3k9rqtmJtCN87t6+ApWsAJRyffF54L
 gMwvcEPpnfao54JC9sHFfL8BXYSluDwV1UGUQdolmxTbeAm/gId/ikF8a8HhIrHqOh6CWNbMhIK
 oFUk3
X-Gm-Gg: ASbGncv/t2B44dT/n9YlTTObWc6zT0Gi9qsWTB7fXv2nLClgAYAA4xB7L9/0Gi3gxE/
 3PLV97aFpAgnQVS/Y5jb/jOlZO2GkMs7uhrlhUHtOUZXjLziyF7qlnRbqIgJbIHe08PZ3+QkaDq
 HAD2oDQy9cepkaWthkdSPN5OUKK/ewREqtG55976yiBD4D7JTAuDJApsKL430eOsad4R14Ai6cw
 ZONBLM/faSgVwk8JHt4rhZxkvQpuNQG5gdETTHBiRg2K/kvlChW2z/L7qFnA4V6SV/nY7w9HALe
 WqksUDbtFwdDmEWPkhwUsiznVzEn6TYhx7fLHJFY6Ux6SuHY5++0JfBksFQMZoo6PRFfXPEP+dS
 DZX2DUCsx/ReBNwWafn2qhoY2d48XW3UMii4Py1/2/jIn9As6EU9mH5TIRtcJJFL/Cw==
X-Google-Smtp-Source: AGHT+IHlboE04qvx2HL59Pt1OgIwDr2U0Yy2HGomxoCCHrb47DxHEjAn65XWONIUXS0e58C7CK+IWg==
X-Received: by 2002:a17:907:86ab:b0:b2e:4504:2cf2 with SMTP id
 a640c23a62f3a-b34bc87627fmr1786044566b.45.1759150202230; 
 Mon, 29 Sep 2025 05:50:02 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([176.201.139.243])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3b0c9c9e8esm451378166b.59.2025.09.29.05.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 05:50:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 29 Sep 2025 14:49:54 +0200
Message-ID: <20250929124955.1295473-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759150202; x=1759755002;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n0SBgCsgdtSG+r8kuUq+ZlJbGHmHW9ogBoA7t0X0qVE=;
 b=lyxQUsGSwhDRCCPcG1OUNU6J4ZcXErYhIfADNYtMnDx2TdIVE36JQNXBLFZYYABrxT
 xPa7TnVfNApEgE3DumepL9wu4dpXLdHD1JCCdmpJkMry5rOxIx2jQCdk+pIJCAMCV1um
 mggVf16uHWwyLGepPJH9iTsM9V4rE+do27AZ8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lyxQUsGS
Subject: [Buildroot] [PATCH 1/2] package/empty: bump to version 0.6.23d
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

Update hash of COPYRIGHT (update in year with
https://sourceforge.net/p/empty/code/ci/bb26b085df1285570c386d2aa9f5e3bf2fb92ec5/)

Release notes:
https://sourceforge.net/p/empty/code/ci/master/tree/CHANGELOG

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/empty/empty.hash | 4 ++--
 package/empty/empty.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/empty/empty.hash b/package/empty/empty.hash
index 5c7daa0052eb..d621aa373ff0 100644
--- a/package/empty/empty.hash
+++ b/package/empty/empty.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8a7ca8c7099dc6d6743ac7eafc0be3b1f8991d2c8f20cf66ce900c7f08e010bd  empty-0.6.23c.tgz
-sha256  6433f4490a82b80ddac37f24cebfe8f3cd7de5686ebb9737281d47997a9941d6  COPYRIGHT
+sha256  9ad495d52b942e3fd858643536d8d12e282568214300954d4518d8c22b893585  empty-0.6.23d.tgz
+sha256  17e9dd2f3e7bd2d00879dbd5dc908f911e57483439c1ff4c9266e20aa491a9ae  COPYRIGHT
diff --git a/package/empty/empty.mk b/package/empty/empty.mk
index 24135b2f8d70..81196e98ab59 100644
--- a/package/empty/empty.mk
+++ b/package/empty/empty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EMPTY_VERSION = 0.6.23c
+EMPTY_VERSION = 0.6.23d
 EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
 EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
 EMPTY_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
