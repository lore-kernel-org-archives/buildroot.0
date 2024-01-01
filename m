Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79502C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 22:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E61D400EF;
	Mon,  1 Jan 2024 22:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E61D400EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gqmq9QsiOY55; Mon,  1 Jan 2024 22:02:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17E204090D;
	Mon,  1 Jan 2024 22:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17E204090D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9616B1BF3ED
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67EFF41DEC
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67EFF41DEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sfZsExZWe9uP for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 22:02:18 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CB9741DE9
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 22:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CB9741DE9
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d3352b525so100125165e9.1
 for <buildroot@buildroot.org>; Mon, 01 Jan 2024 14:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704146535; x=1704751335;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OAomARFzoquO6bXab7OYQXYXDFPCruNzp+OkgIIDpNY=;
 b=Pd3UggH75TK6DnLf/Wh9J3eFSLSjh8vtDZDKs4mVuFgCFYxlibuZBpT5i2wL1vBtel
 VikdYKRJK7EkFiBfPQfp2YDl0tfiQxHfDa3JYb3Bf3Jp8y3Z1eQxxElb/eeEFyC9gTOr
 pnYl0lNCPA++ZaoHZGhEnU6z95gvAE1gqDpDprqZhLSblQ1eU0lTR2Ie4BVP0Cy7+cTp
 W2XrE5k3SXkHHSbWdcIdyxMcIDqEFh2Zn5aw4/9g/nl8JZoQpVrvfnHeROZhlHZkLnPP
 kQuBns1LdD8eBrnWKYaSryiLaX7YfuKX8EbHtnzs8BjaMhTG4lNjBvRF0fTR98A/LUtZ
 Idiw==
X-Gm-Message-State: AOJu0Yzmk8k+g4qR5G/HjYown2qL43h8P5CfEVAAfnTUo7G+xgFN2Hqa
 4gSMTh0Q0fquypVBHGYFDh3TlvHrMOg=
X-Google-Smtp-Source: AGHT+IGxSFaiMh6fKFUyc9cBKIXJHiZdx5NTAywyjiDDuNmbWxSgHItIZs4i36ynF3KivulPZsX1bA==
X-Received: by 2002:a05:600c:1c93:b0:40d:3571:cc13 with SMTP id
 k19-20020a05600c1c9300b0040d3571cc13mr9861020wms.9.1704146535477; 
 Mon, 01 Jan 2024 14:02:15 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l17-20020a05600c4f1100b0040d85a1fad9sm7823794wmq.46.2024.01.01.14.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 14:02:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jan 2024 23:02:13 +0100
Message-ID: <20240101220213.6175-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704146535; x=1704751335; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OAomARFzoquO6bXab7OYQXYXDFPCruNzp+OkgIIDpNY=;
 b=JaSFXkg8W3BBUkQQwTyApZbHDTlld2zbDNuQ1f5ocrCfu8NSbm155VfD15r4s34uub
 24r2ylbEoO9g9+FjkrSZjXpxITcM8uH3Ap2vliqbV4vp5U2xOTvd+jXaRi+E8j1NqEsg
 zn0z+UJ4iG3yj7Q2IbmdvfKe4YIwaolWeQFp+Z22sKiCyEW9Y4WkuDtKrO0C+dyGFTyd
 damTRYYHs0EEhNC1SPOFvrfC0vdbcHt9+xkCEdktgQaZ0i5BPjAYlu5IL7N8JvQxwFk2
 TClZNKdWnav4bl26paKGYIxM9Orv2QXvakmOTBQghDWW1P8HxK9zWB4+ez04H2POSmM4
 AjlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JaSFXkg8
Subject: [Buildroot] [PATCH 1/1] package/tinyssh: security bump to version
 20240101
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
Cc: Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- License changed from public domain to CC0:
  https://github.com/janmojzis/tinyssh/commit/39dfb96613660d67ced44cc3995a08797e6c999a
- Mitigates CVE-2023-48795:
  https://github.com/advisories/GHSA-45x7-px36-x8w8

https://github.com/janmojzis/tinyssh/releases/tag/20230101
https://github.com/janmojzis/tinyssh/releases/tag/20240101

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tinyssh/tinyssh.hash | 4 ++--
 package/tinyssh/tinyssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tinyssh/tinyssh.hash b/package/tinyssh/tinyssh.hash
index 462ffb9002..bdb1504234 100644
--- a/package/tinyssh/tinyssh.hash
+++ b/package/tinyssh/tinyssh.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  234656fc8d369608eb5d0f3a26280e0e38e2e6b134cfc610b6e24bce176acd4f  tinyssh-20220801.tar.gz
-sha256  b5dc19477e29f4111e1c16cd89ec0782f5a07b1a30e3bdb7c155425b81b12c46  LICENCE
+sha256  d2cd49d0e5e8bdb808d86f07f946a0cfbf2dc9a449a4b8243a82be267d852b62  tinyssh-20240101.tar.gz
+sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENCE
diff --git a/package/tinyssh/tinyssh.mk b/package/tinyssh/tinyssh.mk
index 1472f7ead1..80b6ccb850 100644
--- a/package/tinyssh/tinyssh.mk
+++ b/package/tinyssh/tinyssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TINYSSH_VERSION = 20220801
+TINYSSH_VERSION = 20240101
 TINYSSH_SITE = $(call github,janmojzis,tinyssh,$(TINYSSH_VERSION))
-TINYSSH_LICENSE = Public Domain, CC0-1.0
+TINYSSH_LICENSE = CC0-1.0
 TINYSSH_LICENSE_FILES = LICENCE
 
 define TINYSSH_BUILD_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
