Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A3DCA0EE4
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 19:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4FDE80362;
	Mon, 18 Aug 2025 19:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESrnI15BAfdt; Mon, 18 Aug 2025 19:08:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CD9780367
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CD9780367;
	Mon, 18 Aug 2025 19:08:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58FE5160
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 19:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4132660648
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 19:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRKC8JPFRJ8c for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 19:08:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 301AA600B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 301AA600B5
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 301AA600B5
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 19:08:29 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6188b73bef3so8142311a12.3
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 12:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755544107; x=1756148907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YnRd5SdeE8OgkbEzeaPatDm5cwCpM+X+cEXY7Vadd/w=;
 b=sI1BsGVmitab2+o73y/6gpsCCGXJiM2BWQMebFGLoNySNSRBTbgsOh/jwUysX6yK9o
 9HFt1UnIW2NS+SlbJQ2oOWlgKj2b4A6otZUAEwe4XR3brJpUkj+mv34Zq24tBRvd+MCS
 NaRPwidXLpXmG7fihjItmNMH9QBAb1It3Bkfvx57UDZ6q3veTvXRc2UMSx2+bH9qyS6Y
 1HAWDwPEUesyn66q8qE1kCzA8GQQRtdxQAAej7YrfWgfwcNNxSPYW+QniWPJI0P4ICMh
 GIkkQ788+4mke6a1By/6CADugH4gwrpDKe6i80seZZibFgWMXLRNVnOQ5gOpzWIOViia
 qK+w==
X-Gm-Message-State: AOJu0YwiUcbxMuQi/9bEdK7IHaYXzsc8yGTQdzpTcU42EdJxdzn1zjF0
 0Wp+6guOAErIMJBBAtNZsnX9yB0KSmydv/iBuaP5nhtOyp1x3TgVtyh5REBlSMubBfBGr0UsCrL
 nAZDSb1c=
X-Gm-Gg: ASbGncv457j+dc0EB5hLJOEb5PVdAEPXtVw+lhCrlPhjegstVuWCDnBMRbXuhJEhC41
 Ey1XnlfyaL4tanjGAtswZXni+jwSglkYkIXvPY1Ywh9ipmduFTrR+OPJ106tKmXMHKQCIIgxwqp
 j0flcLg5EJLQ7M1UcR+2ujC14dvgS4DQzfbiruO0jlJuDEIzd1uCtf8Z5sNmMJljCICjuPgywVg
 ZNyMbgKROvd4TYQYE+OaOgtCbbFR4c6Uc91QlGxxwKHM3fR7rwB/WeXILBCDM2i06Qit4UEOhhO
 vauvAbIgkuN/Tvb9hMrKRQwj3gtDEHf7ZyK28CT8/qdujfT7iSnV3IlFJmAZK48r3oohaaH++VT
 z7RkRFR3hVedqNYxhc6EphGtCZBudYmWL14UUC2djsbbkOxs5KOLMRlfZmQmdl/V5QD5EBD0/Ay
 KN
X-Google-Smtp-Source: AGHT+IEGoDRCuDGWm8AceJye6GQzTkdPXxeic0Y1vSGysEOovY3ryI3xdjezsAlPoaQVhOsmqI0HdA==
X-Received: by 2002:a17:906:7956:b0:af9:7c1c:b4ce with SMTP id
 a640c23a62f3a-afceadd74f7mr895517866b.39.1755544106692; 
 Mon, 18 Aug 2025 12:08:26 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 ([2001:871:248:acda:e4e:9572:b348:82ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce53ec1sm853850966b.15.2025.08.18.12.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 12:08:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 18 Aug 2025 21:08:22 +0200
Message-ID: <20250818190822.11759-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755544107; x=1756148907;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YnRd5SdeE8OgkbEzeaPatDm5cwCpM+X+cEXY7Vadd/w=;
 b=RDmQnLsk59b3jqQOm0TPp/rHSSXyxUoX+1UdmAsWLTYx6kFkmZ0ho/+enwF2nTVR/A
 v3aElouVaCzWZiG3WoryInkDZwReQciNSx2gKWafsEioUHJQWp+8LzAE6waHF0RG4bnz
 CK+aXjWB0td8dVinHuivgZV8ziQMUM4jCN4q8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=RDmQnLsk
Subject: [Buildroot] [next] package/uuu: bump to version 1.5.222
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

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.222

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 4ad1783b89ab..75e298e4a33a 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  f604de5aeb687b4523768d998f6cc4a5dd295d227107365d32b5032a82be81e6  uuu_source-uuu_1.5.220.tar.gz
+sha256  50bd2ce7e7fbc5fea38bcd138da46ca84aee3aaf723f674fa8546ce70c070c0f  uuu_source-uuu_1.5.222.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index e88f2715e67f..61f4e82ee36f 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.220
+UUU_VERSION = 1.5.222
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
