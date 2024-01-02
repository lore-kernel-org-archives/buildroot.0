Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C18EC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 17:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF7936058C;
	Tue,  2 Jan 2024 17:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF7936058C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9qAIw47W30ha; Tue,  2 Jan 2024 17:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10C5560597;
	Tue,  2 Jan 2024 17:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10C5560597
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E90601BF31F
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 17:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1A186059A
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 17:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1A186059A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5996Lsj0akhL for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 17:46:41 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6F4F6058C
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 17:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6F4F6058C
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d87ecf579so19402945e9.3
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 09:46:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704217598; x=1704822398;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HqJP9GUw12KSM68PtJatyfE3Y/xlZ+ZFe1CDPiGsG+Y=;
 b=CFYKS7tuOJgKHOlmONRDAY+StigXO7HCdDmFdf0xSoVunE7YGbzAjm8BFgtY0OYb7K
 ZvuvPZaSodL9MIbwE1QTlVYjTRGT3G1oGS6sMQAa3IUknClufg65tik2P4UH9M1PrMOO
 HWy+Vqzh7vhVW/GTdECF7Jq3mlNZpD2lDNmRxGeclIAbtocULUTQ3EG6GR6i23swczwF
 DoofsrY8u8p8VjqIFmpd+V6/4YobHDXmd0Y3JNvEdMXGOXU+b/HLgOcl4UTNIYEFNPMy
 ahD5XTs/COWqwEJAX/SQD2VCG3x+wLEeh87tjjGIc4JNiOcXECJE5V2mb9ftQNPIGxnF
 AEzg==
X-Gm-Message-State: AOJu0Yy8FwgsCH5nMLofkBEtAdC+tFn+qmJ1Wq2d2UwuKesLfYUEMR97
 NDCfzifq1uf7zshUaFw2O7i3TlPBj1E=
X-Google-Smtp-Source: AGHT+IFUV0A3RuGceGKqRk9qPnxQMHW+QgAXNCklrLWjgyjZNggtWxpVIAKEloDBaHi0G7DKL3zEiA==
X-Received: by 2002:a05:600c:1caa:b0:40c:2c52:97ec with SMTP id
 k42-20020a05600c1caa00b0040c2c5297ecmr6749301wms.18.1704217597911; 
 Tue, 02 Jan 2024 09:46:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fs7-20020a05600c3f8700b0040d8b4ebd55sm4800584wmb.0.2024.01.02.09.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 09:46:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 18:46:35 +0100
Message-ID: <20240102174635.1012997-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704217598; x=1704822398; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HqJP9GUw12KSM68PtJatyfE3Y/xlZ+ZFe1CDPiGsG+Y=;
 b=bivHh5L6DvMxldS41FWTCavXAA5dY0Gp8OZdwjj+c8SaJVo35Y0IKJaISzoU0U/hOr
 nxYVGorHv6nOWyGBvtnUkfLokel/aRMzXbUh3H2Lr/VLJWQrRCzQvXvc7obAYGJw2DBa
 ljPmMcbSNHaI+7/PfCbehpnD6dsJYAvt2WKABBKwOvwnwI0qIAj3WeMsS3PQgsjDkYco
 76CtjEC/y4ujdFVh/SMJUuR1r3DdHEEdbzjCtyENHeqJpii20zBDB2AxCzV8Cqx18fnJ
 u7HePiz926/+Gt/2sTy7D1uYFQvtPiygSTxpXVwvwSJxccUBpB9VDWD75hPgSFvv4l4I
 WQVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bivHh5L6
Subject: [Buildroot] [PATCH 1/1] package/p11-kit: bump to version 0.25.3
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

https://github.com/p11-glue/p11-kit/blob/0.25.3/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/p11-kit/p11-kit.hash | 2 +-
 package/p11-kit/p11-kit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index e950060c91..81d209b2c2 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  d8be783efd5cd4ae534cee4132338e3f40f182c3205d23b200094ec85faaaef8  p11-kit-0.24.1.tar.xz
+sha256  d8ddce1bb7e898986f9d250ccae7c09ce14d82f1009046d202a0eb1b428b2adc  p11-kit-0.25.3.tar.xz
 # Locally computed
 sha256  2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 868e3a7c9b..8547ee33c2 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.24.1
+P11_KIT_VERSION = 0.25.3
 P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
 P11_KIT_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
