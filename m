Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E215CC5B543
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 22:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FF5480EA5;
	Sat,  7 Jun 2025 22:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXt5nBjXt26m; Sat,  7 Jun 2025 22:29:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB53A81210
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB53A81210;
	Sat,  7 Jun 2025 22:28:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BEB81A4
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 22:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 020AC40A0A
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 22:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtMnxtNuZ5NH for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 22:28:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F090E409A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F090E409A3
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F090E409A3
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 22:28:56 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-b2c2c762a89so2161544a12.0
 for <buildroot@buildroot.org>; Sat, 07 Jun 2025 15:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749335336; x=1749940136;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=35oe3dHRDhj/WaTq37pZn2f+6xVcyMrZut/WxkgLIQU=;
 b=M14Y9nVl0PwP/eRH49inf5DpCnz3IQ4Y1ZWGieXkq+xuvhBYWPeU7z458N1ANq7PTK
 sTzKpoNiscohNP3FAhh9UwLr0LKtiju/bqfuz9PBwe9/2QnloC/PF8tGZYV1PxLkswFk
 LF/Of9drWGsClj0zIpbXowwH62eJKi8lI0DCxSDgzyR/GXzySr2Lkb/xX7Yd4I2L6KZj
 lFkGIv7AQQEbyKGwVHTOAQ5GSRUUAgT6np03xloMQxhVJ+thrElGSZz2H828+mk1zMsl
 JXK7ABRJ1fyntzhtMwTSQeHhsW1lkn+GsdtuPyeWs9qAJxRDGL2l0FJhAOIPGZCNp9Xn
 NKbw==
X-Gm-Message-State: AOJu0Yza6QdrcXBFKkUKWPLY/3J8ynw2fQXh46JFj0bVkzzi7IPmc+Vy
 E1igKxrglqX9HnjaccAWE24wrlGvhjS4dBmeaBdxhcpr2jXIVSY5gN7DzBcfxnCk
X-Gm-Gg: ASbGncsThYC25+i3pxccUJOd4puSEatAZaej/w7cYx3UlkdR1kvTL/bP05Vo7U0GT7S
 e3BYt2Qoq3nywR3bynGiWyLQLXGBkmJYVg6akngMq6ZHr4nmAj0HrObY4uXf8bTGeD5eDUSeSlN
 1rkTb8B8Sh12tML3RpuKqql2d91JQ43PgqUmE9P32Rkb1H72g7XcLpx4v6Gl9LLMclxy0a7qLAx
 q+XMDbP7C4Iz+2p4ppFr4AXg6mmbg/6ZThs1Tu9zMmKjANGFcbWsMxUd0nmXZd3YZT5WF7DOlM2
 KoIeX3R+To9wxSI7cns0BB+pzMyvKsIusO+8MBCGW6VhiRQh4Yr2T3lS2s1HTOONSlWSxBtPwN7
 /lv/Onx2SE63BJxcMqEW9RPz9zFjXki6HrKg12vfRaYpZXbAI
X-Google-Smtp-Source: AGHT+IFVmubaW3kTFawZA3mw2t2HzxkvXsqTXMf2wC/L+xEbY9V+HsebshDRwQMyGBmrKBF9QGp9tw==
X-Received: by 2002:a17:902:fc4b:b0:231:ea68:4e2a with SMTP id
 d9443c01a7336-23601d74a23mr125732155ad.34.1749335335783; 
 Sat, 07 Jun 2025 15:28:55 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3134b13ba54sm3144674a91.38.2025.06.07.15.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 15:28:55 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Kadambini Nema <kadambini.nema@gmail.com>
Date: Sat,  7 Jun 2025 15:28:49 -0700
Message-Id: <20250607222849.53009-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749335336; x=1749940136; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=35oe3dHRDhj/WaTq37pZn2f+6xVcyMrZut/WxkgLIQU=;
 b=hKRmt0flmy8QFvNWSGVzblulGlWIgfKi76shYf0Wi0K2xLoSQcjpRBMp0m372rcy79
 ZRgJSVTZ9yZv+jQTDZ7GJBdUWYNMgcZRJrE54ATKk207hMawPC7TeVEa8bR2DtEGeMht
 dkFPKJcKsZRA3j2TxlxUrebv/l7zuGXmaM6Nu9doXKQG7Q1HySaU8Aw3nUJgRzRcnjq1
 BFOj1k1HZylvS92ZtmciuEmwQ7Q5FvtykRWEMXvig03dUbwF+bCC+JAfqx2TXHNMzNUj
 XUDNnqXMb1hpr4IV5YsukwJ/CwGRCWHknGqOAOqyd79Zjav9kmGZ/vL/dYakAlMHl6xI
 16Qw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hKRmt0fl
Subject: [Buildroot] [PATCH 1/1] package/whois: bump to version 5.6.2
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

Changelog:
https://github.com/rfc1036/whois/blob/v5.6.2/debian/changelog

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/whois/whois.hash | 6 +++---
 package/whois/whois.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 6b1a3f4cc6..49ded707b8 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,6 +1,6 @@
-# From https://snapshot.debian.org/archive/debian/20250527T144819Z/pool/main/w/whois/whois_5.6.1.dsc
-sha1  4c10bcc05b610bfd5a5c9c4465c97cf117826c2b  whois_5.6.1.tar.xz
-sha256  86b4d99d1ea219d2eaa20257b9c549642f101393b4b9369c391370a39341fc32  whois_5.6.1.tar.xz
+# From https://snapshot.debian.org/archive/debian/20250607T082433Z/pool/main/w/whois/whois_5.6.2.dsc
+sha1  6095840107fcaf5339a7c9840c153ad3f29a7ffc  whois_5.6.2.tar.xz
+sha256  7fbcbc00b7aa321ac1af28a85d86d3ce7b11db1d4a2317b25407be04e506ead0  whois_5.6.2.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index a6ed54ab89..9451aa195d 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.6.1
-WHOIS_SITE = https://snapshot.debian.org/archive/debian/20250527T144819Z/pool/main/w/whois
+WHOIS_VERSION = 5.6.2
+WHOIS_SITE = https://snapshot.debian.org/archive/debian/20250607T082433Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
