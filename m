Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B048C4707B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 00:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 158D1404E8;
	Fri, 12 Jan 2024 00:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 158D1404E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eusnSudrjXhK; Fri, 12 Jan 2024 00:57:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A138402E0;
	Fri, 12 Jan 2024 00:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A138402E0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BF611BF97F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0517F84442
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0517F84442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7NjHMkjvOT3q for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 00:57:28 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34F368443F
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 00:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34F368443F
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6d9a795cffbso4451898b3a.0
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 16:57:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705021047; x=1705625847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ltLQ1sRzG6Jmrio8JOnRBrb2jEqh5ICp68FXNccVbKg=;
 b=Q/rhB8fNOLArg/yXtS14pT6uT2tB6jWsMcI5rbJDvzCf11xTF8QSjulQeXirMJWpsC
 sL6dH4uIpcg2J4B+G+v/J7PJA138uDO6+kw2ezM8ei0rPp0SbweCbX1xyI/JarpOG6sb
 Gbh3la1+37A2eiQoR9rdxSew+9mRmAEchAx8Whwu6CNHME+F7HSwQRBeXcjiLseL7XFq
 Vpvijir/Y95MCbxbQrCwbjXfFM/M95GpkfuK/nI2fr8CGxw2SwXbP080yah8e9qJIk5j
 Z6JOphYnbdOAp+u6nWqGrNnNc98IZyPw6h4IBLAHVzU+9TEAti9ms0DlSiH18RISqGAQ
 6G9g==
X-Gm-Message-State: AOJu0YyyOBJT0j5dw9mIvoUXiED70A5q+lFrFFUnJwLP089EigyZXkBT
 +6FkzPg3bONcv72wzRzsL2iZp9xX+/TuqwfLqY2/Ro/1yXU=
X-Google-Smtp-Source: AGHT+IF+OiJlT0wFs9/xdy+4SrnDWbFTeuqduSA7WZCLZ8qtN14NY48/eekng1+K8/aiJADz7ZPCeg==
X-Received: by 2002:a05:6a00:890:b0:6d9:ad3d:7d8 with SMTP id
 q16-20020a056a00089000b006d9ad3d07d8mr257519pfj.19.1705021046719; 
 Thu, 11 Jan 2024 16:57:26 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y187-20020a62cec4000000b006dab86e675esm1917733pfg.185.2024.01.11.16.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 16:57:25 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 17:57:11 -0700
Message-ID: <20240112005719.1082305-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
References: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705021047; x=1705625847;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ltLQ1sRzG6Jmrio8JOnRBrb2jEqh5ICp68FXNccVbKg=;
 b=nIaPUgvd6VG/VKBVRZIOP7PcobtQjY2hygBpglb69g2e+tU5T5Uu3xItacvGTWfA7i
 syzl/ATpkUIyf1/whdGCxMHjLUCvIRJ2B1394lzJOjJOimZbrPk+M4f36ev1W5/wk5e5
 JfW768UFIjOeU81/0Q22QLxN68FmJffFfKyBM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nIaPUgvd
Subject: [Buildroot] [PATCH 02/10] package/depot-tools: bump version to
 8d14454ba4a35fd9d2483842b08815a2357ec86f
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
 package/depot-tools/depot-tools.hash | 2 +-
 package/depot-tools/depot-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
index 2109096901..70218e4658 100644
--- a/package/depot-tools/depot-tools.hash
+++ b/package/depot-tools/depot-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8e0bccdd6b1231f58d5453dc14a5e1d195295ac8d466dec34961e951e946b50b  depot-tools-4e87f5bfe244e903f712408ea68dc3c3a6fe2d00-br1.tar.gz
+sha256  5da23d7558975093c6a732f5743c7f224d16dd3f878a6a1b577b1b127a4098cc  depot-tools-8d14454ba4a35fd9d2483842b08815a2357ec86f-br1.tar.gz
 sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
index e3b840f29a..634258ffbb 100644
--- a/package/depot-tools/depot-tools.mk
+++ b/package/depot-tools/depot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEPOT_TOOLS_VERSION = 4e87f5bfe244e903f712408ea68dc3c3a6fe2d00
+DEPOT_TOOLS_VERSION = 8d14454ba4a35fd9d2483842b08815a2357ec86f
 DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
 DEPOT_TOOLS_SITE_METHOD = git
 DEPOT_TOOLS_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
