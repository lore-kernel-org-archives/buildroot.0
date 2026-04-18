Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A2DF99C80
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 13:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 407F840F92;
	Sat, 18 Apr 2026 13:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjBiCya6XV4a; Sat, 18 Apr 2026 13:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B708C40CD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776518886;
	bh=X0WusODd7WUT6fjaOuM6DfoPvbkSpFGbnpQlLxxWOEc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=XGyTYsgIsHM6nxg2Q/nLYiFdfoCpBxBgYnByY0zmbM8HyZ01gPhCLzVn6z9PH7PQK
	 Yzy1CjkOSiTki3UqfXoE7CTy98Lin7EWr65DlpdfUnjmAZc+3Gg2yfCTx9cQwlv4R9
	 DTP+OZiXYkJxWSX4hCCphYAyTXYhr8FQSC6ePAaeoL8WvfGOPMmQiTUvwn+e5P/neD
	 I7cuKqS9OLg5lretfbhx4tJYPRzSV7liEPLI4jol6mdjDVy0kNL0U9OdFGGU0iWJG3
	 XCaLgvA3RXZZhKoxqLKVcpwFX7fgbHOJDvQfEwmwX5dMBwHygcLizJvN+DniuHk7d0
	 9zu9gqkdxKyrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B708C40CD9;
	Sat, 18 Apr 2026 13:28:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27D1935B
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 13:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19362400F8
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 13:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6SqzHs9qe9o for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 13:28:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C476840057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C476840057
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C476840057
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 13:28:03 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D3C496013A;
 Sat, 18 Apr 2026 15:27:58 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 18 Apr 2026 15:27:54 +0200
Message-ID: <20260418132754.476672-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776518880;
 bh=yvxQAefIV4HNiBx2WkkmAZ/Bds8UwONIMykYw8XyUVU=;
 h=From:To:Cc:Subject:Date:From;
 b=gaQIra1x3Q/6UGZwAUbXCf2gmnqCeOY1wnivwTDnoOcYvT9Q1ZkTAo+/A2sDWZWmc
 SpHe5ewQl2wK3tj/wYAHHYO4//pps56hPlTrcQ/IxM1VtPmCkfTg6VgTU1k52AQtbd
 yYfCKtgFj2/fq7m0f2Hlk44RMYoEdCYu9pB+ExGFk6awpPG8OZJbV1TQvaCnb3Tahw
 uNPGjX8mcwRZDgBHdfkGFK6n7I+QjwcuIJ1fIhFHUb/9BOszEEXuiiLe0ZFQIRetLf
 lKWkRLsoIPcnOTLUnMwd6zrbT77J6NL2OZ7a0WwkExx3lPuoLfkL0P2KobkP/y/nkK
 HEyon1ceus61A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gaQIra1x
Subject: [Buildroot] [PATCH 1/1] package/xfsprogs: bump version to 6.19.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/doc/CHANGES?h=v6.19.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xfsprogs/xfsprogs.hash | 2 +-
 package/xfsprogs/xfsprogs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index 24c2e20a7e..03ace91fb6 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/sha256sums.asc
-sha256  3a6dc7b1245ce9bccd197bab00691f1b190bd3694d3ccc301d21b83afc133199  xfsprogs-6.18.0.tar.xz
+sha256  f3b0d758ed3802b20f838fefc42bbff431e0f0df2fe03cd50d0aa4ad86dcd0fc  xfsprogs-6.19.0.tar.xz
 
 # Hash for license files
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 729f4f753f..d84d479500 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 6.18.0
+XFSPROGS_VERSION = 6.19.0
 XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
 XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
 XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
