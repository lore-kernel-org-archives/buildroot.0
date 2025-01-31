Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4707CC02190
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 05:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B86883F8A;
	Fri, 31 Jan 2025 05:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7wSnTBNaYs7; Fri, 31 Jan 2025 05:39:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE0DC83F86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE0DC83F86;
	Fri, 31 Jan 2025 05:39:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89BF016E
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 05:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8512D60762
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 05:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZN3Z8pYBvbqf for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 05:39:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ACC5C60740
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACC5C60740
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACC5C60740
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 05:39:12 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2f83a8afcbbso2386737a91.1
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 21:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738301952; x=1738906752;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qgzYLiBW0tvGtTk9B/ls2Ce/sQIma4nYYMxFqspSpGE=;
 b=BHRHXSIyXlxlIaqJmoL+V00UmfyEWstjF9kdrac6bXnP8Y0YaYyGOklS/b8STXMKo4
 M7Sc8MzzrqvyM3hXAyUYlayNyvN0JaSKDoOU8f3ovRo2pfNrFdA8Nkq1+XOMth0e1TjI
 NshcrFlhZcwDHLvonclGuu4Y71ou1V1C+UQOPrliYCj+gQl5Nl8DQpNpRDQ0LKg5sUoe
 dibi2PC62xYEvo1e2DXvI3Gq9GlR5FXal776MQplwhVK0Hc8PN1Oq7dFUXO/eUqckm78
 y/JVkCrlWsB+VTcBoUXCLS3t2PVj3IfKKR9ZIDtQ3jo9Oe6PuLCYqy/UMGMu/PVqDw9H
 j4WA==
X-Gm-Message-State: AOJu0YzVlHSgyqT0ug6ezrrMzrEPdAP1UKBByoiv3Vt4S2wX7CjixRaO
 e3J+f2lRWG7/n9JcYwT0vXMgEK9z/iJBrKIKcrgLG1DIUDINvozFbyzasiaD5e0raHr/DXUG/MR
 4
X-Gm-Gg: ASbGncsd7Ja3RIqXXXN4Df5jmlAVbP0R5td9mSo2UoqDBYsx+hCurGu6G7HfsVNkESU
 MCBbN0deScRuNFvio0DkCFoUO/cSCS/nj0BR5n80/hg1A+eoMRNaAIohRScIqJSc9w8BXlWCZp8
 DUbxt0KkIBscqiigJBcKYtqaw0JvEShJuNS/a76yBKm493gIcY1yZs63KdNoJusKJVZPJfg0mt4
 IfupCkR+VoFZQqg+yXWXe2K8Tj/IYsF6XDYrt9GxGM9PTMQMJkZCxEJXfqg0BtKCEsIWhRaf0E3
 SsVgNydwHLk6qbtKuvFv4rLZmxDuSdFF130Lcx+dYrzYaTcSJCKs0M2oK+bRss4KWY4jidN8iDl
 RDQI=
X-Google-Smtp-Source: AGHT+IFM3uKy3KPwPU9LR4K11J3nuAKJUuN0NPYGTTPTsyYLKfnlRVHJCvXVQTgLoav+cvvo20ARDg==
X-Received: by 2002:a17:90b:288a:b0:2f8:2fe5:f146 with SMTP id
 98e67ed59e1d1-2f994f501b7mr3465877a91.14.1738301951691; 
 Thu, 30 Jan 2025 21:39:11 -0800 (PST)
Received: from localhost.localdomain (c-73-35-224-251.hsd1.wa.comcast.net.
 [73.35.224.251]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f83bb9bf39sm4983458a91.0.2025.01.30.21.39.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Jan 2025 21:39:11 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 30 Jan 2025 21:38:40 -0800
Message-ID: <20250131053840.73757-1-christian@aperture.us>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738301952; x=1738906752; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qgzYLiBW0tvGtTk9B/ls2Ce/sQIma4nYYMxFqspSpGE=;
 b=R5YAJJ+RIXF23Zy2bSamoEdjm2kKoU0dh20C8V57OUfJasTbTc2ef/dyP/50uHlt40
 23KycX26mY0L+Y0SDIK0xVBy4aVXyXq7wjSo/Ig4VVosyN28D9IzUmNNK+5Wg/jgJV71
 RKgjqchDewBKjuKgI7X5xKRC6oeYsRUCNAlorX7kUH0lt2XfbPffUV6VCeXwGfXmhheO
 +p1KuIeY4e2sxYY2B2RiPGfKByTrjqDMgLTdtpW5mz5XOUVDb0/PYvJu++HvNl5mhsLA
 GwX/O5hcxOPbvyfN621roEOGjPRGeWExH74UD+lDiFZr8m8hcY/qQ9hUVZWGGdeh3EEY
 LL/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=R5YAJJ+R
Subject: [Buildroot] [PATCH v1 1/1] package/runc: bump version to v1.2.4
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 Christian Stewart <christian@aperture.us>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/opencontainers/runc/releases/tag/v1.2.4

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 711d7c61a2..d25d8facfd 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  25072beb84f4adae316a968241dc74ac30982d38e4459635074aa9e9d87d3de7  runc-1.2.0-go2.tar.gz
+sha256  9785c144c97974b52b6091b7a79168b73681ff574bc8438b44f3f5f8c112f171  runc-1.2.4-go2.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 94b7b15900..51ac32de26 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.2.0
+RUNC_VERSION = 1.2.4
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
