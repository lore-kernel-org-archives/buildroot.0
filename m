Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965B9C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 20:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 500D460790;
	Tue, 23 Jul 2024 20:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_lvGw79Xumo; Tue, 23 Jul 2024 20:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61683606AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61683606AA;
	Tue, 23 Jul 2024 20:53:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5EAC1BF27E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F19E4035C
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYq3F7Ra8rOm for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 20:53:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B37B405AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B37B405AB
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B37B405AB
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 20:53:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-368f92df172so2836865f8f.2
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 13:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721767990; x=1722372790;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zFaJlm3Yg2OFC+Kx0BuM45pFHG/inKSufD45mxX331s=;
 b=QceWT34VwUfTj4bVbyFH0S8U3j++ozSuEQ/vyb2h3wfX3tx1rIldQ71ZhAJbBUOcqU
 3VQgHYEaHSsdPDHifmEH0SDoaTKd4/rgrcerdQLQkQmwWSh8uBtSCqS4Sprdz5A2Stoc
 CCqNz41reQAwSX+CBhkD0ugUVnHgfI/pJSrokf1EeKwr2MsEnfVNAtWdWeb4XvBCiP1o
 H5UjumGY1bKDxkFPr7XtajWAoLM1ZcGdoAa6vl0d4AIQIgA9znwkRBWBA49OLODdYH2a
 3XZbdN4z7YkJwAQZ6rvglim24NYvFgOwysnYpMPBUB1nZIrdzfHMVOavRXbeatECjtNj
 Eh/g==
X-Gm-Message-State: AOJu0YxvT1KvLPBbEiiqlZ/2jhxRuvXA1qqyC7SNXjwHUtY7nN3qcyZO
 GwbxkQUnQGxeVkygBOdDTDbLTypVHTt7f+9qIHyu835e6T7cJTot8y26rA==
X-Google-Smtp-Source: AGHT+IEDNrco+952096M8Qb1CmKj4kk0BmuNtRO7weE3AOym97xu8RvzcddEWlwSI5YvaTXitlSu9Q==
X-Received: by 2002:adf:f042:0:b0:368:71fa:7532 with SMTP id
 ffacd0b85a97d-369f5b34ef7mr56057f8f.31.1721767989631; 
 Tue, 23 Jul 2024 13:53:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787cedcdsm12431784f8f.83.2024.07.23.13.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 13:53:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 22:53:06 +0200
Message-ID: <20240723205306.672381-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721767990; x=1722372790; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zFaJlm3Yg2OFC+Kx0BuM45pFHG/inKSufD45mxX331s=;
 b=fBrk3q76Dtcb0g+fORQgqyuymtZQdOXoBYbqyYc3nSzAtypZVII4P4iuEaUVD45eso
 4kVEbjk2/WF1hRL6cIHAG5JrZotF+lkk3d7t+wLYbLCQTCqr4KqW5UICnf6GaOJmUCiO
 PQQr284sB4w5V7yHBeDpC84ZwqYVnakSOcagMHeRRnfnq6Xt/Yfw+X/p2lBvemGK6h5F
 tp94yhWmJdyl0wKoRvlX9Yt61Ezk0Do7qYvWNttX4c+trNsSw4Y8NThYXk/1xrMBjfPR
 wrhKyl42T02mjcDSHbnxEQ/fAcMM1iiQK8CC5sbeN4xHUGuNWyhFX0cKjhUrvVUNwv4S
 9MMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fBrk3q76
Subject: [Buildroot] [PATCH v2,1/1] package/speex: ARM5E needs ARM mode
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a dependency on ARM mode for ARM5E to fix the following build
failure on Cortex-M3 which only supports Thumb2 mode:

/tmp/ccJHSu7y.s:158: Error: selected processor does not support `smulbb r1,r6,lr' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/1575da3a8ea2bcde7fa9885df317a12d5c36918f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Fix commit message (replacing arm926ej-s by Cortex-M3)

 package/speex/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/speex/Config.in b/package/speex/Config.in
index c4e3df5dcd..134e6e4b35 100644
--- a/package/speex/Config.in
+++ b/package/speex/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_SPEEX_ARM4
 config BR2_PACKAGE_SPEEX_ARM5E
 	bool
 	default y
-	depends on BR2_arm && !BR2_PACKAGE_SPEEX_ARM4
+	depends on BR2_arm && BR2_ARM_CPU_HAS_ARM && \
+		!BR2_PACKAGE_SPEEX_ARM4
 
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
