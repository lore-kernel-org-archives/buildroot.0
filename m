Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DB0CCF9E0
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 08:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF74C61270;
	Mon, 27 Oct 2025 08:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DIJ5GYjqRO7J; Mon, 27 Oct 2025 08:21:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E99B961271
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E99B961271;
	Mon, 27 Oct 2025 08:21:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4301143F
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 08:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 404B483F83
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 08:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VnblDfkJMh96 for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 08:21:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D65C83F79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D65C83F79
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D65C83F79
 for <buildroot@busybox.net>; Mon, 27 Oct 2025 08:21:26 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b6d70df0851so581309266b.1
 for <buildroot@busybox.net>; Mon, 27 Oct 2025 01:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761553284; x=1762158084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=enNoyxJoXAQ8EelGKeBarFY/3tKdcyjj4WKiuagRAXQ=;
 b=KvlgDtcsJu2N/t8Pouj0gepG9KsBx308sVIiORqg8XSfCjjcZ4LJ2oYV2txoHUMnzw
 cxts5gPU03iRi0ykTSHtDSf7T5zElL9uoOCx8d+t2H7exRpzQUC3axNPFySAGWBM90CY
 Elru9uvKqpSKLjUOumHQby/ExYwsjIcqty00aqVozM6njc9M1EhYzrs/AMKezIN4vZcn
 hQgrZP++f9eD7bL2H2B0Lqynzxmp1qbt7Io9c2o7GKC9ovQf34Y38qG0g9AXTdnMJlul
 V/7Yx/NZlKrxFdY9X9dfKiyebFWs9PFCKpvyu5FGfG8kdDADxRzZGMUTQdG7D7Iq4480
 3LcQ==
X-Gm-Message-State: AOJu0Yx0eMlLni10Z+NXAmbSAoHEcpLuqGqg3GeV/xUmkeCSUgrs+oip
 KZF8rnFNRrCTYUXUYo/Sm429y18qEuSrMFqzcU73wvvZ7RE2y8p6MVyKfwM0DAkkx5VF/hiSvJC
 3g1nHiQ==
X-Gm-Gg: ASbGncvg/3mQIHMO22QIH9OWJT4F1EoX3wuDWEsCYOh5NlmImNwBngbvRCZTbwBJGv8
 3G1c0dMZhOCmG8yHtVswTszvH8eXMolqEUfXHEbL6FrFwacgH14ugJdHlNxYCHCATutaZgxu3ZT
 XyWQ6BYtmUGnN+RuH7HXQJE8Wv90+VLbT3zfZ74sjvbQ5p+ZKRXmZqwiw/47rxqtzpcvmm74rcR
 J3r9fSzpTbj5lM+kMK/jX32SKq18yE+JvnCuw0/LZR8QQtQLNxYzLWkAxFmpJERm1fxh+TgICbq
 fFACD87y5Dk/7AEWE43Jtap+Lr7ii8Y3hFCDhBghFUHv3fqTrI43BwcC9sPZ3fnENgTwhqilV87
 vC1sTgZHQJj6eMCwYuYIXjAVM8exBQQCPamhZghNLCXyrOyT6JLq2/B/3IGdPZIVpE5UbzTPdvK
 suacsWkgSwmKFM5DYibe7O5pkeNrkkHhk6sw==
X-Google-Smtp-Source: AGHT+IHcEzYIuQdZVvNyYrGgIEk9yWaLNdVM/c732KtU6C3mIVllvW8/Nn2VD/x9c9+M/5QtiMd8Pw==
X-Received: by 2002:a17:907:6ea9:b0:b6d:606e:db5a with SMTP id
 a640c23a62f3a-b6d606ee2c2mr1452371366b.34.1761553283731; 
 Mon, 27 Oct 2025 01:21:23 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6da1e2226fsm296961766b.20.2025.10.27.01.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 01:21:23 -0700 (PDT)
To: buildroot@busybox.net
Date: Mon, 27 Oct 2025 09:21:17 +0100
Message-ID: <20251027082118.329639-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1761553284; x=1762158084; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=enNoyxJoXAQ8EelGKeBarFY/3tKdcyjj4WKiuagRAXQ=;
 b=Mras9wwJqVXGyE8VJ6pLVYD/JdJMmq9ZSOGkzIf28WGMaWkuOoAFSxXpe/ThCWLv4H
 ijXQ32YJBjCU8zxbr6n57JCq8gL/SxsybFV+m7CKzCZkPBpfKfnm4EDhwtTk//yQm381
 PxrJ3ueNr9yuQjjIqA0Owp2H7HPMI2r9ro0UjORR6cn5DunNollFnQxBGZuZMYfawDKP
 ctCavVZ9otHvgJ92bsy+/XNinOlEJbUle3gTqh+UQYcZphKFMVAbt5+1kOVAcVt4C7JV
 laemzPfNujHqT6oivq5Eap+p5VzoUh2F0hslfoK/LMcLmLT6YZ8Yeb1WchiwKYVox90c
 TRvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=Mras9wwJ
Subject: [Buildroot] [PATCH] package/lynis: bump to version 3.1.6
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lynis/lynis.hash | 2 +-
 package/lynis/lynis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lynis/lynis.hash b/package/lynis/lynis.hash
index 3e387e2c0..a8b1d87a0 100644
--- a/package/lynis/lynis.hash
+++ b/package/lynis/lynis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  02e16e452a926b6dbae5bfc28b0592d42c8af24c572180f444ac865e0e4f4bce  lynis-3.1.5.tar.gz
+sha256  2a31e3e028d6b9f0e8f502402ad6752b069f9082893514c8c023962f5786b3b6  lynis-3.1.6.tar.gz
 sha256  57151f0fa287550534af08facb1c6693ca803ffa65b512da38b55c3130810bcf  LICENSE
diff --git a/package/lynis/lynis.mk b/package/lynis/lynis.mk
index d6b3371e6..d63018273 100644
--- a/package/lynis/lynis.mk
+++ b/package/lynis/lynis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LYNIS_VERSION = 3.1.5
+LYNIS_VERSION = 3.1.6
 LYNIS_SITE = $(call github,CISOfy,lynis,$(LYNIS_VERSION))
 LYNIS_LICENSE = GPL-3.0
 LYNIS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
