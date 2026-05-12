Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C2DCD4F25
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 15:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A712440F01;
	Tue, 12 May 2026 15:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzF79pAzvmub; Tue, 12 May 2026 15:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE53040F2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778598448;
	bh=GrZxfCVnE8xrqn0qulzPnF8vWv4a0n2ONZBRqV0csOQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m6OcYy4db2sd2e+PWt4Urxb1EoImH1vxcuzI012wzmMn8/GXevxe915vPMN9ZAoq6
	 8fIX+UN7Da8mWPy3uoWfi4C3Fiwg4Ci7VwU3JLxB4asc/IxJGUIAHSYpYiYKhBIzgk
	 HKEUfnsWQEm4NGtMThY4c2RQBq81snqv1MSnTCu6BpFJebnb1sAJBMFs0or8e+bgHd
	 RRTY9QeugGZhGrNDYNbuNRI1HmMnGxPHGz0cfjzh3d9vo2/DRkWmV2NoGJLFQkOFJk
	 Dmnc2dSlMKLzt4L50Ns4b9mGx/ZU7CavkM1HdKQd6WAdp2T1uL/8O+0U6gh5w073G1
	 L1Gw6Trci1+rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE53040F2C;
	Tue, 12 May 2026 15:07:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8B87398
 for <buildroot@buildroot.org>; Tue, 12 May 2026 15:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4B2C40F01
 for <buildroot@buildroot.org>; Tue, 12 May 2026 15:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vL8WqoybNsZp for <buildroot@buildroot.org>;
 Tue, 12 May 2026 15:07:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A56964068C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A56964068C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A56964068C
 for <buildroot@buildroot.org>; Tue, 12 May 2026 15:07:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E8113A4C061C;
 Tue, 12 May 2026 17:07:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55368)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMohf-0000000078I-2YWN;
 Tue, 12 May 2026 15:07:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 12 May 2026 17:07:23 +0200
Message-ID: <20260512150723.1800805-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778598443;
 bh=tHZu5N80s8P6/PKxtNIkf8RXfYNxed1G85vflfWC5dI=;
 h=From:To:Cc:Subject:Date:From;
 b=C1cyEquzkrut2Cd8ZsnBDkLeQt2b8q5twJ8ZtaC88I/onFrsKVDdaCmpP8iV3YJYQ
 5HgcuF+MD3UArtSrF9jSloKMNp6URT/009CSyFvU9kZsQoNSn2nf8SG1uCmkgTxphu
 8Q1qXoI0OY9cFjTw5gQ0zoGlmxv4GRoQbOHcdbvg4EdO34Ztk+JUa3uM29MNsuKNBv
 o+gGtrAwX793905TQkiGCcSnNhSk+ODbB8OtZrDfnBsRcGrlU5457BQXcYcVekAA1O
 vCZ4/xl2S+1qF8Rp0abYJPBQYTRLZc4xxyrI+QES9BYABfeahXASWyz1YtqsGwO9GZ
 tsMr41/Wna6OA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=C1cyEquz
Subject: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.99.3
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

https://seclists.org/oss-sec/2026/q2/491
https://exim.org/static/doc/security/EXIM-Security-2026-05-01.1/EXIM-Security-2026-05-01.1.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 745b9f0977..e95f7f5efe 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  25364f19988270d846965689dd29c662cf5de152639875d0d5352a69fd753a47  exim-4.99.2.tar.xz
+sha256  663e76d2a0d9b8fc5b373d0008e44ae044f10feb22bc9dbae8c7f21345ebfb3b  exim-4.99.3.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  e5c80a77dca642c132dda82166c919ba9f553436038b734ef66ae41666b8c9f5818e2cd6080e4c7c8b52e866f7f89d271233fb183c7e405feb15536d507098a3  exim-4.99.2.tar.xz
+sha512  7c4109f499497e2432b71ad3f3f1cac358e63b1b693a352047e6990619d7fd619d3a966ba585482c58e0b23b3fa4f385d15720c455fda29633411e35db1d2e7f  exim-4.99.3.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 7129e2ebf6..c72e25a2c4 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.99.2
+EXIM_VERSION = 4.99.3
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
