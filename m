Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93904C27C52
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 17:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C66D419DA;
	Wed,  5 Jun 2024 17:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2owK4FXFsx0E; Wed,  5 Jun 2024 17:53:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E776419C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E776419C6;
	Wed,  5 Jun 2024 17:53:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 30E361BF5B3
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DC64610FE
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_IINy23kDzF for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 17:53:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E74461104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E74461104
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E74461104
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 17:53:26 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-35dc1d8867eso52758f8f.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 10:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717610004; x=1718214804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zIUNVSyg58dJ2UEImd53H1aJD52m+l9UgPKX97lpp1w=;
 b=tQC7bm3tvEXQFTt74yvlaYr1MHKZOOymVEfgazX56Q4xsCDg2QGMAxXP4gG8CtWPiN
 uBw749WXFcsaSnpXjj4oqtsxNOdf5DoLcympQ3bp+3srXCmofcz8z15TugzbyysVCrV1
 pLU5QSQcEkIBzAQg2mdh3UGAtKxmZI+0eyhvGBocm3bRaiG6jVSAtYNd9kJxG2hEgALs
 jq1DLe+k9Qp2xB4HPFvkWD03zw9mM1KBT03xRwV+qycBfLYT2WXfhB0L35QumsMBv8Gl
 3aL5ajYavioNQerxuLt7FxRl4PP7FDZn+wYKZJZjMRCPyvYlUsqJvVPqabRxI2q72pJ+
 eo4Q==
X-Gm-Message-State: AOJu0YwZvz90IEZOGaUsbKdcEsx9d4qMZWiI/SJdqMnHcTdW3Ig+ZOOB
 49e0WJnpNf8SvugDEE3I89AuplNN6sJcQ/kt+XsjxagLscx3ipr59k2lrw==
X-Google-Smtp-Source: AGHT+IH+7/sgcl8piq04UXpLW18ZzZ1NyNKiUDBotXUysq1wB9BGKl2greUS4xV3F+2EyB9H+41Vrg==
X-Received: by 2002:a5d:4d0f:0:b0:355:a6:d3d8 with SMTP id
 ffacd0b85a97d-35e98098f91mr2415004f8f.71.1717610003914; 
 Wed, 05 Jun 2024 10:53:23 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04d90a8sm15520821f8f.46.2024.06.05.10.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 10:53:23 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 19:53:16 +0200
Message-ID: <7e8ebad019c026217778280a99c9ade2d9970893.1717609998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717609998.git.yann.morin.1998@free.fr>
References: <cover.1717609998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717610004; x=1718214804; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zIUNVSyg58dJ2UEImd53H1aJD52m+l9UgPKX97lpp1w=;
 b=GXqtQ42tYSY+ElwwPs48bU27HkZCXeajYPiHk0W25BXfUjFs6GuAY3K/R1yCN++Wu3
 eWlag+wnWf1wrfu7MLWE2lWER02Yba4eYEokoC6nor/BYIbEliA8xW462Nnn8/UEgbNZ
 Sr6ws2xMHxBsounWVWVZYlNTSWbSuIwlvnnLi57ktv4J9Uj5yKaiX+lEH54odtGoM+oF
 Kcr65DLLXJOy8O0N6XGlZ4YewfPKiDFTxxA3m6UkBO9e1CeR4CghOxOAqf6+YPHf5QT4
 1f0Z6t++SG1DX+K8yN3ytaMh1zExUheNPlCP6nHqXy0IL5z7M225Gw0bMI9kaH3WF/79
 1dWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GXqtQ42t
Subject: [Buildroot] [PATCH 04/10 v2] package/flutter-engine: use
 appropriate TAR
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-engine/flutter-engine.mk | 1 +
 package/flutter-engine/gen-tarball       | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index d9c2b3dee5..9fb63094ef 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -176,6 +176,7 @@ endif
 
 # Generate a tarball if one does not already exist.
 define FLUTTER_ENGINE_GENERATE_TARBALL
+	TAR=$(TAR) \
 	PATH=$(HOST_DIR)/share/depot_tools:$(BR_PATH) \
 	PYTHONPATH=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR) \
 	PUB_CACHE=$(FLUTTER_SDK_BIN_PUB_CACHE) \
diff --git a/package/flutter-engine/gen-tarball b/package/flutter-engine/gen-tarball
index 2d2117b9be..23b121d1f9 100755
--- a/package/flutter-engine/gen-tarball
+++ b/package/flutter-engine/gen-tarball
@@ -70,7 +70,7 @@ gen_tarball() {
     # - it insists on having a full git repositoy, with .git et al., which means
     #   we can't generate a reproducible archive anyway.
     # So we jsut create a plain tarball.
-    tar -C "${SCRATCH_DIR}"/src -czf "${TARBALL_NAME}" .
+    ${TAR} -C "${SCRATCH_DIR}"/src -czf "${TARBALL_NAME}" .
     mv "${TARBALL_NAME}" "${TARBALL_DL_PATH}"
 }
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
