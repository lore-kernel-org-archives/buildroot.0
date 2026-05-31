Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F367CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 14:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D28A4290D;
	Sun, 31 May 2026 14:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJ1x1xVV4T8Y; Sun, 31 May 2026 14:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E42D42917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780237115;
	bh=1FIWN42g4Yq/gpeCTCFukR+SGGf99sewRNK1mZREfZQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NEikE1lrgUHHCVd/6Fnk9xBBGX2wu/ZtIUUUNT+jdjI+dx9xbZL2g3zewz+y/bhGJ
	 pIyj+8a7eKvFNMB7RFivoViNNfw8BUKrsm6ZECv5MwfvC0mqHWB8/8WSxr6UXT3HmU
	 BrwAvf96dhdvH3hfkaqg7RDvNwZIxC/x5/MF/t3FcSj89fFBDcx3fwFOrZ+L2XymRH
	 AuzcSK/dpF4P3K5bzp7D11+JFI7EZFAxNFMGCfdhi8qRfY1LJ0rZPIfI535PYYrhh0
	 LhueOsb5gYddHPKDri1oeMB4nYcO87nlM+85LlOq4uiX9FsusIePqg2UFRnOrBMZSf
	 QfjuSgvQYljjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E42D42917;
	Sun, 31 May 2026 14:18:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 503F9257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3636060B97
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_B59f3gPlCs for <buildroot@buildroot.org>;
 Sun, 31 May 2026 14:18:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D8B5860B83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8B5860B83
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8B5860B83
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:18:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1510A4C34FB;
 Sun, 31 May 2026 16:18:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58112)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTgzm-000000005aR-3OT8;
 Sun, 31 May 2026 14:18:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dimitrios Siganos <dimitris@siganos.org>
Date: Sun, 31 May 2026 16:18:30 +0200
Message-ID: <20260531141830.2898251-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780237110;
 bh=S1SxZR4abXglVQQqW/a9RBhBY1lek2+DncTSHNRqeYs=;
 h=From:To:Cc:Subject:Date:From;
 b=Uwwdnbrlv8T4udg1GUDTU2gStesSspd6o0lqaMrLPSJDEPLvKZ0g8F0Onf7yBk3mK
 AhULoc3PtTuBRB9w6ooe+EFDXRpAfIkFFGGHuBZO3monoE4apuoEQyy9vNb2990Gd1
 P8EVXshpmlg/QsfxbYWpq+S8AFmn52gZBaKjULkvmwKdTU/tuZNqparR5cJn77J2Z8
 tUAhM6hr9x3q4MZMu7ux2wGnN7Zniypr0aiEifMzjhY4cx5EuMm4v8gc+wDHEWLrte
 MIs3uTGK0dZJchdlS4R6l+eae+sAxbSjV+d0RUG8P7ABp2mkT5S8d5vj6aVoip3k/c
 1BM74NKEp7UiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Uwwdnbrl
Subject: [Buildroot] [PATCH 1/1] package/wireless-regdb: bump version to
 2026.05.30
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

https://lists.infradead.org/pipermail/wireless-regdb/2026-May/001917.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2565367825

 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index bdca077781..4c6b3bec78 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac  wireless-regdb-2026.03.18.tar.xz
+sha256  8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993  wireless-regdb-2026.05.30.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 7e0c585401..9761afc243 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2026.03.18
+WIRELESS_REGDB_VERSION = 2026.05.30
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
