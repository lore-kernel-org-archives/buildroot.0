Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64F9C83F17
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 20:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D89561482;
	Mon, 14 Jul 2025 20:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id upyB2ClRggfY; Mon, 14 Jul 2025 20:26:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88B57606CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88B57606CA;
	Mon, 14 Jul 2025 20:26:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB3A3DF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1880406A6;
 Mon, 14 Jul 2025 20:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNXF7X8rfYrF; Mon, 14 Jul 2025 20:26:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0325406AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0325406AA
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0325406AA
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:11 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so3556811f8f.2
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752524769; x=1753129569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OTK1RLVspbXNG++NNz1y1WE3GCdsPTaht36Es4A22O4=;
 b=JU05l4I2jLl9I5P/lZpwPUUO8bgEHgVKgajDnx5Mp0k5czS64161HlZVxJMZd3eUXt
 4Ijsz1JcdGkt4XMyrS43ufTrSRnP33iFY1tgO+fjS1lI9lB512MYEul4V6PMfadbGfnr
 huOuh+jlUTMIDf0QSKIZUGiiQDbUDf06G9fupgJ31FURlgy9m01VAtxM56ck7JBFxXVY
 tSmeLF2NQSoRbcZgiXqyzxIXMo2bA0herB3jRwf/YILzPwCLB3+2PdNsiN+SJoEmsj2E
 wE7jBmw83PidRvfpP8D2m2ANQhgc82kCsMJLthNF546v7jM5Eh8YV9pIVRyTC4nxJf6V
 lkeA==
X-Gm-Message-State: AOJu0YyStlOqclbgehXxamV5pbUzUBc61K5vP0jjs12hp68N9rQ4fZhz
 Hagb6SKiQFxBK4vJ9mOZ512XSQtT51VG4gbzyblYG9bxKJYnvOb+WU+uu0qepA==
X-Gm-Gg: ASbGncu4TLGsebncJstlSp37SoCBR2DeSW+7AQuD+zzqU1kda7XtbjG6DFT6IxrEa16
 pnh/bK6UsSB4GtXVZW2zTfxJ/SeCqfIvWlP0an4fB38EU6QFtFZLTznw9fEooyyCSGP6zAIDCwf
 /Jda2S4OD7Msj0kv9KmdeDSpcDCowKG+AUHYx8LZijTWse63pEYU092MROldGb9DQRr39AZBu8q
 S2WAOzbdWqd0r4s1V91mboAFZ+eNOfZuJpVTmFZqeUoJHCplMy/OiCltBSUhDhh9t9EBDX1FLj0
 jE7FDlU1kkQBoYK2lUniQsX7HLO1gbD/4k3TQlqyezPM1fAIKB28Q8B1sHyRHVv6d3gqcxUBQC2
 uCYHs4s1qTGe/mUlpb4bPM3p5z3laWUjk
X-Google-Smtp-Source: AGHT+IHeBKnOdHwk46ywSi1t3U/MAtT83qUSiJMzHut0MezzN9tg9zKNDlgm+1IYEhm+0oHn3nhr1A==
X-Received: by 2002:a05:6000:2a10:b0:3b5:f7a4:3306 with SMTP id
 ffacd0b85a97d-3b5f7a436c7mr5855997f8f.42.1752524769346; 
 Mon, 14 Jul 2025 13:26:09 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc91e3sm13144838f8f.43.2025.07.14.13.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 13:26:08 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon, 14 Jul 2025 22:25:56 +0200
Message-ID: <66c49bfb9672373847031e6d9d0761e75425df6f.1752524763.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752524763.git.yann.morin.1998@free.fr>
References: <cover.1752524763.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752524769; x=1753129569; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OTK1RLVspbXNG++NNz1y1WE3GCdsPTaht36Es4A22O4=;
 b=mAWARHRqosJlE68ymN/aXWn78ff3JhMji5X+OwZVuVRW76nKZMXAufkMe16DF8cVSy
 wfzGsG9O9Xwa+pgRYVmlLxHy6oE4YHeAobIfQhIxEGeCdovSNn0u6gCX2jTFyNpauoGP
 d/YJgjvDXEiFis8rGQ0TGg6MXXlfB3TgGmpi5NBBeBeoYmQSwBulvhpYsVmBwz9hkHVH
 WNPDKVP2Tq902A73aABomVVG34VRQdQh8qqS1bS7dj/d08w4hVqLbEmCfXeC1B5Slci2
 XwGC8QNuNrz/VIYzJ4rI8cKJfY7w4SpYieUPYxW6QZjfGQHiomxhK7cljJjoZO6YHiUe
 d2Lg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mAWARHRq
Subject: [Buildroot] [PATCH 02/13] package/{aardvark-dns,
 netavark}: bump to versions 1.15.x
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the versions of those two packages, that must be updated in
lock-step to minor-level compatible versions.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/aardvark-dns/aardvark-dns.hash | 2 +-
 package/aardvark-dns/aardvark-dns.mk   | 2 +-
 package/netavark/netavark.hash         | 2 +-
 package/netavark/netavark.mk           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
index 227ace529a..cef7f262e5 100644
--- a/package/aardvark-dns/aardvark-dns.hash
+++ b/package/aardvark-dns/aardvark-dns.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f5a75dec1b1a54e5460ecb9e2e27c88bd7f1b8eef3d78da08ec45a8a0d99604b  aardvark-dns-v1.14.0-git4-cargo4.tar.gz
+sha256  d38758c5cf1a732d34c8bcf8f4d3d49d308903206082721c6099daf89fcca87f  aardvark-dns-v1.15.0-git4-cargo4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/aardvark-dns/aardvark-dns.mk b/package/aardvark-dns/aardvark-dns.mk
index a2e74a72bf..1d2e06fd03 100644
--- a/package/aardvark-dns/aardvark-dns.mk
+++ b/package/aardvark-dns/aardvark-dns.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, also update netavark in lockstep
-AARDVARK_DNS_VERSION = v1.14.0
+AARDVARK_DNS_VERSION = v1.15.0
 AARDVARK_DNS_SITE = https://github.com/containers/aardvark-dns
 AARDVARK_DNS_SITE_METHOD = git
 
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
index ba6c942fd9..0f6d3976e6 100644
--- a/package/netavark/netavark.hash
+++ b/package/netavark/netavark.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  00219b98bcee1c25aa2fc7557b25c3f22a12ebbcbe1e83e82fe71f51541b250b  netavark-v1.14.0-git4-cargo4.tar.gz
+sha256  1a530b275d73c937c63d513bfe3f5ac3651b9346fdf98411b16fdcf9e1cd59b0  netavark-v1.15.2-git4-cargo4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/netavark/netavark.mk b/package/netavark/netavark.mk
index 31d0b28b74..4a4038d02f 100644
--- a/package/netavark/netavark.mk
+++ b/package/netavark/netavark.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, also update aardvark-dns in lockstep
-NETAVARK_VERSION = v1.14.0
+NETAVARK_VERSION = v1.15.2
 NETAVARK_SITE = https://github.com/containers/netavark
 NETAVARK_SITE_METHOD = git
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
