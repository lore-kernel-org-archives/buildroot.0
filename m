Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368C510AB822
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 21:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FBD2401EF;
	Thu, 26 Mar 2026 21:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9P4rWMc8JfI; Thu, 26 Mar 2026 21:17:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 454A9401F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774559822;
	bh=fAN/Xwb1y1hPDDnwHRpUtkJ/eBz9GHYNbyWlhL/3Imc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aZ1KdKeKW/GO/ifKJT1HUF8rkwf4J4n57juhiXGDCFTVb5ZhlPE+GWaS8gDWYqg0j
	 3pBN0qFz/95A0qhbJtzgHRcwKFOUraJrFVA1OZ5U/hBEI7iW+qGDWl8xVVaFwBKgTU
	 4AJi2f/3Pz8gpxZAowG2t+Lmqy+edfF6zv8GKelqEV6ChB7DQpxEQwCfaB9BP9nMCe
	 oHKmqgHILhJMaY8KzD30lJCWLKf8F+x44X4aYJhhjOnGwQLM3GnuptqYA0YQKv5T7J
	 Zz6mit0z/qOIfUDEg+2N46Xq9CqNZg88cAuvVswfSAcnVnwpk3+X8IPBVVyaejOehn
	 vtsAOpwZj6Tfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 454A9401F4;
	Thu, 26 Mar 2026 21:17:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ECCCA249
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF10B80BFB
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ib3Pb80gABuM for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 21:17:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA1D380BB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA1D380BB8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA1D380BB8
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:16:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c201.dip0.t-ipconnect.de [79.214.194.1])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0FCD8A4C0DCF
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 22:16:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40194)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w5s4X-000000007Ha-34sV
 for buildroot@buildroot.org; Thu, 26 Mar 2026 21:16:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 22:16:57 +0100
Message-ID: <20260326211657.3598854-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774559818;
 bh=Hacml1AfBUPHAmVUuHTWLE3byB70SJAatcRLpi05CvQ=;
 h=From:To:Subject:Date:From;
 b=hh0Hv4H7qlJb4KPWjspt7Lbyz2yX1Rxgsjdn1dlaT4kUiL00sJ7E5ScdS6u24fdDm
 O4BcdjoSfCzowveVcm7eocVvZ+jkL0lG3z5ViIiTfg/WU9FumgCecgjDH8b/4DUnPd
 qkAud6EfODnqKRv5Zt/PQnXbhcS4zMVt+LzvaBunEESUDwUbAnHhB1Trm+1GZo1Z7P
 OaKL0sg67JbHO+WtSHFK6IPu686wM1AbCgWm2Dz6FhAKQAT2eem54axi1raVlQ/12N
 bHZUiUbenz7tyoqxqn6y8Pw3rp5B+SVLIWtnBmVLeiC+PvsbOgFM5QPVVCZdgy1Cy2
 nfMzrLvwghdfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hh0Hv4H7
Subject: [Buildroot] [PATCH 1/1] package/leafnode2: bump version to
 2.0.0.alpha202601
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

https://gitlab.com/leafnode-2/leafnode-2/-/blob/leafnode-2.0.0.alpha202601/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/leafnode2/leafnode2.hash | 2 +-
 package/leafnode2/leafnode2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leafnode2/leafnode2.hash b/package/leafnode2/leafnode2.hash
index 9a5eb4aa40..040e0d92a4 100644
--- a/package/leafnode2/leafnode2.hash
+++ b/package/leafnode2/leafnode2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  c9f92282e97f399e02d6d2a2576f21e19dbb81961901e5278941e859f8660076  leafnode2-2.0.0.alpha202501.tar.gz
+sha256  c98201dffc51addf4157ceb67f2ef7f2c0f3813e49342834f243244a872d90c1  leafnode2-2.0.0.alpha202601.tar.gz
 sha256  59d37f745dc5a2d63a51dff344f4ad89f72e76f8c7b7d877f20880d838b1bec9  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 6f7035ac13..4afb449b9e 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEAFNODE2_VERSION = 2.0.0.alpha202501
+LEAFNODE2_VERSION = 2.0.0.alpha202601
 LEAFNODE2_SITE = $(call gitlab,leafnode-2,leafnode-2,leafnode-$(LEAFNODE2_VERSION))
 LEAFNODE2_LICENSE = LGPL-2.1
 LEAFNODE2_LICENSE_FILES = COPYING COPYING.LGPL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
