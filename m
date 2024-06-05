Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267CBC27C53
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 14:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1C6F61238;
	Wed,  5 Jun 2024 14:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNjcvjJXKT_d; Wed,  5 Jun 2024 14:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7826611A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7826611A9;
	Wed,  5 Jun 2024 14:18:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E11C1BF23C
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 317C06112E
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6t4gtSJFqdM for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 14:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4352461034
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4352461034
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4352461034
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 14:18:21 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-421578c546eso7122945e9.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 07:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717597099; x=1718201899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zIUNVSyg58dJ2UEImd53H1aJD52m+l9UgPKX97lpp1w=;
 b=HqulieFPsicCewC/PHSlLGLQYO0323Vc5RtpmZcdefezUExBX2G2xN069NtTI5qR7B
 7tCZ6feCPNLYLjQ4QpNEnxAdQuhC1cY5sqWmk0eD2dDzY7gMdBHaxRDNlzhXOk1KTcXK
 /685zy/6MlO9VqWILwxxT6BlhiH/owBaNAPCnn3xE6gcIhFr1qxUTki5zlOKqU6cqEQ/
 M/L4LBut1Q4KyCoy4NlAjKQnKfUfSEe5on7PSWujREP3W4Lb9R84Ce64TXhe6zH16VFF
 UdOmplFAZZRz+stuTxQ2Zr6YV99mD4rDTK5HQUPnHdSFlYhu8qIL4XaXXrqlZFUzv4iN
 SohQ==
X-Gm-Message-State: AOJu0YyTDowPuTIgLVLJDlDXW6j/lUnBSb9srRr8jPeM06akeV8u970w
 FNyQWWST/+97LA56xdOfEHqqrB8/ePF1tCHlzta17iX5UbrGk9556ANGcA==
X-Google-Smtp-Source: AGHT+IHLHFKOP+aE3WFAaBKE0IhZivSzeGEek+nA1N7e4IalCenCL/pRholT7KbLkIqWh8hYEXEKJQ==
X-Received: by 2002:a05:600c:1c19:b0:418:29d4:1964 with SMTP id
 5b1f17b1804b1-42156259b99mr22097095e9.0.1717597099133; 
 Wed, 05 Jun 2024 07:18:19 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158149057sm24253925e9.36.2024.06.05.07.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 07:18:18 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 16:18:11 +0200
Message-ID: <8b8291910e0cc5702002473bdeacb3da6d4f06fa.1717597094.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717597094.git.yann.morin.1998@free.fr>
References: <cover.1717597094.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717597099; x=1718201899; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zIUNVSyg58dJ2UEImd53H1aJD52m+l9UgPKX97lpp1w=;
 b=h3R6JAgYAq7nc1z9jdEnRqVVyq98uTRBM1BTMd9AzglP5dLFFU5VIqf76Rx3qF74wJ
 WtAzqnSgv7LYfB/YxRpME45IKfyxpBo5P5X8UdDOhkdWOsQym6TW+QZ2F8bMQ0ukQocD
 hQvQFrsajSRDMh96EKkRptwUwCgdlsBHOFfkVFkU+zYEMAJnNIBGcHNUkKDTF+KTbS8m
 UNtLLqlr4N1ovjgkmeDQu4pQlqy0ozIn3Mb4mY7oNTl5zvbuXTZDWiQOmoYu/qhWQsvZ
 B/rU2A+2Q5T0ivkIYhj+rK/ytugrFr3qIDYLZykdUrWhhYEaOPVf7c0ZwBDy9dgwclum
 oHKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h3R6JAgY
Subject: [Buildroot] [PATCH 3/9] package/flutter-engine: use appropriate TAR
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
