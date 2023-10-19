Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BCACDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 17:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7745783EA2;
	Thu, 19 Oct 2023 17:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7745783EA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2wm3m77hJ1zb; Thu, 19 Oct 2023 17:27:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9A9E83F1A;
	Thu, 19 Oct 2023 17:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9A9E83F1A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3ADB1BF368
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 17:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CB9B83EA2
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 17:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CB9B83EA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6YrO8tPSx6X9 for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 17:27:30 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19A8E83EE6
 for <buildroot@busybox.net>; Thu, 19 Oct 2023 17:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19A8E83EE6
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9be1ee3dc86so946453566b.1
 for <buildroot@busybox.net>; Thu, 19 Oct 2023 10:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697736448; x=1698341248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sTVJnKe7yz7Ro/R6zoFGovbhzMq1il7twvcUHXVwino=;
 b=AkKwsnBxlSHbNTlQM/wMu/dUYSJy/1eXDfVfCGaLAniVz1qCXqMLUq3uH9xS7r4ZxW
 55Vkp2+/e8KySAvQpkw+Dw3iMJsiACr4t3Aq2zPRdta9ZtgYNddGmTEmeEeBrDOc1mFt
 snQ2AVOMcy5cwU/C/dwkeT3pJs6p0a86flGP5hcBo99Rfa5pkqqHAPWu3iWIMvKASCf2
 dvMyIopImkVZPEuDFbrEF8/rbAxZHROMHhcSUtvwQ50fqOsYAIrrznpu/kWLL9PA/eF5
 X6NwBk/QgrVolAMYVj1upAjecmJBMPDngk6KEiENfbvFbPkubqIAp/04WEVVDtuexeLj
 zXAw==
X-Gm-Message-State: AOJu0YyH5YHqUy5ylCV+NUqKhL3+KMm/b/zzrxQ7O73QSyu//4Wmy4fJ
 HhHSlT6Kou8oDTePvg7LRu4Wo1enlQ4=
X-Google-Smtp-Source: AGHT+IGPlKi62Bo9PNeSSj9V4OQpJnVe7lTNjcJnSsh8DZ6Vr8apl2HmX4eN4NwgJ4CasA8V0zcrew==
X-Received: by 2002:a17:907:9705:b0:9c4:b8c9:1bf4 with SMTP id
 jg5-20020a170907970500b009c4b8c91bf4mr1946441ejc.19.1697736448203; 
 Thu, 19 Oct 2023 10:27:28 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 og22-20020a1709071dd600b0099290e2c163sm3811204ejc.204.2023.10.19.10.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 10:27:27 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu, 19 Oct 2023 19:27:25 +0200
Message-Id: <20231019172725.40857-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697736448; x=1698341248; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sTVJnKe7yz7Ro/R6zoFGovbhzMq1il7twvcUHXVwino=;
 b=MHtMmD3H0Uew7ynaWNysgv6Ztd1/5zPdqU4X2UmV0BYlkiUE1luNdtcnNcZKPOUFma
 QOXmbVT+9QAhjgmwUyR1NvAbmPVF3pyF4DEgufOI+x3CZv0ITbmYoWTNoFq7uGHgqJUp
 A1ULjDrPsLzCH0m9jRINhwFkZnG2PCsU8VzpgS+BHAePNz6AEvKH/sRq0MwrhzVkwrqF
 0t4zHh6QI9/R8hesABIZrZCDhAIrtz0CPojRMXMBX/JY3QSECS0ORsz7nnYxeE8SSlkY
 OZrezpG1ZRIZMBQ+6CB205+4mookgCdWi5KiajU+Pnt5LYuY0T1c92vPCQoKObL71hUw
 E8Vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MHtMmD3H
Subject: [Buildroot] [PATCH] package/moarvm: bump to version 2023.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 7d113694f..f988f9b15 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  143f92510eaa3452c712e4aae9f44d84cd078f16517b40252bab7dd5e224ecdb  MoarVM-2023.06.tar.gz
+sha256  aa79d77896c312ba23e01074a53ef3d060becae2ed70b066f902f332da65a499  MoarVM-2023.10.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 8f568f4b4..dc833181a 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2023.06
+MOARVM_VERSION = 2023.10
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
