Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27CBD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 21:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1F2E40062;
	Sun,  7 Dec 2025 21:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2LO56StbSS8; Sun,  7 Dec 2025 21:37:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAA6240423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765143461;
	bh=up5/9Dx6A1xkCIkE4TkFUYqxAvplkn3b4G/88F+8fk4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=TZ+pvbI/IY2BOV03MW/BHqTscFRhNXCHIxnEUKw2vKMokUa/4dw37MjtcC6iZYw+4
	 WyD2pOmJ1SBRlu7ZZoE5v59sxruM0+n9sQ0VoAAjvCFNvp8wFmd3u+AgeKy0u1PmpQ
	 vK94sSEyWIu/i/xcmR/FrI10EyNJYZ5x6EFwFVp7I3v12yYyI3vs4+PBSNyZZSv7w7
	 JFLRun9tPuJZcgEule8ZZb5nqL0xLmh33mt/3GCQ73TTyidOsThg5oX3hh18jDBrx2
	 C/sDNuA7ZXrWDnVgv99Mj+VbcuRwUfaKOj5DlnkfRHnHuEwa4Hw27aRV89E7Br9+LT
	 Le+xjRyhZin9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAA6240423;
	Sun,  7 Dec 2025 21:37:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B544BE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B308540423
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IDPKv1Q2Xxgs for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 21:37:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09A7840062
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09A7840062
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09A7840062
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:37:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6BDBEA4C00E1;
 Sun,  7 Dec 2025 22:37:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42554)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSMRi-000000000ue-2zNs;
 Sun, 07 Dec 2025 21:37:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 22:37:34 +0100
Message-ID: <20251207213735.3332670-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765143455;
 bh=pZ5EzZGenTuOUZxsi1wo6CM1ExW8bN9k6T+ZdtDdd+o=;
 h=From:To:Cc:Subject:Date:From;
 b=i3azXrEVXJTYPlldSsZEaGPlxyiE09ph4N9cIKF2vey5ypdf0EWpSUqdEPHxc7ViT
 BrzkQAlEvDA+68tLJ/eTgx6NiDTB+7uMWUTMdZ+WRo3Py2INfcuGhkd7QEyz1FL28d
 5pX7/KT6AYSmPniQwaxzE2MZB7WRnKxK29PGt27Cto9ATSsEcZJLJJXHzeCgaad/OT
 FWFTZKMNkdDRAFLuTC8CsEz9sjckkc3IaAwjjFl7XHshRhYIxwoHnM0knhWsv0ya4A
 LKwLCJUqxAqR5kr73mbxbzffuMniuwd8LUM4mNWcERC4FaZ/M565G8g1xAnWrFrb05
 UV+sm3EDrDSqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=i3azXrEV
Subject: [Buildroot] [PATCH 1/1] package/python3: security bump version to
 3.13.11
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://www.python.org/downloads/release/python-31311/

Fixes CVE-2025-12084.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 778dca3b69..fddfcc1a4d 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-31310/
-md5  5ada33c7f08d5d2df881657bdb8e848d  Python-3.13.10.tar.xz
+# From https://www.python.org/downloads/release/python-31311/
+md5  4c3517dd8b1fd76377dcb3e5e8f71ad6  Python-3.13.11.tar.xz
 # Locally computed
-sha256  bc673c04375a1a3f0808c27ba8f0411ab811ad390a8740318ccb9c60fad8fd77  Python-3.13.10.tar.xz
+sha256  16ede7bb7cdbfa895d11b0642fa0e523f291e6487194d53cf6d3b338c3a17ea2  Python-3.13.11.tar.xz
 sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6200b8af4e..0189a505b4 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.13
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).11
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
