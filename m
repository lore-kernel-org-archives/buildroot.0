Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4F3FF885C
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 21:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAF2B421E8;
	Sat, 25 Apr 2026 21:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uzoln5u1R25p; Sat, 25 Apr 2026 21:17:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 207D3421EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777151859;
	bh=FJfw+t5s/SfuQPunfvTym3X4cJ0ftWEA6LcZNi3S2pA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WBdO/F9XGH4VY+Jo68eo+kaBT4Y/I0FUZuxoYDoqfPieDx0Y00deW6+jaqIe4MFuU
	 FB8KerPNhPv52fR0YpjJFN6F+GLgqnAfZQ3UX9j36QQPqebd0+2PP7Cjr1PKNEivrt
	 tq/89VHyut3z6MojOBH0tpD9AMWEfhSCqvyT4X97euR8L0lDUHqvCpR1m8oxJIZSbl
	 zRU7B+2KGJR5geeCSjQlH0ABID5JpRBe4XaFXrptkODCvXM/WiJy0iumosMsgSiMj5
	 q563NK5yMGniLwZ6/px5kKYMo50a1zbjzXBnIjF2JTdOM4b0Wy3ACf9P8bxe2V+Mgo
	 acsEGfvRz7jGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 207D3421EC;
	Sat, 25 Apr 2026 21:17:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29888231
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F3824026E
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIe8NzYfywL6 for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 21:17:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F05E84026B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F05E84026B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F05E84026B
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:17:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 093A6A4C0F58;
 Sat, 25 Apr 2026 23:17:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48402)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGkMj-000000004gG-2HCD;
 Sat, 25 Apr 2026 21:16:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Qais Yousef <qais.yousef@arm.com>,
	Romain Naour <romain.naour@gmail.com>
Date: Sat, 25 Apr 2026 23:16:40 +0200
Message-ID: <20260425211641.479665-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260425211641.479665-1-bernd@kuhls.net>
References: <20260425211641.479665-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777151822;
 bh=g2MczvL6xkOvenW2DApq1FkGA8zXlgWbM4Fnk7s/DHQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=t+icX4Q4dXLijDYF+r4SR9A/fo9XnllFfeaLR6nl9GFwzlsvyNO1b1fHjTqtI6SeJ
 HzK8KCuegsWxmnjelFsKVt61wO9OzxXjrbggdyx7ndLzw+JCN4OSinnHj8OUXTj09r
 4EN8VmkR52DdT51GGKV7NmSmk2oC4EWSSsj7eO1owvzTw33kBYp7IyWGNA6zLQrUxN
 HCLgkHW70fe3mg8KUYxN8pYBGE1rB++BvI4vg3oT49PWgF2ymf5VZkBrnidGd8Qxtb
 MdWhqbxR8xrQuEIbQ1Y2y1XLNToqFz5i3Q4hF/vaNflrUEy759H/M1pYnbOniNI0/1
 4MnACH/XEpZ2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=t+icX4Q4
Subject: [Buildroot] [PATCH 7/8] package/libbpf: bump version to 1.7.0
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

https://github.com/libbpf/libbpf/releases/tag/v1.7.0
https://github.com/libbpf/libbpf/releases/tag/v1.6.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libbpf/libbpf.hash | 2 +-
 package/libbpf/libbpf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libbpf/libbpf.hash b/package/libbpf/libbpf.hash
index 9a2acb2521..f66fd71cdc 100644
--- a/package/libbpf/libbpf.hash
+++ b/package/libbpf/libbpf.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  16f31349c70764cba8e0fad3725cc9f52f6cf952554326aa0229daaa21ef4fbd  libbpf-1.6.2.tar.gz
+sha256  7ab5feffbf78557f626f2e3e3204788528394494715a30fc2070fcddc2051b7b  libbpf-1.7.0.tar.gz
 sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
 sha256  e1638b9a0c68ca90fad3df1d6b4e430804d2fbdc15e58d02cffddfae38953bbf  LICENSE.BSD-2-Clause
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LGPL-2.1
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index d405767988..21f3b1b8ef 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBPF_VERSION = 1.6.2
+LIBBPF_VERSION = 1.7.0
 LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
 LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
 LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
