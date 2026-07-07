Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD26C43458
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 18:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22DF5408E0;
	Tue,  7 Jul 2026 18:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGIK_Ekd2aND; Tue,  7 Jul 2026 18:52:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1416408E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783450335;
	bh=L8XuOTalehGIS11oG/ncWsmnAuQv2NXkFcM8gzzRUhE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZXMbucXeeLip73aYG862DEX6IZxiQlNKlqC5905Q0BfnKx6tVL20pZI0lPYT0TLoZ
	 Saf2wXjubNGVGkz7HL6tfM+BEgWaLIbufpcOvqwA1UmmI0pCKA5GfUgXMPIe51pU8I
	 MiJH6UfedEPYcsOV3QTZZlzD0RnqMhDnLLqoIoYpp/etKK9xeUR4uDSBpX9pwRfpiv
	 E7J628hSu0pY5T4gfjTAfHQnK53Dqwg/eamGL4Br/6SzLk3Aw6Q+cnYLLBS2Vi+UKV
	 QBQhaB+kVbWrS2Z+GfLIN2WlsUOG6LOjJB9tzT9vMTXQjim1YSnlhkLM+IO8wGxNlD
	 sDX459LrORWfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1416408E1;
	Tue,  7 Jul 2026 18:52:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D64433A
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 18:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AC38400D6
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 18:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxoP7hstzr-7 for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 18:52:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83D1640055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83D1640055
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83D1640055
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 18:52:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb1c.dip0.t-ipconnect.de [84.161.187.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E1DB2A4C1094;
 Tue,  7 Jul 2026 20:52:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40682)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1whAtr-000000003rP-2IVi;
 Tue, 07 Jul 2026 18:52:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  7 Jul 2026 20:52:07 +0200
Message-ID: <20260707185207.2387124-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783450327;
 bh=o7x68xF59GcZoscfhM8rcWqJw+XTGYxNvwhP1fn+Bqo=;
 h=From:To:Cc:Subject:Date:From;
 b=jg+8sLoGViwp85YJRWooQXafrkhrFew0gO0gam1846FFcC7AOOEnQXOHdkEcKcmQS
 mVndIT/Wf1LflK+/hExGFjmktZwjjYGhC4PbLDEEL/JLdtCQGqvxOgsoj7o7uUlAVW
 ndHWT6T7zZBxJJ4uiYMK6jw47E/6eMi74xAY6iUD/rz0U6FZHrpPqTsQbpZCxlw8qf
 +CTbryWWrxPgJ2GpuSh88eMivEH6ftw8gm1PIVVilJPk0nPR3z0Enf1Px7PUiGFIjV
 NKqbpTr+9kCF2uDWa5LM26pUOFq+nlHVCd6RBAVygnbImqgtL1nUcm5OGeljl3h8hW
 nzbDNPdt0eSYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jg+8sLoG
Subject: [Buildroot] [PATCH 1/1] package/dropbear: security bump version to
 2026.92
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

https://matt.ucc.asn.au/dropbear/CHANGES

- Security: server: Don't allow -B (accept blank password) with
  -t (two factor auth). If run with -t and -B a user configured with a
  blank password would be allowed to log in without pubkey auth.
  https://github.com/mkj/dropbear/commit/23ec78285639edf068d86bb96f91cba755039740
  Reported by nvidia

- Security: server: Fix parsing of long authorized_keys lines.
  The remainder of a long line would be handled as the start of a new line.
  In the case where external programs add semi-trusted public keys to
  authorized_keys, a crafted key might bypass restrictions such as "command=".
  https://github.com/mkj/dropbear/commit/8d8e1930b866eb44135ae393a793cbeb03b6b9d6
  Reported by nvidia

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ac42a98b3278d90a9a5eacd4f4cf6336879b5158
with the exception of bootlin-m68k-5208-uclibc which was broken before:
https://gitlab.com/bkuhls/buildroot/-/commits/345fe196c6f81d16429e5d41185e4a08120562d4

 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 31ac153b89..9df81ea4b5 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  defa924475abf6bc1e74abc00173e46bfdc804bd47caafa14f5a4ef0cc76da34  dropbear-2026.91.tar.bz2
+sha256  91dcb5234de8dea68dd82c55411c9fc986b457ab58372a780ee8a870419c2f7e  dropbear-2026.92.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index a7de8432af..e7e6703057 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2026.91
+DROPBEAR_VERSION = 2026.92
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
