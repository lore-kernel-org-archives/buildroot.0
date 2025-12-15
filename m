Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041E8D5B868
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 20:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F372405D2;
	Mon, 15 Dec 2025 20:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkPkBKajAf0Z; Mon, 15 Dec 2025 20:11:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2B8940550
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765829493;
	bh=d9zVOIKtmvzbHxUiMZebrD+cq1EhnSZwTFfy4LosvZw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hZKhdFzoED+resGVWXRQ7ZV4FvXt+H+gExXoqMNmjYo0IvnSt4I3i7UQ32v0jxtX0
	 TPCoKZET4+dufg5yEl5f/OB4T9tKyUbVfz99b7L4s/0b8xNHsRQiZ8iQ9QIFPVDK42
	 iQRzY9aGlPgmFpBNGFZxXlX21lJMLCsiQYxgNOXGEzuDCQTxCaFecQxeQQWScdRlTv
	 ByZyClBDjKN/p/9QGC6H7bXkWTmXW/+y8dzVL2Dr19GHqQnN5m1HNLL2Y44Dm3deAy
	 kxg7L9TB/hCrsOw0Pu7EPPvBi1h6Bww0t98gfNgvDqM51uLatA318P41WvS2BVNCPz
	 MwzD+gIdt+jTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2B8940550;
	Mon, 15 Dec 2025 20:11:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67BB9117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 20:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DEF14087D
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 20:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAyD9gUHYZBo for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 20:11:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4AFD04028D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AFD04028D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AFD04028D
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 20:11:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 68959A4C4100
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:11:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41822)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVEum-000000006qS-3UbH
 for buildroot@buildroot.org; Mon, 15 Dec 2025 20:11:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 21:11:28 +0100
Message-ID: <20251215201128.2334659-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765829489;
 bh=hwyRU2pn9SgHmdzoZAuab+KO8R13oCChUHPxQUQ/C1w=;
 h=From:To:Subject:Date:From;
 b=XniH0jc/7R96HeSFKC7T/vvV2///S1jwkRvMguqG3TKYTa36YzSk+y7viMdiCdnjy
 dmU01t9fu5k5MCbrQY/3Ht7lrhL0r55TLkGJfsjiZ7D9eflRIw2pIYGkRxBHVBsoHM
 xaOkr8KTWpO0DY6OTsaxT4fXmpVRTPmHP1cNXIGdiQZF/bvytwAIIzFicB6TL2XOuI
 7tPXyMSeNDBZTOjGvVlSoycycrTjTcjb7FeDTkzl2OAHUSjMdjLaHw9lGwziw9uqR/
 ezfejTDY7y4dAj5LPzxpBQZGD3sBooze25qSUXu/mH12sHvLBXeA9QIb+JlNNF7ZZ4
 SIpSSrYGH96lw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=XniH0jc/
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: bump version to 1.58
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

https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=blob;f=NEWS;h=c60ad85d84da2a1721e6bb8c4ae95e645be1b201;hb=e880193c55f0321bbefc16be3194fdbb7a48078f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libgpg-error/libgpg-error.hash | 4 ++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index d02983d1ca..ede1a2113e 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  6db7c51778e424c928993e1d49ccf6ad6866b185  libgpg-error-1.56.tar.bz2
-sha256  82c3d2deb4ad96ad3925d6f9f124fe7205716055ab50e291116ef27975d169c0  libgpg-error-1.56.tar.bz2
+sha1  a9876a9e4cb54298960bd4202baf891642060428  libgpg-error-1.58.tar.bz2
+sha256  f943aea9a830a8bd938e5124b579efaece24a3225ff4c3d27611a80ce1260c27  libgpg-error-1.58.tar.bz2
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 1fb1076ef3..5207d926df 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.56
+LIBGPG_ERROR_VERSION = 1.58
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
