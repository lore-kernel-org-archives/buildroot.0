Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124DEC83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 695BE41942;
	Thu, 29 Aug 2024 14:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezKeWvkOKtP2; Thu, 29 Aug 2024 14:51:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FA8A41A19
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FA8A41A19;
	Thu, 29 Aug 2024 14:51:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22C371BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D933606A8
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i67u4X07ULQm for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 552EB6069B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 552EB6069B
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 552EB6069B
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-371a92d8c90so466630f8f.3
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943046; x=1725547846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MhAnK3uvofk++sjtOXIVqa4HcvgcaqXNWOt8fBSycyg=;
 b=pM/BE+Rhg2H7XQ5T771dg6bXkATRhM/EXJ13cS4vyulS37kpzm0yMB8Pt8yKjdU8Bn
 1LkgWODzINv19LH/ug9MIKrU8W0ThwKv45DyGukwrPV9BrtQdqmQVR7B7WXXhRqE/oTq
 mlGZ84fE+i6kBH24ZYWlQ2Oplxxa1WAVcTDP9xfyyHsXyoxZEGfTG3fe07rWLeWyXOLh
 okIB1qVtBrOGzwmRK6d6NND1HoeNy2Coi4qbuAuV2v3NXurX+vYCO6TnlLq7FWt510e/
 em6SqxNDBfbsiOpi0sTg4VVRd9MKEuJpDyYIAO6C/1t08p7Sxp9S0P9qZni3CH/LtMFA
 DRuA==
X-Gm-Message-State: AOJu0YzBlPfBhxR/I2xct5t3R05O44mLEinD5gz3u4U1jpUGtcuHXbGA
 AfV5Ko4YcZBk3PUP3Z66IK8IrPJ5/gysbCQWGB6U1EG4nWeKT26grfb90g==
X-Google-Smtp-Source: AGHT+IGVfxFzOshj/1eyDZvkuCKfre9tuNHBxdUb/GXF/SsWjaKkBaGi8Hy2Nku0WoeqzJU1ObrCZQ==
X-Received: by 2002:adf:f681:0:b0:365:980c:d281 with SMTP id
 ffacd0b85a97d-3749b5807acmr2083745f8f.45.1724943045749; 
 Thu, 29 Aug 2024 07:50:45 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:45 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:33 +0200
Message-Id: <20240829144940.209964-18-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943046; x=1725547846; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MhAnK3uvofk++sjtOXIVqa4HcvgcaqXNWOt8fBSycyg=;
 b=T62eoam4p6zQ5Pyywh3A2UNiiKgAyrjzwLfkzcnBEVeo0YjzqWpFqKAIoiMGSXI7ZP
 9Gt7jDNQB3k6ThTcW2iqpqDax37JuKofFFfIL6Ro7LCja6CH7rWD9GUmGQ+0kCvNvWHt
 3t7y2T4M6oQYY/GLVtAuZPTvsJIpj6wfIrPkj7JSYZ5IsMjQrx8KVieJwfH8ElZK1srO
 KdkJM/2PAVzDZ9xmx6uJSi57OXdNE+8aDL+WnkeNQq8Ws5TRRXP3hqf9Zjk0ACRFtz79
 ctKHO2Oseqr+kph4yBoTKqHDEns+OGXbXk/orMrP9iYaPTKDy3a71ujY7cSLuygNQf5i
 JRCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=T62eoam4
Subject: [Buildroot] [PATCH v2 17/23] package/erlang-p1-mqtree: bump version
 to 1.0.17
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-mqtree/erlang-p1-mqtree.hash | 2 +-
 package/erlang-p1-mqtree/erlang-p1-mqtree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-mqtree/erlang-p1-mqtree.hash b/package/erlang-p1-mqtree/erlang-p1-mqtree.hash
index 4ce3295ed3..ff92cd42b2 100644
--- a/package/erlang-p1-mqtree/erlang-p1-mqtree.hash
+++ b/package/erlang-p1-mqtree/erlang-p1-mqtree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8d6b2d780d3d6e23a2d205406b30bf96c722f6c8b336a83182d5455e665ae866  erlang-p1-mqtree-1.0.15.tar.gz
+sha256  a2b7a000efdc2f4a55b84b5b6cdde000c905856a05fdbd9911275fb9207f7a5b  erlang-p1-mqtree-1.0.17.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/erlang-p1-mqtree/erlang-p1-mqtree.mk b/package/erlang-p1-mqtree/erlang-p1-mqtree.mk
index d606f737aa..96b607f88d 100644
--- a/package/erlang-p1-mqtree/erlang-p1-mqtree.mk
+++ b/package/erlang-p1-mqtree/erlang-p1-mqtree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_MQTREE_VERSION = 1.0.15
+ERLANG_P1_MQTREE_VERSION = 1.0.17
 ERLANG_P1_MQTREE_SITE = $(call github,processone,mqtree,$(ERLANG_P1_MQTREE_VERSION))
 ERLANG_P1_MQTREE_LICENSE = Apache-2.0
 ERLANG_P1_MQTREE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
