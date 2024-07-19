Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC06C3DA49
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 03:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A398608F8;
	Fri, 19 Jul 2024 03:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1FwZNzSPRuI3; Fri, 19 Jul 2024 03:05:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6DBC606E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6DBC606E3;
	Fri, 19 Jul 2024 03:05:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA2A81BF33E
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6BE44027E
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tI_FcR_VL-ZV for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 03:05:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D000340279
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D000340279
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D000340279
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 03:05:45 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-398039f8b7bso716545ab.3
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721358344; x=1721963144;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yLJGTikDhLddhcZSO7xcgzvKOk5AsPzj37mwVxrJgrg=;
 b=UFkmjZngFlDI9498KBKHAmz0qZLzsVO0FhOjvg1Z9BlF+kP7Ki/Is1H881rJYROcFE
 geJ/j5j8nBfhI7FHAWT9OW5xbLDMBdpJvLXMkRGHwmwm0bZ5f4NszupxPanwqPPgh6NL
 QuZDtkWx6y8rcml7udEsvTXbWCGl2N1u4oq6RexSJj/fvu5hCHl2mJ8D3KJeZwbFXwYL
 L1dWhTWXB4Yjoq/ZcR57rlvQN21qfLVoEPzuAUawsGj0rsTxBPsoUaGPccn9hUu243Bj
 Afc49T30ieH4ekxIQDvI7w885b+IpvC72LfnJzZzymAk/KI6Tfx1907sl2S1bzldU4aI
 AosQ==
X-Gm-Message-State: AOJu0YxWhtApr4XztexL+bcGsdrHOvoH1RvZs19qL/SjkhDQ7kMQJiHy
 berOv/U7Ru4Fn4s1bTdcHy/dlnrBo+0+iQUnBv9SE+RsIbs/ZsmOXMZwJg==
X-Google-Smtp-Source: AGHT+IHsNyAKtN6T/uqg7GYsVmZ3/fccd6p0GXSxVLvU4awb/pO2U4/bdUPszqEUN+L9826tB7GhlA==
X-Received: by 2002:a05:6e02:1d05:b0:375:9dc2:fbe3 with SMTP id
 e9e14a558f8ab-395574253famr86444115ab.25.1721358344318; 
 Thu, 18 Jul 2024 20:05:44 -0700 (PDT)
Received: from james-x399.localdomain (97-118-239-252.hlrn.qwest.net.
 [97.118.239.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-397f565f1cbsm1548645ab.29.2024.07.18.20.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 20:05:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 21:05:36 -0600
Message-Id: <20240719030537.3156999-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721358344; x=1721963144; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yLJGTikDhLddhcZSO7xcgzvKOk5AsPzj37mwVxrJgrg=;
 b=N8yMIp/SncIRe4xucYUQghCOUvSR37fWPWYQLMVeDJCGCpxgl+sqrEYiUpH/bd1JeA
 W2jkzdUhhovy4m3mgas1rOzJeD2KN6H/ji6SZFKUFrZZqgqntJOIo2VrShW8InoOWWT2
 c34KMqGsn2xSLrzkkKt0JlbgdtpK3HhV7l6dIA/u+RTZPo2eD3FUAgcdqR/2VCsMBm2Y
 ZmD/HvtY59Hr+Dt6soU5GLP7yNWU2gx8YjDK6Yt2Oal4kwLVyFJaNqk7IInqAThLRWfw
 38uNHfCj2kZuADq8HqyLSCKBQsxO5A20WJr2YYNGtomoRJvuflT8BP8nps/em3sNRZQn
 m/hQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N8yMIp/S
Subject: [Buildroot] [PATCH 1/2] package/pkg-golang.mk: allow packages to
 override download GOPROXY
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some packages like the upcoming tailscale package need to set GOPROXY
to get the correct dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-golang.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 8e27602d41..118908a159 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -85,10 +85,12 @@ define $(2)_GEN_GOMOD
 endef
 $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 
+$(2)_DL_GOPROXY ?= direct
+
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY=direct \
+	GOPROXY=$$($(2)_DL_GOPROXY) \
 	$$($(2)_GO_ENV)
 
 # Because we append vendored info, we can't rely on the values being empty
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
