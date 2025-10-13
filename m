Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E966FCCD187
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 03:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B7E08226B;
	Mon, 13 Oct 2025 03:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKYw7HnWJSP9; Mon, 13 Oct 2025 03:17:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74CD582268
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74CD582268;
	Mon, 13 Oct 2025 03:17:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CF0F12B
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EAAF61136
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1Gr0q-XWh7s for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 03:17:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B0A3361135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0A3361135
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0A3361135
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:11 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-3381f041d7fso5093398a91.0
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760325431; x=1760930231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cTB76CaAO32aF58+pghGXo7eFQmRjRCqd5nILBanogY=;
 b=vPIDy4n0xHbfAZAaG+3NIWUAnIaqc3DW1Ef7QA6XnBCJsDL4I2PtEGkBDX6Ir0SKcL
 x/yojR9QGpPBx9f092sxI/ETttTLPc+TG4r+Tgvz9rz2U+OGcbvuvtHUKctYeLjp3rz5
 pK3CimPp3cwjbZGdkisZv4a+e5BkuoksBzepX84HcdxfZkqwpFPBWAPUXLxxbRRYD7Rq
 5Dxn6TdGcBtFzaOImdsht1SbnPNnejhyEFOGao+fRjg7QSeCtr2uxWfBcs2tuzTaSJCB
 R0Sge4tiaDeRRG16/cgNvLwG2B2rhDJkiqI8mmsHfzHlph9twyTMZ0x19qEn7ocLk+4H
 3OsA==
X-Gm-Message-State: AOJu0Ywox1t0NT6fjThHKNRBqcdStPDEsgglV3ivmrlCMGSijfS1/Vic
 zUMPA6vGSSZJe2E5tFP3QiHNMDCAP7UTuUdPGhvxEnxzr2Rrq3s1UUUJ0WXlEdgx
X-Gm-Gg: ASbGncuQWpOE+8yjvx/slAeDrumQYimGvdEN/uRLOC4CawtZ2p5vgW5DupS0gAkd8G2
 PDdSaSdItVXBCMTsdg4z0nZRAlrcssqSIYBrWnYPzl2hVXyAQKs5Iyfq5JhufyGU35YX1FR1zhw
 dFQ36fEYNfTPTcDeGCPuPo0uJopc6ndavg29jSiOUaKHaGQXE1YsxR8EXaVByyAEzBi2RV1wZcs
 TfYq+iRJr8waDeo2a/TpFY3Z8L7W8AhA0+QVO9B/U7Vg3FgcG9fuka0ktfcizBSkFvLTJm9Y2OI
 KewzO7AP+qrbLjTiQLlXG7Ep+GjitkpQfq+Ny+kHDRnwDD/L4FOcGdYAlCdw4e9mSqHLTfmiywQ
 gAKAgeH9BvbyzJK4OLNo8UGIpQg1GVyrkZFGwI8uZGGo7dXoH37Tcwer6JiqDIb5A+Ku6fTaH94
 tF7YC47oPTPWLOJpgiSgZQfoDog6fn7AbBCEJEVNaihpFKC2Ls8eBIan5291ueraYiY1qUqYTD/
 7RCRQ==
X-Google-Smtp-Source: AGHT+IF3hf77tqyc/ix/dyDsfTLhCyvATLgI3eyAKqydn0m0X3bnDbShGNs19x+j8vDYcV7vyUL7lQ==
X-Received: by 2002:a17:90b:1b01:b0:32e:7277:9a81 with SMTP id
 98e67ed59e1d1-33b51660588mr27354167a91.4.1760325430619; 
 Sun, 12 Oct 2025 20:17:10 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61ac8d7fsm10195647a91.21.2025.10.12.20.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 20:17:10 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:14:50 -0700
Message-Id: <20251013031453.566526-6-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251013031453.566526-1-nemaakhilesh@gmail.com>
References: <20251013031453.566526-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760325431; x=1760930231; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cTB76CaAO32aF58+pghGXo7eFQmRjRCqd5nILBanogY=;
 b=cihYrwGU6GYq2XA6PhJFBibThQ3MK3uH6Nyu/kFpO/xaI3IHBuMiebIuUQyo+dAKSm
 i0Pr39skaCl2jGqxivYwDF71M5FCzQdJ+tDJgyp5EdjDyNrbtR91Sh6DdN2qOGw2BnnG
 prGMkuk8Kv7z/VjTijPh2ajwMxy5lQ7hMqYbYtoPlV7/lGrh89ugWInxUlmwaERnluoA
 75Fl84kZjkTMNP1p/7BVEWKT8o89MJubQJ1MfT6S26fAjg/diYFGXPpne+klLP3RfOiH
 yOcpDAupkUUGnhMi5qXgGs4LuVUG22jE9mtU22Gk+eqKVf21l8y5hGcaq64nRd+PwPOs
 JCkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cihYrwGU
Subject: [Buildroot] [PATCH 6/9] package/qoriq-fm-ucode: bump version to
 lf-6.12.34-2.1.0
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
Cc: Vladimir Oltean <olteanv@gmail.com>, Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

No change.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash | 2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
index fb5fdac9a6..1f6bd01b64 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  12894dd52239e98b00bdd0a4e30b57d7bf6c37becf2a5db4a2e7d0074435d072  qoriq-fm-ucode-lf-6.12.20-2.0.0.tar.gz
+sha256  a3ee2bd375c90de1249ff49e6185874583edd92aa2e2bfb4ccf25b7d8a563205  qoriq-fm-ucode-lf-6.12.34-2.1.0.tar.gz
 sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
index fe71c283ea..3c197346ca 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_FM_UCODE_VERSION = lf-6.12.20-2.0.0
+QORIQ_FM_UCODE_VERSION = lf-6.12.34-2.1.0
 QORIQ_FM_UCODE_SITE = $(call github,nxp-qoriq,qoriq-fm-ucode,$(QORIQ_FM_UCODE_VERSION))
 QORIQ_FM_UCODE_LICENSE = NXP Binary EULA
 QORIQ_FM_UCODE_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
