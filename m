Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB99D1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EAF74075C;
	Wed,  3 Dec 2025 22:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WrYmo1t5bvZ; Wed,  3 Dec 2025 22:03:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF26F403A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799403;
	bh=swKwwSWjQebDCHR11LGO1olXmwEu4QQW4gOIcep/ehM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MrCqGDQnzH5TxvSqCLDvFVcL3UmZg0TYTkEzTUODWTIAxxb2Ne6lTNXpJWKcYsVdP
	 oErxGxuqUYc3W22ZK09S8g1jooVX3Y52w6qjJiNyIi2kmQQXf7s0Zxrzeu3+EPeocx
	 BU7CqjmEh7SWJ6MJLhuFSGd/CjeNwTkoqL7214N3xoGTAsFSGda4+8oLjU9abljaRn
	 PaNr96tkCwx0iH3UZDciZIu5ncbDTd5YymiwDYPG5dDH+bD//yVMYfrNwt7DBIJrKN
	 DcsIDfuvK0OJnZXArrMnSFlGu/0nXISfmKB3+6vwLMfj57sU1PCl2fSzuXzlpY+gRF
	 OM1DFX2gahR6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF26F403A9;
	Wed,  3 Dec 2025 22:03:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A249AD3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 893DF84239
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYxFfQwUjbp5 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:03:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77CA28221B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77CA28221B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77CA28221B
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:03:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 586A8A4C3D04;
 Wed,  3 Dec 2025 22:59:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQuqh-000000002OS-0fQ7;
 Wed, 03 Dec 2025 21:57:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 22:57:11 +0100
Message-ID: <20251203215723.2323032-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203215723.2323032-1-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799145;
 bh=PINfr/hpHKUSOJoxsTuGORzwHsPDhosHReXPXIxmU7w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BGDxYnfdvydAkESlurVbNMJ0Qs71fUDRFeRTNrYqIrnPgu0Ob2INm3tqmXhqIkG9K
 +86trTUNSSCDuHIPAghEk4aX3y0hvVi8UyEooMbOhUjCKq2jp/PXgjcgJbMI2963l4
 0UnzKuRZZs1uaZWrAw+9m/EMCxE1q8qMpE40v0u/352tOrqyB0FSQ9T6GdkF1tdP96
 ry9b33K2AhPrhyrcELbTIfvnOScZgxHmC5XQEVIhCtfGFrP8ORUfQiSew5BtvgA5Bt
 DyD1PzmwLpBpwoS6nnRHCpL2POiA7BFQRkRFO6VZ0Lpznbj6FW96Oe5KBojbjIXCSm
 zisQg+98TOSoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=BGDxYnfd
Subject: [Buildroot] [PATCH/next 04/16] package/firmware-utils: bump version
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ Ascani <rj.ascani@gmail.com>,
 Daniel Nicoletti <dantti12@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump includes a patch which adds cmake4 compatibility.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/firmware-utils/firmware-utils.hash | 2 +-
 package/firmware-utils/firmware-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/firmware-utils/firmware-utils.hash b/package/firmware-utils/firmware-utils.hash
index 8e09c06733..e258516aec 100644
--- a/package/firmware-utils/firmware-utils.hash
+++ b/package/firmware-utils/firmware-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5d6fdc6ba3cb3976df68625cbc59a1e0acbd5ecaf9daa41c3a2aaad1ff368f51  firmware-utils-86739f2b3ae9502368b89ef37fa6f31c42aad6f4-git4.tar.gz
+sha256  8a12240dfdca5e26a4b2443724276a0a25f61797e133757605ed1b9941145fc3  firmware-utils-c42a3bc53da869d02c8ae4d62b3b08a95ff5833f-git4.tar.gz
diff --git a/package/firmware-utils/firmware-utils.mk b/package/firmware-utils/firmware-utils.mk
index d5b079e4f5..77be4a9224 100644
--- a/package/firmware-utils/firmware-utils.mk
+++ b/package/firmware-utils/firmware-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_UTILS_VERSION = 86739f2b3ae9502368b89ef37fa6f31c42aad6f4
+FIRMWARE_UTILS_VERSION = c42a3bc53da869d02c8ae4d62b3b08a95ff5833f
 FIRMWARE_UTILS_SITE = https://git.openwrt.org/project/firmware-utils.git
 FIRMWARE_UTILS_SITE_METHOD = git
 FIRMWARE_UTILS_LICENSE = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
