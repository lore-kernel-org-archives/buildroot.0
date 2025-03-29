Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AF0C36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 17:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E49140DD8;
	Sat, 29 Mar 2025 17:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_ovI5nr0B1E; Sat, 29 Mar 2025 17:47:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D70FE40CA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D70FE40CA9;
	Sat, 29 Mar 2025 17:47:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 375A3121
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 17:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C94540C18
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 17:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5W8l5elKto8 for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 17:47:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.53;
 helo=mail-wr1-f53.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF05240C94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF05240C94
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF05240C94
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 17:47:55 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-39c0dfad22aso1036271f8f.2
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743270473; x=1743875273;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rHVrGBeLZAkyxsSjoqp46ZX6k802A8btbARkqlW+Shc=;
 b=hW9OUyseFg/ibHqto5YxS2HMdASrreZT3AnGYPyzI1ztm8IvdazTwGce4ooimKdChr
 l5/zEgn9HLl3ydginIiBX1I5kaDp5dsBI+yLiWo1Jq8kun+473wHMo+dU8++rNNXtYYu
 T1uuWaXGJgmwinbiNRgwBOMBJalLOD7+rtT7+bgYK1PIMap3jxPZ+ThNOp6G9upggxXx
 IGqEOdrNqEK3KnbBlZhw/e6uI2lVf84LnqfNW9bKDVing3ePHeMj+vAKQEFY7Gz4rHcx
 65jKJgXbxLjj6RTFjokjRvl1RO/gDnlN4rDb4rIqYmBsW70PgfQ5rrdsLG2KQMF3eif7
 8Ryg==
X-Gm-Message-State: AOJu0YxvPXcz0ji8nqmWmmID11kYB4CD6ZcIFiEu41wzhtU1RFh+TD5E
 Q/fksJpZaKQAUohmHjHvJCDk1zI94CgzBcfAliY+u9OlanKABHhkOw2+Nw==
X-Gm-Gg: ASbGncvdLFgfoE8WcJDLKwZtNj1dmBTftUOKZbXtm9cpdij2F79EvfreDA2Tuo8TSNH
 +AzZvs+ZltpVHfoQ8UZKNy3rr++jYIk0vQDhgfteyLAvMLXSc0Ousyqk3Y9DRwYxMwlhBIhwPRz
 7hP3pfZvqbk8OFvqrS2oNcCaCWGfi7s/laBz1Ga+kSWGNGiHC95tVvBBEDfGRZmOYK3vZ3JkxoV
 PFdhXOdWoZOTczTXn3yA5+SttWaxxANc5qKrTvBPHAvUP4cwWIO8t96pgTpACiQ8AMF+c0El/sR
 AGUKoeKGp4fD77vnRhsQ17AmXh8QXGWRw9yzdh6YvKjyob2HHFeKj7+V/IopWG5dk7h9Vr5fBxY
 =
X-Google-Smtp-Source: AGHT+IFUZAEtrNDoL+3JhEbxPNDmvO0ZDByDRdidRhOnsYeEsiqT8GxQRJyOzKfsl9V+9JQv/fHB0w==
X-Received: by 2002:a05:6000:4011:b0:390:f902:f973 with SMTP id
 ffacd0b85a97d-39c120ca7a3mr2613839f8f.8.1743270472801; 
 Sat, 29 Mar 2025 10:47:52 -0700 (PDT)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:418a:c8de:a7c8:4861])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a4294sm6198425f8f.89.2025.03.29.10.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Mar 2025 10:47:52 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 29 Mar 2025 18:47:49 +0100
Message-ID: <20250329174749.1886148-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/lighttpd: bump to 1.4.78
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

News:
- https://www.lighttpd.net/2025/3/22/1.4.78/

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/lighttpd/lighttpd.hash | 8 ++++----
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index d4742b5746..4834e2e947 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.77.sha512sum
-sha512  696fd4fd8486a6c3fd1131c7e8a935a02b5384882b74ddc19bf79d085e2a0abed9184a30f97e3a7aafb816d3589e110e8d70115daa15cdc52cf61aa4129e3565  lighttpd-1.4.77.tar.xz
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.77.sha256sum
-sha256  acafabdbfa2267d8b6452d03d85fdd2a66525f3f05a36a79b6645c017f1562ce  lighttpd-1.4.77.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.78.sha512sum
+sha512  40559e676da38b7b4742d7140ab1afe6b69a10ececc5ab1e18c1ea0e4b1c3f13f8058e8e005cbad3df8c008b6b80511afbd0bde9c8094848f3db4d5a29961181  lighttpd-1.4.78.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.78.sha256sum
+sha256  3c0739e8bc75c9e9fc1cfa89e1c304dd4b0e4abb87adc646a1d20bc6a2db2a3e  lighttpd-1.4.78.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 609fe3e3be..5f38637857 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).77
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).78
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
