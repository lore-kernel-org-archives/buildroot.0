Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C599CD343F
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 17:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC386405D7;
	Thu,  7 May 2026 17:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WruK0MHa09mZ; Thu,  7 May 2026 17:19:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F6CA405DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778174352;
	bh=0JlHwhwN+7AZJZTSmKRNwRquYLWIrB4erzCUDP28XZQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fb+WpMCW4nH5A5S/uqPc6ZGNAszWKRq+lEMFMmwUBcN6LnEUo+rBErDcFuxqXXAXL
	 wA3TvvWPoMxh/8wxUf2Z1lqv0ES8f6kmVyHBnB8pYINeTc+J6aGMtPLesg80cybbES
	 7FRsMKRnpnyV/3H4if3PENOl3M9v0tfxe0qf1IYr7JwJNKO6zJBl4a0LBl3iXpWWcX
	 X/Y9ASCtzN2qZ6+LdHxQSjwPJDVtuFOvDS+K2EYPDcxEDwTUR9XRsFF3RPPLqSKa/L
	 lfus5X0EIB1OA3dNKdFwPBOxE5M+DphwCv2wxFMohbQ/yY03Dsv4h+e/hymF0l4LGj
	 5Ui9wVU9RBOtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F6CA405DC;
	Thu,  7 May 2026 17:19:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA3D2317
 for <buildroot@buildroot.org>; Thu,  7 May 2026 17:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 856DC83C15
 for <buildroot@buildroot.org>; Thu,  7 May 2026 17:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dtneVG4XG7q for <buildroot@buildroot.org>;
 Thu,  7 May 2026 17:19:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E696C83C14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E696C83C14
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E696C83C14
 for <buildroot@buildroot.org>; Thu,  7 May 2026 17:19:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c188.dip0.t-ipconnect.de [79.214.193.136])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1081AA4C21BA;
 Thu,  7 May 2026 19:19:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33950)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wL2NN-0000000021d-2zhY;
 Thu, 07 May 2026 17:19:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dimitrios Siganos <dimitris@siganos.org>
Date: Thu,  7 May 2026 19:19:05 +0200
Message-ID: <20260507171905.3974201-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778174346;
 bh=UhVLOYr2QvJMKdByLzTvsCGWMVX4hP1DpB430lWpwvY=;
 h=From:To:Cc:Subject:Date:From;
 b=OuvzSihccAF1F0K46PJsxSUH6TToM8F8XL+Fa07h9CyfomkSZVm9I76AGB5FZaPd/
 wTtp9SEmm2X/llGnobFS3EZIsaLBiVo/KK45z1OBMhwfPyPVnhQkaJyJ6sM3uTYHVz
 jmNVd/vz/dQt6cmBUCWYCDBoHpk+jaoMgOCeiGCN9EOl+BU7L1fxhuSvnIlQ2n7cAa
 Wp8ahDslvtm8YeO1bnlbNpxoxvrinyZr9O1Zvgq08PKSqQjGPgSf+PnSi1vE9zxox4
 ARZ4ZRVKuhlqzr14U+KtwbqoQNf6YhnX7uwLSxcM3MfbluR9Lf/ZVgRPVYq5FtK9VB
 2DSumZdEYzE7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=OuvzSihc
Subject: [Buildroot] [PATCH 1/1] package/wireless-regdb: bump version to
 2026.03.18
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

https://lists.infradead.org/pipermail/wireless-regdb/2026-March/001844.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index 39fc1a78d5..bdca077781 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6  wireless-regdb-2026.02.04.tar.xz
+sha256  5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac  wireless-regdb-2026.03.18.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 31bc9e9a22..7e0c585401 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2026.02.04
+WIRELESS_REGDB_VERSION = 2026.03.18
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
